using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Drawing;
using System.Data;

public partial class Tracking_ViewOfficeInspection : System.Web.UI.Page
{
    #region Class Variables
    // Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    // The colour of header text.
    public Color HeaderForeColor = ColorTranslator.FromHtml("#d80080");
    #endregion class variables

    protected void Page_Load(object sender, EventArgs e)
    {
        String reqIncidentNo = Request.QueryString["LabInspectionNo"];
        int incidentNo = 5; // should be -1
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

    /// <summary>
    /// 
    /// </summary>
    /// <param name="insNo"></param>
    protected void displayLabInspection(int insNo) {
        var qry = ctx.OfficeInspections
                    .Join(
                        ctx.OfficeInspectionDetails,
                        OI => OI.officeInsNo,
                        OID => OID.officeInsNo,
                        (OI, OID) =>
                        new {
                            OI = OI,
                            OID = OID
                        }
                    )
                    .Join(
                        ctx.OfficeInspectionItems,
                        temp0 => temp0.OID.officeInsItemNo,
                        OII => (Int32?)(OII.officeInsItemNo),
                        (temp0, OII) =>
                        new {
                            temp0 = temp0,
                            OII = OII
                        }
                    )
                    .Where(temp1 => (temp1.temp0.OI.officeInsNo == insNo))
                    .Select(
                        temp1 =>
                        new {
                            officeInsItemNo = temp1.OII.officeInsItemNo,
                            officeInsItem = temp1.OII.officeInsName,
                            checkbox = temp1.temp0.OID.checkbox,
                            comments = temp1.temp0.OID.comments
                        }
                    );

        // Format the data for the Grid View
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("officeInsItemNo", typeof(System.String)));
        dt.Columns.Add(new DataColumn("officeInsItem", typeof(System.String)));
        dt.Columns.Add(new DataColumn("checkbox", typeof(System.String)));
        dt.Columns.Add(new DataColumn("comments", typeof(System.String)));
        // Generate rows for each employee
        foreach (var result in qry) {
            String subheader = checkForSubheaderStart(result.officeInsItemNo);
            if (!subheader.Equals(String.Empty)) {
                DataRow drSubheader = dt.NewRow();
                drSubheader["officeInsItemNo"] = subheader;
                dt.Rows.Add(drSubheader);
            }
            DataRow dr = dt.NewRow();
            dr["officeInsItemNo"] = result.officeInsItemNo;
            dr["officeInsItem"] = result.officeInsItem;
            dr["checkbox"] = convertRadioButtonListValue(result.checkbox);
            dr["comments"] = result.comments;
            dt.Rows.Add(dr);
        }

        gdvOfficeInspection.DataSource = dt;
        gdvOfficeInspection.DataBind();

        gdvOfficeInspection.Columns[0].ItemStyle.Width = 20;
        gdvOfficeInspection.Columns[1].ItemStyle.Width = 360;
        gdvOfficeInspection.Columns[2].ItemStyle.Width = 80;
        gdvOfficeInspection.Columns[3].ItemStyle.Width = 250;

        foreach (GridViewRow row in gdvOfficeInspection.Rows) {
            String strChecked = ((Label)row.FindControl("lblChecked")).Text;
            if ((strChecked == null) || (strChecked.Equals(String.Empty))) {
                row.Cells[0].ColumnSpan = gdvOfficeInspection.Columns.Count;
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
            case 1: // Are worker incident/injury forms available / do staff know when to use them
                subheader = "General Safety";
                break;
            case 10: // Is adequate space provided to work safely
                subheader = "Work Areas";
                break;
            case 16: // Are surfaces level and even
                subheader = "Support and Structure";
                break;
            case 21: // Are switch panels free of clutter and accessible
                subheader = "Electrical";
                break;
            case 25: // Does there appear to be adequate ventilation (may have to ask staff to find out about complaints)
                subheader = "Ventilation, Illumination, Noise";
                break;
            case 28: // Are safety procedures in place and known to staff
                subheader = "Work Practices Section";
                break;
            case 32: // Is personal protective equipment required for any specific work
                subheader = "Personal Protective Equipment";
                break;
            case 35: // Are staff trained in proper lift techniques
                subheader = "Strain, Sprain, Overexertion";
                break;
            case 39: // Are Material Safety Data Sheets (MSDS) accessible for staff (via a binder or on-line link to OHSAH)
                subheader = "WHMIS / Hazardous Materials";
                break;
            case 44: // Do staff know what to do in the event of an evacuation alarm
                subheader = "Fire Safety and Emergency Response";
                break;            
            default:
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
            case 2:
                returnValue = "No";
                break;
            case 3:
                returnValue = "N/A";
                break;
            default:
                // default should not be reached
                returnValue = String.Empty;
                break;
        }
        return returnValue;
    }


}