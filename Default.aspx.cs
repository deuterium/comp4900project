using System;
using System.Linq;
using System.Web.Security;
using BCCAModel;

public partial class _Default : System.Web.UI.Page
{

    //Database Entities
    BCCAEntities ctx = new BCCAEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            //Label1.Text += Session["AuthenticatedUser"].ToString();
            //Label2.Text += Session["AuthenticationHash"].ToString();
            //Label3.Text += Session["RoleNo"].ToString();
            //Label4.Text += Session["DeptNo"].ToString();
        }
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
        if (ASP.global_asax.Hash_Password(password).Equals(dbPass))
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
            try
            {
                Session["RoleNo"] = ctx.Users.Where(u => u.userName == tbxLoginUsername.Text).Select(r => r.roleNo).First();
            }
            catch (Exception ex)
            {
                ex.ToString();
                Session["RoleNo"] = "";
            }


            try
            {
                Session["DeptNo"] = ctx.Users.Where(u => u.userName == tbxLoginUsername.Text).Select(r => r.deptNo).First();
                Session["DeptNo"].ToString();
            }
            catch (Exception ex)
            {
                ex.ToString();
                Session["DeptNo"] = "";
            }

            Object redirectUrl = Session["AfterLoginRedirectUrl"];
            if ((redirectUrl == null))
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Session["AfterLoginRedirectUrl"] = null;
                Response.Redirect(redirectUrl.ToString());
            }
        }
        //Authentication Failure
        else
        {
            lblLoginError.Text = "Username/Password pair not found.";
            lblLoginError.ForeColor = System.Drawing.Color.Red;
        }
    }
}