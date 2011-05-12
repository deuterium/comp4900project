﻿using System;
using System.Drawing;
using System.Linq;
using BCCAModel;

/// <summary>
///Admin/Default.aspx.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Author: BCIT COMP4900 2011
///Chris Wood - chriswood.ca@gmail.com
/// </summary>
public partial class Admin_Default : System.Web.UI.Page
{
    //Database Entities
    BCCAEntities ctx = new BCCAEntities();

    /// <summary>
    /// Hides Popup panel on page load.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        pnlPop.Style.Value = "display:none;";
    }

    #region Page Popup
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
    /// Clears username and password textboxes when the overlay is closed.
    /// If user is in edit user mode, the listbox is also updated.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnPnlPopClose_Click(object sender, EventArgs e)
    {
        switch (rblUsers.SelectedValue)
        {
            case "Create":
                User_Pass_Clear();
                break;
            case "Edit":
                User_Pass_Clear();
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }
    #endregion

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
                tdUserCreateRoleDiv.Visible = true;
                btnUserDelete.Visible = false;
                tbUsername.Text = String.Empty;
                tbUsername.ReadOnly = false;
                tbPassword.Text = String.Empty;
                cvlUserNew.Enabled = true;
                rblUserRole.ClearSelection();
                tbwPassword.Enabled = false;
                btnUserNew.Text = "Create User";
                break;
            case "Edit":
                tdUserCreateRoleDiv.Visible = false;
                tdUserCreateLabDiv.Visible = false;
                tdUserSystemUsers.Visible = true;
                btnUserDelete.Visible = true;
                tbUsername.ReadOnly = true;
                cvlUserNew.Enabled = false;
                btnUserNew.Text = "Change Password";
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
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
                rfvLabManagerDepartment.Enabled = false;
                ddlDepartments.SelectedValue = "";
                break;
            case "Safety Officer":
                tdUserCreateLabDiv.Visible = false;

                rfvLabManagerDepartment.Enabled = false;
                ddlDepartments.SelectedValue = "";
                break;
            case "Lab Manager":
                tdUserCreateLabDiv.Visible = true;
                rfvLabManagerDepartment.Enabled = true;
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
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
                        return;
                    }
                    Popup_Overlay("User succesfully added.", Color.Green);
                    lbxUsers.DataBind();
                }
                break;
            case "Edit":
                int userNo = Convert.ToInt32(tbUsernameID.Text);
                BCCAModel.User user = ctx.Users
                    .Select(us => us)
                    .Where(us => us.userNo == userNo)
                    .First();
                user.password = ASP.global_asax.Hash_Password(tbPassword.Text);
                try
                {
                    ctx.SaveChanges();
                }
                catch (Exception ex)
                {
                    Popup_Overlay(ex.Message, Color.Red);
                    return;
                }
                Popup_Overlay("User's password changed.", Color.Green);
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }

    /// <summary>
    /// Loads the selected user's information into the username textbox when a user
    /// is chosen from the System Users list box. Changes the text of the password box
    /// to "Enter new password". Also loads the databaase user ID number into a hidden textbox 
    /// </summary>
    /// <param name="sender">not used in our system</param>
    /// <param name="e">not used in our system</param>
    protected void lbxUsers_SelectedIndexChanged(object sender, EventArgs e)
    {
        tbUsername.Text = lbxUsers.SelectedItem.Text;
        tbUsernameID.Text = lbxUsers.SelectedValue;
        tbwPassword.Enabled = true;
    }

    /// <summary>
    /// Deletes the user that is currently selected in the listbox from the System using the ID
    /// in the hidden text box.
    /// </summary>
    /// <param name="sender">not used in our system</param>
    /// <param name="e">not used in our system</param>
    protected void btnUserDelete_Click(object sender, EventArgs e)
    {
        int userNo = Convert.ToInt32(tbUsernameID.Text);
        BCCAModel.User user = ctx.Users
                        .Select(us => us)
                        .Where(us => us.userNo == userNo)
                        .First();
        try
        {
            ctx.DeleteObject(user);
            ctx.SaveChanges();
        }
        catch (Exception ex)
        {
            Popup_Overlay(ex.Message, Color.Red);
            return;
        }
        Popup_Overlay("User successfully deleted.", Color.Green);
        lbxUsers.DataBind();
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

    protected void User_Pass_Clear()
    {
        tbUsername.Text = String.Empty;
        tbUsernameID.Text = String.Empty;
        tbPassword.Text = String.Empty;
    }
    #endregion

    #region Dropdown Menu Management

    /// <summary>
    /// TODO---------------------------------------------------------------------------------------------------------------------------
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void lbDropDowns_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Load_Departments();
        }
    }

    /// <summary>
    /// TODO---------------------------------------------------------------------------------------------------------------------------
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void rblDropDownEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Value from selected radio button item for drop down menu editing
        string mode = rblDropDownEdit.SelectedValue;
        switch (mode)
        {
            case "Departments":
                Load_Departments();
                break;
            case "Positions":
                Load_Positions();
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }

        //change listbox datasource here
        lblDropDownsDelete.Text = mode + " in system:";
        mode = mode.Substring(0, mode.Length - 1);
        lblDropDownsNew.Text = "Name of " + mode + " to add:";
        btnDropDownsDelete.Text = "> Delete " + mode;
        btnDropDownsNew.Text = "< Add " + mode;
    }

    /// <summary>
    /// Loads all the departments from the table in the database and binds
    /// the information to the Dropdown items Listbox.
    /// </summary>
    protected void Load_Departments()
    {
        lbDropDowns.DataSource = ctx.Departments.Select(d => new
        {
            deptName = d.deptName,
            deptNo = d.deptNo
        });
        lbDropDowns.DataTextField = "deptName";
        lbDropDowns.DataValueField = "deptNo";
        lbDropDowns.DataBind();
    }

    /// <summary>
    /// Loads all the positions from the table in the database and binds
    /// the information to the Dropdown items Listbox.
    /// </summary>
    protected void Load_Positions()
    {
        lbDropDowns.DataSource = ctx.Positions.Select(p => new
        {
            positionName = p.posName,
            positionNo = p.posNo
        });
        lbDropDowns.DataTextField = "positionName";
        lbDropDowns.DataValueField = "positionNo";
        lbDropDowns.DataBind();
    }

    /// <summary>
    /// TODO---------------------------------------------------------------------------------------------------------------------------
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDropDownsNew_Click(object sender, EventArgs e)
    {
        switch (rblDropDownEdit.SelectedValue)
        {
            case "Departments":
                try
                {
                    ctx.AddToDepartments(new Department()
                    {
                        deptName = tbxDropDownsNew.Text
                    });
                    ctx.SaveChanges();
                }
                catch (Exception ex)
                {
                    Popup_Overlay(ex.Message, Color.Red);
                    return;
                }
                Popup_Overlay("Department successfully added.", Color.Green);
                Load_Departments();
                tbxDropDownsNew.Text = String.Empty;
                break;
            case "Positions":
                try
                {
                    ctx.AddToPositions(new Position()
                    {
                        posName = tbxDropDownsNew.Text
                    });
                    ctx.SaveChanges();
                }
                catch (Exception ex)
                {
                    Popup_Overlay(ex.Message, Color.Red);
                    return;
                }
                Popup_Overlay("Position successfully added.", Color.Green);
                Load_Positions();
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }

    /// <summary>
    /// TODO---------------------------------------------------------------------------------------------------------------------------
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDropDownsDelete_Click(object sender, EventArgs e)
    {
        switch (rblDropDownEdit.SelectedValue)
        {
            case "Departments":
                try
                {
                    int deptNo = Convert.ToInt32(lbDropDowns.SelectedValue);
                    ctx.DeleteObject(ctx.Departments.Select(d => d).Where(d => d.deptNo == deptNo).First());
                    ctx.SaveChanges();
                }
                catch (Exception ex)
                {
                    Popup_Overlay(ex.Message, Color.Red);
                    return;
                }
                Popup_Overlay("Department successfully removed.", Color.Green);
                Load_Departments();
                break;
            case "Positions":
                try
                {
                    int deptNo = Convert.ToInt32(lbDropDowns.SelectedValue);
                    ctx.DeleteObject(ctx.Positions.Select(p => p).Where(p => p.posNo == deptNo).First());
                    ctx.SaveChanges();
                }
                catch (Exception ex)
                {
                    Popup_Overlay(ex.Message, Color.Red);
                    return;
                }
                Popup_Overlay("Position successfully removed.", Color.Green);
                Load_Positions();
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }
    #endregion

    #region Course Management
    #endregion


}