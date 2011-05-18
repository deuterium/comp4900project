using System;
using System.Linq;
using BCCAModel;
using System.Collections.Generic;
using System.Drawing;
using System.Linq.Expressions;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data.Objects;
using System.Drawing;
using System.Data;

/**
 * TO DO:
 * 
 * Finish documentation
 * Fix panels (scrollbars)
 * 
 */

public partial class Tracking_Default : System.Web.UI.Page {
    #region Class Variables
    // The background color of disabled controls.
    public Color DisabledColor = ColorTranslator.FromHtml("#E6E6E6");
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
    // The pink colour of the header text.
    public Color HeaderForeColor = ColorTranslator.FromHtml("#d80080");
    #endregion Class Variables

    /// <summary>
    /// Sets up the dynamic elements when the page loads for the first time.
    /// Populates the Employer, Position, and Department drop down lists.
    /// Hides Popup panel on page load.
    /// </summary>
    /// <param name="sender">The object that requested the page load.</param>
    /// <param name="e">The page load event.</param>
    protected void Page_Load(object sender, EventArgs e)
    {    
        if (!IsPostBack) {
            pnlPop.Style.Value = "display:none;";
            disableAllTextBoxes();
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

    #region Filter Report
    /// <summary>
    /// Calls the filter report method, which gets a list of incident reports that match ONLY the data entered
    /// into the form. Only considers the checkboxes (Section B, C, D, and E).
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The button click event.</param>
    protected void btnFilterReport_Click(object sender, EventArgs e) {
        filterReport(gdvTracker);
        collapseAllFilterPanels();
        pnlResultsContainer.Visible = true;
        cpeResults.Collapsed = false;
        cpeResults.ClientState = "false";
    }

    private void collapseAllFilterPanels() {
        cpeFilters.Collapsed = true;
        cpeFilters.ClientState = "true";
        cpeA.Collapsed = true;
        cpeA.ClientState = "true";
        cpeB.Collapsed = true;
        cpeB.ClientState = "true";
        cpeC.Collapsed = true;
        cpeC.ClientState = "true";
        cpeD.Collapsed = true;
        cpeD.ClientState = "true";
        cpeE.Collapsed = true;
        cpeE.ClientState = "true";
    }

    /// <summary>
    /// Gets a list of incident reports that match ONLY the data entered into the form.
    /// Only considers the checkboxes in sections B, C, D, and E of the form.
    /// Populates the GridView parameter with the resulting reports.
    /// </summary>
    private void filterReport(GridView gdv) {
        var reports = ctx.Incidents
                      .Select(r => r);

        #region B_NatureOfInjury
        if (cbx_p1_nature_no.Checked) { reports = reports.Where(r => r.p1_nature_no.Equals("1")); }
        if (cbx_p1_nature_musculoskeletal.Checked) { reports = reports.Where(r => r.p1_nature_musculoskeletal.Equals("1")); }
        if (cbx_p1_nature_bruise.Checked) { reports = reports.Where(r => r.p1_nature_bruise.Equals("1")); }
        if (cbx_p1_nature_burn.Checked) { reports = reports.Where(r => r.p1_nature_burn.Equals("1")); }
        if (cbx_p1_nature_cut.Checked) { reports = reports.Where(r => r.p1_nature_cut.Equals("1")); }
        if (cbx_p1_nature_puncture.Checked) { reports = reports.Where(r => r.p1_nature_puncture.Equals("1")); }
        if (cbx_p1_nature_skinIrritation.Checked) { reports = reports.Where(r => r.p1_nature_skinIrritation.Equals("1")); }
        if (cbx_p1_nature_skinMucous.Checked) { reports = reports.Where(r => r.p1_nature_skinMucous.Equals("1")); }
        if (cbx_p1_nature_eye.Checked) { reports = reports.Where(r => r.p1_nature_eye.Equals("1")); }
        if (cbx_p1_nature_allergic.Checked) { reports = reports.Where(r => r.p1_nature_allergic.Equals("1")); }
        if (cbx_p1_nature_psychological.Checked) { reports = reports.Where(r => r.p1_nature_psychological.Equals("1")); }
        if (cbx_p1_nature_respiratory.Checked) { reports = reports.Where(r => r.p1_nature_respiratory.Equals("1")); }
        #endregion B_NatureOfInjury

        #region C_AccidentInvestigation
        if (cbx_p2_activity_no.Checked) { reports = reports.Where(r => r.p2_activity_no.Equals("1")); }
        if (cbx_p2_activity_repositioning.Checked) { reports = reports.Where(r => r.p2_activity_repositioning.Equals("1")); }
        if (cbx_p2_activity_transferring.Checked) { reports = reports.Where(r => r.p2_activity_transferring.Equals("1")); }
        if (cbx_p2_activity_assistedWalking.Checked) { reports = reports.Where(r => r.p2_activity_assistedWalking.Equals("1")); }
        if (cbx_p2_activity_assistedFloor.Checked) { reports = reports.Where(r => r.p2_activity_assistedFloor.Equals("1")); }
        if (cbx_p2_activity_fall.Checked) { reports = reports.Where(r => r.p2_activity_fall.Equals("1")); }
        if (cbx_p2_activity_holding.Checked) { reports = reports.Where(r => r.p2_activity_holding.Equals("1")); }
        if (cbx_p2_activity_toileting.Checked) { reports = reports.Where(r => r.p2_activity_toileting.Equals("1")); }

        if (cbx_p2_patient_ceilingLift.Checked) { reports = reports.Where(r => r.p2_patient_ceilingLift.Equals("1")); }
        if (cbx_p2_patient_sitStandLift.Checked) { reports = reports.Where(r => r.p2_patient_sitStandLift.Equals("1")); }
        if (cbx_p2_patient_floorLift.Checked) { reports = reports.Where(r => r.p2_patient_floorLift.Equals("1")); }
        if (cbx_p2_patient_manualLift.Checked) { reports = reports.Where(r => r.p2_patient_manualLift.Equals("1")); }
        if (cbx_p2_patient_other.Checked) { reports = reports.Where(r => !(r.p2_patient_otherSpecify.Equals(null))); }
        if (!rbl_p2_patient_adequateAssist.SelectedValue.Equals(String.Empty)) {
            reports = reports.Where(r => r.p2_patient_adequateAssist.Equals(rbl_p2_patient_adequateAssist.SelectedValue));
        }

        if (cbx_p2_activity_washing.Checked) { reports = reports.Where(r => r.p2_activity_washing.Equals("1")); }
        if (cbx_p2_activity_dressing.Checked) { reports = reports.Where(r => r.p2_activity_dressing.Equals("1")); }
        if (cbx_p2_activity_changing.Checked) { reports = reports.Where(r => r.p2_activity_changing.Equals("1")); }
        if (cbx_p2_activity_feeding.Checked) { reports = reports.Where(r => r.p2_activity_feeding.Equals("1")); }
        if (cbx_p2_activity_prep.Checked) { reports = reports.Where(r => r.p2_activity_prep.Equals("1")); }
        if (cbx_p2_activity_dressingChanges.Checked) { reports = reports.Where(r => r.p2_activity_dressingChanges.Equals("1")); }
        if (cbx_p2_activity_otherPatientCare.Checked) { reports = reports.Where(r => r.p2_activity_otherPatientCare.Equals("1")); }

        if (cbx_p2_activity_recapping.Checked) { reports = reports.Where(r => r.p2_activity_recapping.Equals("1")); }
        if (cbx_p2_activity_puncture.Checked) { reports = reports.Where(r => r.p2_activity_puncture.Equals("1")); }
        if (cbx_p2_activity_sharpsDisposal.Checked) { reports = reports.Where(r => r.p2_activity_sharpsDisposal.Equals("1")); }
        if (cbx_p2_activity_otherSharps.Checked) { reports = reports.Where(r => r.p2_activity_otherSharps.Equals("1")); }

        //if (tbx_p2_acitvity_material.Checked) { reports = reports.Where(r => r.p2_activity_material.Equals("1")); }
        if (cbx_p2_activity_lift.Checked) { reports = reports.Where(r => r.p2_activity_lift.Equals("1")); }
        if (cbx_p2_activity_push.Checked) { reports = reports.Where(r => r.p2_activity_push.Equals("1")); }
        if (cbx_p2_activity_carry.Checked) { reports = reports.Where(r => r.p2_activity_carry.Equals("1")); }
        if (cbx_p2_activity_otherMat.Checked) { reports = reports.Where(r => r.p2_activity_otherMat != null); }
        if (cbx_p2_activity_driving.Checked) { reports = reports.Where(r => r.p2_activity_driving.Equals("1")); }
        if (cbx_p2_activity_otherEquip.Checked) { reports = reports.Where(r => r.p2_activity_otherEquip != null); }
        if (cbx_p2_activity_otherEquipDesc.Checked) { reports = reports.Where(r => r.p2_activity_otherEquipDesc != null); }
        if (cbx_p2_activity_equipMain.Checked) { reports = reports.Where(r => r.p2_activity_equipMain.Equals("1")); }
        if (cbx_p2_activity_comp.Checked) { reports = reports.Where(r => r.p2_activity_comp.Equals("1")); }
        if (cbx_p2_activity_nonComp.Checked) { reports = reports.Where(r => r.p2_activity_nonComp.Equals("1")); }

        if (cbx_p2_activity_walking.Checked) { reports = reports.Where(r => r.p2_activity_walking.Equals("1")); }
        if (cbx_p2_activity_bending.Checked) { reports = reports.Where(r => r.p2_activity_bending.Equals("1")); }
        if (cbx_p2_activity_reading.Checked) { reports = reports.Where(r => r.p2_activity_reading.Equals("1")); }
        if (cbx_p2_activity_spill.Checked) { reports = reports.Where(r => r.p2_activity_spill.Equals("1")); }
        if (cbx_p2_activity_cleaning.Checked) { reports = reports.Where(r => r.p2_activity_cleaning.Equals("1")); }
        if (cbx_p2_activity_other.Checked) { reports = reports.Where(r => r.p2_activity_other != null); }
        #endregion C_AccidentInvestigation

        #region D_Cause
        if (cbx_p2_cause_human.Checked) { reports = reports.Where(r => r.p2_cause_human.Equals("1")); }
        if (cbx_p2_cause_animal.Checked) { reports = reports.Where(r => r.p2_cause_animal.Equals("1")); }

        if (cbx_p2_cause_needle.Checked) { reports = reports.Where(r => r.p2_cause_needle.Equals("1")); }
        if (cbx_p2_cause_otherSharps.Checked) { reports = reports.Where(r => r.p2_cause_otherSharps.Equals("1")); }
        if (cbx_p2_cause_skin.Checked) { reports = reports.Where(r => r.p2_cause_skin.Equals("1")); }

        if (cbx_p2_cause_awkwardPosture.Checked) { reports = reports.Where(r => r.p2_cause_awkwardPosture.Equals("1")); }
        if (cbx_p2_cause_staticPosture.Checked) { reports = reports.Where(r => r.p2_cause_staticPosture.Equals("1")); }
        if (cbx_p2_cause_contactStress.Checked) { reports = reports.Where(r => r.p2_cause_contactStress.Equals("1")); }
        if (cbx_p2_cause_force.Checked) { reports = reports.Where(r => r.p2_cause_force.Equals("1")); }
        if (cbx_p2_cause_rep.Checked) { reports = reports.Where(r => r.p2_cause_rep.Equals("1")); }

        if (cbx_p2_cause_motor.Checked) { reports = reports.Where(r => r.p2_cause_motor.Equals("1")); }
        if (cbx_p2_cause_slip.Checked) { reports = reports.Where(r => r.p2_cause_slip.Equals("1")); }
        if (cbx_p2_cause_aggression.Checked) { reports = reports.Where(r => r.p2_cause_aggression.Equals("1")); }
        if (cbx_p2_cause_undetermined.Checked) { reports = reports.Where(r => r.p2_cause_undetermined.Equals("1")); }
        if (cbx_p2_cause_event.Checked) { reports = reports.Where(r => r.p2_cause_event.Equals("1")); }
        if (cbx_p2_cause_underEquip.Checked) { reports = reports.Where(r => r.p2_cause_underEquip.Equals("1")); }
        if (cbx_p2_cause_hit.Checked) { reports = reports.Where(r => r.p2_cause_hit.Equals("1")); }
        if (cbx_p2_cause_other.Checked) { reports = reports.Where(r => r.p2_cause_other != null); }

        if (cbx_p2_cause_aggression_verbal.Checked) { reports = reports.Where(r => r.p2_aggression_verbal.Equals("1")); }
        if (cbx_p2_cause_aggression_biting.Checked) { reports = reports.Where(r => r.p2_aggression_biting.Equals("1")); }
        if (cbx_p2_cause_aggression_hitting.Checked) { reports = reports.Where(r => r.p2_aggression_hitting.Equals("1")); }
        if (cbx_p2_cause_aggression_squeezing.Checked) { reports = reports.Where(r => r.p2_aggression_squeezing.Equals("1")); }
        if (cbx_p2_cause_aggression_assault.Checked) { reports = reports.Where(r => r.p2_aggression_assault.Equals("1")); }
        if (cbx_p2_cause_aggression_patient.Checked) { reports = reports.Where(r => r.p2_aggression_patient.Equals("1")); }
        if (cbx_p2_cause_aggression_family.Checked) { reports = reports.Where(r => r.p2_aggression_family.Equals("1")); }
        if (cbx_p2_cause_aggression_public.Checked) { reports = reports.Where(r => r.p2_aggression_public.Equals("1")); }
        if (cbx_p2_cause_aggression_worker.Checked) { reports = reports.Where(r => r.p2_aggression_worker.Equals("1")); }
        if (cbx_p2_cause_aggression_other.Checked) { reports = reports.Where(r => r.p2_aggression_other != null); }

        //if (tbx_p2_cause_exposure_chemName.Checked) { reports = reports.Where(r => r.p2_cause_exposure_chemName.Equals("1")); }
        if (cbx_p2_cause_chemInhalation.Checked) { reports = reports.Where(r => r.p2_cause_chemInhalation.Equals("1")); }
        if (cbx_p2_cause_chemIngest.Checked) { reports = reports.Where(r => r.p2_cause_chemIngest.Equals("1")); }
        if (cbx_p2_cause_chemContact.Checked) { reports = reports.Where(r => r.p2_cause_chemContact.Equals("1")); }
        if (cbx_p2_cause_latex.Checked) { reports = reports.Where(r => r.p2_cause_latex.Equals("1")); }
        if (cbx_p2_cause_dust.Checked) { reports = reports.Where(r => r.p2_cause_dust.Equals("1")); }
        if (cbx_p2_cause_disease.Checked) { reports = reports.Where(r => r.p2_cause_disease.Equals("1")); }
        if (cbx_p2_cause_temp.Checked) { reports = reports.Where(r => r.p2_cause_temp.Equals("1")); }
        if (cbx_p2_cause_noise.Checked) { reports = reports.Where(r => r.p2_cause_noise.Equals("1")); }
        if (cbx_p2_cause_radiation.Checked) { reports = reports.Where(r => r.p2_cause_radiation.Equals("1")); }
        if (cbx_p2_cause_elec.Checked) { reports = reports.Where(r => r.p2_cause_elec.Equals("1")); }
        if (cbx_p2_cause_air.Checked) { reports = reports.Where(r => r.p2_cause_air.Equals("1")); }
        #endregion D_Cause

        #region E_ContributingFactors
        if (cbx_p2_factors_malfunction.Checked) { reports = reports.Where(r => r.p2_factors_malfunction.Equals("1")); }
        if (cbx_p2_factors_improperUse.Checked) { reports = reports.Where(r => r.p2_factors_improperUse.Equals("1")); }
        if (cbx_p2_factors_signage.Checked) { reports = reports.Where(r => r.p2_factors_signage.Equals("1")); }
        if (cbx_p2_factors_notAvailable.Checked) { reports = reports.Where(r => r.p2_factors_notAvailable.Equals("1")); }
        if (cbx_p2_factors_poorDesign.Checked) { reports = reports.Where(r => r.p2_factors_poorDesign.Equals("1")); }
        if (cbx_p2_factors_otherEquip.Checked) { reports = reports.Where(r => r.p2_factors_otherEquip != null); }

        if (cbx_p2_factors_temp.Checked) { reports = reports.Where(r => r.p2_factors_temp.Equals("1")); }
        if (cbx_p2_factors_workplace.Checked) { reports = reports.Where(r => r.p2_factors_workplace.Equals("1")); }
        if (cbx_p2_factors_layout.Checked) { reports = reports.Where(r => r.p2_factors_layout.Equals("1")); }
        if (cbx_p2_factors_limitedWorkspace.Checked) { reports = reports.Where(r => r.p2_factors_limitedWorkspace.Equals("1")); }
        if (cbx_p2_factors_slippery.Checked) { reports = reports.Where(r => r.p2_factors_slippery.Equals("1")); }
        if (cbx_p2_factors_lighting.Checked) { reports = reports.Where(r => r.p2_factors_lighting.Equals("1")); }
        if (cbx_p2_factors_noise.Checked) { reports = reports.Where(r => r.p2_factors_noise.Equals("1")); }
        if (cbx_p2_factors_vent.Checked) { reports = reports.Where(r => r.p2_factors_vent.Equals("1")); }
        if (cbx_p2_factors_storage.Checked) { reports = reports.Where(r => r.p2_factors_storage.Equals("1")); }
        if (cbx_p2_factors_otherEnv.Checked) { reports = reports.Where(r => r.p2_factors_otherEnv != null); }

        if (cbx_p2_factors_assessment.Checked) { reports = reports.Where(r => r.p2_factors_assessment.Equals("1")); }
        if (cbx_p2_factors_procedure.Checked) { reports = reports.Where(r => r.p2_factors_procedure.Equals("1")); }
        if (cbx_p2_factors_appropriateEquip.Checked) { reports = reports.Where(r => r.p2_factors_appropriateEquip.Equals("1")); }
        if (cbx_p2_factors_conduct.Checked) { reports = reports.Where(r => r.p2_factors_conduct.Equals("1")); }
        if (cbx_p2_factors_extended.Checked) { reports = reports.Where(r => r.p2_factors_extended.Equals("1")); }
        if (cbx_p2_factors_comm.Checked) { reports = reports.Where(r => r.p2_factors_comm.Equals("1")); }
        if (cbx_p2_factors_unaccustomed.Checked) { reports = reports.Where(r => r.p2_factors_unaccustomed.Equals("1")); }
        if (cbx_p2_factors_otherWorkPractice.Checked) { reports = reports.Where(r => r.p2_factors_otherWorkPractice != null); }

        if (cbx_p2_factors_directions.Checked) { reports = reports.Where(r => r.p2_factors_directions.Equals("1")); }
        if (cbx_p2_factors_weight.Checked) { reports = reports.Where(r => r.p2_factors_weight.Equals("1")); }
        if (cbx_p2_factors_aggressive.Checked) { reports = reports.Where(r => r.p2_factors_aggressive.Equals("1")); }
        if (cbx_p2_factors_patientResistive.Checked) { reports = reports.Where(r => r.p2_factors_patientResistive.Equals("1")); }
        if (cbx_p2_factors_movement.Checked) { reports = reports.Where(r => r.p2_factors_movement.Equals("1")); }
        if (cbx_p2_factors_confused.Checked) { reports = reports.Where(r => r.p2_factors_confused.Equals("1")); }
        if (cbx_p2_factors_influence.Checked) { reports = reports.Where(r => r.p2_factors_influence.Equals("1")); }
        if (cbx_p2_factors_lang.Checked) { reports = reports.Where(r => r.p2_factors_lang.Equals("1")); }
        if (cbx_p2_factors_otherPatient.Checked) { reports = reports.Where(r => r.p2_factors_otherPatient != null); }

        if (cbx_p2_factors_alone.Checked) { reports = reports.Where(r => r.p2_factors_alone.Equals("1")); }
        if (cbx_p2_factors_info.Checked) { reports = reports.Where(r => r.p2_factors_info.Equals("1")); }
        if (cbx_p2_factors_scheduling.Checked) { reports = reports.Where(r => r.p2_factors_scheduling.Equals("1")); }
        if (cbx_p2_factors_training.Checked) { reports = reports.Where(r => r.p2_factors_training.Equals("1")); }
        if (cbx_p2_factors_equip.Checked) { reports = reports.Where(r => r.p2_factors_equip.Equals("1")); }
        if (cbx_p2_factors_personal.Checked) { reports = reports.Where(r => r.p2_factors_personal.Equals("1")); }
        if (cbx_p2_factors_safe.Checked) { reports = reports.Where(r => r.p2_factors_safe.Equals("1")); }
        if (cbx_p2_factors_perceived.Checked) { reports = reports.Where(r => r.p2_factors_perceived.Equals("1")); }
        if (cbx_p2_factors_otherOrganizational.Checked) { reports = reports.Where(r => r.p2_factors_otherOrganizational != null); }

        if (cbx_p2_factors_inexperienced.Checked) { reports = reports.Where(r => r.p2_factors_inexperienced.Equals("1")); }
        if (cbx_p2_factors_communication.Checked) { reports = reports.Where(r => r.p2_factors_communication.Equals("1")); }
        if (cbx_p2_factors_fatigued.Checked) { reports = reports.Where(r => r.p2_factors_fatigued.Equals("1")); }
        if (cbx_p2_factors_distracted.Checked) { reports = reports.Where(r => r.p2_factors_distracted.Equals("1")); }
        if (cbx_p2_factors_preexisting.Checked) { reports = reports.Where(r => r.p2_factors_preexisting.Equals("1")); }
        if (cbx_p2_factors_sick.Checked) { reports = reports.Where(r => r.p2_factors_sick.Equals("1")); }
        if (cbx_p2_factors_otherWorker.Checked) { reports = reports.Where(r => r.p2_factors_otherWorker != null); }
        #endregion E_ContributingFactors

        // Format the data for the Grid View
        // Setup the Data Table
        DataTable dt = new DataTable();
        dt.Columns.Add(new DataColumn("incidentNo", typeof(System.String)));
        dt.Columns.Add(new DataColumn("date", typeof(System.String)));
        dt.Columns.Add(new DataColumn("submitter", typeof(System.String)));
        dt.Columns.Add(new DataColumn("employee", typeof(System.String)));

        String prevDeptName = String.Empty;

        // Put the data in rows, inserting rows for subheaders
        foreach (var report in reports) {
            // if it's the start of a new department, add a subheader row
            if (!prevDeptName.Equals(report.Employee.deptName)) {
                prevDeptName = report.Employee.deptName;
                DataRow drSubheader = dt.NewRow();
                drSubheader["incidentNo"] = report.Employee.deptName;
                dt.Rows.Add(drSubheader);
            }
            DataRow dr = dt.NewRow();
            dr["incidentNo"] = report.incidentNo;
            if (report.p1_dateOfIncident != null) {
                dr["date"] = Convert.ToDateTime(report.p1_dateOfIncident).ToString("M/d/yyyy");
            }
            dr["submitter"] = report.reportSubmitter;
            dr["employee"] = report.Employee.fname + " " + report.Employee.lname;
            dt.Rows.Add(dr);
        }

        // Bind the data to the Grid View
        gdvTracker.DataSource = dt;
        gdvTracker.DataBind();

        // Set the Grid View column widths
        //gdvTracker.Columns[0].ItemStyle.Width = 20;
        //gdvTracker.Columns[1].ItemStyle.Width = 360;
        //gdvTracker.Columns[2].ItemStyle.Width = 80;
        //gdvTracker.Columns[3].ItemStyle.Width = 450;

        // Find and format the subheader rows
        foreach (GridViewRow row in gdvTracker.Rows) {
            String strName = ((Label)row.FindControl("lblEmployeeName")).Text;
            if ((strName == null) || (strName.Equals(String.Empty))) {
                row.Cells[0].ColumnSpan = gdvTracker.Columns.Count;
                foreach (TableCell c in row.Cells) {
                    c.Visible = false;
                }
                row.Cells[0].Visible = true;
                row.Height = 50;
                row.ForeColor = HeaderForeColor;
            }
        }

        //gdvTracker.Columns[gdvTracker.Columns.Count - 1].Visible = false;
        
    }
    #endregion Filter Report

    #region Toggle Other TextBox and CheckBox
    private void toggleOther(TextBox tbx, CheckBox cbx) {
        if (!tbx.Text.Equals(String.Empty)) {
            cbx.Checked = true;
            return;
        }
        cbx.Checked = false;
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_patient_otherSpecify_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_patient_otherSpecify, cbx_p2_patient_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_activity_otherPatientCare_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_activity_otherPatientCare, cbx_p2_activity_otherPatientCare);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_activity_otherMat_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_activity_otherMat, cbx_p2_activity_otherMat);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_activity_otherEquip_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_activity_otherEquip, cbx_p2_activity_otherEquip);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_activity_otherEquipDesc_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_activity_otherEquipDesc, cbx_p2_activity_otherEquipDesc);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_activity_other_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_activity_other, cbx_p2_activity_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_cause_other_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_cause_other, cbx_p2_cause_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_cause_aggression_other_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_cause_aggression_other, cbx_p2_cause_aggression_other);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherEquip_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherEquip, cbx_p2_factors_otherEquip);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherEnv_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherEnv, cbx_p2_factors_otherEnv);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherWorkPractice_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherWorkPractice, cbx_p2_factors_otherWorkPractice);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherPatient_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherPatient, cbx_p2_factors_otherPatient);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherOrganizational_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherOrganizational, cbx_p2_factors_otherOrganizational);
    }
    /// <summary>
    /// Calls toggleOther() for the textbox and it's corresponding checkbox.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The text changed event.</param>
    protected void tbx_p2_factors_otherWorker_OnTextChanged(object sender, EventArgs e) {
        toggleOther(tbx_p2_factors_otherWorker, cbx_p2_factors_otherWorker);
    }
    #endregion Toggle Other TextBox and CheckBox

    #region Disable Form
    /// <summary>
    /// Disabled the parameter TextBox control.
    /// Changes the control's background color to the disabled color.
    /// </summary>
    /// <param name="cbx">The TextBox to disable.</param>
    private void disableTextBox(TextBox tbx) {
        tbx.Enabled = false;
        tbx.BackColor = DisabledColor;
        tbx.Visible = false;
    }
    /// <summary>
    /// Disabled the parameter RadioButtonList control.
    /// </summary>
    /// <param name="cbx">The RadioButtonList to disable.</param>
    private void disableRadioButtonList(RadioButtonList rbl) {
        rbl.Enabled = false;
    }
    /// <summary>
    /// Disabled the parameter TextBoxWatermarkExtender control.
    /// </summary>
    /// <param name="cbx">The TextBoxWatermarkExtender to disable.</param>
    private void disableWatermark(TextBoxWatermarkExtender twe) {
        twe.Enabled = false;
    }

    /// <summary>
    /// Calls the disableTextBox method on each textbox in the form.
    /// Disables all the watermarks as well.
    /// </summary>
    private void disableAllTextBoxes() {
        #region A_IncidentInfo
        disableTextBox(tbx_p1_action_medicalGP_date);
        disableTextBox(tbx_p1_action_medicalER_date);
        #endregion A_IncidentInfo

        #region B_NatureOfInjury
        disableTextBox(tbx_p1_numEmployeesInvolved);
        disableTextBox(tbx_p2_patient_otherSpecify);
        disableTextBox(tbx_p2_activity_otherPatientCare);
        disableTextBox(tbx_p2_activity_otherMat);
        disableTextBox(tbx_p2_activity_otherEquip);
        disableTextBox(tbx_p2_activity_otherEquipDesc);
        disableTextBox(tbx_p2_activity_other);
        #endregion C_AccidentInvestigation

        #region D_Cause
        disableTextBox(tbx_p2_cause_other);
        disableTextBox(tbx_p2_cause_aggression_other);

        disableTextBox(tbx_p2_cause_exposure_chemName);
        #endregion D_Cause

        #region E_ContributingFactors
        disableTextBox(tbx_p2_factors_otherEquip);
        disableTextBox(tbx_p2_factors_otherEnv);
        disableTextBox(tbx_p2_factors_otherWorkPractice);
        disableTextBox(tbx_p2_factors_otherPatient);
        disableTextBox(tbx_p2_factors_otherOrganizational);
        disableTextBox(tbx_p2_factors_otherWorker);
        #endregion E_ContributingFactors

        #region watermarks
        disableWatermark(tweMedicalGpDate);
        disableWatermark(tweMedicalErDate);
        #endregion watermarks
    }
    #endregion Disable Form

    protected void gdvTracker_RowCommand(object sender, GridViewCommandEventArgs e) {
        // Get the row that called the event
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = gdvTracker.Rows[index];
        // Get the Incident No
        String strIncidentNo = ((Label)row.FindControl("lblIncidentNo")).Text;
        int incidentNo = -1;
        try {
            incidentNo = Convert.ToInt32(strIncidentNo);
        }
        catch (FormatException ex) {
            Popup_Overlay("An unexpected error has occured. Please refresh the page and try again.", FailColour);
            return;
        }

        // Find out which button was clicked, take appropriate action
        switch (e.CommandName) {
            case "RowViewReport":
                Response.Redirect("~/Reporting/ViewIncidentReport.aspx?IncidentNo=" + strIncidentNo);
                break;
            case "RowViewEmployee":
                loadEmployee(getEmployeeFromIncidentId(incidentNo));
                break;
            case "RowViewCourses":
                loadCourses(getEmployeeFromIncidentId(incidentNo));
                break;
            case "RowViewLabInspections":
                loadLabInspections(incidentNo);
                break;
            case "RowViewOfficeInspections":
                loadOfficeInspections(incidentNo);
                break;
            default:
                throw new System.SystemException("Default case of switch should never be reached");
        }
    }

    private void loadInspections() {

    }

    private Employee getEmployeeFromIncidentId(int incidentNo) {
        Employee emp = ctx.Incidents
                        .Where(i => i.incidentNo.Equals(incidentNo))
                        .Select(i => i.Employee).FirstOrDefault();
        return emp;
    }

    #region Look Up Courses

    private void loadCourses(Employee employee) {
        if (employee == null) {
            return;
        }
        var qry = ctx.TrainingTakens
                  .Select(tt => new {
                      courseName = tt.TrainingCours.trainingName,
                      status = (tt.completed == 1) ? "Complete" : "Incomplete",
                      completionDate = DateTime.Now,
                      expirationDate = EntityFunctions.AddMonths(DateTime.Now, (int)tt.TrainingCours.monthsValid),
                      required = "Yes"
                  });
        gdvEmpCourses.DataSource = qry;
        gdvEmpCourses.DataBind();
        foreach (GridViewRow row in gdvEmpCourses.Rows) {
            String strExpirationDate = ((Label)row.FindControl("lblExpirationDate")).Text;
            if ((strExpirationDate != null) && (!strExpirationDate.Equals(String.Empty))) {
                DateTime expirationDate = Convert.ToDateTime(strExpirationDate);
                if (expirationDate >= DateTime.Now) {
                    row.ForeColor = Color.Red;
                }
            }
        }
        pnlEmpCoursesContainer.Visible = true;
        cpeEmployeeCourses.Collapsed = false;
        cpeEmployeeCourses.ClientState = "false";
    }

    // not used atm, will be?
    private void getCourses2(Employee employee) {
        var q = from x in ctx.TrainingCourses
                select x;
        var total = q.Count();

        List<String> courseArray = ctx.TrainingCourses.Select(c => c.trainingName).ToList();
        
        for (int i = 0; i < total; i++) {
            GridView grvCourseLookUp = new GridView();
            String temp = courseArray[i];
            grvCourseLookUp.DataSource = ctx.Employees
                               .Join(
                                  ctx.TrainingTakens,
                                  emp => emp.empNo,
                                  TT => TT.empNo,
                                  (emp, TT) =>
                                     new {
                                         emp = emp,
                                         TT = TT
                                     }
                               )
                               .Join(
                                  ctx.TrainingCourses,
                                  temp0 => temp0.TT.trainingNo,
                                  TC => TC.trainingNo,
                                  (temp0, TC) =>
                                     new {
                                         temp0 = temp0,
                                         TC = TC
                                     }
                               )
                               .Where(temp1 => (temp1.TC.trainingName == temp))
                               .Select(
                                  temp1 =>
                                     new {
                                         lastname = temp1.temp0.emp.lname,
                                         firstname = temp1.temp0.emp.fname,
                                         startdate = temp1.temp0.TT.startDate,
                                         enddate = temp1.temp0.TT.endDate
                                     }
                               );
            pnlEmployeeCourses.Controls.Add(grvCourseLookUp);

            grvCourseLookUp.Caption = "<table width=\"100%\" class=\"gvCaption\"><tr><td>" + temp + "</td></tr></table>";
            grvCourseLookUp.DataBind();
            
            //pnlEmpCoursesContainer.Visible = true;
            //cpeEmployeeCourses.Collapsed = false;
            //cpeEmployeeCourses.ClientState = "false";
        }

    }
    #endregion Look Up Courses

    #region Look Up Employee Info
    private void loadEmployee(Employee emp) {
        if (emp != null) {
            lblId.Text = emp.empNo.ToString();
            lblFirstName.Text = emp.fname.ToString();
            lblLastName.Text = emp.lname.ToString();
            lblPosition.Text = convertToTextBoxValue(emp.position);
            lblEmployer.Text = convertToTextBoxValue(emp.employer);
            lblDepartment.Text = convertToTextBoxValue(emp.deptName);
            lblSupervisor.Text = convertToTextBoxValue(emp.supervisor);
            lblRoom.Text = convertToTextBoxValue(emp.room);

            if (emp.startDate != null) {
                lblStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("M/d/yyyy");
            }

            if (emp.endDate != null) {
                lblEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("M/d/yyyy");
            }
        }
        pnlEmpInfoContainer.Visible = true;
        cpeEmpInfo.Collapsed = false;
        cpeEmpInfo.ClientState = "false";
    }

    /// <summary>
    /// If a string is NULL, returns an empty string.
    /// Otherwise, returns the value.
    /// This is so textboxes display an empty string instead of NULL.
    /// </summary>
    /// <param name="value">The String to convert.</param>
    /// <returns>Empty string if null, otherwise returns the value.</returns>
    private String convertToTextBoxValue(String value) {
        if (value == null) {
            return String.Empty;
        }
        return value;
    }
    #endregion Look Up Employee Info

    protected void gdvLabInspections_RowCommand(object sender, GridViewCommandEventArgs e) {
        // Get the row that called the event
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = gdvLabInspections.Rows[index];
        // Get the Lab Inspection No
        String strLabInspectionNo = String.Empty;
        Label lbl = (Label)row.FindControl("lblLabInspectionNo");
        if (lbl != null) {
            strLabInspectionNo = lbl.Text;
        }
        // Find out which button was clicked, take appropriate action
        if (e.CommandName.Equals("RowViewLabInspection")) {
            Response.Redirect("~/Tracking/ViewLabInspection.aspx?LabInspectionNo=" + strLabInspectionNo);
        }
    }

    private void loadLabInspections(int incidentNo) {
        var qry = from l in ctx.LabInspections
                  join i in ctx.Incidents on l.deptName equals i.Employee.deptName
                  where (i.incidentNo.Equals(incidentNo))
                  select new {
                      labInspectionNo = l.labInsNo,
                      deptName = l.deptName,
                      inspectionDate = l.date,
                      followup = l.followupComment,
                      inspector = l.inspector,
                      labManager = l.labMgr,
                      supervisor = l.supervisor,
                      room = l.room
                  };

        gdvLabInspections.DataSource = qry;
        gdvLabInspections.DataBind();

        pnlLabInspectionsContainer.Visible = true;
        cpeLabInspections.Collapsed = false;
        cpeLabInspections.ClientState = "false";
    }

    protected void gdvOfficeInspections_RowCommand(object sender, GridViewCommandEventArgs e) {
        // Get the row that called the event
        int index = Convert.ToInt32(e.CommandArgument);
        GridViewRow row = gdvOfficeInspections.Rows[index];
        // Get the Office Inspection No
        String strOfficeInspectionNo = String.Empty;
        Label lbl = (Label)row.FindControl("lblOfficeInspectionNo");
        if (lbl != null) {
            strOfficeInspectionNo = lbl.Text;
        }
        // Find out which button was clicked, take appropriate action
        if (e.CommandName.Equals("RowViewOfficeInspection")) {
            Response.Redirect("~/Tracking/ViewOfficeInspection.aspx?OfficeInspectionNo=" + strOfficeInspectionNo);
        }
    }

    private void loadOfficeInspections(int incidentNo) {
        var qry = from l in ctx.OfficeInspections
                  join i in ctx.Incidents on l.deptName equals i.Employee.deptName
                  where (i.incidentNo.Equals(incidentNo))
                  select new {
                      officeInspectionNo = l.officeInsNo,
                      deptName = l.deptName,
                      inspectionDate = l.insDate,
                      followup = l.followupComment,
                      inspector = l.inspector,
                      area = l.area
                  };

        gdvOfficeInspections.DataSource = qry;
        gdvOfficeInspections.DataBind();

        pnlOfficeInspectionsContainer.Visible = true;
        cpeOfficeInspections.Collapsed = false;
        cpeOfficeInspections.ClientState = "false";
    }

}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    