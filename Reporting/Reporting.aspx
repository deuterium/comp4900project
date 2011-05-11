<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reporting.aspx.cs" Inherits="Reporting_Reporting" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
   
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="body">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeReportInfo" runat="server" Collapsed="false"
CollapseControlID="hr3ReportInfo" ExpandControlID="hr3ReportInfo" TargetControlID="pnlReportInfo"
ImageControlID="imgExpandCollapseReportInfo" TextLabelID="ExpandCollapseA" CollapsedImage="../images/expand.jpg" 
ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="true"
CollapseControlID="hr3A" ExpandControlID="hr3A" TargetControlID="pnlA"
ImageControlID="imgExpandCollapseA" TextLabelID="ExpandCollapseA" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="true"
CollapseControlID="hr3B" ExpandControlID="hr3B" TargetControlID="pnlB"
ImageControlID="imgExpandCollapseB" TextLabelID="ExpandCollapseB" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeC" runat="server" Collapsed="true"
CollapseControlID="hr3C" ExpandControlID="hr3C" TargetControlID="pnlC"
ImageControlID="imgExpandCollapseC" TextLabelID="ExpandCollapseC" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeD" runat="server" Collapsed="true"
CollapseControlID="hr3D" ExpandControlID="hr3D" TargetControlID="pnlD"
ImageControlID="imgExpandCollapseD" TextLabelID="ExpandCollapseD" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeE" runat="server" Collapsed="true"
CollapseControlID="hr3E" ExpandControlID="hr3E" TargetControlID="pnlE"
ImageControlID="imgExpandCollapseE" TextLabelID="ExpandCollapseE" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeF" runat="server" Collapsed="true"
CollapseControlID="hr3F" ExpandControlID="hr3F" TargetControlID="pnlF"
ImageControlID="imgExpandCollapseF" TextLabelID="ExpandCollapseF" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeG" runat="server" Collapsed="true"
CollapseControlID="hr3G" ExpandControlID="hr3G" TargetControlID="pnlG"
ImageControlID="imgExpandCollapseG" TextLabelID="ExpandCollapseG" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeH" runat="server" Collapsed="true"
CollapseControlID="hr3H" ExpandControlID="hr3H" TargetControlID="pnlH"
ImageControlID="imgExpandCollapseH" TextLabelID="ExpandCollapseH" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<div id="divReportInfo">

<h3 id="hr3ReportInfo"><asp:Image ID="imgExpandCollapseReportInfo" runat="server" /> Header Info<asp:Label ID="ExpandCollapseReportInfo" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlReportInfo" CssClass="panel" runat="server">
    <table id="tblReportInfoForm">
        <tr>
            <td>Id:</td>
            <td><asp:TextBox ID="tbxId" runat="server"></asp:TextBox></td>
            <td>Position:</td>
            <td><asp:DropDownList ID="ddlPositions" runat="server"></asp:DropDownList></td>
            <td>Room:</td>
            <td><asp:TextBox ID="tbxRoom" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Last name:</td>
            <td><asp:TextBox ID="tbxLastName" runat="server"></asp:TextBox></td>
            <td>Employer:</td>
            <td><asp:DropDownList ID="ddlEmployers" runat="server"></asp:DropDownList></td>
            <td>Supervisor:</td>
            <td><asp:TextBox ID="tbxSupervisor" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>First name:</td>
            <td><asp:TextBox ID="tbxFirstName" runat="server"></asp:TextBox></td>
            <td>Department:</td>
            <td><asp:DropDownList ID="ddlDepartments" runat="server"></asp:DropDownList></td>
            <td>Start date:</td>
            <td>
                <asp:TextBox ID="tbxStartDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="cexStartDate" runat="server" TargetControlID="tbxStartDate" Format="yyyy/MM/dd" >
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td>End date:</td>
            <td>
                <asp:TextBox ID="tbxEndDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="cexEndDate" runat="server" TargetControlID="tbxEndDate" Format="yyyy/MM/dd" >
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr> 
            <td><asp:Button ID="btnSSearch" ValidationGroup="vgpHeader" runat="server" 
                    Text="Search" onclick="btnSSearch_Click" /></td>
        </tr>
    </table>

