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
    // The pink colour of the header text.
    public Color HeaderForeColor = ColorTranslator.FromHtml("#d80080");
    #endregion class variables

    /// <summary>
    /// Loads a lab inspection if the page request contains a valid inspection number.
    /// Otherwise, shows a "no data found" message.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e) {
        String reqIncidentNo = Request.QueryString["LabInspectionNo"];
        int incidentNo = -1;
        try {
            if (reqIncidentNo != null) {
                incidentNo = Convert.ToInt32(reqIncidentNo);
            }
        }
        catch (FormatException ex) {
            // do nothing
        }
        displayLabInspection(incidentNo);
    }

    /// <summary>
    /// Gets the lab inspection out of the database.
    /// Inserts subheader rows into the lab inspection data.
    /// Binds the lab inspection to the grid view.
    /// Formats the grid view so it displays nicely.
    /// </summary>
    /// <param name="insNo">The id of the Lab Inspection to display.</param>
    protected void displayLabInspection(int insNo) {
        if (insNo == -1) {
            return;
        }

        // Get the lab inspection from the database
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
        // Setup the Data Table
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("labInsItemNo", typeof(System.String)));
        dt.Columns.Add(new DataColumn("labInsItem", typeof(System.String)));
        dt.Columns.Add(new DataColumn("checkbox", typeof(System.String)));
        dt.Columns.Add(new DataColumn("comments", typeof(System.String)));
        
        // Put the data in rows, inserting rows for subheaders
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

        // Bind the data to the Grid View
        gdvLabInspection.DataSource = dt;
        gdvLabInspection.DataBind();

        // Set the Grid View column widths
        gdvLabInspection.Columns[0].ItemStyle.Width = 20;
        gdvLabInspection.Columns[1].ItemStyle.Width = 360;
        gdvLabInspection.Columns[2].ItemStyle.Width = 80;
        gdvLabInspection.Columns[3].ItemStyle.Width = 250;
        
        // Find and format the subheader rows
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
    
    /// <summary>
    /// Checks if the lab inspection number is the first one after a subheader
    /// and if it is, returns the subheader, otherwise returns an empty string.
    /// </summary>
    /// <param name="labInsItem">The id of the lab inspection item.</param>
    /// <returns>A subheader or an empty string.</returns>
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

    /// <summary>
    /// Converts a radio button list value (from the database) to display string.
    /// </summary>
    /// <param name="value">The radio button value to convert to a display String.</param>
    /// <returns>A string: Yes for 1, No for 2, N/A or Unknown for 3.</returns>
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
}