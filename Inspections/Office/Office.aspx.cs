using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

/// <summary>
///Office.aspx.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Author: BCIT COMP4900 2011
///Mike Anderson - anderson.michael23@gmail.com
/// </summary>
public partial class Inspections_Office_Office : System.Web.UI.Page
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
            ddlOfficeLabManager.DataSource = ctx.LabInspections.Select(l => new { text = l.labMgr, value = l.labMgr });
            ddlOfficeLabManager.DataValueField = "value";
            ddlOfficeLabManager.DataTextField = "text";
            ddlOfficeLabManager.DataBind();
        }
    }

    /// <summary>
    /// This is the function that is executed when the Submit button on the Office page has been pushed.
    /// The function validates the page ensuring the form is correctly completed. It then creates the 
    /// entity objects and submits the data to the database.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnOfficeInspectionSubmit_Click(object sender, EventArgs e)
    {

        //Validates the various sections of the page to ensure the data is input correctly.
        Page.Validate("vgpOfficeB");
        Page.Validate("vgpOfficeC");
        Page.Validate("vgpOfficeD");
        Page.Validate("vgpOfficeE");
        Page.Validate("vgpOfficeF");
        Page.Validate("vgpOfficeG");
        Page.Validate("vgpOfficeH");
        Page.Validate("vgpOfficeI");
        Page.Validate("vgpOfficeJ");
        Page.Validate("vgpOfficeK");

        //If the page is valid then it continues to enter the data into the database.
        if (Page.IsValid)
        {

        }
    }

    /// <summary>
    /// This function takes in the value returned from the RadioButtonList control and converts
    /// it to a value that is standard in our database by using a switch that determines the
    /// returned string's value.
    /// </summary>
    /// <param name="selection">The string value of the RadioButtonList SelectedItem Value</param>
    /// <returns>The int value that is standard in our database</returns>
    protected int radiobuttonConvert(string selection)
    {
        int value = 0;

        switch (selection)
        {
            case "Yes":
                value = 1;
                break;
            case "No":
                value = 2;
                break;
            case "NA":
                value = 3;
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }

        return value;
    }
}