</asp:Panel>

<h3 id="hr3A"><asp:Image ID="imgExpandCollapseA" runat="server" /> A. Incident/Accident Information <asp:Label ID="ExpandCollapseA" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlA" CssClass="panel" runat="server">
    <table>
        <tr>
            <td>Date of Incident:</td>
            <td>
                <asp:TextBox ID="tbxDateOfIncident" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="cexDateOfIncident" runat="server" TargetControlID="tbxDateOfIncident" Format="yyyy/MM/dd" >
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td>Time of Incident:</td>
            <td><asp:TextBox ID="tbxTimeOfIncident" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Date Reported:</td>
            <td>
                <asp:TextBox ID="tbxDateReported" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="cexDateReported" runat="server" TargetControlID="tbxDateReported" Format="yyyy/MM/dd" >
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td>Time Reported:</td>
            <td><asp:TextBox ID="tbxTimeReported" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Incident Description:</td>
            <td><asp:TextBox ID="tbxIncidentDescription" runat="server" Height="100px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Witness 1:</td>
            <td>
                Name: <asp:TextBox ID="tbxWitnessName1" runat="server"></asp:TextBox>
                Phone: <asp:TextBox ID="tbxWitnessPhone1" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Witness 2:</td>
            <td>
                Name: <asp:TextBox ID="tbxWitnessName2" runat="server"></asp:TextBox>
                Phone: <asp:TextBox ID="tbxWitnessPhone2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Action following the Incident:</td>
            <td><asp:DropDownList ID="ddlActionFollowing" runat="server" OnSelectedIndexChanged="ddlActionFollowing_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="uplMedicalAidLabel" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblMedicalAid" Text="Date (M/D/Y): " runat="server" Visible="false"></asp:Label>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlActionFollowing" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td>
                <asp:UpdatePanel ID="uplMedicalAidTextbox" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="tbxMedicalAid" runat="server" Visible="false" ></asp:TextBox>
                        <asp:CalendarExtender ID="cexMedicalAid" runat="server" TargetControlID="tbxMedicalAid" Format="yyyy/MM/dd" >
                        </asp:CalendarExtender>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlActionFollowing" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

</asp:Panel>

<h3 id="hr3B"><asp:Image ID="imgExpandCollapseB" runat="server" /> B. Nature of Injury <asp:Label ID="ExpandCollapseB" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlB" CssClass="panel" runat="server">

    <h4>Nature of Injury</h4>
    <div id="divBLeftPanel">
        <table>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_no" Text="No Injury (Near Miss/ Unsafe Condition)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_musculoskeletal" Text="Musculoskeletal Injyry (Strain / Sprain)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_bruise" Text="Bruise / Confusion" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_burn" Text="Burn (Heat or Cold)" runat="server" /></td></tr>
        </table>
    </div>
    <div id="divBMiddlePanel">
        <table>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_cut" Text="Cut / Scratch / Abrasion / Laceration / Puncture (Non BBF)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_puncture" Text="Puncture Wound (BBF)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_skinIrritation" Text="Skin Irritation" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_skinMucous" Text="Skin / Mucous Membrane Exposure (incl. eye)" runat="server" /></td></tr>
        </table>
    </div>
    <div id="divBRightPanel">
        <table>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_eye" Text="Eye Irritation" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_allergic" Text="Allergic Response" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_psychological" Text="Psychological Trauma / Aggressive Incident" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p1_nature_respiratory" Text="Respiratory Irritation" runat="server" /></td></tr>
        </table>
    </div>
</asp:Panel>

