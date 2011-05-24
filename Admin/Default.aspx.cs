using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
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
        //Check User Authentication
        Session["AfterLoginRedirectUrl"] = Request.Url.ToString();
        ASP.global_asax.Session_Authentication();
        Session["AfterLoginRedirectUrl"] = null;

        //Lab managers should no be on this page, if they go here they are forwarded away
        int roleNo = (int)Session["RoleNo"];
        string role = ctx.Roles.Where(r => r.roleNo == roleNo).Select(r => r.role1).First();
        if (role == "Lab Manager" || role == "Safety Officer")
        {
            Response.Redirect("~/Default.aspx");
        }

        pnlPop.Style.Value = "display:none;";

        if (!IsPostBack)
        {
            addCharFilterToAllTextBoxes();
        }
    }

    #region Add Char Filter to All TextBox
    /// <summary>
    /// Recursively gets every control of the specified root (including root and all it's child controls).
    /// Returns the controls as an array of Control objects.
    /// </summary>
    /// <param name="root">The root control to get child controls for.</param>
    /// <returns>An array of all the child controls of root.</returns>
    public static Control[] getAllPageControls(Control root)
    {
        List<Control> list = new List<Control>();
        list.Add(root);
        if (root.HasControls())
        {
            foreach (Control control in root.Controls)
            {
                list.AddRange(getAllPageControls(control));
            }
        }
        return list.ToArray();
    }

    /// <summary>
    /// Adds a character filter to all Text Boxes on the page.
    /// Prevents users from entering the <, >, &, or # characters in Text Boxes.
    /// These characters trigger the HttpRequestValidationException that prevents script injection.
    /// Note: the JS behind the filter could be turned off, in which case, the exception will still occur.
    /// </summary>
    private void addCharFilterToAllTextBoxes()
    {
        Control[] allControls = getAllPageControls(Page);
        foreach (Control c in allControls)
        {
            TextBox tbx = c as TextBox;
            if (tbx != null)
            {
                FilteredTextBoxExtender fte = new FilteredTextBoxExtender();
                fte.FilterMode = FilterModes.InvalidChars;
                fte.InvalidChars = "<>&#";
                fte.TargetControlID = c.ID;
                tbx.Parent.Controls.Add(fte);
            }
        }
    }
    #endregion Filter TextBox

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
                tbUsername.ReadOnly = false;
                User_Pass_Clear();
                cvlUserNew.Enabled = true;
                rblUserRole.ClearSelection();
                tbwPassword.Enabled = false;
                tbUsername.Enabled = true;
                btnUserNew.Text = "Create User";
                break;
            case "Edit":
                User_Pass_Clear();
                tdUserCreateRoleDiv.Visible = false;
                tdUserCreateLabDiv.Visible = false;
                tdUserSystemUsers.Visible = true;
                btnUserDelete.Visible = true;
                tbUsername.ReadOnly = true;
                cvlUserNew.Enabled = false;
                tbUsername.Enabled = false;
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
                    User_Pass_Clear();
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

    /// <summary>
    /// Clears the values of the textboxes of any previous User informaiton 
    /// that is not needed in the tbs after creating or deleting an User.
    /// </summary>
    protected void User_Pass_Clear()
    {
        tbUsername.Text = String.Empty;
        tbUsernameID.Text = String.Empty;
        tbPassword.Text = String.Empty;
    }
    #endregion

    #region Dropdown Menu Management

    /// <summary>
    /// By default the selection of the radio button list for editing of Drop downs is set to Departments
    /// This method allows on the first page load for the departments to be populated into the listbox.
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
    /// Populates the listbox for the selected value from the radio button list
    /// of drop down menu types. Selection also changes to text on a few labels
    /// and the create and delete buttons for this portion of the Admin page.
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

        //change button text to selected mode
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
        }).OrderBy(a => a.deptName);
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
        })
        .OrderBy(p => p.positionName);
        lbDropDowns.DataTextField = "positionName";
        lbDropDowns.DataValueField = "positionNo";
        lbDropDowns.DataBind();
    }

    /// <summary>
    /// Used for the creation of Drop down menu items. What is created is dependant on what
    /// mode the drop down menu radio button list is in. Once the object is created it is 
    /// submitted to the database. A popup overlay is displayed on success and on error.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
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
    /// Used for the deletion of Drop down menu items as per the selected value in the listbox.
    /// What is deletd is dependant on what mode the drop down menu radio button list is in. 
    /// Once the object is created it is submitted to the database. 
    /// A popup overlay is displayed on success and on error.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
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
    /// <summary>
    /// Loads all the courses when the page is first displayed.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void lbxAllCourses_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Load_AllCourses();
            switchCourseManagementMode("Create");
        }
    }

    /// <summary>
    /// Loads all the courses from the database and binds the information to the List Box.
    /// </summary>
    protected void Load_AllCourses()
    {
        var qry = ctx.TrainingCourses
                  .OrderBy(tc => tc.trainingName)
                  .Select(tc => tc);

        lbxAllCourses.DataSource = qry;
        lbxAllCourses.DataTextField = "trainingName";
        lbxAllCourses.DataValueField = "trainingNo";
        lbxAllCourses.DataBind();
    }

    /// <summary>
    /// Returns the course selected in the List Box of all courses as an object.
    /// Returns null on failure.
    /// </summary>
    /// <returns>Returns the selected course in the List Box as an object.</returns>
    private TrainingCours getSelectedCourse()
    {
        if (lbxAllCourses.SelectedValue == null)
        {
            return null;
        }
        if (lbxAllCourses.SelectedValue.Equals(String.Empty))
        {
            return null;
        }

        int courseId = Convert.ToInt32(lbxAllCourses.SelectedValue);
        TrainingCours course = ctx.TrainingCourses
                               .Where(c => (c.trainingNo == courseId))
                               .Select(c => c).FirstOrDefault();
        return course;
    }

    /// <summary>
    /// Calls loadCourse() to load a course into the edit form.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void lbxAllCourses_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadCourse();
    }

    /// <summary>
    /// Switches to edit mode.
    /// Loads a course into the edit form.
    /// Displays a pop-up if there is an error.
    /// </summary>
    private void loadCourse()
    {
        TrainingCours course = getSelectedCourse();

        if (course == null)
        {
            Popup_Overlay("An unexpected error occured. Unable to select course.", Color.Red);
            return;
        }

        switchCourseManagementMode("Edit");
        tbxCourseName.Text = course.trainingName;
        if (course.monthsValid == null)
        {
            cbxNeverExpires.Checked = true;
            toggleNeverExpires();
            tbxMonthsValid.Text = "1";
        }
        else
        {
            cbxNeverExpires.Checked = false;
            toggleNeverExpires();
            tbxMonthsValid.Text = course.monthsValid.ToString();
        }
    }

    /// <summary>
    /// Creates a course from the fields in the form and saves that course to the database.
    /// Displays a pop-up on success/failure.
    /// </summary>
    private void createCourse()
    {
        TrainingCours tc = new TrainingCours();
        tc.trainingName = tbxCourseName.Text;
        if (cbxNeverExpires.Checked)
        {
            tc.monthsValid = null;
        }
        else
        {
            tc.monthsValid = Convert.ToDecimal(tbxMonthsValid.Text);
        }

        try
        {
            ctx.AddToTrainingCourses(tc);
            ctx.SaveChanges();
        }
        catch (Exception ex)
        {
            ex.ToString();
            Popup_Overlay("An error occured while adding your course. Please try again.", Color.Red);
            return;
        }
        Load_AllCourses();
        Popup_Overlay("Course succesfully added.", Color.Green);
    }

    /// <summary>
    /// Updates the selected course from the fields in the form and saves the changes to the database.
    /// Displays a pop-up on success/failure.
    /// </summary>
    private void updateCourse()
    {
        TrainingCours course = getSelectedCourse();

        if (course == null)
        {
            Popup_Overlay("Could not find course. Course changes not saved.", Color.Red);
        }

        course.trainingName = tbxCourseName.Text;
        if (cbxNeverExpires.Checked)
        {
            course.monthsValid = null;
        }
        else
        {
            course.monthsValid = Convert.ToDecimal(tbxMonthsValid.Text);
        }

        try
        {
            ctx.SaveChanges();
        }
        catch (Exception ex)
        {
            ex.ToString();
            Popup_Overlay("An error occured while saving your course. Please try again.", Color.Red);
            return;
        }
        Popup_Overlay("Course succesfully saved.", Color.Green);
    }

    /// <summary>
    /// Calls switchCourseManagementMode() to change the form fields to match the selected mode (Create or Edit).
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void rblCourseMode_SelectedIndexChanged(object sender, EventArgs e)
    {
        switchCourseManagementMode(rblCourseMode.SelectedValue);
    }

    /// <summary>
    /// Changes the form fields to match the selected mode (Create or Edit).
    /// Create mode clears the List Box selection, changes the submit button to an Add button, and hides the Delete button.
    /// Edit mode changes the submit button to a Save button and shows the Delete button.
    /// </summary>
    /// <param name="mode"></param>
    private void switchCourseManagementMode(String mode)
    {
        if (mode.Equals("Create"))
        {
            clearForm();
            rblCourseMode.SelectedValue = mode;
            lbxAllCourses.ClearSelection();
            btnDeleteCourse.Visible = false;
            btnSubmitCourse.Text = "Add";
        }
        else
        {
            rblCourseMode.SelectedValue = mode;
            btnDeleteCourse.Visible = true;
            btnSubmitCourse.Text = "Save";
        }
    }

    /// <summary>
    /// Toggles the months valid field to show/hide if the never expires is unchecked/checked.
    /// </summary>
    private void toggleNeverExpires()
    {
        if (cbxNeverExpires.Checked)
        {
            nexMonthsValid.Enabled = false;
            tbxMonthsValid.Visible = false;
        }
        else
        {
            nexMonthsValid.Enabled = true;
            tbxMonthsValid.Visible = true;
        }
    }

    /// <summary>
    /// Calls toggleNeverExpires() to show/hide the months valid field.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void cbxNeverExpires_CheckChanged(object sender, EventArgs e)
    {
        toggleNeverExpires();
    }

    /// <summary>
    /// Deletes the selected course.
    /// Shows a pop-up on success/failure.
    /// Clears the form and re-loads the list of all courses.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnDeleteCourse_Click(object sender, EventArgs e)
    {
        TrainingCours course = getSelectedCourse();
        try
        {
            ctx.DeleteObject(course);
            ctx.SaveChanges();
        }
        catch (Exception ex)
        {
            ex.ToString();
            Popup_Overlay("An error occured while deleting your course. Please try again.", Color.Red);
            return;
        }
        clearForm();
        Load_AllCourses();
        Popup_Overlay("Course succesfully deleted.", Color.Green);
    }

    /// <summary>
    /// Checks the Course Management mode.
    /// If Edit mode is selected, calls the updateCourse() method.
    /// If Create mode is selected, calls the createCourse() method.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnSubmitCourse_Click(object sender, EventArgs e)
    {
        if (rblCourseMode.SelectedValue.Equals("Create"))
        {
            createCourse();
        }
        else if (rblCourseMode.SelectedValue.Equals("Edit"))
        {
            updateCourse();
        }
    }

    /// <summary>
    /// Resets the form fields to blank and the months valid to 1.
    /// Clears the selected value in the List Box.
    /// </summary>
    private void clearForm()
    {
        lbxAllCourses.ClearSelection();
        cbxNeverExpires.Checked = false;
        toggleNeverExpires();
        tbxCourseName.Text = String.Empty;
        tbxMonthsValid.Text = "1";
    }

    /// <summary>
    /// Calls clearForm() to reset the form.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnCancelCourse_Click(object sender, EventArgs e)
    {
        clearForm();
    }
    #endregion Course Management
}