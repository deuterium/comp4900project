using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCCAModel;
using System.Data;
using System.Drawing;

/** TO DO:
 * fix time regex (see sample forms) --> make a up/down arrow clock
 * fix table style (when you select Other from DDL)
 * make clear all and clear individual form buttons
 * add regex validator to phone
 * add regex for name
 * custom validator for Others in DDL
 * ask about dates (how the labels on the forms say M/D/Y)
 * Kalen: panel A, panel B
 * Kalen: comment boxes are centered (vertically) - see section G
 * put tbx on same line as Other: option
 * add regex to last 3 sections
 * test really long inputs
 * put results msg in update panel triggered by btn click (so it disappears eveyr time you click submit)
 **/

public partial class Reporting_Reporting : System.Web.UI.Page {
    #region class variables
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
    // List of static, pre-defined actiosn following an incident that a user can select
    public static List<String> actionsFollowing = new List<String> {
        noOptionSpecified,
        "Report Only",
        "Lost time (missed/will miss next scheduled shift due to injury)",
        "First Aid",
        "Medical Aid (GP / Clinic)",
        "Medical Aid (ER)"
    };
    #endregion class variables

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            GridView1.DataSource = ctx.Incidents;
            GridView1.DataBind();
            
            //ddlActionFollowing.DataSource = actionsFollowing;
            //ddlActionFollowing.DataBind();

            ddlEmployers.DataSource = employers;
            ddlEmployers.DataBind();

            ddlDepartments.DataSource = ctx.Departments;
            ddlDepartments.DataValueField = "deptNo";
            ddlDepartments.DataTextField = "deptName";
            ddlDepartments.DataBind();
            ddlDepartments.Items.Insert(0, noOptionSpecified);

            ddlPositions.DataSource = ctx.Positions;
            ddlPositions.DataValueField = "posName";
            ddlPositions.DataBind();
            ddlPositions.Items.Insert(ddlPositions.Items.Count, otherOption);
            ddlPositions.Items.Insert(0, noOptionSpecified);