<h3 id="hr3C"><asp:Image ID="imgExpandCollapseC" runat="server" /> C. Accident Investigation <asp:Label ID="ExpandCollapseC" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlC" CssClass="panel" runat="server">
<h4>Activity</h4>
    <div id="divCLeftPanel">
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_no" Text="No Injury" runat="server" /></td></tr>
        </table>
    
        <h5>Patient Handling</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_repositioning" Text="Repositioning" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_transferring" Text="Transferring (incl. to seclusion)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_assistedWalking" Text="Assisted Walking" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_assistedFloor" Text="Assisted from Floor" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_fall" Text="Preventing a fall" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_holding" Text="Holding / Assisting during procedure (incl. patient restraint)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_toileting" Text="Toileting" runat="server" /></td></tr>
        </table>

        <h5>Patient Handling Details</h5>
        <table>
            <tr><td>Equipment used at time of Injury:</td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_patient_ceilingLift" Text="Ceiling Lift" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_patient_sitStandLift" Text="Sit-Stand Lift" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_patient_floorLift" Text="Floor Lift" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_patient_manualLift" Text="Manual Lift" runat="server" /></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_patient_other" Text="Other: " runat="server" />
                <asp:TextBox ID="tbx_p2_patient_otherSpecify" runat="server" ></asp:TextBox>
            </td></tr>
            <tr><td>Was adaquate assistance available?</td></tr>
            <tr><td>
                <asp:RadioButtonList ID="rbl_p2_patient_adequateAssist" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="Yes" Value="1" ></asp:ListItem>
                    <asp:ListItem Text="No" Value="0" ></asp:ListItem>
                    <asp:ListItem Text="Unknown" Value="Null" ></asp:ListItem>
                </asp:RadioButtonList>
            </td></tr>
            <tr><td>How many employees involved in activity at time of incident?</td></tr>
            <tr><td><asp:TextBox ID="tbx_p2_patient_involved" runat="server" ></asp:TextBox></td></tr>
        </table>
  
        <h5>Patient Care</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_washing" Text="Washing / Bathing" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_dressing" Text="Dressing" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_changing" Text="Changing" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_feeding" Text="Feeding" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_prep" Text="Prep / Dispensing Meds" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_dressingChanges" Text="Dressing Changes" runat="server" /></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_activity_otherPatientCare" Text="Other: " runat="server" />
                <asp:TextBox ID="tbx_p2_activity_otherPatientCare" runat="server"></asp:TextBox>
            </td></tr>
        </table>

        <h5>Sharps Handling</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_recapping" Text="Re-capping" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_puncture" Text="Veno Puncture / Arterio Puncture" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_sharpsDisposal" Text="Sharps Disposal" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_otherSharps" Text="Other Sharps / Instruments" runat="server" /></td></tr>
        </table>
    </div>

    <div id="divCRightPanel">
        <h5>Using Material / Equipment</h5>
        <table>
            <tr><td>Material / Equipment Description (stretchers, carts, boxes, etc.):</td></tr>
            <tr><td><asp:TextBox ID="tbx_p2_acitvity_material" runat="server"></asp:TextBox></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_lift" Text="Lift / Lower" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_push" Text="Push / Pull" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_carry" Text="Carry" runat="server" /></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_activity_otherMat" Text="Other Material Description: " runat="server" />
                <asp:TextBox ID="tbx_p2_activity_otherMat" runat="server"></asp:TextBox>
            </td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_driving" Text="Equipment Operation - Driving" runat="server" /></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_activity_otherEquip" Text="Equipment Operation - Other: " runat="server" />
                <asp:TextBox ID="tbx_p2_activity_otherEquip" runat="server"></asp:TextBox>
            </td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_otherEquipDesc" Text="Other Equipment Description: " runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_equipMain" Text="Equipment Maintenance" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_comp" Text="Office Work - Computer" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_nonComp" Text="Office Work - Non Computer" runat="server" /></td></tr>
        </table>

        <h5>Other</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_walking" Text="Walking / Running" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_bending" Text="Bending" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_reading" Text="Reading" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_spill" Text="Spill Cleanup" runat="server" /></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_activity_cleaning" Text="Cleaning" runat="server" /></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_activity_other" Text="Other: " runat="server" />
                <asp:TextBox ID="tbx_p2_activity_other" runat="server"></asp:TextBox>
            </td></tr>
        </table>
    </div>
