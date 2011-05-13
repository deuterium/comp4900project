using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;

public partial class Inspections_Office_Office : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// This is the function that is executed when the Submit button on the Office page has been pushed.
    /// The function validates the page ensuring the form is correctly completed. It then creates the 
    /// entity objects and submits the data to the database.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
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
}