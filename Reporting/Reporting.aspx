<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reporting.aspx.cs" Inherits="Reporting_Reporting" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
   
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
    </asp:ToolkitScriptManager>

<div>
<h3>A. Incident/Accident Information</h3>
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

<h3>B. Nature of Injury</h3>

Should I make a properties file or dynamically generate these controls based on the database??
<asp:CheckBoxList ID="cblNatureOfInjury" runat="server">
    <asp:ListItem ID="limNoInjury" Text="No Injury (Near Miss/ Unsafe Condition)" ></asp:ListItem>
    <asp:ListItem ID="limMusculoskeletal" Text="Musculoskeletal Injyry (Strain / Sprain)" ></asp:ListItem>
    <asp:ListItem Id="limBruse" Text="Bruise / Confusion" ></asp:ListItem>
    <asp:ListItem Id="limBurn" Text="Burn (Heat or Cold)" ></asp:ListItem>
</asp:CheckBoxList>

<h3>C. Accident Investigation</h3>

<h4>Activity</h4>
<asp:CheckBoxList ID="cblActivity" runat="server">
    <asp:ListItem ID="limActivityNoInjury" Text="No Injury" ></asp:ListItem>
</asp:CheckBoxList>

<h5>Patient Handling</h5>
<asp:CheckBoxList ID="cblActivityPatientHandling" runat="server">
    <asp:ListItem ID="limRepositioning" Text="Respositioning" ></asp:ListItem>
    <asp:ListItem ID="limTransferring" Text="Transferring (incl. to seclusion)" ></asp:ListItem>
    <asp:ListItem ID="limAssitedWalking" Text="Assisted Walking" ></asp:ListItem>
</asp:CheckBoxList>
<h5>Patient Handling Details</h5>
Equipment used at time of Injury:
<asp:CheckBoxList ID="cblPatientHandlingEquipmentUsed" runat="server">
    <asp:ListItem ID="limEquipmentCeilingLift" Text="Ceiling Lift" ></asp:ListItem>
    <asp:ListItem ID="limEquipmentFloorLift" Text="Floor Lift"></asp:ListItem>
    <asp:ListItem ID="limSitStandLift" Text="Sit-Stand Lift" ></asp:ListItem>
</asp:CheckBoxList>
Was adaquate assistance available?
<asp:CheckBoxList ID="cblPatientHandlingAssistanceAvailable" runat="server">
    <asp:ListItem ID="limAssitanceAvailableYes" Text="Yes" ></asp:ListItem>
    <asp:ListItem ID="limAssitanceAvailableNo" Text="No" ></asp:ListItem>
    <asp:ListItem ID="limAssitanceAvailableUnknown" Text="Unknown" ></asp:ListItem>
</asp:CheckBoxList>

<h3>D. Cause</h3>
<table>
    <tr>
        <td>
            
        </td>
        <td>
        
        </td>
    </tr>
</table>

<h3>E. Contributing Factors</h3>
<table>
    <tr>
        <td>
            
        </td>
        <td>
        
        </td>
    </tr>
</table>

<h3>F. Corrective Action</h3>
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
            <asp:CheckBoxList ID="cblMaintReqSubmitted" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem ID="limMaintReqYes" Text="Yes" ></asp:ListItem>
                <asp:ListItem ID="limMaintReqNo" Text="No" ></asp:ListItem>
                <asp:ListItem ID="limMaintReqNA" Text="N/A" ></asp:ListItem>
            </asp:CheckBoxList>
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
            <asp:CheckBoxList ID="cblCommToStaff" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem ID="limCommToStaffYes" Text="Yes" ></asp:ListItem>
                <asp:ListItem ID="limCommToStaffNo" Text="No" ></asp:ListItem>
                <asp:ListItem ID="limCommToStaffNA" Text="N/A" ></asp:ListItem>
            </asp:CheckBoxList>
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
            <asp:CheckBoxList ID="cblTimeLoss" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem ID="limTimeLossYes" Text="Yes" ></asp:ListItem>
                <asp:ListItem ID="limTimeLossNo" Text="No" ></asp:ListItem>
                <asp:ListItem ID="limTimeLossNA" Text="N/A" ></asp:ListItem>
            </asp:CheckBoxList>
        </td>
        <td>
            Date (M/DY):
            <asp:TextBox ID="tbxDateTimeLoss" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexDateTimeLoss" runat="server" TargetControlID="tbxDateTimeLoss" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
</table>

<h3>G. Relavant Corrective Actions and Follow Up</h3>    
<table>
    <tr>
        <td>
            <asp:CheckBox ID="cbxWrittenReq" runat="server" />
            Written Safe Work Procedures Required / Updated:
        </td>
        <td>
        
        </td>
    </tr>
    <tr>
        <td>
            <asp:CheckBox ID="cbxEducationReq" runat="server" />
            Education or Training Required / Provided for Specific Task:
        </td>
        <td>
        
        </td>
    </tr>
    <tr>
        <td>
            <asp:CheckBox ID="cbxEquipmentChange" runat="server" />
            Equipment - Repair / Replace / Purchase
        </td>
        <td>
        
        </td>
    </tr>
    <tr>
        <td>
            <asp:CheckBox ID="cbxEnvironmentChange" runat="server" />
            Environment - Change / Modify Workstation or subsitute / Eliminate Product:
        </td>
        <td>
        
        </td>
    </tr>
    <tr>
        <td>
            <asp:CheckBox ID="cbxPatientResidentRelated" runat="server" />
            Patient/Resident Related Incidents - Lift / Transfer Re-Accessed or Care Plan / ADL Card Updated:
        </td>
        <td>
            Target Completion Date (M/DY):
            <br />
            <asp:TextBox ID="tbxTargetCompletionDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexTargetCompletionDate" runat="server" TargetControlID="tbxTargetCompletionDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
            <br />
            Date completed (M/DY):
            <br />
            <asp:TextBox ID="tbxCompletionDate" runat="server"></asp:TextBox>
            <asp:CalendarExtender ID="cexCompletionDate" runat="server" TargetControlID="tbxCompletionDate" Format="yyyy/MM/dd" >
            </asp:CalendarExtender>
        </td>
    </tr>
    <tr>
        <td>
            
        </td>
        <td>
        
        </td>
    </tr>
</table>

<h3>H. Managers Report</h3>
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
</div>
</asp:Content>