</asp:Panel>

<h3 id="hr3D"><asp:Image ID="imgExpandCollapseD" runat="server" /> D. Cause <asp:Label ID="ExpandCollapseD" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlD" CssClass="panel" runat="server">
    <div id="divDLeftPanel">
        <h5>Bite</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_human" Text="Human" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_animal" Text="Animal / Insect" runat="server"/></td></tr>
        </table>

        <h5>BBF Exposure</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_needle" Text="Needlestick" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_otherSharps" Text="Other Sharps" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_skin" Text="Skin/ Mucous Membrane (Splash / Spit)" runat="server"/></td></tr>
        </table>

        <h5>Ergonomic Factors</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_awkwardPosture" Text="Awkward Posture" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_staticPosture" Text="Static Posture" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_contact" Text="Contact Stress" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_force" Text="Force" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_rep" Text="Repetition" runat="server"/></td></tr>
        </table>

        <h5>Other</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_motor" Text="Motor Vehicle Accident" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_slip" Text="Slip and Fall" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_aggression" Text="Workplace Agression" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_undetermined" Text="Cause Undetermined" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_event" Text="Traumatic Event" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_underEquip" Text="Caught In / Under / Between Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_hit" Text="Hit / Struck By / Cut by Equipment" runat="server"/></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_cause_other" Text="Other: " runat="server"/>
                <asp:TextBox ID="tbx_p2_cause_other" runat="server"></asp:TextBox>
            </td></tr>
        </table>
    </div>
    
    <div id="divDAgressionDetailsPanel">
        <h5>Details for Workplace Aggression Incidents</h5>
        Type of Incident:
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_aggression_verbal" Text="Verbal - threats of violence, verbal assault" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_aggression_biting" Text="Biting / Spitting" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_aggression_hitting" Text="Hitting / Kicking / Beating / Choking" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_aggression_squeezing" Text="Squeezing / Punching / Scratching / Twisting" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_aggression_assault" Text="Sexual assault" runat="server"/></td></tr>
        </table>
        Incident Involved:
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_aggression_patient" Text="Patient / Resident" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_aggression_family" Text="Family member of Patient / Resident" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_aggression_public" Text="Other member of Public" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_aggression_worker" Text="Worker" runat="server"/></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_cause_aggression_other" Text="Other: " runat="server"/>
                <asp:TextBox ID="tbx_p2_cause_aggression_other" runat="server"></asp:TextBox>
            </td></tr>
        </table>
    </div>

    <div id="divDRightPanel">
        <h5>Exposure</h5>
        <table>
            <tr><td>Checmical Name: <asp:TextBox ID="tbxExposureChemical" runat="server"></asp:TextBox></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_chemInhalation" Text="Chemical Inhalation" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_chemIngest" Text="Chemical Ingestion" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_chemContact" Text="Chemical Skin / Eye Contact" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_latex" Text="Latex" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_dust" Text="Dust / Particulate" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_disease" Text="Communicable Diseases" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_temp" Text="Temperature Extremes" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_noise" Text="Noise" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_radiation" Text="Radiation" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_elec" Text="Electricity" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_cause_air" Text="Indoor Air Quality" runat="server"/></td></tr>
        </table>
    </div>
</asp:Panel>

