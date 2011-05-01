﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reporting.aspx.cs" Inherits="Reporting_Reporting" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
   
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>
<asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="true"
CollapseControlID="hr3A" ExpandControlID="hr3A" TargetControlID="pnlA">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="true"
CollapseControlID="hr3B" ExpandControlID="hr3B" TargetControlID="pnlB">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeC" runat="server" Collapsed="true"
CollapseControlID="hr3C" ExpandControlID="hr3C" TargetControlID="pnlC">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeD" runat="server" Collapsed="true"
CollapseControlID="hr3D" ExpandControlID="hr3D" TargetControlID="pnlD">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeE" runat="server" Collapsed="true"
CollapseControlID="hr3E" ExpandControlID="hr3E" TargetControlID="pnlE">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeF" runat="server" Collapsed="true"
CollapseControlID="hr3F" ExpandControlID="hr3F" TargetControlID="pnlF">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeG" runat="server" Collapsed="true"
CollapseControlID="hr3G" ExpandControlID="hr3G" TargetControlID="pnlG">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeH" runat="server" Collapsed="true"
CollapseControlID="hr3H" ExpandControlID="hr3H" TargetControlID="pnlH">
</asp:CollapsiblePanelExtender>

<div>

<h3 id="hr3A">A. Incident/Accident Information</h3>
<asp:Panel ID="pnlA" runat="server">
    <table>
        <tr>
            <td>
                Date of Incident:
            </td>
            <td>
                <asp:TextBox ID="tbxDateOfIncident" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="cexDateOfIncident" runat="server" TargetControlID="tbxDateOfIncident" Format="yyyy/MM/dd" >
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td>
                Time of Incident:
            </td>
            <td>
              <asp:TextBox ID="tbxTimeOfIncident" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Time Reported:
            </td>
            <td>
                <asp:TextBox ID="tbxTimeReported" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Incident Description:
            </td>
            <td>
                <asp:TextBox ID="tbxIncidentDescription" runat="server" Height="100px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Witness 1:
            </td>
            <td>
                Name: <asp:TextBox ID="tbxWitness1Name" runat="server"></asp:TextBox>
                Phone: <asp:TextBox ID="tbxWitness1Phone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Witness 2:
            </td>
            <td>
                Name: <asp:TextBox ID="tbxWitness2Name" runat="server"></asp:TextBox>
                Phone: <asp:TextBox ID="tbxWitness2Phone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Action following the Incident:
            </td>
            <td>
                <asp:DropDownList ID="ddlActionFollowingIncident" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
</asp:Panel>

<h3 id="hr3B">B. Nature of Injury</h3>
<asp:Panel ID="pnlB" runat="server">
    <asp:CheckBoxList ID="cblNatureOfInjury" runat="server">
        <asp:ListItem Text="No Injury (Near Miss/ Unsafe Condition)" ></asp:ListItem>
        <asp:ListItem Text="Musculoskeletal Injyry (Strain / Sprain)" ></asp:ListItem>
        <asp:ListItem Text="Bruise / Confusion" ></asp:ListItem>
        <asp:ListItem Text="Burn (Heat or Cold)" ></asp:ListItem>
        <asp:ListItem Text="Cut / Scratch / Abrasion / Laceration / Puncture (Non BBF)" ></asp:ListItem>
        <asp:ListItem Text="Puncture Wound (BBF)" ></asp:ListItem>
        <asp:ListItem Text="Skin Irritation" ></asp:ListItem>
        <asp:ListItem Text="Skin / Mucous Membrane Exposure (incl. eye)" ></asp:ListItem>
    </asp:CheckBoxList>
</asp:Panel>

<h3 id="hr3C">C. Accident Investigation</h3>
<asp:Panel ID="pnlC" runat="server">
<h4>Activity</h4>
<asp:CheckBoxList ID="cblActivity" runat="server">
    <asp:ListItem Text="No Injury" ></asp:ListItem>
</asp:CheckBoxList>

<h5>Patient Handling</h5>
<asp:CheckBoxList ID="cblActivityPatientHandling" runat="server">
    <asp:ListItem Text="Respositioning" ></asp:ListItem>
    <asp:ListItem Text="Transferring (incl. to seclusion)" ></asp:ListItem>
    <asp:ListItem Text="Assisted Walking" ></asp:ListItem>
    <asp:ListItem Text="Assisted from Floor" ></asp:ListItem>
    <asp:ListItem Text="Preventing a fall" ></asp:ListItem>
    <asp:ListItem Text="Holding / Assisting during procedure (incl. patient restraint)" ></asp:ListItem>
    <asp:ListItem Text="Toileting" ></asp:ListItem>
