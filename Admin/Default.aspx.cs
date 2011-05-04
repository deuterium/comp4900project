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
    /// Changes the button "mode" of the User button for creating new users
    /// and editing existing users.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void rblUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch(rblUsers.SelectedValue) {
            case "Create":
                btnUser.Text = "< Create User";
                break;
            case "Edit":
                btnUser.Text = "< Edit User";
                break;
        }
    }
}