<h3 id="hr3E"><asp:Image ID="imgExpandCollapseE" runat="server"/> E. Contributing Factors <asp:Label ID="ExpandCollapseE" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlE" CssClass="panel" runat="server">
    <div id="divELeftPanel" >
        <h5>Equipment / Device</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_malfunction" Text="Malfunctioning" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_improperUse" Text="Improper Use" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_signage" Text="Improper / Inadequate signage" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_notAvailable" Text="Not Available at Point of Use" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_poorDesign" Text="Poor Design" runat="server"/></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_factors_otherEquip" Text="Other: " runat="server"/>
                <asp:TextBox ID="tbx_p2_factors_otherEquip" runat="server"></asp:TextBox>
            </td></tr>
        </table>
    
        <h5>Environment</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_temp" Text="Temperature" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_workplace" Text="Workplace" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_layout" Text="Layout / Design" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_limitedWorkspace" Text="Limited Workspace" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_slippery" Text="Floor Slippery / Uneven" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_lighting" Text="Lighting Inadequate" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_noise" Text="Exessive Noise" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_vent" Text="Ventilation Inadequate" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_storage" Text="Improper Storage" runat="server"/></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_factors_otherEnv" Text="Other: " runat="server"/>
                <asp:TextBox ID="tbx_p2_factors_otherEnv" runat="server"></asp:TextBox>
            </td></tr>
        </table>
    </div>

    <div id="divEMiddlePanel">
        <h5>Work Practice</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_assessment" Text="Improper Assessment of Client / Load" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_procedure" Text="Did Not Follow Appropriate Procedure" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_equip" Text="Did Not Use Designated / Appropriate Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_conduct" Text="Conduct" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_extended" Text="Task Performed for extended periods" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_comm" Text="Communication" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_unaccustomed" Text="Unaccustomed" runat="server"/></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_factors_otherWorkPractice" Text="Other: " runat="server"/>
                <asp:TextBox ID="tbx_p2_factors_otherWorkPractice" runat="server"></asp:TextBox>
            </td></tr>
        </table>

        <h5>Patient Related Factors</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_directions" Text="Unable to Follow Directions" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_weight" Text="Inconsistent Weight Bearing" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_aggressive" Text="Patient Aggressive" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_resistive" Text="Patient Resistive" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_movement" Text="Made Unexpected Movement" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_confused" Text="Confused / Dementia" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_influence" Text="Under Influence of Drugs / Alcohol" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_lang" Text="Language Barriers" runat="server"/></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_factors_otherPatient" Text="Other: " runat="server"/>
                <asp:TextBox ID="tbxEPatientRelatedOther" runat="server"></asp:TextBox>
            </td></tr>
        </table>
    </div>

    <div id="divERightPanel">
        <h5>Organizational / Administrative</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_alone" Text="Working Alone" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_info" Text="Inadequate Information" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_scheduling" Text="Inappropriate Scheduling" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_training" Text="Lack of Training / Education" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_appropriateEquip" Text="Lack of Appropriate Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_personal" Text="Lack of Personal Protection Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_safe" Text="Lack of Safe Work Procedures" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_perceived" Text="Perceived Time Constraints" runat="server"/></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_factors_otherOrganizational" Text="Other: " runat="server"/>
                <asp:TextBox ID="tbx_p2_factors_otherOrganizational" runat="server"></asp:TextBox>
            </td></tr>
        </table>

        <h5>Worker</h5>
        <table>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_inexperienced" Text="Inexperienced" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_communication" Text="Communication Difficulties" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_fatigued" Text="Fatigued" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_distracted" Text="Distracted" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_preexisting" Text="Pre-existing Injury" runat="server"/></td></tr>
            <tr><td><asp:CheckBox ID="cbx_p2_factors_sick" Text="Sick / Medicated" runat="server"/></td></tr>
            <tr><td>
                <asp:CheckBox ID="cbx_p2_factors_otherWorker" Text="Other: " runat="server"/>
                <asp:TextBox ID="tbx_p2_factors_otherWorker" runat="server"></asp:TextBox>
            </td></tr>
        </table>
    </div>
</asp:Panel>

