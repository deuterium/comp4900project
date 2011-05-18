using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Data;
using System.Drawing;

public partial class Tracking_ViewLabInspection : System.Web.UI.Page {  
    #region Class Variables
    // Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    // The colour of header text.
    public Color HeaderForeColor = ColorTranslator.FromHtml("#d80080");
    #endregion class variables

    protected void Page_Load(object sender, EventArgs e) {
        String reqIncidentNo = Request.QueryString["LabInspectionNo"];
        int incidentNo = -1;
        try {
            if (reqIncidentNo != null) {
                incidentNo = Convert.ToInt32(reqIncidentNo);
            }
        }
        catch (FormatException ex) {
            // redirect to error page
        }
        displayLabInspection(incidentNo);
    }

    protected void displayLabInspection(int insNo) {
        var qry = ctx.LabInspections
                .Join(
                    ctx.LabInspectionDetails,
                    LI => LI.labInsNo,
                    LID => LID.labInsNo,
                    (LI, LID) =>
                    new {
                        LI = LI,
                        LID = LID
                    }
                )
                .Join(
                    ctx.LabInspectionItems,
                    temp0 => temp0.LID.labItemNo,
                    LII => (Int32?)(LII.labInsItemNo),
                    (temp0, LII) =>
                    new {
                        temp0 = temp0,
                        LII = LII
                    }
                )
                .Where(temp1 => (temp1.temp0.LI.labInsNo == insNo))
                .Select(
                    temp1 =>
                    new {
                        labInsItemNo = temp1.LII.labInsItemNo,
                        labInsItem = temp1.LII.labInsItem,
                        checkbox = temp1.temp0.LID.checkbox,
                        comments = temp1.temp0.LID.comments,
                    }
                );
        // Format the data for the Grid View
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("labInsItemNo", typeof(System.String)));
        dt.Columns.Add(new DataColumn("labInsItem", typeof(System.String)));
        dt.Columns.Add(new DataColumn("checkbox", typeof(System.String)));
        dt.Columns.Add(new DataColumn("comments", typeof(System.String)));
        // Generate rows for each employee
        foreach (var result in qry) {
            String subheader = checkForSubheaderStart(result.labInsItemNo);
            if (!subheader.Equals(String.Empty)) {
                DataRow drSubheader = dt.NewRow();
                drSubheader["labInsItemNo"] = subheader;
                dt.Rows.Add(drSubheader);
            }
            DataRow dr = dt.NewRow();
            dr["labInsItemNo"] = result.labInsItemNo;
            dr["labInsItem"] = result.labInsItem;
            dr["checkbox"] = convertRadioButtonListValue(result.checkbox);
            dr["comments"] = result.comments;
            dt.Rows.Add(dr);
        }

        gdvLabInspection.DataSource = dt;
        gdvLabInspection.DataBind();

        gdvLabInspection.Columns[0].ItemStyle.Width = 20;
        gdvLabInspection.Columns[1].ItemStyle.Width = 360;
        gdvLabInspection.Columns[2].ItemStyle.Width = 80;
        gdvLabInspection.Columns[3].ItemStyle.Width = 250;

        foreach (GridViewRow row in gdvLabInspection.Rows) {
            String strChecked = ((Label)row.FindControl("lblChecked")).Text;
            if ((strChecked == null) || (strChecked.Equals(String.Empty))) {
                row.Cells[0].ColumnSpan = gdvLabInspection.Columns.Count;
                row.Cells[1].Visible = false;
                row.Cells[2].Visible = false;
                row.Cells[3].Visible = false;
                row.Height = 50;
                row.Font.Bold = true;
                row.ForeColor = HeaderForeColor;
            }
        }

    }

    // checks for the first value of a list, meaning it should insert a row above it
    private String checkForSubheaderStart(int labInsItem) {
        String subheader = String.Empty;
        switch (labInsItem) {
            case 1 : // Fire evacuation route posted on exits in each section/floor
                subheader = "Emergency & Information Material";
                break;
            case 13 : // Safety Glasses/Facial shield available and in good condition
                subheader = "Personal Protection";
                break;
            case 20 : // Bench tops and sink areas tidy
                subheader = "Housekeeping";
                break;
            case 27 : // Separate collection containers for sharps available
                subheader = "Waste Management";
                break;
            case 35 : // Appropriate disinfectant(s) in correct concentration available
                subheader = "Biohazards";
                break;
            case 37 : // Sash at recommended height and air flow on
                subheader = "Fume Hoods/Biological Safety Cabinets";
                break;
            case 41 : // Vacuum pumps stored safely and belts guarded
                subheader = "Electrical Apparatus";
                break;
            case 46 : // Flammables stored in appropriate refrigerator/cabinet
                subheader = "Chemicals and Reagents";
                break;
            case 54 : // Biosafety, chemical and cytotoxics safety training provided and documented
                subheader = "Training";
                break;
            case 58 : // Equipment/storage shelves seismically restrained
                subheader = "Miscellaneous";
                break;
            default : 
                // do nothing
                break;
        }
        return subheader;
    }

    private String convertRadioButtonListValue(int value) {
        String returnValue = String.Empty;
        switch (value) {
            case 1:
                 returnValue = "Yes";
                break;
            case 2 :
                returnValue =  "No";
                break;
            case 3 :
                returnValue =  "N/A";
                break;
            default : 
                // default should not be reached
                returnValue = String.Empty;
                break;
        }
        return returnValue;
    }

    /// <summary>
    /// Changes the bound data in the Lab/Office Gridview to Yes,No,N/A depenind on database value
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">row in the gridview</param>
    protected void gdvLabInspection_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e) {
        if (e.Row.RowType == DataControlRowType.DataRow) {
            for (int i = -1; i < gdvLabInspection.Rows.Count; i++) {
                if (e.Row.Cells[1].Text == "1")
                    e.Row.Cells[1].Text = "Yes";

                if (e.Row.Cells[1].Text == "2")
                    e.Row.Cells[1].Text = "No";

                if (e.Row.Cells[1].Text == "3")
                    e.Row.Cells[1].Text = "N/A";
            }
        }
    }
}