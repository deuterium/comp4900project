using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Data;

public partial class Reporting_Reporting : System.Web.UI.Page
{
    #region class variables
    // Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    // Text value of DropDowns for the none specified option (null value in db)
    public static String noOptionSpecified = String.Empty;
    // List of static, pre-defined actiosn following an incident that a user can select
    public static List<String> actionsFollowing = new List<String> {
        noOptionSpecified,
        "Report Only",
        "Lost time (missed/will miss next scheduled shift due to injury)",
        "First Aid",
        "Medical Aid (GP / Clinic)",
        "Medical Aid (ER)"
    };
    #endregion class variables

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            ddlActionFollowing.DataSource = actionsFollowing;
            ddlActionFollowing.DataBind();
        }
    }

    protected void btnSSearch_Click(object sender, EventArgs e) {
        SaveReport();
    }

    private void SaveReport() {
        int empId = Convert.ToInt32(tbxId.Text);
        DateTime dateOfIncident = Convert.ToDateTime(tbxDateOfIncident.Text);
        DateTime dateReported = Convert.ToDateTime("2011/06/01 09:00:00");
        
        Incident report = new Incident {
            empNo = empId,
            p1_dateOfIncident = dateOfIncident,
            p1_timeReported = dateReported,
            p1_incidentDesc = tbxIncidentDescription.Text,
            p1_witnessName1 = tbxWitnessName1.Text,
            p1_witnessPhone1 = tbxWitnessPhone1.Text,
            p1_witnessName2 = tbxWitnessName2.Text,
            p1_witnessPhone2 = tbxWitnessPhone2.Text,
            p1_nature_no = convertCheckbox(cbx_p1_nature_no)
        };
        
    }

    private String convertCheckbox(CheckBox cbx) {
        if (!cbx.Checked) {
            return "0";
        }
        return "1";
    }

    #region DropDownLists
    /// <summary>
    /// Calls CheckActionFollowingOption(), which displays a textbox if either of the "Medical Aid" options
    /// are selected and hides the textbox if any other option is selected.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlActionFollowing_SelectedIndexChanged(object sender, EventArgs e) {
        CheckActionFollowingOption();
    }

    /// <summary>
    /// If the Positions drop down list is changed to either of the "Medical Aid" options,
    /// display the text box for data entry. If any other value is selected, hide the textbox.
    /// </summary>
    private void CheckActionFollowingOption() {
        if (ddlActionFollowing.SelectedValue.StartsWith("Medical Aid")) {
            tbxMedicalAid.Visible = true;
            lblMedicalAid.Visible = true;
        } else {
            tbxMedicalAid.Visible = false;
            lblMedicalAid.Visible = false;
        }
    }
    #endregion DropDownLists

}