<h3 id="hr3F"><asp:Image ID="imgExpandCollapseF" runat="server" /> F. Corrective Action <asp:Label ID="ExpandCollapseF" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlF" CssClass="panel" runat="server">
<table>
    <tr>
        <td>
            Person assigned to corrective action:
        </td>
        <td>
            <asp:TextBox ID="tbxPersonAssigned" runat="server"></asp:TextBox>
        </td>
        <td>
            Date (M/DY):
            <asp:TextBox ID="tbxDatePersonAssigned" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexDatePersonAssigned" runat="server" TargetControlID="tbxDatePersonAssigned" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td>
            Maintenance Requisition Submitted:
        </td>
        <td>
            <asp:RadioButtonList ID="rblMaintReqSubmitted" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Text="Yes" ></asp:ListItem>
                <asp:ListItem Text="No" ></asp:ListItem>
                <asp:ListItem Text="N/A" ></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td>
            Date (M/DY):
            <asp:TextBox ID="tbxDateMaintReqSubmitted" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexDateMaintReqSubmitted" runat="server" TargetControlID="tbxDateMaintReqSubmitted" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td>
            Corrective Action Communicated to Staff:
        </td>
        <td>
            <asp:RadioButtonList ID="rblCommToStaff" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Text="Yes" ></asp:ListItem>
                <asp:ListItem Text="No" ></asp:ListItem>
                <asp:ListItem Text="N/A" ></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td>
            Date (M/DY):
            <asp:TextBox ID="tbxDateCommToStaff" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexDateCommToStaff" runat="server" TargetControlID="tbxDateCommToStaff" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td>
            Any time loss subsequent to injury:
        </td>
        <td>
            <asp:RadioButtonList ID="rblTimeLoss" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Text="Yes" ></asp:ListItem>
                <asp:ListItem Text="No" ></asp:ListItem>
                <asp:ListItem Text="N/A" ></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td>
            Date (M/DY):
            <asp:TextBox ID="tbxDateTimeLoss" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexDateTimeLoss" runat="server" TargetControlID="tbxDateTimeLoss" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
</table>
</asp:Panel>

<h3 id="hr3G"><asp:Image ID="imgExpandCollapseG" runat="server" /> G. Relavant Corrective Actions and Follow Up <asp:Label ID="ExpandCollapseG" runat="server" Text=""></asp:Label></h3>    
<asp:Panel ID="pnlG" CssClass="panel" runat="server">
<p>Full descriptions and target completion dates for corrective actions are required.</p>
<table>
    <tr>
        <td>
            Written Safe Work Procedures Required / Updated:
            <br />
            <asp:TextBox ID="tbxWrittenReq" runat="server" CssClass="commentBoxReporting"></asp:TextBox>
        </td>
        <td>
            Target Completion Date (M/DY):
            <br />
            <asp:TextBox ID="tbxWrittenTargetDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexWrittenTargetDate" runat="server" TargetControlID="tbxWrittenTargetDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
            <br />
            Date completed (M/DY):
            <br />
            <asp:TextBox ID="tbxWrittenCompletedDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexWrittenCompletedDate" runat="server" TargetControlID="tbxWrittenCompletedDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td>
            Education or Training Required / Provided for Specific Task:
            <br />
            <asp:TextBox ID="tbxEducationReq" runat="server" CssClass="commentBoxReporting"></asp:TextBox>
        </td>
        <td>
            Target Completion Date (M/DY):
            <br />
            <asp:TextBox ID="tbxEducationTargetDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexEducationTargetDate" runat="server" TargetControlID="tbxEducationTargetDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
            <br />
            Date completed (M/DY):
            <br />
            <asp:TextBox ID="tbxEducationCompletedDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexEducationCompletedDate" runat="server" TargetControlID="tbxEducationCompletedDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td>
            
            Equipment - Repair / Replace / Purchase
            <br />
            <asp:TextBox ID="tbxEquipmentChange" runat="server" CssClass="commentBoxReporting"></asp:TextBox>
        </td>
        <td>
            Target Completion Date (M/DY):
            <br />
            <asp:TextBox ID="tbxEquipmentTargetDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexEquipmentTargetDate" runat="server" TargetControlID="tbxEquipmentTargetDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
            <br />
            Date completed (M/DY):
            <br />
            <asp:TextBox ID="tbxEquipmentCompletedDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexEquipmentCompletedDate" runat="server" TargetControlID="tbxEquipmentCompletedDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td>
            Environment - Change / Modify Workstation or subsitute / Eliminate Product:
            <br />
            <asp:TextBox ID="tbxEnvironmentChange" runat="server" CssClass="commentBoxReporting"></asp:TextBox>
        </td>
        <td>
            Target Completion Date (M/DY):
            <br />
            <asp:TextBox ID="tbxEnvironmentTargetDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexEnvironmentTargetDate" runat="server" TargetControlID="tbxEnvironmentTargetDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
            <br />
            Date completed(M/DY):
            <br />
            <asp:TextBox ID="tbxEnvironmentCompleteDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexEnvironmentCompleteDate" runat="server" TargetControlID="tbxEnvironmentCompleteDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td>
            Patient/Resident Related Incidents - Lift / Transfer Re-Accessed or Care Plan / ADL Card Updated:
            <br />
            <asp:TextBox ID="tbxPatientResidentRelated" runat="server" CssClass="commentBoxReporting"></asp:TextBox>
        </td>
        <td>
            Target Completion Date (M/DY):
            <br />
            <asp:TextBox ID="tbxPatientResidentTargetDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexPatientResidentTargetDate" runat="server" TargetControlID="tbxPatientResidentTargetDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
            <br />
            Date completed (M/DY):
            <br />
            <asp:TextBox ID="tbxPatientResidentCompleteDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexPatientResidentCompleteDate" runat="server" TargetControlID="tbxPatientResidentCompleteDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