</asp:CheckBoxList>
<h5>Patient Handling Details</h5>
Equipment used at time of Injury:
<asp:RadioButtonList ID="rblPatientHandlingEquipmentUsed" runat="server">
    <asp:ListItem Text="Ceiling Lift" ></asp:ListItem>
    <asp:ListItem Text="Sit-Stand Lift" ></asp:ListItem>
    <asp:ListItem Text="Floor Lift"></asp:ListItem>
    <asp:ListItem Text="Manual Lift" ></asp:ListItem>
    <asp:ListItem Text="Other" ></asp:ListItem>
</asp:RadioButtonList>
If other, please specifiy:
<asp:TextBox ID="tbxPatientHandlingOther" runat="server"></asp:TextBox>
<p>
Was adaquate assistance available?
<asp:RadioButtonList ID="rblPatientHandlingAssistanceAvailable" runat="server" RepeatDirection="Horizontal">
    <asp:ListItem Text="Yes" ></asp:ListItem>
    <asp:ListItem Text="No" ></asp:ListItem>
    <asp:ListItem Text="Unknown" ></asp:ListItem>
</asp:RadioButtonList>
</p>

<h5>Patient Care</h5>
<asp:CheckBoxList ID="cblPatientCare" runat="server">
    <asp:ListItem Text="Washing / Bathing" ></asp:ListItem>
    <asp:ListItem Text="Dressing" ></asp:ListItem>
    <asp:ListItem Text="Changing" ></asp:ListItem>
    <asp:ListItem Text="Feeding" ></asp:ListItem>
    <asp:ListItem Text="Prep / Dispensing Meds" ></asp:ListItem>
    <asp:ListItem Text="Dressing Changes" ></asp:ListItem>
</asp:CheckBoxList>
<asp:CheckBox ID="cbxOtherPatientCare" Text="Other Patient Care" runat="server" />
<asp:TextBox ID="tbxOtherPatientCare" runat="server"></asp:TextBox>

<h5>Sharps Handling</h5>
<asp:CheckBoxList ID="cblSharpsHandling" runat="server">
    <asp:ListItem Text="Re-capping" ></asp:ListItem>
    <asp:ListItem Text="Veno Puncture / Arterio Puncture" ></asp:ListItem>
    <asp:ListItem Text="Sharps Disposal" ></asp:ListItem>
    <asp:ListItem Text="Other Sharps / Instruments" ></asp:ListItem>
</asp:CheckBoxList>

<h5>Using Material / Equipment</h5>
<p>
Material / Equipment Description (stretchers, carts, boxes, etc.):
<asp:TextBox ID="tbxMaterialEquipDesc" runat="server"></asp:TextBox>
</p>
<p>
<asp:CheckBox ID="cbxLiftLower" Text="Lift / Lower" runat="server" />
<br /><asp:CheckBox ID="cbxPushPull" Text="Push / Pull" runat="server" />
<br /><asp:CheckBox ID="cbxCarry" Text="Carry" runat="server" />
<br /><asp:CheckBox ID="cbxOtherMaterialDesc" Text="Other Material Description: " runat="server" />
<asp:TextBox ID="tbxOtherMaterialDesc" runat="server"></asp:TextBox>
<br /><asp:CheckBox ID="cbxEquipOpDriving" Text="Equipment Operation - Driving" runat="server" />
<br /><asp:CheckBox ID="cbxEquipOpOther" Text="Equipment Operation - Other: " runat="server" />
<asp:TextBox ID="tbxEquipOpOther" runat="server"></asp:TextBox>
<br /><asp:CheckBox ID="cbxEquipOther" Text="Other Equipment Description: " runat="server" />
<asp:TextBox ID="tbxEquipOther" runat="server"></asp:TextBox>
<br /><asp:CheckBox ID="cbxEquipMaint" Text="Equipment Maintenance" runat="server" />
<br /><asp:CheckBox ID="cbxOfficeWorkComp" Text="Office Work - Computer" runat="server" />
<br /><asp:CheckBox ID="cbxOfficeWorkNoComp" Text="Office Work - Non Computer" runat="server" />
</p>

<h5>Other</h5>
<asp:CheckBoxList ID="cblUsingMaterialOther" runat="server">
    <asp:ListItem Text="Walking / Running" ></asp:ListItem>
    <asp:ListItem Text="Bending" ></asp:ListItem>
    <asp:ListItem Text="Reading" ></asp:ListItem>
    <asp:ListItem Text="Spill Cleanup" ></asp:ListItem>
    <asp:ListItem Text="Cleaning" ></asp:ListItem>
