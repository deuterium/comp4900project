﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using BCCAModel;

/// <summary>
/// Reporting/ViewIncidentReport.aspx.cs
/// BCCA Cancer Research Centre
/// Safety Training Database and Website
/// Author: BCIT COMP4900 2011
/// Lindsay Fester - lindsay.m.fester@gmail.com
/// </summary>
public partial class View_IncidentReport : System.Web.UI.Page
{
    #region Class Variables
    // The background color of disabled controls.
    public Color DisabledColor = ColorTranslator.FromHtml("#FFFFFF");
    // Database Entity framework context
    BCCAEntities ctx = new BCCAEntities();
    // Text colour for failure messages
    public static Color FailColour = Color.Red;
    // Text colour for success messages
    public static Color SuccessColour = Color.Green;
    // Text value of DropDowns for the other option, selecting this option causes a textbox to appear for custom data entry
    public static String otherOption = "Other (specifiy)";
    // Text value of DropDowns for the none specified option (null value in db)
    public static String noOptionSpecified = String.Empty;
    // List of static, pre-defined employers a user can select
    public static List<String> employers = new List<String> {
        noOptionSpecified, "BCCA", "BCCDC", "BCTS", "C&W", "Corporate", "FPSC", "RVH", otherOption
    };
    #endregion Class Variables

    /// <summary>
    /// Sets up the dynamic elements when the page loads for the first time.
    /// Hides Popup panel on page load.
    /// Populates the DDLs.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        //Check User Authentication
        Session["AfterLoginRedirectUrl"] = Request.Url.ToString();
        ASP.global_asax.Session_Authentication();
        Session["AfterLoginRedirectUrl"] = null;

