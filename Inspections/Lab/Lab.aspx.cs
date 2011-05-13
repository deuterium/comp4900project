using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

/// <summary>
///Lab.aspx.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Author: BCIT COMP4900 2011
///Mike Anderson - anderson.michael23@gmail.com
/// </summary>
public partial class Inspections_Lab_Lab : System.Web.UI.Page
{
    BCCAEntities ctx = new BCCAEntities();

    /// <summary>
    /// Code that is executed when the page is originally loaded. In this case, the code will populate
    /// the dropdown menu Lab Manager with information from the database.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlLabLabManager.DataSource = ctx.LabInspections.Select(l => new { text = l.labMgr, value = l.labMgr });
            ddlLabLabManager.DataValueField = "value";
            ddlLabLabManager.DataTextField = "text";
            ddlLabLabManager.DataBind();
        }
    }

    /// <summary>
    /// This is the function that is executed when the Submit button on the Lab page has been pushed.
    /// The function validates the page ensuring the form is correctly completed. It then creates the 
    /// entity objects and submits the data to the database.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnLabInspectionSubmit_Click(object sender, EventArgs e)
    {

        //Validates the various sections of the page to ensure the data is input correctly.
        Page.Validate("vgpLabB");
        Page.Validate("vgpLabC");
        Page.Validate("vgpLabD");
        Page.Validate("vgpLabE");
        Page.Validate("vgpLabF");
        Page.Validate("vgpLabG");
        Page.Validate("vgpLabH");
        Page.Validate("vgpLabI");
        Page.Validate("vgpLabJ");
        Page.Validate("vgpLabK");

        //If the page is valid then it continues to enter the data into the database.
        if (Page.IsValid)
        {
            /*
            LabInspection inc = new LabInspection()
            {
            
            };


            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
                {
                    labItemNo = 1,
                    @checked = this.rblFireEvac.SelectedItem.Value,
                    comments = this.tbxCommentFireEvac.Text,
                });

            LabInspectionDetail detailFireEvac = new LabInspectionDetail()
            ;

            LabInspectionDetail detailFireExtinguish = new LabInspectionDetail() 
            {
                labItemNo = 2,
                @checked = this.rblFireExtinguish.SelectedValue,
                comments = this.tbxCommentFireExtinguish.Text,
            };


            ctx.AddToLabInspections(inc);
            ctx.SaveChanges();
            */
        }
    }
}