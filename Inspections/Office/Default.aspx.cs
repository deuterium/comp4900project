using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Drawing;

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
        ASP.global_asax.Session_Authentication();

        if (!IsPostBack)
        {
            ddlOfficeDepartment.DataSource = ctx.Departments.Select(D => new { text = D.deptName, value = D.deptName });
            ddlOfficeDepartment.DataValueField = "value";
            ddlOfficeDepartment.DataTextField = "text";
            ddlOfficeDepartment.DataBind();
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

        #region Page Validation

        //Validates the various sections of the page to ensure the data is input correctly.
        Page.Validate("vgpOfficeA");
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
        Page.Validate("vgpOfficeL");

        #endregion

        //If the page is valid then it continues to enter the data into the database.
        if (Page.IsValid)
        {

            #region OfficeInspection Object

            DateTime tmpDate = Convert.ToDateTime(tbxOfficeInspectionDate.Text);

            //OfficeInspection object that will be inserted into the database before the rest of the form
            //so that the unique id can be used to link the OfficeInspectionDetail objects.
            OfficeInspection onc = new OfficeInspection()
            {
                inspector = tbxOfficeInspectors.Text,
                insDate = tmpDate,
                area = tbxOfficeArea.Text,
                deptNo = Convert.ToInt32(ddlOfficeDepartment.SelectedValue),
                reportSubmitter = Session["AuthenticatedUser"].ToString(),
                comments = tbxCommentOfficeComments.Text,
                followUpStatus = "0"
            };

            //try-catch for saving the OfficeInspection object into the database
            try
            {
                ctx.AddToOfficeInspections(onc);
                ctx.SaveChanges();
            }
            catch (Exception ex)
            {
                Popup_Overlay(ex.Message, Color.Red);
                return;
            }

            #endregion

            #region OfficeInspectionDetail Objects Section B

            //Are worker incident/injury forms available / do staff know when to use them
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 1,
                checkbox = radiobuttonConvert(this.rblWorkForm.SelectedItem.Value),
                comments = this.tbxCommentWorkForm.Text,
            });

            //Are new employees informed of work hazards
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 2,
                checkbox = radiobuttonConvert(this.rblNewWorkHaz.SelectedItem.Value),
                comments = this.tbxCommentNewWorkHaz.Text,
            });

            //Do staff know how to contact first aid
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 3,
                checkbox = radiobuttonConvert(this.rblConFirstA.SelectedItem.Value),
                comments = this.tbxCommentConFirstA.Text,
            });

            //Is safety and health training provided
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 4,
                checkbox = radiobuttonConvert(this.rblSafeHealth.SelectedItem.Value),
                comments = this.tbxCommentSafeHealth.Text,
            });

            //Are staff encouraged to take H&S training
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 5,
                checkbox = radiobuttonConvert(this.rblHSTrain.SelectedItem.Value),
                comments = this.tbxCommentHSTrain.Text,
            });

            //Are all exit signs working
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 6,
                checkbox = radiobuttonConvert(this.rblExitSignWork.SelectedItem.Value),
                comments = this.tbxCommentExitSignWork.Text,
            });

            //Are fire exits kept clear
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 7,
                checkbox = radiobuttonConvert(this.rblExitClear.SelectedItem.Value),
                comments = this.tbxCommentExitClear.Text,
            });

            //Are fire extinguishers inspected and up to date
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 8,
                checkbox = radiobuttonConvert(this.rblExtinguishDate.SelectedItem.Value),
                comments = this.tbxCommentExtinguishDate.Text,
            });

            //Do emergency procedures/floor plans exist
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 9,
                checkbox = radiobuttonConvert(this.rblEmProcFloor.SelectedItem.Value),
                comments = this.tbxCommentEmProcFloor.Text,
            });

            #endregion

            #region OfficeInspectionDetail Objects Section C

            //Is adequate space provided to work safely
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 10,
                checkbox = radiobuttonConvert(this.rblSpace.SelectedItem.Value),
                comments = this.tbxCommentSpace.Text,
            });

            //Is work area free of glare and reflection
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 11,
                checkbox = radiobuttonConvert(this.rblGlareReflect.SelectedItem.Value),
                comments = this.tbxCommentGlareReflect.Text,
            });

            //Are appropriate chairs available (5 castors, adjustments etc)
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 12,
                checkbox = radiobuttonConvert(this.rblChairs.SelectedItem.Value),
                comments = this.tbxCommentChairs.Text,
            });

            //Is area free of clutter (housekeeping)
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 13,
                checkbox = radiobuttonConvert(this.rblHousekeep.SelectedItem.Value),
                comments = this.tbxCommentHousekeep.Text,
            });

            //Are shelves kept free of overstacking
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 14,
                checkbox = radiobuttonConvert(this.rblOverstack.SelectedItem.Value),
                comments = this.tbxCommentOverstack.Text,
            });

            //Are working surfaces at appropriate heights to limit posture concerns
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 15,
                checkbox = radiobuttonConvert(this.rblPosture.SelectedItem.Value),
                comments = this.tbxCommentPosture.Text,
            });

            #endregion

            #region OfficeInspectionDetail Objects Section D

            //Are surfaces level and even
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 16,
                checkbox = radiobuttonConvert(this.rblLevel.SelectedItem.Value),
                comments = this.tbxCommentLevel.Text,
            });

            //Is area free of hazards that may cause trips, slips and falls
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 17,
                checkbox = radiobuttonConvert(this.rblTripSlipFall.SelectedItem.Value),
                comments = this.tbxCommentTripSlipFall.Text,
            });

            //Are surfaces slip resistant where necessary
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 18,
                checkbox = radiobuttonConvert(this.rblSlipRes.SelectedItem.Value),
                comments = this.tbxCommentSlipRes.Text,
            });

            //Are steps in good condition
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 19,
                checkbox = radiobuttonConvert(this.rblSteps.SelectedItem.Value),
                comments = this.tbxCommentSteps.Text,
            });

            #endregion

            #region OfficeInspectionDetail Objects Section E

            //Are switch panels free of clutter and accessible
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 20,
                checkbox = radiobuttonConvert(this.rblSwitchPanel.SelectedItem.Value),
                comments = this.tbxCommentSwitchPanel.Text,
            });

            //Are cords and plugs in good condition
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 21,
                checkbox = radiobuttonConvert(this.rblCordPlug.SelectedItem.Value),
                comments = this.tbxCommentCordPlug.Text,
            });

            //Are circuits free of overload
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 22,
                checkbox = radiobuttonConvert(this.rblOverload.SelectedItem.Value),
                comments = this.tbxCommentOverload.Text,
            });

            //Are cords out of the way as not to contribute to tripping hazards
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 23,
                checkbox = radiobuttonConvert(this.rblTripCord.SelectedItem.Value),
                comments = this.tbxCommentTripCord.Text,
            });

            #endregion

            #region OfficeInspectionDetail Objects Section F

            //Does there appear to be adequate ventilation (may have to ask staff to find out about complaints)
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 24,
                checkbox = radiobuttonConvert(this.rblVent.SelectedItem.Value),
                comments = this.tbxCommentVent.Text,
            });

            //Is the workplace free of excessive noise
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 25,
                checkbox = radiobuttonConvert(this.rblNoise.SelectedItem.Value),
                comments = this.tbxCommentNoise.Text,
            });

            //Is there adequate lighting (overhead or task)            
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 26,
                checkbox = radiobuttonConvert(this.rblLighting.SelectedItem.Value),
                comments = this.tbxCommentLighting.Text,
            });

            #endregion

            #region OfficeInspectionDetail Objects Section G

            //Are safety procedures in place and known to staff  
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 27,
                checkbox = radiobuttonConvert(this.rblSafeProc.SelectedItem.Value),
                comments = this.tbxCommentSafeProc.Text,
            });

            //Are procedures documented
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 28,
                checkbox = radiobuttonConvert(this.rblDocs.SelectedItem.Value),
                comments = this.tbxCommentDocs.Text,
            });

            //Do staff know how to report concerns
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 29,
                checkbox = radiobuttonConvert(this.rblConcern.SelectedItem.Value),
                comments = this.tbxCommentConcern.Text,
            });

            #endregion

            #region OfficeInspectionDetail Objects Section H

            //Is personal protective equipment required for any specific work
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 30,
                checkbox = radiobuttonConvert(this.rblPersonEquipReq.SelectedItem.Value),
                comments = this.tbxCommentPersonEquipReq.Text,
            });

            //Do staff know how to use it properly and have been trained where appropriate (E.G. respirator fit test)
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 31,
                checkbox = radiobuttonConvert(this.rblEquipProp.SelectedItem.Value),
                comments = this.tbxCommentEquipProp.Text,
            });

            //Is it available, or do they know how to access PPE
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 32,
                checkbox = radiobuttonConvert(this.rblPPE.SelectedItem.Value),
                comments = this.tbxCommentPPE.Text,
            });

            #endregion

            #region OfficeInspectionDetail Objects Section I

            //Are staff trained in proper lift techniques
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 33,
                checkbox = radiobuttonConvert(this.rblLiftTech.SelectedItem.Value),
                comments = this.tbxCommentLiftTech.Text,
            });

            //Are workstations set up to reduce poor posture
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 34,
                checkbox = radiobuttonConvert(this.rblPoorPosture.SelectedItem.Value),
                comments = this.tbxCommentPoorPosture.Text,
            });

            //Are staff aware of safe handling procedures
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 35,
                checkbox = radiobuttonConvert(this.rblHandle.SelectedItem.Value),
                comments = this.tbxCommentHandle.Text,
            });

            //Do staff know where to find safe handling procedures
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 36,
                checkbox = radiobuttonConvert(this.rblHandleProc.SelectedItem.Value),
                comments = this.tbxCommentHandleProc.Text,
            });

            #endregion

            #region OfficeInspectionDetail Objects Section J

            //Are Material Safety Data Sheets (MSDS) accessible for staff (via a binder or on-line link to OHSAH)
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 37,
                checkbox = radiobuttonConvert(this.rblMSDSandOHSAH.SelectedItem.Value),
                comments = this.tbxCommentMSDSandOHSAH.Text,
            });

            //Have staff who work with hazardous products had WHMIS training
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 38,
                checkbox = radiobuttonConvert(this.rblWHMISTrain.SelectedItem.Value),
                comments = this.tbxCommentWHMISTrain.Text,
            });

            //Worker can answer the following four questions: 1. What are the hazards of the products you are using? 
            //2. How do you protect yourself from the hazards of these products? 3. What do you do in the event of an 
            //emergency? 4. Where can additional information be found?
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 39,
                checkbox = radiobuttonConvert(this.rblFourQuestions.SelectedItem.Value),
                comments = this.tbxCommentFourQuestions.Text,
            });

            //Do staff know how to access the on-line training module
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 40,
                checkbox = radiobuttonConvert(this.rblOnLineTrain.SelectedItem.Value),
                comments = this.tbxCommentOnLineTrain.Text,
            });

            //Do staff know what to do in the event of a spill
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 41,
                checkbox = radiobuttonConvert(this.rblSpill.SelectedItem.Value),
                comments = this.tbxCommentSpill.Text,
            });

            #endregion

            #region OfficeInspectionDetail Objects Section K

            //Do staff know what to do in the event of an evacuation alarm
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 42,
                checkbox = radiobuttonConvert(this.rblEvacAlarm.SelectedItem.Value),
                comments = this.tbxCommentEvacAlarm.Text,
            });

            //Do staff know where the muster station is in the event of an evacuation
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 43,
                checkbox = radiobuttonConvert(this.rblMuster.SelectedItem.Value),
                comments = this.tbxCommentMuster.Text,
            });

            //Are there designated fire wardens and have they had appropriate training
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 44,
                checkbox = radiobuttonConvert(this.rblWarden.SelectedItem.Value),
                comments = this.tbxCommentWarden.Text,
            });

            //Are fire extinguishers in working condition
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 45,
                checkbox = radiobuttonConvert(this.rblExtinguishWork.SelectedItem.Value),
                comments = this.tbxCommentExtinguishWork.Text,
            });

            //Are corridors outside the office area clear and free of storage
            ctx.AddToOfficeInspectionDetails(new OfficeInspectionDetail()
            {
                officeInsNo = onc.officeInsNo,
                officeInsItemNo = 46,
                checkbox = radiobuttonConvert(this.rblOfficeClear.SelectedItem.Value),
                comments = this.tbxCommentOfficeClear.Text,
            });

            #endregion

            #region OfficeInspectionDetail Objects SaveChanges

            //Try-catch for saving the LabInspectionDetail objects into the database.
            try
            {
                ctx.SaveChanges();
            }
            catch (Exception ex)
            {
                Popup_Overlay(ex.InnerException.ToString(), Color.Red);
                return;
            }

            Popup_Overlay("Update Successful", Color.Green);

            #endregion
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

    /// <summary>
    /// Calls the show method of the modal popup AJAX panel. Shows a confirmation page overlay with 
    /// a message.
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
}