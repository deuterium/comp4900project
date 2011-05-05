using System;

/// <summary>
///Admin/Default.aspx.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Authors: BCIT COMP4900 2011
///Chris Wood - chriswood.ca@gmail.com
///Daisy Yuen - yuen.daisy@gmail.com
///Kalen Wessel - kalen.wessel@gmail.com
///Lindsay Fester - lindsay_f@live.com
///Michael Anderson - anderson.michael23@gmail.com
/// </summary>
public partial class Admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    /// <summary>
    /// Postback event selecting the mode of the system user administration
    /// section of the admin page. Two modes:
    /// Create - Shows the UI for creating a new user
    /// Edit - Shows the UI for editing a existing user
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void rblUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch(rblUsers.SelectedValue) {
            case "Create":
                tdUserSystemUsers.Visible = false;
                divUserManage.Visible = true;
                btnDelete.Visible = false;
                btnUser.Text = "Create User";
                break;
            case "Edit":
                tdUserSystemUsers.Visible = true;
                divUserManage.Visible = true;
                btnDelete.Visible = true;
                btnUser.Text = "Submit Changes";
                break;
        }
    }
    
    /// <summary>
    /// Postback event for selecting information for a user's role in the
    /// system user administration section of the admin page. Two Roles:
    /// Safety Officer - hides department dropdownmenu
    /// Lab Manager - shows department dropdownmenu
    /// Department shows what lab the Lab Manager looks after.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void rblUserRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (rblUserRole.SelectedValue)
        {
            case "rwAll":
                tdUserCreateLabDiv.Visible = false;
                break;
            case "rInspections":
                tdUserCreateLabDiv.Visible = true;
                break;
        }
    }
}