</asp:CheckBoxList>
<asp:CheckBox ID="cbxUsingMaterialOther" Text="Other: " runat="server" />
<asp:TextBox ID="tbxUsingMaterialOther" runat="server"></asp:TextBox>

</asp:Panel>

<h3 id="hr3D">D. Cause</h3>
<asp:Panel ID="pnlD" runat="server">
<h5>Bite</h5>
<asp:CheckBoxList ID="cblbite" runat="server">
    <asp:ListItem Text="Human" ></asp:ListItem>
    <asp:ListItem Text="Animal / Insect" ></asp:ListItem>
</asp:CheckBoxList>

<h5>BBF Exposure</h5>
<asp:CheckBoxList ID="cblBbfExposure" runat="server">
    <asp:ListItem Text="Needlestick" ></asp:ListItem>
    <asp:ListItem Text="Other Sharps" ></asp:ListItem>
    <asp:ListItem Text="Skin/ Mucous Membrane (Splash / Spit)" ></asp:ListItem>
</asp:CheckBoxList>

<h5>Ergonomic Factors</h5>
<asp:CheckBoxList ID="cblErgonomicFactors" runat="server">
    <asp:ListItem Text="Awkward Posture" ></asp:ListItem>
    <asp:ListItem Text="Static Posture" ></asp:ListItem>
    <asp:ListItem Text="Contact Stress" ></asp:ListItem>
    <asp:ListItem Text="Force" ></asp:ListItem>
    <asp:ListItem Text="Repetition" ></asp:ListItem>
</asp:CheckBoxList>

<h5>Other</h5>
<asp:CheckBoxList ID="cblOther" runat="server">
    <asp:ListItem Text="Motor Vehicle Accident" ></asp:ListItem>
    <asp:ListItem Text="Slip and Fall" ></asp:ListItem>
    <asp:ListItem Text="Workplace Agression" ></asp:ListItem>
    <asp:ListItem Text="Cause Undetermined" ></asp:ListItem>
    <asp:ListItem Text="Traumatic Event" ></asp:ListItem>
    <asp:ListItem Text="Caught In / Under / Between Equipment" ></asp:ListItem>
    <asp:ListItem Text="Hit / Struck By / Cut by Equipment" ></asp:ListItem>
</asp:CheckBoxList>
<asp:CheckBox ID="cbxDCasesOther" Text="Other:" runat="server" />
<asp:TextBox ID="tbxDCausesOther" runat="server"></asp:TextBox>

<h5>Details for Workplace Agression Incidents</h5>
Type of Incident:
<asp:CheckBoxList ID="cblAggressionIncidentType" runat="server">
    <asp:ListItem Text="Verbal - threats of violence, verbal assault" ></asp:ListItem>
    <asp:ListItem Text="Biting / Spitting" ></asp:ListItem>
    <asp:ListItem Text="Hitting / Kicking / Beating / Choking" ></asp:ListItem>
    <asp:ListItem Text="Squeezing / Punching / Scratching / Twisting" ></asp:ListItem>
    <asp:ListItem Text="Sexual assault" ></asp:ListItem>
</asp:CheckBoxList>
Incident Involved:
<asp:CheckBoxList ID="cblAggressionIncidentInvolved" runat="server">
    <asp:ListItem Text="Patient / Resident" ></asp:ListItem>
    <asp:ListItem Text="Family member of Patient / Resident" ></asp:ListItem>
    <asp:ListItem Text="Other member of Public" ></asp:ListItem>
    <asp:ListItem Text="Worker" ></asp:ListItem>
</asp:CheckBoxList>
<asp:CheckBox ID="cbxDAggressionIncidentOther" Text="Other:" runat="server" />
<asp:TextBox ID="tbxDAggressionIncidentOther" runat="server"></asp:TextBox>

<h5>Exposure</h5>
<p>
Checmical Name: <asp:TextBox ID="tbxExposureChemical" runat="server"></asp:TextBox>
</p>
<asp:CheckBoxList ID="cblExposure" runat="server">
    <asp:ListItem Text="Chemical Inhalation" ></asp:ListItem>
    <asp:ListItem Text="Chemical Ingestion" ></asp:ListItem>
    <asp:ListItem Text="Chemical Skin / Eye Contact" ></asp:ListItem>
    <asp:ListItem Text="Latex" ></asp:ListItem>
    <asp:ListItem Text="Dust / Particulate" ></asp:ListItem>
    <asp:ListItem Text="Communicable Diseases" ></asp:ListItem>
    <asp:ListItem Text="Temperature Extremes" ></asp:ListItem>
    <asp:ListItem Text="Noise" ></asp:ListItem>
    <asp:ListItem Text="Radiation" ></asp:ListItem>
    <asp:ListItem Text="Electricity" ></asp:ListItem>
    <asp:ListItem Text="Indoor Air Quality" ></asp:ListItem>