            lblResults.Visible = true;
        }
    }

    /// <summary>
    /// Uses the employee's first and last name to get the rest employee's information from the database.
    /// Populates the Header form with this data.
    /// </summary>
    private void getEmployeeData() {
        String first = tbxFirstName.Text;
        String last = tbxLastName.Text;
        Employee emp = null;

        var qry = ctx.Employees
                  .Where(e => e.fname.Equals(first) && e.lname.Equals(last))
                  .Select(e => e);

        if ((qry != null) && (qry.Count() == 1)) {
            emp = qry.FirstOrDefault();

            tbxId.Text = emp.empNo.ToString();
            
            var position = ctx.Positions
                           .Where(p => p.posName.Equals(emp.position))
                           .Select(p => p.posName);

            if (emp.position == null) {
                ddlPositions.SelectedIndex = 0;
            } else if (position.Count() == 1) {
                ddlPositions.SelectedValue = emp.position;
            } else {
                ddlPositions.SelectedValue = otherOption;
                tbxPosition.Text = emp.position;
            }
            CheckPositionOption();

            if (emp.employer == null) {
                ddlEmployers.SelectedIndex = 0;
            } else if (employers.Contains(emp.employer)) {
                ddlEmployers.SelectedValue = emp.employer;
            } else {
                ddlEmployers.SelectedValue = otherOption;
                tbxEmployer.Text = emp.employer;
            }
            CheckEmployeeOption();

            if (emp.supervisor == null) {
                tbxSupervisor.Text = String.Empty;
            } else {
                tbxSupervisor.Text = emp.supervisor;
            }

            ddlDepartments.SelectedValue = emp.deptNo.ToString();

            tbxStartDate.Text = Convert.ToDateTime(emp.startDate).ToString("yyyy/MM/dd");
            
            if (emp.endDate != null) {
                tbxEndDate.Text = Convert.ToDateTime(emp.endDate).ToString("yyyy/MM/dd");
            }

            setResultMsg(null, SuccessColour);

        } else if ((qry != null) && (qry.Count() <= 0)) {
            setResultMsg("No employees with that first and last name found.", FailColour);
        } else {
            setResultMsg("There was more than one employee with that first and last name.", FailColour);
        }
    }

    /// <summary>
    /// Calls getEmployeeData(), which fetches the employee from the database using the employee's first and last name
    /// then populates the rest of the form with the employee's information.
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void btnGetEmployee_Click(object sender, EventArgs e) {
        setResultMsg(null, SuccessColour);
        getEmployeeData();
    }

    /// <summary>
    /// Sets and displays the result message for the header form.
    /// Using a null msg param will clear and hide the message.
    /// </summary>
    /// <param name="msg">The message to display</param>
    /// <param name="foreColour">The font colour of the message</param>
    private void setResultMsg(String msg, Color foreColour) {
        if (msg == null) {
            lblResults.Text = String.Empty;
            lblResults.Visible = false;
        }
        lblResults.Visible = true;
        lblResults.ForeColor = foreColour;
        lblResults.Text = msg;
    }

    protected void btnCreateReport_Click(object sender, EventArgs e) {
        createReport();
    }

    private void createReport() {
        int empId = Convert.ToInt32(tbxId.Text);
        DateTime dateOfIncident = Convert.ToDateTime(tbx_p1_dateOfIncident.Text + " " + tbx_p1_timeOfIncident.Text);
        DateTime dateReported = Convert.ToDateTime(tbx_p1_dateReported.Text + " " + tbx_p1_timeReported.Text);
        DateTime dateMedicalGP = Convert.ToDateTime(tbx_p1_action_medicalGP_date.Text);
        DateTime dateMedicalER = Convert.ToDateTime(tbx_p1_action_medicalER_date.Text);
        DateTime dateCorrectivePerson = Convert.ToDateTime(tbx_p2_corrective_personDate.Text);
        DateTime dateMaintenance = Convert.ToDateTime(tbx_p2_corrective_maintenanceDate.Text);
        DateTime dateCommunicated = Convert.ToDateTime(tbx_p2_corrective_communicatedDate.Text);
        DateTime dateTimeLoss = Convert.ToDateTime(tbx_p2_corrective_timeDate.Text);
        
        String test = rbl_p2_patient_adequateAssist.SelectedValue;
        
        Incident report = new Incident {
            empNo = empId,
            p1_dateOfIncident = dateOfIncident,
            p1_timeReported = dateReported,
            p1_incidentDesc = tbx_p1_incidentDesc.Text,
            p1_witnessName1 = tbx_p1_witnessName1.Text,
            p1_witnessPhone1 = tbx_p1_witnessPhone1.Text,
            p1_witnessName2 = tbx_p1_witnessName2.Text,
            p1_witnessPhone2 = tbx_p1_witnessPhone2.Text,

            p1_action_firstAid = convertCheckbox(cbx_p1_action_firstAid),
            p1_action_medicalGP = convertCheckbox(cbx_p1_action_medicalGP),
            p1_action_medicalGP_date = dateMedicalGP,
            p1_action_lostTime = convertCheckbox(cbx_p1_action_lostTime),
            p1_action_medicalER = convertCheckbox(cbx_p1_action_medicalER),
            p1_action_medicalER_date = dateMedicalER,

            p1_nature_no = convertCheckbox(cbx_p1_nature_no),
            p1_nature_musculoskeletal = convertCheckbox(cbx_p1_nature_musculoskeletal),
            p1_nature_bruise = convertCheckbox(cbx_p1_nature_bruise),
            //p1_nature_burn = convertCheckbox(cbx_p1_nature_burn),
            p1_nature_cut = convertCheckbox(cbx_p1_nature_cut),
            p1_nature_puncture = convertCheckbox(cbx_p1_nature_puncture),
            p1_nature_skinIrritation = convertCheckbox(cbx_p1_nature_skinIrritation),
            p1_nature_skinMucous = convertCheckbox(cbx_p1_nature_skinMucous),
            p1_nature_eye = convertCheckbox(cbx_p1_nature_eye),
            p1_nature_allergic = convertCheckbox(cbx_p1_nature_allergic),
            p1_nature_psychological = convertCheckbox(cbx_p1_nature_psychological),
            p1_nature_respiratory = convertCheckbox(cbx_p1_nature_respiratory),

            p2_activity_no = convertCheckbox(cbx_p2_activity_no),
            p2_activity_repositioning = convertCheckbox(cbx_p2_activity_repositioning),
            p2_activity_transferring = convertCheckbox(cbx_p2_activity_transferring),
            p2_activity_assistedWalking = convertCheckbox(cbx_p2_activity_assistedWalking),
            p2_activity_assistedFloor = convertCheckbox(cbx_p2_activity_assistedFloor),
            p2_activity_fall = convertCheckbox(cbx_p2_activity_fall),
            p2_activity_holding = convertCheckbox(cbx_p2_activity_holding),
            p2_activity_toileting = convertCheckbox(cbx_p2_activity_toileting),

            p2_patient_celingLift = convertCheckbox(cbx_p2_patient_ceilingLift),
            p2_patient_sitStandLift = convertCheckbox(cbx_p2_patient_sitStandLift),
            p2_patient_floorLift = convertCheckbox(cbx_p2_patient_floorLift),
            p2_patient_manualLift = convertCheckbox(cbx_p2_patient_manualLift),
            p2_patient_otherSpecify = tbx_p2_patient_otherSpecify.Text,
            p2_patient_adequateAssist = convertRadioButtonList(rbl_p2_patient_adequateAssist),
            //p2_patient_involved = tbx_p2_patient_involved.Text,

            p2_activity_washing = convertCheckbox(cbx_p2_activity_washing),
            p2_activity_dressing = convertCheckbox(cbx_p2_activity_dressing),
            p2_activity_changing = convertCheckbox(cbx_p2_activity_changing),
            p2_activity_feeding = convertCheckbox(cbx_p2_activity_feeding),
            p2_activity_prep = convertCheckbox(cbx_p2_activity_prep),
            p2_activity_dressingChanges = convertCheckbox(cbx_p2_activity_dressingChanges),
            p2_activity_otherPatientCare = tbx_p2_activity_otherPatientCare.Text,

            p2_activity_recapping = convertCheckbox(cbx_p2_activity_recapping),
            p2_activity_puncture = convertCheckbox(cbx_p2_activity_puncture),
            p2_activity_sharpsDisposal = convertCheckbox(cbx_p2_activity_sharpsDisposal),
            p2_activity_otherSharps = convertCheckbox(cbx_p2_activity_otherSharps),

            p2_activity_material = tbx_p2_acitvity_material.Text,
            p2_activity_lift = convertCheckbox(cbx_p2_activity_recapping),
            p2_activity_push = convertCheckbox(cbx_p2_activity_push),
            p2_activity_carry = convertCheckbox(cbx_p2_activity_carry),
            p2_activity_otherMat = tbx_p2_activity_otherMat.Text,
            p2_activity_driving = convertCheckbox(cbx_p2_activity_driving),
            p2_activity_otherEquip = convertCheckbox(cbx_p2_activity_otherEquip),
            p2_activity_otherEquipDesc = convertCheckbox(cbx_p2_activity_otherEquipDesc),
            p2_activity_equipMain = convertCheckbox(cbx_p2_activity_equipMain),
            p2_activity_comp = convertCheckbox(cbx_p2_activity_comp),
            p2_activity_nonComp = convertCheckbox(cbx_p2_activity_nonComp),

            p2_activity_walking = convertCheckbox(cbx_p2_activity_walking),
            p2_activity_bending = convertCheckbox(cbx_p2_activity_bending),
            p2_activity_reading = convertCheckbox(cbx_p2_activity_reading),
            p2_activity_spill = convertCheckbox(cbx_p2_activity_spill),
            p2_activity_cleaning = convertCheckbox(cbx_p2_activity_cleaning),
            p2_activity_other = tbx_p2_activity_other.Text,
            
            p2_cause_human = convertCheckbox(cbx_p2_cause_human),
            p2_cause_animal = convertCheckbox(cbx_p2_cause_animal),

            p2_cause_needle = convertCheckbox(cbx_p2_cause_needle),
            p2_cause_otherSharps = convertCheckbox(cbx_p2_cause_otherSharps),
            p2_cause_skin = convertCheckbox(cbx_p2_cause_skin),

            p2_cause_awkwardPosture = convertCheckbox(cbx_p2_cause_awkwardPosture),
            p2_cause_staticPosture = convertCheckbox(cbx_p2_cause_staticPosture),
            //p2_cause_contact = convertCheckbox(cbx_),
            p2_cause_force = convertCheckbox(cbx_p2_cause_force),
            p2_cause_rep = convertCheckbox(cbx_p2_cause_rep),

            p2_cause_motor = convertCheckbox(cbx_p2_cause_motor),
            p2_cause_slip = convertCheckbox(cbx_p2_cause_slip),
            p2_cause_aggression = convertCheckbox(cbx_p2_cause_aggression),
            p2_cause_undeterminded = convertCheckbox(cbx_p2_cause_undetermined),    // spelled wrong
            p2_cause_event = convertCheckbox(cbx_p2_cause_event),
            p2_cause_underEquip = convertCheckbox(cbx_p2_cause_underEquip),
            p2_cause_hit = convertCheckbox(cbx_p2_cause_hit),
            p2_cause_other = cbx_p2_cause_other.Text,

            p2_aggression_verbal = convertCheckbox(cbx_p2_cause_aggression_verbal),
            p2_aggression_biting = convertCheckbox(cbx_p2_cause_aggression_biting),
            p2_aggression_hitting = convertCheckbox(cbx_p2_cause_aggression_hitting),
            p2_aggression_squeezing = convertCheckbox(cbx_p2_cause_aggression_squeezing),
            p2_aggression_assault = convertCheckbox(cbx_p2_cause_aggression_assault),
            p2_aggression_patient = convertCheckbox(cbx_p2_cause_aggression_patient),
            p2_aggression_family = convertCheckbox(cbx_p2_cause_aggression_family),
            p2_aggression_public = convertCheckbox(cbx_p2_cause_aggression_public),
            p2_aggression_worker = convertCheckbox(cbx_p2_cause_aggression_worker),
            p2_aggression_other = tbx_p2_cause_aggression_other.Text,

            //p2_cause_chemName = convertCheckbox(p2_cause_chemName),
            p2_cause_chemInhalation = convertCheckbox(cbx_p2_cause_chemInhalation),
            p2_cause_chemIngest = convertCheckbox(cbx_p2_cause_chemIngest),
            p2_cause_chemContact = convertCheckbox(cbx_p2_cause_chemContact),
            p2_cause_latex = convertCheckbox(cbx_p2_cause_latex),
            p2_cause_dust = convertCheckbox(cbx_p2_cause_dust),
            p2_cause_disease = convertCheckbox(cbx_p2_cause_disease),
            p2_cause_temp = convertCheckbox(cbx_p2_cause_temp),
            p2_cause_noise = convertCheckbox(cbx_p2_cause_noise),
            p2_cause_radiation = convertCheckbox(cbx_p2_cause_radiation),
            p2_cause_elec = convertCheckbox(cbx_p2_cause_elec),
            p2_cause_air = convertCheckbox(cbx_p2_cause_air),

            p2_factors_malfunction = convertCheckbox(cbx_p2_factors_malfunction),
            p2_factors_improperUse = convertCheckbox(cbx_p2_factors_improperUse),
            p2_factors_signage = convertCheckbox(cbx_p2_factors_signage),
            p2_factors_notAvailable = convertCheckbox(cbx_p2_factors_notAvailable),
            p2_factors_poorDesign = convertCheckbox(cbx_p2_factors_poorDesign),
            p2_factors_otherEquip = tbx_p2_factors_otherEquip.Text,

            p2_factors_temp = convertCheckbox(cbx_p2_factors_temp),
            p2_factors_workplace = convertCheckbox(cbx_p2_factors_workplace),
            p2_factors_layout = convertCheckbox(cbx_p2_factors_layout),
            p2_factors_limitedWorkspace = convertCheckbox(cbx_p2_factors_limitedWorkspace),
            p2_factors_slippery = convertCheckbox(cbx_p2_factors_slippery),
            p2_factors_lighting = convertCheckbox(cbx_p2_factors_lighting),
            p2_factors_noise = convertCheckbox(cbx_p2_factors_noise),
            p2_factors_vent = convertCheckbox(cbx_p2_factors_vent),
            p2_factors_storage = convertCheckbox(cbx_p2_factors_storage),
            p2_factors_otherEnv = tbx_p2_factors_otherEnv.Text,

            p2_factors_assessment = convertCheckbox(cbx_p2_factors_assessment),
            p2_factors_procedure = convertCheckbox(cbx_p2_factors_procedure),
            p2_factors_appropriateEquip = convertCheckbox(cbx_p2_factors_appropriateEquip),
            p2_factors_conduct = convertCheckbox(cbx_p2_factors_conduct),
            p2_factors_extended = convertCheckbox(cbx_p2_factors_extended),
            p2_factors_comm = convertCheckbox(cbx_p2_factors_comm),
            p2_factors_unaccustomed = convertCheckbox(cbx_p2_factors_unaccustomed),
            p2_factors_otherWorkPractice = tbx_p2_factors_otherWorkPractice.Text,

            p2_factors_directions = convertCheckbox(cbx_p2_factors_directions),
            p2_factors_weight = convertCheckbox(cbx_p2_factors_weight),
            p2_factors_aggressive = convertCheckbox(cbx_p2_factors_aggressive),
            //p2_factors_resistive = convertCheckbox(cbx_p2_factors_resistive),
            p2_factors_movement = convertCheckbox(cbx_p2_factors_movement),
            p2_factors_confused = convertCheckbox(cbx_p2_factors_confused),
            p2_factors_influence = convertCheckbox(cbx_p2_factors_influence),
            p2_factors_lang = convertCheckbox(cbx_p2_factors_lang),
            p2_factors_otherPatient = tbx_p2_factors_otherPatient.Text,

            p2_factors_alone = convertCheckbox(cbx_p2_factors_alone),
            p2_factors_info = convertCheckbox(cbx_p2_factors_info),
            p2_factors_scheduling = convertCheckbox(cbx_p2_factors_scheduling),
            p2_factors_training = convertCheckbox(cbx_p2_factors_training),
            p2_factors_equip = convertCheckbox(cbx_p2_factors_equip),
            p2_factors_personal = convertCheckbox(cbx_p2_factors_personal),
            p2_factors_safe = convertCheckbox(cbx_p2_factors_safe),
            p2_factors_perceived = convertCheckbox(cbx_p2_factors_perceived),
            p2_factors_otherOrganizational = tbx_p2_factors_otherOrganizational.Text,

            p2_factors_inexperienced = convertCheckbox(cbx_p2_factors_inexperienced),
            p2_factors_communication = convertCheckbox(cbx_p2_factors_communication),
            p2_factors_fatigued = convertCheckbox(cbx_p2_factors_fatigued),
            p2_factors_distracted = convertCheckbox(cbx_p2_factors_distracted),
            p2_factors_preexisting = convertCheckbox(cbx_p2_factors_preexisting),
            p2_factors_sick = convertCheckbox(cbx_p2_factors_sick),
            p2_factors_otherWorker = tbx_p2_factors_otherWorker.Text,

            // ENDED HERE! FIX: may be null b/c not required!!!
            p2_corrective_person = tbx_p2_corrective_person.Text,
            p2_corrective_personDate = dateCorrectivePerson,
            p2_corrective_maintenance = convertRadioButtonList(rbl_p2_corrective_maintenance),
            p2_corrective_maintenanceDate = dateMaintenance,
            p2_corrective_communicated = convertRadioButtonList(rbl_p2_corrective_communicated),
            p2_corrective_communicatedDate = dateCommunicated,
            p2_corrective_time = convertRadioButtonList(rbl_p2_corrective_time),
            p2_corrective_timeDate = dateTimeLoss,
        };

        try {
            ctx.AddToIncidents(report);
            ctx.SaveChanges();
        } catch (Exception ex) {
            setResultMsg(ex.StackTrace, FailColour);
        }
        
    }

    private String convertCheckbox(CheckBox cbx) {
        if (!cbx.Checked) {
            return null;
        }
        return "1";
    }

    private String convertRadioButtonList(RadioButtonList rbl) {
        if ((rbl.SelectedValue == null) || rbl.SelectedValue.Equals("Null")) {
            return null;
        } else {
            return rbl.SelectedValue.ToString();
        }
    }

    #region DropDownLists
    /// <summary>
    /// Calls CheckEmployeeOption(), which displays a textbox if the "Other (specify)" option is selected
    /// and hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlEmployers_SelectedIndexChanged(object sender, EventArgs e) {
        CheckEmployeeOption();
    }

    /// <summary>
    /// Calls CheckPositionOption(), which displays a textbox if the "Other (specify)" option is selected
    /// and hides the textbox if any other option is selected
    /// </summary>
    /// <param name="sender">The object that triggered the event.</param>
    /// <param name="e">The index changed event.</param>
    protected void ddlPositions_SelectedIndexChanged(object sender, EventArgs e) {
        CheckPositionOption();
    }

    private void CheckPositionOption() {
        if (ddlPositions.SelectedValue.Equals(otherOption)) {
            tbxPosition.Visible = true;
        } else {
            tbxPosition.Visible = false;
        }
    }

    private void CheckEmployeeOption() {
        if (ddlEmployers.SelectedValue.Equals(otherOption)) {
            tbxEmployer.Visible = true;
        } else {
            tbxEmployer.Visible = false;
        }
    }
    #endregion DropDownLists
}