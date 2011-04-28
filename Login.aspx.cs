using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

/// <summary>
///Login.aspx.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Authors: BCIT COMP4900 2011
///Chris Wood - chriswood.ca@gmail.com
///Daisy Yuen - yuen.daisy@gmail.com
///Kalen Wessel - kalen.wessel@gmail.com
///Lindsay Fester - lindsay_f@live.com
///Michael Anderson - anderson.michael23@gmail.com
/// </summary>
public partial class Login : System.Web.UI.Page
{
    /// <summary>
    /// Login Page Load Method
    /// TODO:
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e) {

        //Following code is an example for checking session for authenticated user.
        //DO NOT uncomment on this page, inifinte load!
        //ASP.global_asax.Session_Authentication();
        //lblTest.Text = Session["AuthenticatedUser"].ToString();
    }

    /// <summary>
    /// Compares entered username and password to credentials in database
    /// Passwords are hashed to match hashed passwords in database
    /// TODO: Database query for password
    /// </summary>
    /// <param name="username">Entered username</param>
    /// <param name="password">Entered password</param>
    /// <returns>true if exists, false if does not exist</returns>
    protected bool Check_Credentials(string username, string password)
    {
        //Get password where username, this is for testing purposes
        string dbPass = FormsAuthentication.HashPasswordForStoringInConfigFile("chris", "SHA1");

        if (FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1").Equals(dbPass))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// Authenticates User Credentials to database
    /// Redirects on success and stores login status in session
    /// Returns error on failure
    /// TODO: Redirect on success, which page?
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //Authentication Success    
        if (Check_Credentials(tbxLoginUsername.Text, tbxLoginPassword.Text))
        {
            lblLoginError.Text = "success!";//String.Empty;
            Session["AuthenticatedUser"] = tbxLoginUsername.Text;
            Response.Redirect("ChrisTest.aspx");
        }
        //Authentication Failure
        else
        {
            lblLoginError.Text = "Username/Password pair not found.";
            lblLoginError.ForeColor = System.Drawing.Color.Red;
        }
    }
}