</asp:CheckBoxList>

</asp:Panel>

<h3 id="hr3E">E. Contributing Factors</h3>
<asp:Panel ID="pnlE" runat="server">
<h5>Equipment / Device</h5>
<asp:CheckBoxList ID="cblEquipmentDevice" runat="server">
    <asp:ListItem Text="Malfunctioning" ></asp:ListItem>
    <asp:ListItem Text="Improper Use" ></asp:ListItem>
    <asp:ListItem Text="Improper / Inadequate signage" ></asp:ListItem>
    <asp:ListItem Text="Not Available at Point of Use" ></asp:ListItem>
    <asp:ListItem Text="Poor Design" ></asp:ListItem>
</asp:CheckBoxList>
<asp:CheckBox ID="cbxEEquipOther" Text="Other, specifiy: " runat="server" />
<asp:TextBox ID="tbxEEquipOther" runat="server"></asp:TextBox>

<h5>Environment</h5>
<asp:CheckBoxList ID="cblEnvironment" runat="server">
    <asp:ListItem Text="Temperature" ></asp:ListItem>
    <asp:ListItem Text="Workplace" ></asp:ListItem>
    <asp:ListItem Text="Layout / Design" ></asp:ListItem>
    <asp:ListItem Text="Limited Workspace" ></asp:ListItem>
    <asp:ListItem Text="Floor Slippery / Uneven" ></asp:ListItem>
    <asp:ListItem Text="Lighting Inadequate" ></asp:ListItem>
    <asp:ListItem Text="Exessive Noise" ></asp:ListItem>
    <asp:ListItem Text="Ventilation Inadequate" ></asp:ListItem>
    <asp:ListItem Text="Improper Storage" ></asp:ListItem>
</asp:CheckBoxList>
<asp:CheckBox ID="cbxEEnviroOther" Text="Other, specifiy: " runat="server" />
<asp:TextBox ID="tbxEEnviroOther" runat="server"></asp:TextBox>

<h5>Work Practice</h5>
<asp:CheckBoxList ID="cblWorkPractice" runat="server">
    <asp:ListItem Text="Improper Assessment of Client / Load" ></asp:ListItem>
    <asp:ListItem Text="Did Not Follow Appropriate Procedure" ></asp:ListItem>
    <asp:ListItem Text="Did Not Use Designated / Appropriate Equipment" ></asp:ListItem>
    <asp:ListItem Text="Conduct" ></asp:ListItem>
    <asp:ListItem Text="Task Performed for extended periods" ></asp:ListItem>
    <asp:ListItem Text="Communication" ></asp:ListItem>
    <asp:ListItem Text="Unaccustomed" ></asp:ListItem>
</asp:CheckBoxList>
<asp:CheckBox ID="cbxEWorkPracticeOther" Text="Other, specifiy: " runat="server" />
<asp:TextBox ID="tbxEWorkPracticeOther" runat="server"></asp:TextBox>

<h5>Patient Related Factors</h5>
<asp:CheckBoxList ID="cblPatientRelated" runat="server">
    <asp:ListItem Text="Unable to Follow Directions" ></asp:ListItem>
    <asp:ListItem Text="Inconsistent Weight Bearing" ></asp:ListItem>
    <asp:ListItem Text="Patient Aggressive" ></asp:ListItem>
    <asp:ListItem Text="Patient Resistive" ></asp:ListItem>
    <asp:ListItem Text="Made Unexpected Movement" ></asp:ListItem>
    <asp:ListItem Text="Confused / Dementia" ></asp:ListItem>
    <asp:ListItem Text="Under Influence of Drugs / Alcohol" ></asp:ListItem>
    <asp:ListItem Text="Language Barriers" ></asp:ListItem>
</asp:CheckBoxList>
<asp:CheckBox ID="cbxEPatientRelatedOther" Text="Other, specifiy: " runat="server" />
<asp:TextBox ID="tbxEPatientRelatedOther" runat="server"></asp:TextBox>

