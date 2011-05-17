using System;
using System.Linq;
using BCCAModel;
using System.Web.UI.WebControls;
using System.Drawing;

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
        if (!IsPostBack)
        {
            try
            {
                tbTypeHidden.Text = PreviousPage.followupType;
                tbNoHidden.Text = PreviousPage.followupNo;
                switch (tbTypeHidden.Text)
                {
                    case "Incident":
                        divFollowupIncidentReport.Visible = true;
                        break;
                    case "Lab":
                        divLabOfficeFollowupReport.Visible = true;
                        Populate_Lab_Followup(Convert.ToInt32(tbNoHidden.Text));
                        break;
                    case "Office":
                        divLabOfficeFollowupReport.Visible = true;
                        break;
                    default:
                        throw new System.SystemException("Default case of switch should never be reached");
                }
            }
            //If execption thrown, no data from previous page; Should not be here unless transfered
            //from Default.aspx in this same directory with selected report information
            catch (Exception ex)
            {
                ex.ToString();
                Response.Redirect("Default.aspx");
            }
        }
    }

    /// <summary>
    /// Calls the show method of the modal popup AJAX panel.
    /// Shows a confirmation page overlay with a message.
    /// </summary>
    /// <param name="msg">Message displayed on confirmation overlay</param>
    /// <param name="color">Color for the message to be</param>
    protected void Popup_Overlay(string msg, Color color)
    {
        lblPnlPop.Text = msg;
        lblPnlPop.ForeColor = color;
        pnlPop.Style.Value = "display:block;";
        mpePop.Show();
    }

    protected void btnPnlPopClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    #region Incident Followup

    #endregion

    #region Lab & Office Followup
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
        gvwLabFollowup.Columns[0].ItemStyle.Width = 220;
        gvwLabFollowup.Columns[1].ItemStyle.Width = 80;
        gvwLabFollowup.Columns[2].ItemStyle.Width = 250;
        gvwLabFollowup.Columns[3].ItemStyle.Width = 250;

    }

    protected void tbSubmittedby_Load(object sender, EventArgs e)
    {
        tbSubmittedby.Text = Session["AuthenticatedUser"].ToString();
        tbFollowUpDate.Text = DateTime.Now.ToShortDateString();
    }

    /// <summary>
    /// Changes the bound data in the Lab/Office Gridview to Yes,No,N/A depenind on database value
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">row in the gridview</param>
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

    protected void btnLabOfficeFollowupSubmit_Click(object sender, EventArgs e)
    {
        switch (tbTypeHidden.Text)
        {
            case "Lab":
                Submit_Lab_Followup();
                break;
            case "Office":

                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }


    protected void Submit_Lab_Followup()
    {
        int insNo = Convert.ToInt32(tbNoHidden.Text);
        foreach (GridViewRow r in gvwLabFollowup.Rows)
        {
            //Decodes &codes;
            string insItem = Server.HtmlDecode(r.Cells[0].Text);

            int insItemNo = ctx.LabInspectionItems
                    .Where(lii => lii.labInsItem == insItem)
                    .Select(lii => lii.labInsItemNo).First();
            string insComment = ((TextBox)r.Cells[3].FindControl("tbCorrectiveAction")).Text;
            ctx.AddToLabFollowUps(new LabFollowUp()
            {
                labInsNo = insNo,
                labInsItemNo = insItemNo,
                comment = insComment
            });
        }

        LabInspection labIns = ctx.LabInspections
            .Where(li => li.labInsNo == insNo)
            .Select(li => li).First();
        labIns.followupComment = tbLabOfficeFollowupComments.Text;
        labIns.followupSubmitter = tbSubmittedby.Text;
        labIns.followupDate = Convert.ToDateTime(tbFollowUpDate.Text);
        labIns.followUpStatus = "2";

        try
        {
            ctx.SaveChanges();
        }
        catch (Exception ex)
        {
            Popup_Overlay(ex.Message, Color.Red);
            return;
        }
        Popup_Overlay("Follow up Submitted.", Color.Green);
    }
    protected void Submit_Office_Followup()
    {

    }
    #endregion


}