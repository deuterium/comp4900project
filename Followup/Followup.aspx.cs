using System;
using System.Linq;
using BCCAModel;
using System.Web.UI.WebControls;

/// <summary>
///Followup/Followup.aspx.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Author: BCIT COMP4900 2011
///Chris Wood - chriswood.ca@gmail.com
/// </summary>
public partial class Followup_Followup : System.Web.UI.Page
{
    //Database Entities
    BCCAEntities ctx = new BCCAEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            switch (PreviousPage.followupType)
            {
                case "Incident":
                    divFollowupIncident.Visible = true;
                    break;
                case "Lab":
                    divFollowupLab.Visible = true;
                    Populate_Lab_Followup(Convert.ToInt32(PreviousPage.followupNo));
                    break;
                case "Office":
                    divFollowupOffice.Visible = true;
                    break;
                default:
                    throw new System.SystemException("Default case of switch should never be reached");
            }
        }
        //If execption thrown, no data from previous page; Should not be here unless transfered
        //from Default.aspx in this same directory with selected report information
        catch (Exception ex)
        {
            Response.Redirect("Default.aspx");
        }
    }

    #region Incident Followup

    #endregion

    #region Lab Followup
    protected void Populate_Lab_Followup(int insNo)
    {
        gvwLabFollowup.DataSource = ctx.LabInspections
                                  .Join(
                                     ctx.LabInspectionDetails,
                                     LI => LI.labInsNo,
                                     LID => LID.labInsNo,
                                     (LI, LID) =>
                                        new
                                        {
                                            LI = LI,
                                            LID = LID
                                        }
                                  )
                                  .Join(
                                     ctx.LabInspectionItems,
                                     temp0 => temp0.LID.labItemNo,
                                     LII => (Int32?)(LII.labInsItemNo),
                                     (temp0, LII) =>
                                        new
                                        {
                                            temp0 = temp0,
                                            LII = LII
                                        }
                                  )
                                  .Where(temp1 => (temp1.temp0.LI.labInsNo == insNo))
                                  .Select(
                                     temp1 =>
                                        new
                                        {
                                            labInsItem = temp1.LII.labInsItem,
                                            checkbox = temp1.temp0.LID.checkbox,
                                            comments = temp1.temp0.LID.comments
                                        }
                                  );
        gvwLabFollowup.DataBind();
    }

    protected void gvwLabFollowup_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            for (int i = -1; i < gvwLabFollowup.Rows.Count; i++)
            {

                if (e.Row.Cells[1].Text == "1")
                    e.Row.Cells[1].Text = "Yes";

                if (e.Row.Cells[1].Text == "2")
                    e.Row.Cells[1].Text = "No";

                if (e.Row.Cells[1].Text == "3")
                    e.Row.Cells[1].Text = "N/A";

            }
        }
    }
    #endregion

    #region Office Followup

    #endregion
}