</table>
</asp:Panel>

<h3 id="hr3H"><asp:Image ID="imgExpandCollapseH" runat="server" /> H. Managers Report <asp:Label ID="ExpandCollapseH" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlH" CssClass="panel" runat="server">
<table>
    <tr><td>Do you know of any previous pain/disability in the area of the worker's present injury? If YES, please explain.</td></tr>
    <tr><td><asp:TextBox ID="tbxMgrReportPreviousPain" runat="server" CssClass="commentBoxReporting"></asp:TextBox></td></tr>
    <tr><td>Do you have any objections to the claim being accepted? If YES, please explain.</td></tr>
    <tr><td><asp:TextBox ID="tbxMgrReportObjections" runat="server" CssClass="commentBoxReporting"></asp:TextBox></td></tr>
    <tr><td>Is alternative light duty or modified work available?</td></tr>
    <tr><td><asp:TextBox ID="tbxMgrReportAlt" runat="server" CssClass="commentBoxReporting"></asp:TextBox></td></tr>
    <tr>
        <td>
            Does the worker work a fixed shift rotation? If yes, please provide:
            <br />
            <table>
                <thead>
                    <tr>
                        <td></td>
                        <td>Sun</td>
                        <td>Mon</td>
                        <td>Tue</td>
                        <td>Wed</td>
                        <td>Thu</td>
                        <td>Fri</td>
                        <td>Sat</td>
                    </tr>
                </thead>
                <tr>
                    <td>Week1</td>
                    <td>
                        <asp:TextBox ID="tbxW1Sun" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW1Mon" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW1Tue" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW1Wed" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW1Thu" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW1Fri" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW1Sat" runat="server" Width="20px" />
                    </td>
                </tr>
                <tr>
                    <td>Week2</td>
                    <td>
                        <asp:TextBox ID="tbxW2Sun" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW2Mon" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW2Tue" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW2Wed" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW2Thu" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW2Fri" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbxW2Sat" runat="server" Width="20px" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>

</asp:Panel>
</div>
</asp:Content>