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

    /// <summary>
    /// When this page is visited for the first time, it should have been forwarded from
    /// Followup/Default.aspx, so it tries to load some page level variables under the
    /// PreviousPage directive. If it cannot do this, the user gets forwarded back to
    /// Followup/Default.aspx
    /// 
    /// If the page view is valid, then depending on what type of report is forwarded to 
    /// this page does it populate the previous report with followup information below.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                //Store Report/Inspection Type (going to be one of the switch items)
                tbTypeHidden.Text = PreviousPage.followupType;
                //Store Report/Inspection Number
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
                        Populate_Office_Followup(Convert.ToInt32(tbNoHidden.Text));
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

    #region Popup Overlay
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

    /// <summary>
    /// Redirects user on popup overlay close as the followup is now completed.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnPnlPopClose_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    #endregion

    #region Incident Followup

    #endregion

    #region Lab & Office Followup
    /// <summary>
    /// Populates the gridview on the page with the corresponding Lab insNo's
    /// submitted inspection data.
    /// </summary>
    /// <param name="insNo">lab inspection id</param>
    protected void Populate_Lab_Followup(int insNo)
    {
        gvwLabOfficeFollowup.DataSource = ctx.LabInspections
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
                                            insItem = temp1.LII.labInsItem,
                                            checkbox = temp1.temp0.LID.checkbox,
                                            comments = temp1.temp0.LID.comments
                                        }
                                  );
        gvwLabOfficeFollowup.DataBind();
        //Set column widths
        gvwLabOfficeFollowup.Columns[0].ItemStyle.Width = 220;
        gvwLabOfficeFollowup.Columns[1].ItemStyle.Width = 80;
        gvwLabOfficeFollowup.Columns[2].ItemStyle.Width = 250;
        gvwLabOfficeFollowup.Columns[3].ItemStyle.Width = 250;

        //Fills in saved infomoration if report is saved and not submitted
        if (ctx.LabInspections.Where(LI => LI.labInsNo == insNo).Select(LI => LI.followUpStatus).First() == "1")
        {
            foreach (GridViewRow r in gvwLabOfficeFollowup.Rows)
            {
                //Decodes &codes;
                string insItem = Server.HtmlDecode(r.Cells[0].Text);
                int insItemNo = ctx.LabInspectionItems
                        .Where(lii => lii.labInsItem == insItem)
                        .Select(lii => lii.labInsItemNo).First();
                ((TextBox)r.Cells[3].FindControl("tbCorrectiveAction")).Text
                    = ctx.LabFollowUps
                        .Where(LFU => (LFU.labInsNo == insNo) && (LFU.labInsItemNo == insItemNo))
                        .Select(LFU => LFU.comment)
                        .First();
                tbLabOfficeFollowupComments.Text = ctx.LabInspections.Where(LI => LI.labInsNo == insNo).Select(LI => LI.comments).First();

            }
        }

    }

    /// <summary>
    /// Populates the gridview on the page with the corresponding Office insNo's
    /// submitted inspection data.
    /// </summary>
    /// <param name="insNo">office inspection id</param>
    protected void Populate_Office_Followup(int insNo)
    {
        gvwLabOfficeFollowup.DataSource = ctx.OfficeInspections
                                  .Join(
                                     ctx.OfficeInspectionDetails,
                                     OI => OI.officeInsNo,
                                     OID => OID.officeInsNo,
                                     (OI, OID) =>
                                        new
                                        {
                                            OI = OI,
                                            OID = OID
                                        }
                                  )
                                  .Join(
                                     ctx.OfficeInspectionItems,
                                     temp0 => temp0.OID.officeInsItemNo,
                                     OII => (Int32?)(OII.officeInsItemNo),
                                     (temp0, OII) =>
                                        new
                                        {
                                            temp0 = temp0,
                                            OII = OII
                                        }
                                  )
                                  .Where(temp1 => (temp1.temp0.OI.officeInsNo == insNo))
                                  .Select(
                                     temp1 =>
                                        new
                                        {
                                            insItem = temp1.OII.officeInsName,
                                            checkbox = temp1.temp0.OID.checkbox,
                                            comments = temp1.temp0.OID.comments
                                        }
                                  );
        gvwLabOfficeFollowup.DataBind();
        //sets column widths
        gvwLabOfficeFollowup.Columns[0].ItemStyle.Width = 220;
        gvwLabOfficeFollowup.Columns[1].ItemStyle.Width = 80;
        gvwLabOfficeFollowup.Columns[2].ItemStyle.Width = 250;
        gvwLabOfficeFollowup.Columns[3].ItemStyle.Width = 250;

        //Fills in saved infomoration if report is saved and not submitted
        if (ctx.OfficeInspections.Where(OI => OI.officeInsNo == insNo).Select(OI => OI.followUpStatus).First() == "1")
        {
            foreach (GridViewRow r in gvwLabOfficeFollowup.Rows)
            {
                //Decodes &codes;
                string insItem = Server.HtmlDecode(r.Cells[0].Text);
                int insItemNo = ctx.OfficeInspectionItems
                        .Where(oii => oii.officeInsName == insItem)
                        .Select(oii => oii.officeInsItemNo).First();
                ((TextBox)r.Cells[3].FindControl("tbCorrectiveAction")).Text
                    = ctx.OfficeFollowUps
                        .Where(OFU => (OFU.officeInsNo == insNo) && (OFU.officeInsItemNo == insItemNo))
                        .Select(OFU => OFU.comment)
                        .First();
                tbLabOfficeFollowupComments.Text = ctx.OfficeInspections.Where(OI => OI.officeInsNo == insNo).Select(OI => OI.followupComment).First();
            }
        }
    }

    /// <summary>
    /// When the Lab/Office Inspection followup is loaded, automatically fills
    /// in the Followup submitter and defaults the date to current date.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
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
    protected void gvwLabOfficeFollowup_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            for (int i = -1; i < gvwLabOfficeFollowup.Rows.Count; i++)
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

    /// <summary>
    /// Button click method for Lab/Office Followup section, calls corresponding
    /// DB addition functions depending on if Lab or Office Inspection.
    /// Determines which SUBMIT method should be called.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnLabOfficeFollowupSubmit_Click(object sender, EventArgs e)
    {
        switch (tbTypeHidden.Text)
        {
            case "Lab":
                Submit_Lab_Followup();
                break;
            case "Office":
                Submit_Office_Followup();
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }

    /// <summary>
    /// Button click method for Lab/Office Followup section, calls corresponding
    /// DB addition functions depending on if Lab or Office Inspection.
    /// Determines which SAVE method should be called.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnLabOfficeFollowupSave_Click(object sender, EventArgs e)
    {
        switch (tbTypeHidden.Text)
        {
            case "Lab":
                Save_Lab_Followup();
                break;
            case "Office":
                Save_Office_Followup();
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }

    /// <summary>
    /// Iterates through the user provided "Corrective Action Taken" comments and
    /// saves them to the database into the corrseponding Lab Inspection tables for 
    /// the number stored in the hidden textbox.
    /// SUBMITS the Lab Followup
    /// </summary>
    protected void Submit_Lab_Followup()
    {
        int insNo = Convert.ToInt32(tbNoHidden.Text);
        foreach (GridViewRow r in gvwLabOfficeFollowup.Rows)
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

    /// <summary>
    /// Iterates through the user provided "Corrective Action Taken" comments and
    /// saves them to the database into the corrseponding Office Inspection tables for 
    /// the number stored in the hidden textbox.
    /// SUBMITS the Office Followup
    /// </summary>
    protected void Submit_Office_Followup()
    {
        int insNo = Convert.ToInt32(tbNoHidden.Text);
            foreach (GridViewRow r in gvwLabOfficeFollowup.Rows)
            {
                //Decodes &codes;
                string insItem = Server.HtmlDecode(r.Cells[0].Text);

                int insItemNo = ctx.OfficeInspectionItems
                        .Where(oii => oii.officeInsName == insItem)
                        .Select(oii => oii.officeInsItemNo).First();
                string insComment = ((TextBox)r.Cells[3].FindControl("tbCorrectiveAction")).Text;
                ctx.AddToOfficeFollowUps(new OfficeFollowUp()
                {
                    officeInsNo = insNo,
                    officeInsItemNo = insItemNo,
                    comment = insComment
                });
            }

        OfficeInspection offIns = ctx.OfficeInspections
            .Where(oi => oi.officeInsNo == insNo)
            .Select(oi => oi).First();
        offIns.followupComment = tbLabOfficeFollowupComments.Text;
        offIns.followupSubmitter = tbSubmittedby.Text;
        offIns.followupDate = Convert.ToDateTime(tbFollowUpDate.Text);
        offIns.followUpStatus = "2";

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

    /// <summary>
    /// Iterates through the user provided "Corrective Action Taken" comments and
    /// saves them to the database into the corrseponding Lab Inspection tables for 
    /// the number stored in the hidden textbox.
    /// SAVES the Lab Followup
    /// </summary>
    protected void Save_Lab_Followup()
    {
        int insNo = Convert.ToInt32(tbNoHidden.Text);

        if (ctx.LabFollowUps.Where(LFU => LFU.labInsNo == insNo).Select(LFU => LFU).Count() == 0)
        {
            foreach (GridViewRow r in gvwLabOfficeFollowup.Rows)
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
        }
        else
        {
            foreach (GridViewRow r in gvwLabOfficeFollowup.Rows)
            {
                //Decodes &codes;
                string insItem = Server.HtmlDecode(r.Cells[0].Text);

                int insItemNo = ctx.LabInspectionItems
                        .Where(lii => lii.labInsItem == insItem)
                        .Select(lii => lii.labInsItemNo).First();
                string insComment = ((TextBox)r.Cells[3].FindControl("tbCorrectiveAction")).Text;
                LabFollowUp lfu = ctx.LabFollowUps.Where(LFU => (LFU.labInsNo == insNo) && (LFU.labInsItemNo == insItemNo)).Select(LFU => LFU).First();
                lfu.comment = insComment;
                try
                {
                    ctx.SaveChanges();
                }
                catch (Exception ex)
                {
                    Popup_Overlay(ex.Message, Color.Red);
                    return;
                }
            }
        }

        LabInspection labIns = ctx.LabInspections
            .Where(li => li.labInsNo == insNo)
            .Select(li => li).First();
        labIns.followupComment = tbLabOfficeFollowupComments.Text;
        labIns.followUpStatus = "1";

        try
        {
            ctx.SaveChanges();
        }
        catch (Exception ex)
        {
            Popup_Overlay(ex.Message, Color.Red);
            return;
        }
        Popup_Overlay("Follow up has been saved.", Color.Green);
    }

    /// <summary>
    /// Iterates through the user provided "Corrective Action Taken" comments and
    /// saves them to the database into the corrseponding Office Inspection tables for 
    /// the number stored in the hidden textbox.
    /// SAVES the Office Followup
    /// </summary>
    protected void Save_Office_Followup()
    {
        int insNo = Convert.ToInt32(tbNoHidden.Text);
        foreach (GridViewRow r in gvwLabOfficeFollowup.Rows)
        {
            //Decodes &codes;
            string insItem = Server.HtmlDecode(r.Cells[0].Text);

            int insItemNo = ctx.OfficeInspectionItems
                    .Where(oii => oii.officeInsName == insItem)
                    .Select(oii => oii.officeInsItemNo).First();
            string insComment = ((TextBox)r.Cells[3].FindControl("tbCorrectiveAction")).Text;
            ctx.AddToOfficeFollowUps(new OfficeFollowUp()
            {
                officeInsNo = insNo,
                officeInsItemNo = insItemNo,
                comment = insComment
            });
        }

        OfficeInspection offIns = ctx.OfficeInspections
            .Where(oi => oi.officeInsNo == insNo)
            .Select(oi => oi).First();
        offIns.followupComment = tbLabOfficeFollowupComments.Text;
        offIns.followUpStatus = "1";

        try
        {
            ctx.SaveChanges();
        }
        catch (Exception ex)
        {
            Popup_Overlay(ex.Message, Color.Red);
            return;
        }
        Popup_Overlay("Follow up has been saved.", Color.Green);
    }
    #endregion
}
