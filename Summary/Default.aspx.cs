using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

public partial class Summary_Default : System.Web.UI.Page
{
    /* Chris LOVES t3h pen0r TODO */
    static BCCAEntities ctx = new BCCAEntities();
    private string firstName;
    private string lastName;
    private int department;
    private string labManager;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BCCAEntities ctx = new BCCAEntities();
            ddlLabLabManager.DataSource = ctx.LabInspections.Select(l => new { text = l.labMgr, value = l.labMgr });
            ddlLabLabManager.DataValueField = "value";
            ddlLabLabManager.DataTextField  = "text";
            ddlLabLabManager.DataBind();
        }

    }
    protected void btnInspectionLookUp_Click(object sender, EventArgs e)
    {
        department = Convert.ToInt32(tbxLabDepartment.Text);
        labManager  = Convert.ToString(ddlLabLabManager.SelectedValue);

        grvLabInspections.DataSource = ctx.LabInspections.Select(LI => LI).Where(LI => ((LI.deptNo == department))
                                                                                && (LI.labMgr == labManager));
        grvLabInspections.DataBind();
    }

    protected void btnCourseLookUp_Click(object sender, EventArgs e)
    {
        firstName = tbxFirstName.Text;
        lastName = tbxLastName.Text;
        grvCourses.DataSource = ctx.Employees
                           .Join(
                              ctx.TrainingTakens,
                              emp => emp.empNo,
                              TT => TT.empNo,
                              (emp, TT) =>
                                 new
                                 {
                                     emp = emp,
                                     TT = TT
                                 }
                           )
                           .Join(
                              ctx.TrainingCourses,
                              temp0 => temp0.TT.trainingNo,
                              TC => TC.trainingNo,
                              (temp0, TC) =>
                                 new
                                 {
                                     temp0 = temp0,
                                     TC = TC
                                 }
                           )
                           .Where(temp1 => ((temp1.temp0.emp.lname == lastName) && (temp1.temp0.emp.fname == firstName)))
                           .Select(
                              temp1 =>
                                 new
                                 {
                                     lastname = temp1.temp0.emp.lname,
                                     firstname = temp1.temp0.emp.fname,
                                     trainingName = temp1.TC.trainingName
                                 }
                           );

        grvCourses.DataBind();
        
    }

    void grvCourses_SelectedIndexChanged(Object sender, EventArgs e)
    {
        // Retrieve the company name from the appropriate cell.
        String companyName = grvCourses.SelectedRow.Cells[2].Text;


    }

}