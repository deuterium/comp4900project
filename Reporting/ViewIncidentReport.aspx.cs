using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using AjaxControlToolkit;

public partial class Reporting_ViewIncidentReport : System.Web.UI.Page {
    public Color DisabledColor = ColorTranslator.FromHtml("#E6E6E6");
    
    /// <summary>
    /// Sets up the dynamic elements when the page loads for the first time.
    /// Hides Popup panel on page load.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e) {
        // Only do the initial set up the first time the page loads (and not on post-backs).
        if (!IsPostBack) {
            pnlPop.Style.Value = "display:none;";
            disableAllControls();
        }
    }
    #region Page Popup
    /// <summary>
    /// Calls the show method of the modal popup AJAX panel.
    /// Shows a confirmation page overlay with a message.
    /// </summary>
    /// <param name="msg">Message displayed on confirmation overlay</param>
    /// <param name="color">Color for the message to be</param>
    protected void Popup_Overlay(string msg, Color color) {
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
    protected void btnPnlPopClose_Click(object sender, EventArgs e) {
        // do nothing
    }
    #endregion

    private void disableCheckBox(CheckBox cbx) {
        cbx.Enabled = false;
        //cbx.BackColor = DisabledColor;
    }

    private void disableTextBox(TextBox tbx) {
         tbx.Enabled = false;
         tbx.BackColor = DisabledColor;
    }

    private void disableDropDownList(DropDownList ddl) {
        ddl.Enabled = false;
        ddl.BackColor = DisabledColor;
    }

    private void disableRadioButtonList(RadioButtonList rbl) {
        rbl.Enabled = false;
        //rbl.BackColor = DisabledColor;
    }

    private void disableWatermark(TextBoxWatermarkExtender twe) {
        twe.Enabled = false;
        //rbl.BackColor = DisabledColor;
    }

    private void disableAllControls() {
        #region Employee Info
        disableTextBox(tbxId);
        disableTextBox(tbxFirstName);
        disableTextBox(tbxLastName);
        disableDropDownList(ddlPositions);
        disableTextBox(tbxPosition);
        disableDropDownList(ddlEmployers);
        disableTextBox(tbxEmployer);
        disableDropDownList(ddlDepartments);
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
    
}