        // Only do the initial set up the first time the page loads (and not on post-backs).
        if (!IsPostBack)
        {
            hideAllPanels();
            pnlPop.Style.Value = "display:none;";
            String reqIncidentNo = Request.QueryString["id"];
            int incidentNo = -1;
            try
            {
                incidentNo = Convert.ToInt32(reqIncidentNo);
            }
            catch (FormatException ex)
            {
                // do nothing, load report will handle it
                ex.ToString();
            }
            loadReport(incidentNo);
            disableAllControls();
        }
    }

    /// <summary>
    /// Shows a message for the user on the page.
    /// This is intended to be used for errors.
    /// If a null message parameter is given, the message is hidden.
    /// </summary>
    /// <param name="msg"></param>
    private void setUserMsg(String msg)
    {
        if (msg == null)
        {
            lblUserMsg.Visible = false;
            return;
        }
        lblUserMsg.Visible = true;
        lblUserMsg.Text = msg;
    }

    /// <summary>
    /// Hides all the panels on the page.
    /// Shows the user message.
    /// </summary>
    private void hideAllPanels()
    {
        pnlAllContent.Visible = false;
        lblTitle.Visible = false;
        lblUserMsg.Visible = true;
    }

    /// <summary>
    /// Shows all the panels on the page.
    /// Hides the user message.
    /// </summary>
    private void showAllPanels()
    {
        pnlAllContent.Visible = true;
        lblTitle.Visible = true;
        lblUserMsg.Visible = false;
    }

    /// <summary>
    /// Shows and expands all the panels on the page.
    /// </summary>
    private void expandAllPanels()
    {
        showAllPanels();
        cpeA.Collapsed = false;
        cpeA.ClientState = "false";
        cpeB.Collapsed = false;
        cpeB.ClientState = "false";
        cpeC.Collapsed = false;
        cpeC.ClientState = "false";
        cpeD.Collapsed = false;
        cpeD.ClientState = "false";
        cpeE.Collapsed = false;
        cpeE.ClientState = "false";
        cpeF.Collapsed = false;
        cpeF.ClientState = "false";
        cpeG.Collapsed = false;
        cpeG.ClientState = "false";
        cpeH.Collapsed = false;
        cpeH.ClientState = "false";
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
        // do nothing
    }
    #endregion

    #region Disable Form
    /// <summary>
    /// Disabled the parameter CheckBox control.
    /// </summary>
    /// <param name="cbx">The CheckBox to disable.</param>
    private void disableCheckBox(CheckBox cbx)
    {
        //cbx.Enabled = false;
        cbx.Attributes.Add("onclick", "return false;");
    }
    /// <summary>
    /// Disabled the parameter TextBox control.
    /// Changes the control's background color to the disabled color.
    /// </summary>
    /// <param name="cbx">The TextBox to disable.</param>
    private void disableTextBox(TextBox tbx)
    {
        tbx.ReadOnly = true;
        tbx.ForeColor = Color.Black;
        tbx.BackColor = DisabledColor;
    }
    /// <summary>
    /// Disabled the parameter RadioButtonList control.
    /// </summary>
    /// <param name="cbx">The RadioButtonList to disable.</param>
    private void disableRadioButtonList(RadioButtonList rbl)
    {
        rbl.Enabled = false;
    }
    /// <summary>
    /// Disabled the parameter TextBoxWatermarkExtender control.
    /// </summary>
    /// <param name="cbx">The TextBoxWatermarkExtender to disable.</param>
    private void disableWatermark(TextBoxWatermarkExtender twe)
    {
        twe.Enabled = false;
    }

    /// <summary>
    /// Calls the appropriate disable method on each of the form's controls.
    /// Disables watermarks as well.
    /// </summary>
    private void disableAllControls()
    {
        #region Employee Info
        disableTextBox(tbxId);
        disableTextBox(tbxFirstName);
        disableTextBox(tbxLastName);
        disableTextBox(tbxPosition);
        disableTextBox(tbxEmployer);
        disableTextBox(tbxDepartment);
        disableTextBox(tbxRoom);
        disableTextBox(tbxSupervisor);
        disableTextBox(tbxStartDate);
        disableTextBox(tbxEndDate);
        #endregion Employee Info

        #region A_IncidentInfo
        disableTextBox(tbx_p1_dateOfIncident);
        disableTextBox(tbx_p1_dateOfIncident);
        disableTextBox(tbx_p1_timeOfIncident);
        disableTextBox(tbx_p1_dateReported);
        disableTextBox(tbx_p1_timeReported);
        disableTextBox(tbx_p1_incidentDesc);
        disableTextBox(tbx_p1_witnessName1);
        disableTextBox(tbx_p1_witnessPhone1);
        disableTextBox(tbx_p1_witnessName2);
        disableTextBox(tbx_p1_witnessPhone2);
        disableCheckBox(cbx_p1_action_report);
        disableCheckBox(cbx_p1_action_firstAid);
        disableCheckBox(cbx_p1_action_medicalGP);
        disableTextBox(tbx_p1_action_medicalGP_date);
        disableCheckBox(cbx_p1_action_medicalER);
        disableTextBox(tbx_p1_action_medicalER_date);
        disableCheckBox(cbx_p1_action_lostTime);
        #endregion A_IncidentInfo

        #region B_NatureOfInjury
        disableCheckBox(cbx_p1_nature_no);
        disableCheckBox(cbx_p1_nature_musculoskeletal);
        disableCheckBox(cbx_p1_nature_bruise);
        disableCheckBox(cbx_p1_nature_burn);
        disableCheckBox(cbx_p1_nature_cut);
        disableCheckBox(cbx_p1_nature_puncture);
        disableCheckBox(cbx_p1_nature_skinIrritation);
        disableCheckBox(cbx_p1_nature_skinMucous);
        disableCheckBox(cbx_p1_nature_eye);
        disableCheckBox(cbx_p1_nature_allergic);
        disableCheckBox(cbx_p1_nature_psychological);
        disableCheckBox(cbx_p1_nature_respiratory);
        #endregion B_NatureOfInjury

        #region C_AccidentInvestigation
        disableCheckBox(cbx_p2_activity_no);
        disableCheckBox(cbx_p2_activity_repositioning);
        disableCheckBox(cbx_p2_activity_transferring);
        disableCheckBox(cbx_p2_activity_assistedWalking);
        disableCheckBox(cbx_p2_activity_assistedFloor);
        disableCheckBox(cbx_p2_activity_fall);
        disableCheckBox(cbx_p2_activity_holding);
        disableCheckBox(cbx_p2_activity_toileting);

        disableCheckBox(cbx_p2_patient_ceilingLift);
        disableCheckBox(cbx_p2_patient_sitStandLift);
        disableCheckBox(cbx_p2_patient_floorLift);
        disableCheckBox(cbx_p2_patient_manualLift);
        disableCheckBox(cbx_p2_patient_other);
        disableTextBox(tbx_p1_numEmployeesInvolved);

        disableCheckBox(cbx_p2_patient_other);
        disableTextBox(tbx_p2_patient_otherSpecify);
        disableRadioButtonList(rbl_p2_patient_adequateAssist);

        disableCheckBox(cbx_p2_activity_washing);
        disableCheckBox(cbx_p2_activity_dressing);
        disableCheckBox(cbx_p2_activity_changing);
        disableCheckBox(cbx_p2_activity_feeding);
        disableCheckBox(cbx_p2_activity_prep);
        disableCheckBox(cbx_p2_activity_dressingChanges);
        disableCheckBox(cbx_p2_activity_otherPatientCare);
        disableTextBox(tbx_p2_activity_otherPatientCare);

        disableCheckBox(cbx_p2_activity_recapping);
        disableCheckBox(cbx_p2_activity_puncture);
        disableCheckBox(cbx_p2_activity_sharpsDisposal);
        disableCheckBox(cbx_p2_activity_otherSharps);

        disableTextBox(tbx_p2_activity_material);
        disableCheckBox(cbx_p2_activity_lift);
        disableCheckBox(cbx_p2_activity_push);
        disableCheckBox(cbx_p2_activity_carry);
        disableCheckBox(cbx_p2_activity_otherMat);
        disableTextBox(tbx_p2_activity_otherMat);
        disableCheckBox(cbx_p2_activity_driving);
        disableCheckBox(cbx_p2_activity_otherEquip);
        disableTextBox(tbx_p2_activity_otherEquip);
        disableCheckBox(cbx_p2_activity_otherEquipDesc);
        disableTextBox(tbx_p2_activity_otherEquipDesc);
        disableCheckBox(cbx_p2_activity_equipMain);
        disableCheckBox(cbx_p2_activity_comp);
        disableCheckBox(cbx_p2_activity_nonComp);

        disableCheckBox(cbx_p2_activity_walking);
        disableCheckBox(cbx_p2_activity_bending);
        disableCheckBox(cbx_p2_activity_reading);
        disableCheckBox(cbx_p2_activity_spill);
        disableCheckBox(cbx_p2_activity_cleaning);
        disableCheckBox(cbx_p2_activity_other);
        disableTextBox(tbx_p2_activity_other);
        #endregion C_AccidentInvestigation

        #region D_Cause
        disableCheckBox(cbx_p2_cause_human);
        disableCheckBox(cbx_p2_cause_animal);

        disableCheckBox(cbx_p2_cause_needle);
        disableCheckBox(cbx_p2_cause_otherSharps);
        disableCheckBox(cbx_p2_cause_skin);

        disableCheckBox(cbx_p2_cause_awkwardPosture);
        disableCheckBox(cbx_p2_cause_staticPosture);
        disableCheckBox(cbx_p2_cause_contactStress);
        disableCheckBox(cbx_p2_cause_force);
        disableCheckBox(cbx_p2_cause_rep);

        disableCheckBox(cbx_p2_cause_motor);
        disableCheckBox(cbx_p2_cause_slip);
        disableCheckBox(cbx_p2_cause_aggression);
        disableCheckBox(cbx_p2_cause_undetermined);
        disableCheckBox(cbx_p2_cause_event);
        disableCheckBox(cbx_p2_cause_underEquip);
        disableCheckBox(cbx_p2_cause_hit);
        disableCheckBox(cbx_p2_cause_other);
        disableTextBox(tbx_p2_cause_other);

        disableCheckBox(cbx_p2_cause_aggression_verbal);
        disableCheckBox(cbx_p2_cause_aggression_biting);
        disableCheckBox(cbx_p2_cause_aggression_hitting);
        disableCheckBox(cbx_p2_cause_aggression_squeezing);
        disableCheckBox(cbx_p2_cause_aggression_assault);
        disableCheckBox(cbx_p2_cause_aggression_patient);
        disableCheckBox(cbx_p2_cause_aggression_family);
        disableCheckBox(cbx_p2_cause_aggression_public);
        disableCheckBox(cbx_p2_cause_aggression_worker);
        disableCheckBox(cbx_p2_cause_aggression_other);
        disableTextBox(tbx_p2_cause_aggression_other);

        disableTextBox(tbx_p2_cause_exposure_chemName);
        disableCheckBox(cbx_p2_cause_chemInhalation);
        disableCheckBox(cbx_p2_cause_chemIngest);
        disableCheckBox(cbx_p2_cause_chemContact);
        disableCheckBox(cbx_p2_cause_latex);
        disableCheckBox(cbx_p2_cause_dust);
        disableCheckBox(cbx_p2_cause_disease);
        disableCheckBox(cbx_p2_cause_temp);
        disableCheckBox(cbx_p2_cause_noise);
        disableCheckBox(cbx_p2_cause_radiation);
        disableCheckBox(cbx_p2_cause_elec);
        disableCheckBox(cbx_p2_cause_air);
        #endregion D_Cause

        #region E_ContributingFactors
        disableCheckBox(cbx_p2_factors_malfunction);
        disableCheckBox(cbx_p2_factors_improperUse);
        disableCheckBox(cbx_p2_factors_signage);
        disableCheckBox(cbx_p2_factors_notAvailable);
        disableCheckBox(cbx_p2_factors_poorDesign);
        disableCheckBox(cbx_p2_factors_otherEquip);
        disableTextBox(tbx_p2_factors_otherEquip);

        disableCheckBox(cbx_p2_factors_temp);
        disableCheckBox(cbx_p2_factors_workplace);
        disableCheckBox(cbx_p2_factors_layout);
        disableCheckBox(cbx_p2_factors_limitedWorkspace);
        disableCheckBox(cbx_p2_factors_slippery);
        disableCheckBox(cbx_p2_factors_lighting);
        disableCheckBox(cbx_p2_factors_noise);
        disableCheckBox(cbx_p2_factors_vent);
        disableCheckBox(cbx_p2_factors_storage);
        disableCheckBox(cbx_p2_factors_otherEnv);
        disableTextBox(tbx_p2_factors_otherEnv);

        disableCheckBox(cbx_p2_factors_assessment);
        disableCheckBox(cbx_p2_factors_procedure);
        disableCheckBox(cbx_p2_factors_appropriateEquip);
        disableCheckBox(cbx_p2_factors_conduct);
        disableCheckBox(cbx_p2_factors_extended);
        disableCheckBox(cbx_p2_factors_comm);
        disableCheckBox(cbx_p2_factors_unaccustomed);
        disableCheckBox(cbx_p2_factors_otherWorkPractice);
        disableTextBox(tbx_p2_factors_otherWorkPractice);

        disableCheckBox(cbx_p2_factors_directions);
        disableCheckBox(cbx_p2_factors_weight);
        disableCheckBox(cbx_p2_factors_aggressive);
        disableCheckBox(cbx_p2_factors_patientResistive);
        disableCheckBox(cbx_p2_factors_movement);
        disableCheckBox(cbx_p2_factors_confused);
        disableCheckBox(cbx_p2_factors_influence);
        disableCheckBox(cbx_p2_factors_lang);
        disableCheckBox(cbx_p2_factors_otherPatient);
        disableTextBox(tbx_p2_factors_otherPatient);

        disableCheckBox(cbx_p2_factors_alone);
        disableCheckBox(cbx_p2_factors_info);
        disableCheckBox(cbx_p2_factors_scheduling);
        disableCheckBox(cbx_p2_factors_training);
        disableCheckBox(cbx_p2_factors_equip);
        disableCheckBox(cbx_p2_factors_personal);
        disableCheckBox(cbx_p2_factors_safe);
        disableCheckBox(cbx_p2_factors_perceived);
        disableCheckBox(cbx_p2_factors_otherOrganizational);
        disableTextBox(tbx_p2_factors_otherOrganizational);

        disableCheckBox(cbx_p2_factors_inexperienced);
        disableCheckBox(cbx_p2_factors_communication);
        disableCheckBox(cbx_p2_factors_fatigued);
        disableCheckBox(cbx_p2_factors_distracted);
        disableCheckBox(cbx_p2_factors_preexisting);
        disableCheckBox(cbx_p2_factors_sick);
        disableCheckBox(cbx_p2_factors_otherWorker);
        disableTextBox(tbx_p2_factors_otherWorker);
        #endregion E_ContributingFactors

        #region F_CorrectiveAction
        disableTextBox(tbx_p2_corrective_person);
        disableTextBox(tbx_p2_corrective_personDate);
        disableRadioButtonList(rbl_p2_corrective_maintenance);
        disableTextBox(tbx_p2_corrective_maintenanceDate);
        disableRadioButtonList(rbl_p2_corrective_communicated);
        disableTextBox(tbx_p2_corrective_communicatedDate);
        disableRadioButtonList(rbl_p2_corrective_time);
        disableTextBox(tbx_p2_corrective_timeDate);
        #endregion F_CorrectiveAction

        #region G_FollowUp
        disableTextBox(tbx_p2_corrective_written);
        disableTextBox(tbx_p2_corrective_writtenTargetDate);
        disableTextBox(tbx_p2_corrective_writtenCompletedDate);
        disableTextBox(tbx_p2_corrective_education);
        disableTextBox(tbx_p2_corrective_educationTargetDate);
        disableTextBox(tbx_p2_corrective_educationCompletedDate);
        disableTextBox(tbx_p2_corrective_equipment);
        disableTextBox(tbx_p2_corrective_equipmentTargetDate);
        disableTextBox(tbx_p2_corrective_equipmentCompletedDate);
        disableTextBox(tbx_p2_corrective_environment);
        disableTextBox(tbx_p2_corrective_environmentTargetDate);
        disableTextBox(tbx_p2_corrective_environmentCompletedDate);
        disableTextBox(tbx_p2_corrective_patient);
        disableTextBox(tbx_p2_corrective_patientTargetDate);
        disableTextBox(tbx_p2_corrective_patientCompletedDate);
        #endregion G_FollowUp

        #region G_ManagersReport
        disableTextBox(tbx_p2_manager_previous);
        disableTextBox(tbx_p2_manager_objections);
        disableTextBox(tbx_p2_manager_alternative);
        #endregion G_ManagersReport

        #region H_FixedShiftRotation

        #region H_FixedShiftRotation_Week1
        disableTextBox(tbx_p2_manager_week1_sun);
        disableTextBox(tbx_p2_manager_week1_mon);
        disableTextBox(tbx_p2_manager_week1_tue);
        disableTextBox(tbx_p2_manager_week1_wed);
        disableTextBox(tbx_p2_manager_week1_thu);
        disableTextBox(tbx_p2_manager_week1_fri);
        disableTextBox(tbx_p2_manager_week1_sat);
        #endregion H_FixedShiftRotation_Week1

        #region H_FixedShiftRotation_Week2
        disableTextBox(tbx_p2_manager_week2_sun);
        disableTextBox(tbx_p2_manager_week2_mon);
        disableTextBox(tbx_p2_manager_week2_tue);
        disableTextBox(tbx_p2_manager_week2_wed);
        disableTextBox(tbx_p2_manager_week2_thu);
        disableTextBox(tbx_p2_manager_week2_fri);
        disableTextBox(tbx_p2_manager_week2_sat);
        #endregion H_FixedShiftRotation_Week2

        #endregion H_FixedShiftRotation

        #region watermarks
        disableWatermark(tweFirstName);
        disableWatermark(tweLastName);
        disableWatermark(tweSupervisor);
        disableWatermark(tweStartDate);
        disableWatermark(tweEndDate);
        disableWatermark(tweDateOfIncident);
        disableWatermark(tweTimeOfIncident);
        disableWatermark(tweDateReported);
        disableWatermark(tweTimeReported);
        disableWatermark(tweWitnessName1);
        disableWatermark(tweWitnessPhone1);
        disableWatermark(tweWitnessName2);
        disableWatermark(tweWitnessPhone2);
        disableWatermark(tweMedicalGpDate);
        disableWatermark(tweMedicalErDate);
        disableWatermark(tweCorrectivePerson);
        disableWatermark(tweCorrectivePersonDate);
        disableWatermark(tweCorrectiveMaintebanceDate);
        disableWatermark(tweCorrectiveCommDate);
        disableWatermark(tweCorrectiveTimeDate);
        disableWatermark(tweWrittenTargetDate);
        disableWatermark(tweWrittenCompletedDate);
        disableWatermark(tweEducationTargetDate);
        disableWatermark(tweEducationCompletedDate);
        disableWatermark(tweEquipmentTargetDate);
        disableWatermark(tweEquipmentCompletedDate);
        disableWatermark(tweEnvironmentTargetDate);
        disableWatermark(tweEnvironmentCompletedDate);
        disableWatermark(twePatientTargetDate);
        disableWatermark(twePatientCompletedDate);
        #endregion watermarks

    }
    #endregion Disable Form

    #region Load Incident Report
    /// <summary>
    /// Loads an Incident report (with the specified ID) from the database into the form.
    /// </summary>
    /// <param name="id">The incidentNo (ID) of the report to load.</param>
    /// <returns></returns>
    private void loadReport(int id)
    {
        if (id == -1)
        {
            setUserMsg("No incident report number given.");
            return;
        }

        var report = ctx.Incidents
                     .Where(r => r.incidentNo.Equals(id))
                     .Select(r => r).FirstOrDefault();

        if (report == null)
        {
            setUserMsg("No incident report with that report number found.");
            return;
        }

        if (Session["RoleNo"].Equals(4))
        {
            if (!Session["DeptNo"].Equals(report.deptNo))
            {
                setUserMsg("Only safety officers and administrators can view incident reports from other departments.");
                return;
            }
        }

        tbxFirstName.Text = report.Employee.fname.ToString();
        tbxLastName.Text = report.Employee.lname.ToString();
        getEmployeeData();

        #region A_IncidentInfo
        tbx_p1_dateOfIncident.Text = convertDateTimeToString(report.p1_dateOfIncident);
        tbx_p1_timeOfIncident.Text = convertTimeToString(report.p1_dateOfIncident);
        tbx_p1_dateReported.Text = convertDateTimeToString(report.p1_dateReported);
        tbx_p1_timeReported.Text = convertTimeToString(report.p1_dateReported);
        tbx_p1_incidentDesc.Text = convertToTextBoxValue(report.p1_incidentDesc);
        tbx_p1_witnessName1.Text = convertToTextBoxValue(report.p1_witnessName1);
        tbx_p1_witnessPhone1.Text = convertToTextBoxValue(report.p1_witnessPhone1);
        tbx_p1_witnessName2.Text = convertToTextBoxValue(report.p1_witnessName2);
        tbx_p1_witnessPhone2.Text = convertToTextBoxValue(report.p1_witnessPhone2);
        cbx_p1_action_report.Checked = convertToCheckBoxValue(report.p1_action_report);
        cbx_p1_action_firstAid.Checked = convertToCheckBoxValue(report.p1_action_firstAid);
        cbx_p1_action_medicalGP.Checked = convertToCheckBoxValue(report.p1_action_medicalGP);
        tbx_p1_action_medicalGP_date.Text = convertDateTimeToString(report.p1_action_medicalGP_date);
        cbx_p1_action_medicalER.Checked = convertToCheckBoxValue(report.p1_action_medicalER);
        tbx_p1_action_medicalER_date.Text = convertDateTimeToString(report.p1_action_medicalER_date);
        cbx_p1_action_lostTime.Checked = convertToCheckBoxValue(report.p1_action_lostTime);
        #endregion A_IncidentInfo

        #region B_NatureOfInjury
        cbx_p1_nature_no.Checked = convertToCheckBoxValue(report.p1_nature_no);
        cbx_p1_nature_musculoskeletal.Checked = convertToCheckBoxValue(report.p1_nature_musculoskeletal);
        cbx_p1_nature_bruise.Checked = convertToCheckBoxValue(report.p1_nature_bruise);
        cbx_p1_nature_burn.Checked = convertToCheckBoxValue(report.p1_nature_burn);
        cbx_p1_nature_cut.Checked = convertToCheckBoxValue(report.p1_nature_cut);
        cbx_p1_nature_puncture.Checked = convertToCheckBoxValue(report.p1_nature_puncture);
        cbx_p1_nature_skinIrritation.Checked = convertToCheckBoxValue(report.p1_nature_skinIrritation);
        cbx_p1_nature_skinMucous.Checked = convertToCheckBoxValue(report.p1_nature_skinMucous);
        cbx_p1_nature_eye.Checked = convertToCheckBoxValue(report.p1_nature_eye);
        cbx_p1_nature_allergic.Checked = convertToCheckBoxValue(report.p1_nature_allergic);
        cbx_p1_nature_psychological.Checked = convertToCheckBoxValue(report.p1_nature_psychological);
        cbx_p1_nature_respiratory.Checked = convertToCheckBoxValue(report.p1_nature_respiratory);
        #endregion B_NatureOfInjury

        #region C_AccidentInvestigation
        cbx_p2_activity_no.Checked = convertToCheckBoxValue(report.p2_activity_no);
        cbx_p2_activity_repositioning.Checked = convertToCheckBoxValue(report.p2_activity_repositioning);
        cbx_p2_activity_transferring.Checked = convertToCheckBoxValue(report.p2_activity_transferring);
        cbx_p2_activity_assistedWalking.Checked = convertToCheckBoxValue(report.p2_activity_assistedWalking);
        cbx_p2_activity_assistedFloor.Checked = convertToCheckBoxValue(report.p2_activity_assistedFloor);
        cbx_p2_activity_fall.Checked = convertToCheckBoxValue(report.p2_activity_fall);
        cbx_p2_activity_holding.Checked = convertToCheckBoxValue(report.p2_activity_holding);
        cbx_p2_activity_toileting.Checked = convertToCheckBoxValue(report.p2_activity_toileting);

        cbx_p2_patient_ceilingLift.Checked = convertToCheckBoxValue(report.p2_patient_ceilingLift);
        cbx_p2_patient_sitStandLift.Checked = convertToCheckBoxValue(report.p2_patient_sitStandLift);
        cbx_p2_patient_floorLift.Checked = convertToCheckBoxValue(report.p2_patient_floorLift);
        cbx_p2_patient_manualLift.Checked = convertToCheckBoxValue(report.p2_patient_manualLift);
        cbx_p2_patient_other.Checked = convertToCheckBoxValue(report.p2_patient_otherSpecify);
        tbx_p2_patient_otherSpecify.Text = convertToTextBoxValue(report.p2_patient_otherSpecify);
        tbx_p1_numEmployeesInvolved.Text = (report.p1_numEmployeesInvolved == null) ? String.Empty : report.p1_numEmployeesInvolved.ToString();

        tbx_p2_patient_otherSpecify.Text = convertToTextBoxValue(report.p2_patient_otherSpecify);
        rbl_p2_patient_adequateAssist.SelectedValue = convertToTextBoxValue(report.p2_patient_adequateAssist);

        cbx_p2_activity_washing.Checked = convertToCheckBoxValue(report.p2_activity_washing);
        cbx_p2_activity_dressing.Checked = convertToCheckBoxValue(report.p2_activity_dressing);
        cbx_p2_activity_changing.Checked = convertToCheckBoxValue(report.p2_activity_changing);
        cbx_p2_activity_feeding.Checked = convertToCheckBoxValue(report.p2_activity_feeding);
        cbx_p2_activity_prep.Checked = convertToCheckBoxValue(report.p2_activity_prep);
        cbx_p2_activity_dressingChanges.Checked = convertToCheckBoxValue(report.p2_activity_dressingChanges);
        tbx_p2_activity_otherPatientCare.Text = convertToTextBoxValue(report.p2_activity_otherPatientCare);

        cbx_p2_activity_recapping.Checked = convertToCheckBoxValue(report.p2_activity_recapping);
        cbx_p2_activity_puncture.Checked = convertToCheckBoxValue(report.p2_activity_puncture);
        cbx_p2_activity_sharpsDisposal.Checked = convertToCheckBoxValue(report.p2_activity_sharpsDisposal);
        cbx_p2_activity_otherSharps.Checked = convertToCheckBoxValue(report.p2_activity_otherSharps);

        tbx_p2_activity_material.Text = convertToTextBoxValue(report.p2_activity_material);
        cbx_p2_activity_lift.Checked = convertToCheckBoxValue(report.p2_activity_lift);
        cbx_p2_activity_push.Checked = convertToCheckBoxValue(report.p2_activity_push);
        cbx_p2_activity_carry.Checked = convertToCheckBoxValue(report.p2_activity_carry);
        tbx_p2_activity_otherMat.Text = convertToTextBoxValue(report.p2_activity_otherMat);
        cbx_p2_activity_driving.Checked = convertToCheckBoxValue(report.p2_activity_driving);
        tbx_p2_activity_otherEquip.Text = convertToTextBoxValue(report.p2_activity_otherEquip);
        cbx_p2_activity_otherEquipDesc.Checked = convertToCheckBoxValue(report.p2_activity_otherEquipDesc);
        tbx_p2_activity_otherEquipDesc.Text = convertToTextBoxValue(report.p2_activity_otherEquipDesc);

        cbx_p2_activity_equipMain.Checked = convertToCheckBoxValue(report.p2_activity_equipMain);
        cbx_p2_activity_comp.Checked = convertToCheckBoxValue(report.p2_activity_comp);
        cbx_p2_activity_nonComp.Checked = convertToCheckBoxValue(report.p2_activity_nonComp);

        cbx_p2_activity_walking.Checked = convertToCheckBoxValue(report.p2_activity_walking);
        cbx_p2_activity_bending.Checked = convertToCheckBoxValue(report.p2_activity_bending);
        cbx_p2_activity_reading.Checked = convertToCheckBoxValue(report.p2_activity_reading);
        cbx_p2_activity_spill.Checked = convertToCheckBoxValue(report.p2_activity_spill);
        cbx_p2_activity_cleaning.Checked = convertToCheckBoxValue(report.p2_activity_cleaning);
        tbx_p2_activity_other.Text = convertToTextBoxValue(report.p2_activity_other);
        #endregion C_AccidentInvestigation

        #region D_Cause
        cbx_p2_cause_human.Checked = convertToCheckBoxValue(report.p2_cause_human);
        cbx_p2_cause_animal.Checked = convertToCheckBoxValue(report.p2_cause_animal);

        cbx_p2_cause_needle.Checked = convertToCheckBoxValue(report.p2_cause_needle);
        cbx_p2_cause_otherSharps.Checked = convertToCheckBoxValue(report.p2_cause_otherSharps);
        cbx_p2_cause_skin.Checked = convertToCheckBoxValue(report.p2_cause_skin);

        cbx_p2_cause_awkwardPosture.Checked = convertToCheckBoxValue(report.p2_cause_awkwardPosture);
        cbx_p2_cause_staticPosture.Checked = convertToCheckBoxValue(report.p2_cause_staticPosture);
        cbx_p2_cause_contactStress.Checked = convertToCheckBoxValue(report.p2_cause_contactStress);
        cbx_p2_cause_force.Checked = convertToCheckBoxValue(report.p2_cause_force);
        cbx_p2_cause_rep.Checked = convertToCheckBoxValue(report.p2_cause_rep);

        cbx_p2_cause_motor.Checked = convertToCheckBoxValue(report.p2_cause_motor);
        cbx_p2_cause_slip.Checked = convertToCheckBoxValue(report.p2_cause_slip);
        cbx_p2_cause_aggression.Checked = convertToCheckBoxValue(report.p2_cause_aggression);
        cbx_p2_cause_undetermined.Checked = convertToCheckBoxValue(report.p2_cause_undetermined);
        cbx_p2_cause_event.Checked = convertToCheckBoxValue(report.p2_cause_event);
        cbx_p2_cause_underEquip.Checked = convertToCheckBoxValue(report.p2_cause_underEquip);
        cbx_p2_cause_hit.Checked = convertToCheckBoxValue(report.p2_cause_hit);
        tbx_p2_cause_other.Text = convertToTextBoxValue(report.p2_cause_other);

        cbx_p2_cause_aggression_verbal.Checked = convertToCheckBoxValue(report.p2_aggression_verbal);
        cbx_p2_cause_aggression_biting.Checked = convertToCheckBoxValue(report.p2_aggression_biting);
        cbx_p2_cause_aggression_hitting.Checked = convertToCheckBoxValue(report.p2_aggression_hitting);
        cbx_p2_cause_aggression_squeezing.Checked = convertToCheckBoxValue(report.p2_aggression_squeezing);
        cbx_p2_cause_aggression_assault.Checked = convertToCheckBoxValue(report.p2_aggression_assault);
        cbx_p2_cause_aggression_patient.Checked = convertToCheckBoxValue(report.p2_aggression_patient);
        cbx_p2_cause_aggression_family.Checked = convertToCheckBoxValue(report.p2_aggression_family);
        cbx_p2_cause_aggression_public.Checked = convertToCheckBoxValue(report.p2_aggression_public);
        cbx_p2_cause_aggression_worker.Checked = convertToCheckBoxValue(report.p2_aggression_worker);
        tbx_p2_cause_aggression_other.Text = convertToTextBoxValue(report.p2_aggression_other);

        tbx_p2_cause_exposure_chemName.Text = convertToTextBoxValue(report.p2_cause_exposure_chemName);
        cbx_p2_cause_chemInhalation.Checked = convertToCheckBoxValue(report.p2_cause_chemInhalation);
        cbx_p2_cause_chemIngest.Checked = convertToCheckBoxValue(report.p2_cause_chemIngest);
        cbx_p2_cause_chemContact.Checked = convertToCheckBoxValue(report.p2_cause_chemContact);
        cbx_p2_cause_latex.Checked = convertToCheckBoxValue(report.p2_cause_latex);
        cbx_p2_cause_dust.Checked = convertToCheckBoxValue(report.p2_cause_dust);
        cbx_p2_cause_disease.Checked = convertToCheckBoxValue(report.p2_cause_disease);
        cbx_p2_cause_temp.Checked = convertToCheckBoxValue(report.p2_cause_temp);
        cbx_p2_cause_noise.Checked = convertToCheckBoxValue(report.p2_cause_noise);
        cbx_p2_cause_radiation.Checked = convertToCheckBoxValue(report.p2_cause_radiation);
        cbx_p2_cause_elec.Checked = convertToCheckBoxValue(report.p2_cause_elec);
        cbx_p2_cause_air.Checked = convertToCheckBoxValue(report.p2_cause_air);
        #endregion D_Cause

        #region E_ContributingFactors
        cbx_p2_factors_malfunction.Checked = convertToCheckBoxValue(report.p2_factors_malfunction);
        cbx_p2_factors_improperUse.Checked = convertToCheckBoxValue(report.p2_factors_improperUse);
        cbx_p2_factors_signage.Checked = convertToCheckBoxValue(report.p2_factors_signage);
        cbx_p2_factors_notAvailable.Checked = convertToCheckBoxValue(report.p2_factors_notAvailable);
        cbx_p2_factors_poorDesign.Checked = convertToCheckBoxValue(report.p2_factors_poorDesign);
        tbx_p2_factors_otherEquip.Text = convertToTextBoxValue(report.p2_factors_otherEquip);

        cbx_p2_factors_temp.Checked = convertToCheckBoxValue(report.p2_factors_temp);
        cbx_p2_factors_workplace.Checked = convertToCheckBoxValue(report.p2_factors_workplace);
        cbx_p2_factors_layout.Checked = convertToCheckBoxValue(report.p2_factors_layout);
        cbx_p2_factors_limitedWorkspace.Checked = convertToCheckBoxValue(report.p2_factors_limitedWorkspace);
        cbx_p2_factors_slippery.Checked = convertToCheckBoxValue(report.p2_factors_slippery);
        cbx_p2_factors_lighting.Checked = convertToCheckBoxValue(report.p2_factors_lighting);
        cbx_p2_factors_noise.Checked = convertToCheckBoxValue(report.p2_factors_noise);
        cbx_p2_factors_vent.Checked = convertToCheckBoxValue(report.p2_factors_vent);
        cbx_p2_factors_storage.Checked = convertToCheckBoxValue(report.p2_factors_storage);
        tbx_p2_factors_otherEnv.Text = convertToTextBoxValue(report.p2_factors_otherEnv);

        cbx_p2_factors_assessment.Checked = convertToCheckBoxValue(report.p2_factors_assessment);
        cbx_p2_factors_procedure.Checked = convertToCheckBoxValue(report.p2_factors_procedure);
        cbx_p2_factors_appropriateEquip.Checked = convertToCheckBoxValue(report.p2_factors_appropriateEquip);
        cbx_p2_factors_conduct.Checked = convertToCheckBoxValue(report.p2_factors_conduct);
        cbx_p2_factors_extended.Checked = convertToCheckBoxValue(report.p2_factors_extended);
        cbx_p2_factors_comm.Checked = convertToCheckBoxValue(report.p2_factors_comm);
        cbx_p2_factors_unaccustomed.Checked = convertToCheckBoxValue(report.p2_factors_unaccustomed);
        tbx_p2_factors_otherWorkPractice.Text = convertToTextBoxValue(report.p2_factors_otherWorkPractice);

        cbx_p2_factors_directions.Checked = convertToCheckBoxValue(report.p2_factors_directions);
        cbx_p2_factors_weight.Checked = convertToCheckBoxValue(report.p2_factors_weight);
        cbx_p2_factors_aggressive.Checked = convertToCheckBoxValue(report.p2_factors_aggressive);
        cbx_p2_factors_patientResistive.Checked = convertToCheckBoxValue(report.p2_factors_patientResistive);
        cbx_p2_factors_movement.Checked = convertToCheckBoxValue(report.p2_factors_movement);
        cbx_p2_factors_confused.Checked = convertToCheckBoxValue(report.p2_factors_confused);
        cbx_p2_factors_influence.Checked = convertToCheckBoxValue(report.p2_factors_influence);
        cbx_p2_factors_lang.Checked = convertToCheckBoxValue(report.p2_factors_lang);
        tbx_p2_factors_otherPatient.Text = convertToTextBoxValue(report.p2_factors_otherPatient);

        cbx_p2_factors_alone.Checked = convertToCheckBoxValue(report.p2_factors_alone);
        cbx_p2_factors_info.Checked = convertToCheckBoxValue(report.p2_factors_info);
        cbx_p2_factors_scheduling.Checked = convertToCheckBoxValue(report.p2_factors_scheduling);
        cbx_p2_factors_training.Checked = convertToCheckBoxValue(report.p2_factors_training);
        cbx_p2_factors_equip.Checked = convertToCheckBoxValue(report.p2_factors_equip);
        cbx_p2_factors_personal.Checked = convertToCheckBoxValue(report.p2_factors_personal);
        cbx_p2_factors_safe.Checked = convertToCheckBoxValue(report.p2_factors_safe);
        cbx_p2_factors_perceived.Checked = convertToCheckBoxValue(report.p2_factors_perceived);
        tbx_p2_factors_otherOrganizational.Text = convertToTextBoxValue(report.p2_factors_otherOrganizational);

        cbx_p2_factors_inexperienced.Checked = convertToCheckBoxValue(report.p2_factors_inexperienced);
        cbx_p2_factors_communication.Checked = convertToCheckBoxValue(report.p2_factors_communication);
        cbx_p2_factors_fatigued.Checked = convertToCheckBoxValue(report.p2_factors_fatigued);
        cbx_p2_factors_distracted.Checked = convertToCheckBoxValue(report.p2_factors_distracted);
        cbx_p2_factors_preexisting.Checked = convertToCheckBoxValue(report.p2_factors_preexisting);
        cbx_p2_factors_sick.Checked = convertToCheckBoxValue(report.p2_factors_sick);
        tbx_p2_factors_otherWorker.Text = convertToTextBoxValue(report.p2_factors_otherWorker);
        #endregion E_ContributingFactors

        #region F_CorrectiveAction
        tbx_p2_corrective_person.Text = convertToTextBoxValue(report.p2_corrective_person);
        tbx_p2_corrective_personDate.Text = convertDateTimeToString(report.p2_corrective_personDate);
        rbl_p2_corrective_maintenance.SelectedValue = convertToTextBoxValue(report.p2_corrective_maintenance);
        tbx_p2_corrective_maintenanceDate.Text = convertDateTimeToString(report.p2_corrective_maintenanceDate);
        rbl_p2_corrective_communicated.SelectedValue = convertToTextBoxValue(report.p2_corrective_communicated);
        tbx_p2_corrective_communicatedDate.Text = convertDateTimeToString(report.p2_corrective_communicatedDate);
        rbl_p2_corrective_time.SelectedValue = convertToTextBoxValue(report.p2_corrective_time);
        tbx_p2_corrective_timeDate.Text = convertDateTimeToString(report.p2_corrective_timeDate);
        #endregion F_CorrectiveAction

        #region G_FollowUp
        tbx_p2_corrective_written.Text = convertToTextBoxValue(report.p2_corrective_written);
        tbx_p2_corrective_writtenTargetDate.Text = convertDateTimeToString(report.p2_corrective_writtenTargetDate);
        tbx_p2_corrective_writtenCompletedDate.Text = convertDateTimeToString(report.p2_corrective_writtenCompletedDate);
        tbx_p2_corrective_education.Text = convertToTextBoxValue(report.p2_corrective_education);
        tbx_p2_corrective_educationTargetDate.Text = convertDateTimeToString(report.p2_corrective_educationTargetDate);
        tbx_p2_corrective_educationCompletedDate.Text = convertDateTimeToString(report.p2_corrective_educationCompletedDate);
        tbx_p2_corrective_equipment.Text = convertToTextBoxValue(report.p2_corrective_equipment);
        tbx_p2_corrective_equipmentTargetDate.Text = convertDateTimeToString(report.p2_corrective_equipmentTargetDate);
        tbx_p2_corrective_equipmentCompletedDate.Text = convertDateTimeToString(report.p2_corrective_equipmentCompletedDate);
        tbx_p2_corrective_environment.Text = convertToTextBoxValue(report.p2_corrective_environment);
        tbx_p2_corrective_environmentTargetDate.Text = convertDateTimeToString(report.p2_corrective_environmentTargetDate);
        tbx_p2_corrective_environmentCompletedDate.Text = convertDateTimeToString(report.p2_corrective_environmentCompletedDate);
        tbx_p2_corrective_patient.Text = convertToTextBoxValue(report.p2_corrective_patient);
        tbx_p2_corrective_patientTargetDate.Text = convertDateTimeToString(report.p2_corrective_patientTargetDate);
        tbx_p2_corrective_patientCompletedDate.Text = convertDateTimeToString(report.p2_corrective_patientCompletedDate);
        #endregion G_FollowUp

        #region G_ManagersReport
        tbx_p2_manager_previous.Text = convertToTextBoxValue(report.p2_manager_previous);
        tbx_p2_manager_objections.Text = convertToTextBoxValue(report.p2_manager_objections);
        tbx_p2_manager_alternative.Text = convertToTextBoxValue(report.p2_manager_alternative);
        #endregion G_ManagersReport

        #region H_FixedShiftRotation

        #region H_FixedShiftRotation_Week1
        tbx_p2_manager_week1_sun.Text = report.p2_manager_week1_sun == null ? String.Empty : report.p2_manager_week1_sun.ToString();
        tbx_p2_manager_week1_mon.Text = report.p2_manager_week1_mon == null ? String.Empty : report.p2_manager_week1_mon.ToString();
        tbx_p2_manager_week1_tue.Text = report.p2_manager_week1_tue == null ? String.Empty : report.p2_manager_week1_tue.ToString();
        tbx_p2_manager_week1_wed.Text = report.p2_manager_week1_wed == null ? String.Empty : report.p2_manager_week1_wed.ToString();
        tbx_p2_manager_week1_thu.Text = report.p2_manager_week1_thu == null ? String.Empty : report.p2_manager_week1_thu.ToString();
        tbx_p2_manager_week1_fri.Text = report.p2_manager_week1_fri == null ? String.Empty : report.p2_manager_week1_fri.ToString();
        tbx_p2_manager_week1_sat.Text = report.p2_manager_week1_sat == null ? String.Empty : report.p2_manager_week1_sat.ToString();
        #endregion H_FixedShiftRotation_Week1

        #region H_FixedShiftRotation_Week2
        tbx_p2_manager_week2_sun.Text = report.p2_manager_week2_sun == null ? String.Empty : report.p2_manager_week2_sun.ToString();
        tbx_p2_manager_week2_mon.Text = report.p2_manager_week2_mon == null ? String.Empty : report.p2_manager_week2_mon.ToString();
        tbx_p2_manager_week2_tue.Text = report.p2_manager_week2_tue == null ? String.Empty : report.p2_manager_week2_tue.ToString();
        tbx_p2_manager_week2_wed.Text = report.p2_manager_week2_wed == null ? String.Empty : report.p2_manager_week2_wed.ToString();
        tbx_p2_manager_week2_thu.Text = report.p2_manager_week2_thu == null ? String.Empty : report.p2_manager_week2_thu.ToString();
        tbx_p2_manager_week2_fri.Text = report.p2_manager_week2_fri == null ? String.Empty : report.p2_manager_week2_fri.ToString();
        tbx_p2_manager_week2_sat.Text = report.p2_manager_week2_sat == null ? String.Empty : report.p2_manager_week2_sat.ToString();
        #endregion H_FixedShiftRotation_Week2

        #endregion H_FixedShiftRotation

        lblTitle.Text = lblTitle.Text + id;
        expandAllPanels();
    }

    /// <summary>
    /// Converts a String value in the database to a radio button list value.
    /// If the value is null or "2", returns false.
    /// If the value is "1" returns true;
    /// </summary>
    /// <param name="value">The String to convert.</param>
    /// <returns>Boolean: true for 1, false for 2 or null.</returns>
    private Boolean convertToCheckBoxValue(String value)
    {
        if ((value == null) || value.Equals("2"))
        {
            return false;
        }
        return true;
    }

    /// <summary>
    /// If a string is NULL, returns an empty string.
    /// Otherwise, returns the value.
    /// This is so textboxes display an empty string instead of NULL.
    /// </summary>
    /// <param name="value">The String to convert.</param>
    /// <returns>Empty string if null, otherwise returns the value.</returns>
    private String convertToTextBoxValue(String value)
    {
        if (value == null)
        {
            return String.Empty;
        }
        return value;
    }

    /// <summary>
    /// Converts a DateTime into a formatted string.
    /// Returns the date in the format "M/d/yyyy" (e.g. 11/1/2010).
    /// Returns an empty string if the value is null.
    /// </summary>
    /// <param name="value">The Date to convert.</param>
    /// <returns>The date in the format "M/d/yyyy" or an empty string if the value is null.</returns>
    private String convertDateTimeToString(Object value)
    {
        if (value == null)
        {
            return String.Empty;
        }
        return Convert.ToDateTime(value).ToString("M/d/yyyy");
    }

    /// <summary>
    /// Converts a DateTime into a formatted string.
    /// Returns the date in the format "h:mm tt" (e.g. 5:37 PM).
    /// Returns an empty string if the value is null.
    /// </summary>
    /// <param name="value">The Date to convert.</param>
    /// <returns>The time in the format "h:mm tt" or an empty string if the value is null.</returns>
    private String convertTimeToString(Object value)
    {
        if (value == null)
        {
            return String.Empty;
        }
        return Convert.ToDateTime(value).ToString("h:mm tt");
    }

    #region Load Employee Data
    /// <summary>
    /// Uses the employee's first and last name to get the rest employee's information from the database.
    /// Populates the Header form with this data.
    /// </summary>
    private void getEmployeeData()
    {
        String first = tbxFirstName.Text;
        String last = tbxLastName.Text;
        Employee emp = null;

        var qry = ctx.Employees
                  .Where(e => e.fname.Equals(first) && e.lname.Equals(last))
                  .Select(e => e);

        if ((qry != null) && (qry.Count() == 1))
        {
            emp = qry.FirstOrDefault();

            tbxId.Text = emp.empNo.ToString();
            tbxFirstName.Text = emp.fname.ToString();
            tbxLastName.Text = emp.lname.ToString();

            if (emp.position != null)
            {
                tbxPosition.Text = emp.position;
            }
            if (emp.employer != null)
            {
                tbxEmployer.Text = emp.employer;
            }
            if (emp.deptName != null)
            {
                tbxDepartment.Text = emp.deptName;
            }
            if (emp.supervisor != null)
            {
                tbxSupervisor.Text = emp.supervisor;
            }
            if (emp.room != null)
            {
                tbxRoom.Text = emp.room;
            }
            if (emp.startDate != null)
            {
                tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("M/d/yyyy");
            }
            if (emp.endDate != null)
            {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("M/d/yyyy");
            }

        }
        else if ((qry != null) && (qry.Count() <= 0))
        {
            Popup_Overlay("No employee with that first and last name found.", FailColour);
        }
        else
        {
            Popup_Overlay("There was more than one employee with that first and last name.", FailColour);
        }
    }

    /// <summary>
    /// Calls getEmployeeData(), which fetches the employee from the database using the employee's first and last name
    /// then populates the rest of the form with the employee's information.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void btnGetEmployee_Click(object sender, EventArgs e)
    {
        getEmployeeData();
    }
    #endregion LoadEmployeeData

    #endregion Load Incident Report
}