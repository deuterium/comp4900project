using System;
using System.Linq;
using BCCAModel;
using System.Collections.Generic;
using System.Drawing;

public partial class Tracking_Default : System.Web.UI.Page
{
    BCCAEntities ctx = new BCCAEntities();
    public static Color FailColour = Color.Red;
    public static Color SuccessColour = Color.Green;
    public static String otherOption = "Other (specifiy)";

    protected void Page_Load(object sender, EventArgs e)
    {    
        //List<Employers> employers = new List<Employers>();
        //var qry = ;
        if (!IsPostBack) {
            List<String> employers = new List<String> { "BCCA", "BCCDC", "BCTS", "C&W", "Corporate", "FPSC", "RVH", otherOption };
            ddlEmployers.DataSource = employers;
            ddlEmployers.DataBind();

            ddlDepartments.DataSource = ctx.Departments;
            ddlDepartments.DataValueField = "deptNo";
            ddlDepartments.DataTextField = "deptName";
            ddlDepartments.DataBind();

            ddlPositions.Items.Insert(ddlPositions.Items.Count, "Lab Manager Sample");
            ddlPositions.Items.Insert(ddlPositions.Items.Count, otherOption);

            lblResults.Visible = true;
        }
    }

    protected void ddlEmployers_SelectedIndexChanged(object sender, EventArgs e) {
        if (ddlEmployers.SelectedValue.Equals(otherOption)) {
            tbxEmployer.Visible = true;
        } else {
            tbxEmployer.Visible = false;
        }
    }

    protected void ddlPositions_SelectedIndexChanged(object sender, EventArgs e) {
        if (ddlPositions.SelectedValue.Equals(otherOption)) {
            tbxPosition.Visible = true;
        }
        else {
            tbxPosition.Visible = false;
        }
    }

    private void getEmployeeData() {
        String first = tbxFirstName.Text;
        String last = tbxLastName.Text;
        Employee emp = null;

        var qry = ctx.Employees
                  .Where(e => e.fname.Equals(first) && e.lname.Equals(last))
                  .Select(e => e);
        
        if (qry.Count() == 1) {
            emp = qry.FirstOrDefault();
            
            tbxId.Text = emp.empNo.ToString();
            
            tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("yyyy/MM/dd");
            if (emp.endDate != null) {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("yyyy/MM/dd");
            }
            setResultMsg(null, SuccessColour);
        } else if (qry.Count() <= 0) {
            setResultMsg("No employees with that first and last name found.", FailColour);
        } else {
            setResultMsg("There was more than one employee with that first and last name.", FailColour);
        }
    }
    protected void btnGetEmployee_Click(object sender, EventArgs e) {
        getEmployeeData();
    }

    private void setResultMsg(String msg, Color foreColour) {
        if (msg == null) {
            lblResults.Text = String.Empty;
            lblResults.Visible = false;
        }
        lblResults.Visible = true;
        lblResults.ForeColor = foreColour;
        lblResults.Text = msg;
    }
}