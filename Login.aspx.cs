using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web.Security;
using BCCAModel;

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
    //Database Entities
    BCCAEntities ctx = new BCCAEntities();

    /// <summary>
    /// Login Page Load Method
    /// Not used on Login page
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //Following code is an example for checking session for authenticated user.
        //DO NOT uncomment on this page, inifinte load!
        //ASP.global_asax.Session_Authentication();
        //lblTest.Text = Session["AuthenticatedUser"].ToString();
    }

    /// <summary>
    /// Compares entered username and password to credentials in database
    /// Passwords are hashed to match hashed passwords in database
    /// </summary>
    /// <param name="username">Entered username</param>
    /// <param name="password">Entered password</param>
    /// <returns>true if exists, false if does not exist</returns>
    protected bool Check_Credentials(string username, string password)
    {
        string dbPass = string.Empty;
        try
        {
            dbPass = ctx.Users.Where(u => u.userName == username).Select(u => u.password).First();
        }
        catch (Exception e) 
        {
            //Treats empty result exceptions and invalid database returns as failed logins
            e.ToString();
        }

        if (HashPassword(password).Equals(dbPass))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// Hashes the provided password with the SHA256 hash that is common
    /// to .NET framework systems rather than just ASP.NET (FormsAuthentication)
    /// </summary>
    /// <param name="pwd">Password to hash</param>
    /// <returns>Password hashed with SHA1</returns>
    protected String HashPassword(string pwd)
    {
        byte[] bytes = Encoding.Unicode.GetBytes(pwd);
        byte[] inArray = HashAlgorithm.Create("SHA256").ComputeHash(bytes);
        return Convert.ToBase64String(inArray);
    }

    /// <summary>
    /// Authenticates User Credentials to database
    /// Redirects on success and stores login status in session
    /// Returns error on failure
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //Authentication Success    
        if (Check_Credentials(tbxLoginUsername.Text, tbxLoginPassword.Text))
        {
            lblLoginError.Text = String.Empty;
            Session["AuthenticatedUser"] = tbxLoginUsername.Text;
            Session["AuthenticationHash"] = FormsAuthentication.HashPasswordForStoringInConfigFile
                (tbxLoginUsername.Text + "&U74U53R", "MD5");

            Response.Redirect("Default.aspx");
        }
        //Authentication Failure
        else
        {
            lblLoginError.Text = "Username/Password pair not found.";
            lblLoginError.ForeColor = System.Drawing.Color.Red;
        }
    }
}