<h5>Organizational / Administrative</h5>
<asp:CheckBoxList ID="cblOrganAdmin" runat="server">
    <asp:ListItem Text="Working Alone" ></asp:ListItem>
    <asp:ListItem Text="Inadequate Information" ></asp:ListItem>
    <asp:ListItem Text="Inappropriate Scheduling" ></asp:ListItem>
    <asp:ListItem Text="Lack of Training / Education" ></asp:ListItem>
    <asp:ListItem Text="Lack of Appropriate Equipment" ></asp:ListItem>
    <asp:ListItem Text="Lack of Personal Protection Equipment" ></asp:ListItem>
    <asp:ListItem Text="Lack of Safe Work Procedures" ></asp:ListItem>
    <asp:ListItem Text="Perceived Time Constraints" ></asp:ListItem>
</asp:CheckBoxList>
<asp:CheckBox ID="cbxEOrganAdminOther" Text="Other, specifiy: " runat="server" />
<asp:TextBox ID="tbxEOrganAdminOther" runat="server"></asp:TextBox>

<h5>Worker</h5>
<asp:CheckBoxList ID="cblWorker" runat="server">
    <asp:ListItem Text="Inexperienced" ></asp:ListItem>
    <asp:ListItem Text="Communication Difficulties" ></asp:ListItem>
    <asp:ListItem Text="Fatigued" ></asp:ListItem>
    <asp:ListItem Text="Distracted" ></asp:ListItem>
    <asp:ListItem Text="Pre-existing Injury" ></asp:ListItem>
    <asp:ListItem Text="Sick / Medicated" ></asp:ListItem>
</asp:CheckBoxList>
<asp:CheckBox ID="cbxEWorkerOther" Text="Other, specifiy: " runat="server" />
<asp:TextBox ID="tbxEWorkerOther" runat="server"></asp:TextBox>

</asp:Panel>

<h3 id="hr3F">F. Corrective Action</h3>
<asp:Panel ID="pnlF" runat="server">
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

<h3 id="hr3G">G. Relavant Corrective Actions and Follow Up</h3>    
<asp:Panel ID="pnlG" runat="server">
Full descriptions and target completion dates for corrective actions are required.
<table>
    <tr>
        <td>
            <asp:CheckBox ID="cbxWrittenReq" runat="server" />
            Written Safe Work Procedures Required / Updated:
            <br />
            <asp:TextBox ID="tbxWrittenReq" runat="server" Height="100px"></asp:TextBox>
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
            <asp:CheckBox ID="cbxEducationReq" runat="server" />
            Education or Training Required / Provided for Specific Task:
            <br />
            <asp:TextBox ID="tbxEducationReq" runat="server" Height="100px"></asp:TextBox>
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
            <asp:CheckBox ID="cbxEquipmentChange" runat="server" />
            Equipment - Repair / Replace / Purchase
            <br />
            <asp:TextBox ID="tbxEquipmentChange" runat="server" Height="100px"></asp:TextBox>
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
            <asp:CheckBox ID="cbxEnvironmentChange" runat="server" />
            Environment - Change / Modify Workstation or subsitute / Eliminate Product:
            <br />
            <asp:TextBox ID="tbxEnvironmentChange" runat="server" Height="100px"></asp:TextBox>
        </td>
        <td>
            Target Completion Date (M/DY):
            <br />
            <asp:TextBox ID="tbxEnvironmentTargetDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexEnvironmentTargetDate" runat="server" TargetControlID="tbxEnvironmentTargetDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
            <br />
            Date completed (M/DY):
            <br />
            <asp:TextBox ID="tbxEnvironmentCompleteDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexEnvironmentCompleteDate" runat="server" TargetControlID="tbxEnvironmentCompleteDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td>
            <asp:CheckBox ID="cbxPatientResidentRelated" runat="server" />
            Patient/Resident Related Incidents - Lift / Transfer Re-Accessed or Care Plan / ADL Card Updated:
            <br />
            <asp:TextBox ID="tbxPatientResidentRelated" runat="server" Height="100px"></asp:TextBox>
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

<h3 id="hr3H">H. Managers Report</h3>
<asp:Panel ID="pnlH" runat="server">
<table>
    <tr>
        <td>
            Do you know of any previous pain or dsiability in the area of the worker's present injury? If YES, please explain.
        </td>
        <td>
        
        </td>
    </tr>
    <tr>
        <td>
            Do you have any objections to the claim being accepted? If YES, please explain.
        </td>
        <td>
        
        </td>
    </tr>
    <tr>
        <td>
            Is alternative light duty or modified work available?
        </td>
        <td>
            Y/N
        </td>
    </tr>
    <tr>
        <td>
            Does the worker work a fixed shift rotation?
        </td>
        <td>
        
        </td>
    </tr>
    <tr>
        <td>
            If yes, please provide:   
        </td>
        <td>
            (TABLE)
        </td>
    </tr>
</table>
</asp:Panel>
</div>
</asp:Content>