using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Drawing;
using BCCAModel;

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
    //Database Entities
    BCCAEntities ctx = new BCCAEntities();

    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlPop.Style.Value = "display:none;";
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

    #region System User Management

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
        switch (rblUsers.SelectedValue)
        {
            case "Create":
                tdUserSystemUsers.Visible = false;
                btnUserDelete.Visible = false;
                btnUserNew.Text = "Create User";
                break;
            case "Edit":
                tdUserCreateRoleDiv.Visible = false;
                tdUserSystemUsers.Visible = true;
                btnUserDelete.Visible = true;
                btnUserNew.Text = "Change Password";
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
        switch (rblUserRole.SelectedItem.Text)
        {
            case "Administrator":
                tdUserCreateLabDiv.Visible = false;
                ddlDepartments.SelectedValue = "";
                break;
            case "Safety Officer":
                tdUserCreateLabDiv.Visible = false;
                ddlDepartments.SelectedValue = "";
                break;
            case "Lab Manager":
                tdUserCreateLabDiv.Visible = true;
                break;
        }
    }

    /// <summary>
    /// Button click method for dealing with the user administration section.
    /// Behavior changes depending on the selected radio button option
    /// Create: Button click creates a new users depending on entered details
    /// Edit: Button click edits selected user depending on details as changed or shown
    /// Shows a completion overlay on success
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnUserNew_Click(object sender, EventArgs e)
    {
        switch (rblUsers.SelectedValue)
        {
            case "Create":
                if (Page.IsValid)
                {
                    BCCAModel.User u = new BCCAModel.User()
                    {
                        userName = tbUsername.Text,
                        password = ASP.global_asax.Hash_Password(tbPassword.Text),
                        roleNo = Convert.ToInt32(rblUserRole.SelectedValue),
                        deptNo = (!(ddlDepartments.SelectedValue == "") ? Convert.ToInt32(ddlDepartments.SelectedValue) : (int?)null)
                    };

                    try
                    {
                        ctx.AddToUsers(u);
                        ctx.SaveChanges();
                    }
                    catch (Exception ex)
                    {
                        Popup_Overlay(ex.Message, Color.Red);
                    }
                    Popup_Overlay("User succesfully added.", Color.Green);
                }
                break;
            case "Edit":

                break;


        }
    }

    protected void lbxUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        tbUsername.Text = lbxUsers.SelectedItem.Text;
        tbUsernameID.Text = lbxUsers.SelectedValue;
        tbPassword.Text = "Enter new password";
    }

    protected void btnUserDelete_Click(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// Custom validator used to check if a username is duplicate in our system. Database allows
    /// for duplicate usernames since the primary key is on userId rather than username. This function 
    /// only allows validation to pass if username does not exist in database.
    /// </summary>
    /// <param name="source">not used in our code</param>
    /// <param name="args">Argument to set valid or not</param>
    protected void cvlUserNew_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        if (ctx.Users.Where(u => u.userName == tbUsername.Text).Count() > 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }
    #endregion

    #region Dropdown Menu Management
    protected void rblDropDownEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
        string mode = rblDropDownEdit.SelectedValue;

        //switch (rblDropDownEdit.SelectedValue)
        //{
        //    case "Departments":

        //        break;
        //    case "Rooms":

        //        break;

        //    case "Positions":

        //        break;

        //    case "Supervisors":

        //        break;
        //}

        //change listbox datasource here
        lblDropDownsDelete.Text = mode + " in system:";
        mode = mode.Substring(0, mode.Length - 1);
        lblDropDownsNew.Text = "Name of " + mode + " to add:";
        btnDropDownsDelete.Text = "> Delete " + mode;
        btnDropDownsNew.Text = "< Add " + mode;
    }

    #endregion

    #region Course Management
    #endregion



    
}