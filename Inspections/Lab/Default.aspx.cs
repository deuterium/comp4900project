using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Drawing;

/// <summary>
///Lab.aspx.cs
///BCCA Cancer Research Centre
///Safety Training Database and Website
///Author: BCIT COMP4900 2011
///Mike Anderson - anderson.michael23@gmail.com
/// </summary>
public partial class Inspections_Lab_Lab : System.Web.UI.Page
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
            ddlLabLabManager.DataSource = ctx.LabInspections.Select(l => new { text = l.labMgr, value = l.labMgr }).Distinct();
            ddlLabLabManager.DataValueField = "value";
            ddlLabLabManager.DataTextField = "text";
            ddlLabLabManager.DataBind();

            ddlLabDepartment.DataSource = ctx.Departments.Select(D => new { text = D.deptName, value = D.deptNo });
            ddlLabDepartment.DataValueField = "value";
            ddlLabDepartment.DataTextField = "text";
            ddlLabDepartment.DataBind();
        }
    }

    /// <summary>
    /// This is the function that is executed when the Submit button on the Lab page has been pushed.
    /// The function validates the page ensuring the form is correctly completed. It then creates the 
    /// entity objects and submits the data to the database.
    /// </summary>
    /// <param name="sender">not used in our code</param>
    /// <param name="e">not used in our code</param>
    protected void btnLabInspectionSubmit_Click(object sender, EventArgs e)
    {

        #region Page Validation

        //Validates the various sections of the page to ensure the data is input correctly.
        Page.Validate("vgpLabB");
        Page.Validate("vgpLabC");
        Page.Validate("vgpLabD");
        Page.Validate("vgpLabE");
        Page.Validate("vgpLabF");
        Page.Validate("vgpLabG");
        Page.Validate("vgpLabH");
        Page.Validate("vgpLabI");
        Page.Validate("vgpLabJ");
        Page.Validate("vgpLabK");

        #endregion

        //If the page is valid then it continues to enter the data into the database.
        if (Page.IsValid)
        {

            #region LabInspection Object

            DateTime tmpDate = Convert.ToDateTime(tbxLabInspectionDate.Text);

            //LabInspection object that will be inserted into the database before the rest of the form
            //so that the unique id can be used to link the LabInspectionDetail objects.
            LabInspection inc = new LabInspection()
            {
                inspector = tbxLabInspectors.Text,
                date = tmpDate,
                labMgr = ddlLabLabManager.Text,
                supervisor = tbxLabSupervisor.Text,
                room = tbxLabRoom.Text,
                followUpStatus = "0",
                reportSubmitter = Session["AuthenticatedUser"].ToString(),
                comments = tbxCommentLabComments.Text,
                deptNo = Convert.ToInt32(ddlLabDepartment.SelectedValue)
            };

            //Try-catch for saving the LabInspection object into the database.
            try
            {
                ctx.AddToLabInspections(inc);
                ctx.SaveChanges();
            }
            catch (Exception ex)
            {
                Popup_Overlay(ex.Message, Color.Red);
                return;
            }

            #endregion

            #region LabInspectionDetail Objects Section B

            //Fire evacuation route posted on exits in each section/floor
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 1,
                checkbox = radiobuttonConvert(this.rblFireEvac.SelectedItem.Value),
                comments = this.tbxCommentFireEvac.Text,
            });

            //Fire extinguisher in working condition
            ctx.AddToLabInspectionDetails(new LabInspectionDetail() 
            {
                labInsNo = inc.labInsNo,
                labItemNo = 2,
                checkbox = radiobuttonConvert(this.rblFireExtinguish.SelectedValue),
                comments = this.tbxCommentFireExtinguish.Text,
            });

            //Blood and Body Fluid protocol posted
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 3,
                checkbox = radiobuttonConvert(this.rblBloodandBody.SelectedValue),
                comments = this.tbxCommentBloodandBody.Text,
            });

            //Injury on Duty Flow Chart posted
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 4,
                checkbox = radiobuttonConvert(this.rblInjuryonDuty.SelectedValue),
                comments = this.tbxCommentInjuryonDuty.Text,
            });

            //Emergency numbers posted
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 5,
                checkbox = radiobuttonConvert(this.rblEmergencyNumber.SelectedValue),
                comments = this.tbxCommentEmergencyNumber.Text,
            });

            //MSDS binder/computer station accessible & up to date
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 6,
                checkbox = radiobuttonConvert(this.rblMSDS.SelectedValue),
                comments = this.tbxCommentMSDS.Text,
            });

            //Emergency Shower available/accessible
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 7,
                checkbox = radiobuttonConvert(this.rblEmergencyShower.SelectedValue),
                comments = this.tbxCommentEmergencyShower.Text,
            });

            //Emergency Shower tested monthly (if located in section)
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 8,
                checkbox = radiobuttonConvert(this.rblEmergencyShowerTest.SelectedValue),
                comments = this.tbxCommentEmergencyShowerTest.Text,
            });

            //Eyewash available/accessible
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 9,
                checkbox = radiobuttonConvert(this.rblEyewash.SelectedValue),
                comments = this.tbxCommentEyewash.Text,
            });

            //Eyewash tested weekly if not sterile/sealed (& if in section)
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 10,
                checkbox = radiobuttonConvert(this.rblEyewashTest.SelectedValue),
                comments = this.tbxCommentEyewashTest.Text,
            });

            //Chemical spill kit accessible/stocked adequately
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 11,
                checkbox = radiobuttonConvert(this.rblChemicalSpill.SelectedValue),
                comments = this.tbxCommentChemicalSpill.Text,
            });

            //Biohazard spill kit accessible/stocked adequately
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 12,
                checkbox = radiobuttonConvert(this.rblBiohazard.SelectedValue),
                comments = this.tbxCommentBiohazard.Text,
            });

            #endregion

            #region LabInspectionDetail Objects Section C

            //Safety Glasses/Facial shield available and in good condition
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 13,
                checkbox = radiobuttonConvert(this.rblSafety.SelectedItem.Value),
                comments = this.tbxCommentSafety.Text,
            });

            //Laboratory coat, gowns, gloves available/worn
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 14,
                checkbox = radiobuttonConvert(this.rblLabCoat.SelectedItem.Value),
                comments = this.tbxCommentLabCoat.Text,
            });

            //Substantial footwear worn (closed toe and heel)
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 15,
                checkbox = radiobuttonConvert(this.rblFootwear.SelectedItem.Value),
                comments = this.tbxCommentFootwear.Text,
            });

            //Respirator(s) available/fit tested and documented
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 16,
                checkbox = radiobuttonConvert(this.rblRespirator.SelectedItem.Value),
                comments = this.tbxCommentRespirator.Text,
            });

            //Appropriate vacuum flask used on vacuum supply
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 17,
                checkbox = radiobuttonConvert(this.rblVacuum.SelectedItem.Value),
                comments = this.tbxCommentVacuum.Text,
            });

            //Splash guards available where necessary
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 18,
                checkbox = radiobuttonConvert(this.rblSplashGuard.SelectedItem.Value),
                comments = this.tbxCommentSplashGuard.Text,
            });

            //Appropriate health surveillance/immunization provided
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 18,
                checkbox = radiobuttonConvert(this.rblHealthSurv.SelectedItem.Value),
                comments = this.tbxCommentHealthSurv.Text,
            });

            #endregion

            #region LabInspectionDetail Objects Section D

            //Bench tops and sink areas tidy
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 19,
                checkbox = radiobuttonConvert(this.rblBenchTidy.SelectedItem.Value),
                comments = this.tbxCommentBenchTidy.Text,
            });

            //No tripping hazards observed
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 20,
                checkbox = radiobuttonConvert(this.rblTripHaz.SelectedItem.Value),
                comments = this.tbxCommentTripHaz.Text,
            });

            //Laboratory exits clear and doors unlocked
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 21,
                checkbox = radiobuttonConvert(this.rblExits.SelectedItem.Value),
                comments = this.tbxCommentExits.Text,
            });

            //No food and drink observed in laboratory area
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 22,
                checkbox = radiobuttonConvert(this.rblFoodDrink.SelectedItem.Value),
                comments = this.tbxCommentFoodDrink.Text,
            });

            //Glassware and tubing in good working condition
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 23,
                checkbox = radiobuttonConvert(this.rblGlassTube.SelectedItem.Value),
                comments = this.tbxCommentGlassTube.Text,
            });

            //No falling object hazards identifiable
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 24,
                checkbox = radiobuttonConvert(this.rblFallHaz.SelectedItem.Value),
                comments = this.tbxCommentFallHaz.Text,
            });

            //Step stool available for out-of-reach items
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 25,
                checkbox = radiobuttonConvert(this.rblStool.SelectedItem.Value),
                comments = this.tbxCommentStool.Text,
            });

            #endregion

            #region LabInspectionDetail Objects Section E

            //Separate collection containers for sharps available
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 26,
                checkbox = radiobuttonConvert(this.rblSharpCont.SelectedItem.Value),
                comments = this.tbxCommentSharpCont.Text,
            });

            //Biohazard needles/sharps in yellow 'Sharps' container
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 27,
                checkbox = radiobuttonConvert(this.rblYellowCont.SelectedItem.Value),
                comments = this.tbxCommentYellowCont.Text,
            });

            //Other biohazard waste disposed in yellow bags/HSS tubs
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 28,
                checkbox = radiobuttonConvert(this.rblYellowBagHSS.SelectedItem.Value),
                comments = this.tbxCommentYellowBagHSS.Text,
            });

            //Cytotoxic waste containers available
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 29,
                checkbox = radiobuttonConvert(this.rblCyto.SelectedItem.Value),
                comments = this.tbxCommentCyto.Text,
            });

            //Bulk solvent waste containers closed and labelled
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 30,
                checkbox = radiobuttonConvert(this.rblBulkLabel.SelectedItem.Value),
                comments = this.tbxCommentBulkLabel.Text,
            });

            //Bulk Solvent waste containers > 25L stored in flammable storage cabinet
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 31,
                checkbox = radiobuttonConvert(this.rblBulk25L.SelectedItem.Value),
                comments = this.tbxCommentBulk25L.Text,
            });

            //Interim solvent waste containers closed
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 32,
                checkbox = radiobuttonConvert(this.rblInterim.SelectedItem.Value),
                comments = this.tbxCommentInterim.Text,
            });

            //Ethidium bromide waste segregated
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 33,
                checkbox = radiobuttonConvert(this.rblEthidium.SelectedItem.Value),
                comments = this.tbxCommentEthidium.Text,
            });

            #endregion

            #region LabInspectionDetail Objects Section F

            //Appropriate disinfectant(s) in correct concentration available
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 34,
                checkbox = radiobuttonConvert(this.rblDisenfect.SelectedItem.Value),
                comments = this.tbxCommentDisenfect.Text,
            });
            //Biological hazard signs posted
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 35,
                checkbox = radiobuttonConvert(this.rblBioHazSign.SelectedItem.Value),
                comments = this.tbxCommentBioHazSign.Text,
            });

            #endregion

            #region LabInspectionDetail Objects Section G

            //Sash at recommended height and air flow on
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 36,
                checkbox = radiobuttonConvert(this.rblSash.SelectedItem.Value),
                comments = this.tbxCommentSash.Text,
            });

            //Biological safety cabinets certified
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 37,
                checkbox = radiobuttonConvert(this.rblBioCabCert.SelectedItem.Value),
                comments = this.tbxCommentBioCabCert.Text,
            });

            //Biological safety cabinets clean and tidy
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 38,
                checkbox = radiobuttonConvert(this.rblBioCabClean.SelectedItem.Value),
                comments = this.tbxCommentBioCabClean.Text,
            });

            //Fume hood(s) functioning properly
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 39,
                checkbox = radiobuttonConvert(this.rblFumeFunc.SelectedItem.Value),
                comments = this.tbxCommentFumeFunc.Text,
            });

            #endregion

            #region LabInspectionDetail Objects Section H

            //Vacuum pumps stored safely and belts guarded
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 40,
                checkbox = radiobuttonConvert(this.rblVacuumPump.SelectedItem.Value),
                comments = this.tbxCommentVacuumPump.Text,
            });

            //No frayed or cracked electrical cords observed
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 41,
                checkbox = radiobuttonConvert(this.rblFrayedCords.SelectedItem.Value),
                comments = this.tbxCommentFrayedCords.Text,
            });

            //Electrical outlets are not overloaded
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 42,
                checkbox = radiobuttonConvert(this.rblOutlets.SelectedItem.Value),
                comments = this.tbxCommentOutlets.Text,
            });

            //Power bars have a circuit breaker and not 'daisy-chained'
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 43,
                checkbox = radiobuttonConvert(this.rblPowerBar.SelectedItem.Value),
                comments = this.tbxCommentPowerBar.Text,
            });

            //Critical equipment connected to emergency power
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 44,
                checkbox = radiobuttonConvert(this.rblEmPower.SelectedItem.Value),
                comments = this.tbxCommentEmPower.Text,
            });

            #endregion

            #region LabInspectionDetail Objects Section I

            //Flammables stored in appropriate refrigerator/cabinet
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 45,
                checkbox = radiobuttonConvert(this.rblFlam.SelectedItem.Value),
                comments = this.tbxCommentFlam.Text,
            });

            //Solvent storage cabinet available, clean and closed
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 46,
                checkbox = radiobuttonConvert(this.rblSolventCab.SelectedItem.Value),
                comments = this.tbxCommentSolventCab.Text,
            });

            //Solvent Containers outside safety cabinet < 25L
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 47,
                checkbox = radiobuttonConvert(this.rblSolventOutside.SelectedItem.Value),
                comments = this.tbxCommentSolventOutside.Text,
            });

            //Proper labelling of hazardous materials
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 48,
                checkbox = radiobuttonConvert(this.rblPropHaz.SelectedItem.Value),
                comments = this.tbxCommentPropHaz.Text,
            });

            //Proper labelling of cytotoxic materials
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 49,
                checkbox = radiobuttonConvert(this.rblPropCyto.SelectedItem.Value),
                comments = this.tbxCommentPropCyto.Text,
            });

            //Cytotoxic materials exposure records and inventory sheets completed and up to date
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 50,
                checkbox = radiobuttonConvert(this.rblCytoToDate.SelectedItem.Value),
                comments = this.tbxCommentCytoToDate.Text,
            });

            //Reagent chemicals stored securely (lips on shelves or doors on cupboards)
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 51,
                checkbox = radiobuttonConvert(this.rblReagentSecure.SelectedItem.Value),
                comments = this.tbxCommentReagentSecure.Text,
            });

            //Incompatible materials separated
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 52,
                checkbox = radiobuttonConvert(this.rblIncompat.SelectedItem.Value),
                comments = this.tbxCommentIncompat.Text,
            });

            #endregion

            #region LabInspectionDetail Objects Section J

            //Biosafety, chemical and cytotoxics safety training provided and documented
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 53,
                checkbox = radiobuttonConvert(this.rblBiosafety.SelectedItem.Value),
                comments = this.tbxCommentBiosafety.Text,
            });

            //Workplace safety training provided and documented
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 54,
                checkbox = radiobuttonConvert(this.rblWorkplaceSafety.SelectedItem.Value),
                comments = this.tbxCommentWorkplaceSafety.Text,
            });

            //WHMIS - all staff are trained (current and documented)
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 55,
                checkbox = radiobuttonConvert(this.rblWHMIS.SelectedItem.Value),
                comments = this.tbxCommentWHMIS.Text,
            });

            //TDG training provided (if applicable) and documented
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 56,
                checkbox = radiobuttonConvert(this.rblTDG.SelectedItem.Value),
                comments = this.tbxCommentTDG.Text,
            });

            #endregion

            #region LabInspectionDetail Objects Section K

            //Equipment/storage shelves seismically restrained
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 57,
                checkbox = radiobuttonConvert(this.rblStorageSeis.SelectedItem.Value),
                comments = this.tbxCommentStorageSeis.Text,
            });

            //Appropriate equipment guard(s) provided
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 58,
                checkbox = radiobuttonConvert(this.rblEquipGuards.SelectedItem.Value),
                comments = this.tbxCommentEquipGuards.Text,
            });

            //Pressurized gas tanks restrained/supported
            ctx.AddToLabInspectionDetails(new LabInspectionDetail()
            {
                labInsNo = inc.labInsNo,
                labItemNo = 59,
                checkbox = radiobuttonConvert(this.rblPressureTankSup.SelectedItem.Value),
                comments = this.tbxCommentPressureTankSup.Text,
            });

            #endregion

            #region LabInspectionDetail Objects SaveChanges

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