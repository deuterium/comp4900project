<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Office.aspx.cs" Inherits="Inspections_Office_Office" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head"></asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server"></asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="true"
CollapseControlID="workA" ExpandControlID="workA" TargetControlID="pnlA">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="true"
CollapseControlID="workB" ExpandControlID="workB" TargetControlID="pnlB">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeC" runat="server" Collapsed="true"
CollapseControlID="workC" ExpandControlID="workC" TargetControlID="pnlC">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeD" runat="server" Collapsed="true"
CollapseControlID="workD" ExpandControlID="workD" TargetControlID="pnlD">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeE" runat="server" Collapsed="true"
CollapseControlID="workE" ExpandControlID="workE" TargetControlID="pnlE">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeF" runat="server" Collapsed="true"
CollapseControlID="workF" ExpandControlID="workF" TargetControlID="pnlF">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeG" runat="server" Collapsed="true"
CollapseControlID="workG" ExpandControlID="workG" TargetControlID="pnlG">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeH" runat="server" Collapsed="true"
CollapseControlID="workH" ExpandControlID="workH" TargetControlID="pnlH">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeI" runat="server" Collapsed="true"
CollapseControlID="workI" ExpandControlID="workI" TargetControlID="pnlI">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeJ" runat="server" Collapsed="true"
CollapseControlID="workJ" ExpandControlID="workJ" TargetControlID="pnlJ">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeK" runat="server" Collapsed="true"
CollapseControlID="workK" ExpandControlID="workK" TargetControlID="pnlK">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeL" runat="server" Collapsed="true"
CollapseControlID="workL" ExpandControlID="workL" TargetControlID="pnlL">
</asp:CollapsiblePanelExtender>

<div>

    <h3 id="workA">Inspection Information</h3>
    <asp:Panel ID="pnlA" CssClass="panel" runat="server">
    <table>
        <tr>
            <td>
                Department: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxDepartment"></asp:TextBox>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                Inspector(s): 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxSupervisor"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Area(s) Inspected: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxRoom" />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
        </tr>
        <tr>
            <td>
                Date of Inspection: 
            </td>
            <td>
                <asp:TextBox ID="tbxOfficeInspectionDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="cexOfficeInspectionDate" runat="server" TargetControlID="tbxOfficeInspectionDate" Format="yyyy/MM/dd" ></asp:CalendarExtender>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workB">1. General Safety</h3>
    <asp:Panel ID="pnlB" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblWorkForm" />
            <td>
                <asp:Label Text="Are worker incident/injury forms available / do staff know when to use them" runat="server" ID="lblWorkForm" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoWorkFormYes" runat="server" GroupName="rblWorkForm" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoWorkFormNo" runat="server" GroupName="rblWorkForm" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoWorkFormNA" runat="server" GroupName="rblWorkForm" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentWorkForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblNewWorkHaz" />
            <td>
                <asp:Label Text="Are new employees informed of work hazards" runat="server" ID="lblNewWorkHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoNewWorkHazYes" runat="server" GroupName="rblNewWorkHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoNewWorkHazNo" runat="server" GroupName="rblNewWorkHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoNewWorkHazNA" runat="server" GroupName="rblNewWorkHaz" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentNewWorkHaz"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblConFirstA" />
            <td>
                <asp:Label Text="Do staff know how to contact first aid" runat="server" ID="lblConFirstA" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoConFirstAYes" runat="server" GroupName="rblConFirstA" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoConFirstANo" runat="server" GroupName="rblConFirstA" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoConFirstANA" runat="server" GroupName="rblConFirstA" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentConFirstA"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblSafeHealth" />
            <td>
                <asp:Label Text="Is safety and health training provided" runat="server" ID="lblSafeHealth" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSafeHealthYes" runat="server" GroupName="rblSafeHealth" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSafeHealthNo" runat="server" GroupName="rblSafeHealth" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSafeHealthNA" runat="server" GroupName="rblSafeHealth" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentSafeHealth"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblHSTrain" />
            <td>
                <asp:Label Text="Are staff encouraged to take H&S training" runat="server" ID="lblHSTrain" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHSTrainYes" runat="server" GroupName="rblHSTrain" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHSTrainNo" runat="server" GroupName="rblHSTrain"  />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHSTrainNA" runat="server" GroupName="rblHSTrain"  />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentHSTrain"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblExitSignWork" />
            <td>
                <asp:Label Text="Are all exit signs working" runat="server" ID="lblExitSignWork" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExitSignWorkYes" runat="server" GroupName="rblExitSignWork" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExitSignWorkNo" runat="server" GroupName="rblExitSignWork" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExitSignWorkNA" runat="server" GroupName="rblExitSignWork" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentExitSignWork"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblExitClear" />
            <td>
                <asp:Label Text="Are fire exits kept clear" runat="server" ID="lblExitClear" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExitClearYes" runat="server" GroupName="rblExitClear" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExitClearNo" runat="server" GroupName="rblExitClear" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExitClearNA" runat="server" GroupName="rblExitClear" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentExitClear"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblExtinguishDate" />
            <td>
                <asp:Label Text="Are fire extinguishers inspected and up to date" runat="server" ID="lblExtinguishDate" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExtinguishDateYes" runat="server" GroupName="rblExtinguishDate" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExtinguishDateNo" runat="server" GroupName="rblExtinguishDate" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExtinguishDateNA" runat="server" GroupName="rblExtinguishDate" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentExtinguishDate"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblEmProcFloor" />
            <td>
                <asp:Label Text="Do emergency procedures/floor plans exist" runat="server" ID="lblEmProcFloor" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmProcFloorYes" runat="server" GroupName="rblEmProcFloor" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmProcFloorNo" runat="server" GroupName="rblEmProcFloor" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmProcFloorNA" runat="server" GroupName="rblEmProcFloor" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEmProcFloor"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workC">2. Work Areas</h3>
    <asp:Panel ID="pnlC" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblSpace" />
            <td>
                <asp:Label Text="Is adequate space provided to work safely" runat="server" ID="lblSpace" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSpaceYes" runat="server" GroupName="rblSpace" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSpaceNo" runat="server" GroupName="rblSpace" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSpaceNA" runat="server" GroupName="rblSpace" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tdbCommentSpace"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblGlareReflect" />
            <td>
                <asp:Label Text="Is work area free of glare and reflection" runat="server" ID="lblGlareReflect" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoGlareReflectYes" runat="server" GroupName="rblGlareReflect" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoGlareReflectNo" runat="server" GroupName="rblGlareReflect" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoGlareReflectNA" runat="server" GroupName="rblGlareReflect" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentGlareReflect"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblChairs" />
            <td>
                <asp:Label Text="Are appropriate chairs available (5 castors, adjustments etc)" runat="server" ID="lblChairs" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoChairsYes" runat="server" GroupName="rblChairs" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoChairsNo" runat="server" GroupName="rblChairs" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoChairsNA" runat="server" GroupName="rblChairs" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentChairs"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblHousekeep" />
            <td>
                <asp:Label Text="Is area free of clutter (housekeeping)" runat="server" ID="lblHousekeep" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHousekeepYes" runat="server" GroupName="rblHousekeep" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHousekeepNo" runat="server" GroupName="rblHousekeep" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHousekeepNA" runat="server" GroupName="rblHousekeep" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentHousekeep"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblOverstack" />
            <td>
                <asp:Label Text="Are shelves kept free of overstacking" runat="server" ID="lblOverstack" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOverstackYes" runat="server" GroupName="rblOverstack" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOverstackNo" runat="server" GroupName="rblOverstack"  />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOverstackNA" runat="server" GroupName="rblOverstack"  />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentOverstack"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblPosture" />
            <td>
                <asp:Label Text="Are working surfaces at appropriate heights to limit posture concerns" runat="server" ID="lblPosture" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPostureYes" runat="server" GroupName="rblPosture" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPostureNo" runat="server" GroupName="rblPosture" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPostureNA" runat="server" GroupName="rblPosture" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentPosture"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workD">3. Support and Structure</h3>
    <asp:Panel ID="pnlD" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblLevel" />
            <td>
                <asp:Label Text="Are surfaces level and even" runat="server" ID="lblLevel" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoLevelYes" runat="server" GroupName="rblLevel" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoLevelNo" runat="server" GroupName="rblLevel" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoLevelNA" runat="server" GroupName="rblLevel" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentLevel"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblTripSlipFall" />
            <td>
                <asp:Label Text="Is area free of hazards that may cause trips, slips and falls" runat="server" ID="lblTripSlipFall" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoTripSlipFallYes" runat="server" GroupName="rblTripSlipFall" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoTripSlipFallNo" runat="server" GroupName="rblTripSlipFall" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoTripSlipFallNA" runat="server" GroupName="rblTripSlipFall" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentTripSlipFall"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblSlipRes" />
            <td>
                <asp:Label Text="Are surfaces slip resistant where necessary" runat="server" ID="lblSlipRes" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSlipResYes" runat="server" GroupName="rblSlipRes" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSlipResNo" runat="server" GroupName="rblSlipRes" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSlipResNA" runat="server" GroupName="rblSlipRes" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentSlipRes"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblSteps" />
            <td>
                <asp:Label Text="Are steps in good condition" runat="server" ID="lblSteps" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoStepsYes" runat="server" GroupName="rblSteps" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoStepsNo" runat="server" GroupName="rblSteps" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoStepsNA" runat="server" GroupName="rblSteps" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentSteps"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workE">4. Electrical</h3>
    <asp:Panel ID="pnlE" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblSwitchPanel" />
            <td>
                <asp:Label Text="Are switch panels free of clutter and accessible" runat="server" ID="lblSwitchPanel" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSwitchPanelYes" runat="server" GroupName="rblSwitchPanel" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSwitchPanelNo" runat="server" GroupName="rblSwitchPanel" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSwitchPanelNA" runat="server" GroupName="rblSwitchPanel" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentSwitchPanel"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblCordPlug" />
            <td>
                <asp:Label Text="Are cords and plugs in good condition" runat="server" ID="lblCordPlug" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoCordPlugYes" runat="server" GroupName="rblCordPlug" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoCordPlugNo" runat="server" GroupName="rblCordPlug" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoCordPlugNA" runat="server" GroupName="rblCordPlug" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentCordPlug"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblOverload" />
            <td>
                <asp:Label Text="Are circuits free of overload" runat="server" ID="lblOverload" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOverloadYes" runat="server" GroupName="rblOverload" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOverloadNo" runat="server" GroupName="rblOverload" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOverloadNA" runat="server" GroupName="rblOverload" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentOverload"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblTripCord" />
            <td>
                <asp:Label Text="Are cords out of the way as not to contribute to tripping hazards" runat="server" ID="lblTripCord" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoTripCordYes" runat="server" GroupName="rblTripCord" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoTripCordNo" runat="server" GroupName="rblTripCord" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoTripCordNA" runat="server" GroupName="rblTripCord" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentTripCord"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workF">5. Ventilation, Illumination, Noise</h3>
    <asp:Panel ID="pnlF" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblVent" />
            <td>
                <asp:Label Text="Does there appear to be adequate ventilation (may have to ask staff to find out about complaints)" runat="server" ID="lblVent" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoVentYes" runat="server" GroupName="rblVent" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoVentNo" runat="server" GroupName="rblVent" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoVentNA" runat="server" GroupName="rblVent" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentVent"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblNoise" />
            <td>
                <asp:Label Text="Is the workplace free of excessive noise" runat="server" ID="lblNoise" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoNoiseYes" runat="server" GroupName="rblNoise" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoNoiseNo" runat="server" GroupName="rblNoise" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoNoiseNA" runat="server" GroupName="rblNoise" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentNoise"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblLighting" />
            <td>
                <asp:Label Text="Is there adequate lighting (overhead or task)" runat="server" ID="lblLighting" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoLightingYes" runat="server" GroupName="rblLighting" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoLightingNo" runat="server" GroupName="rblLighting" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoLightingNA" runat="server" GroupName="rblLighting" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentLighting"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workG">6. Work Practices Section</h3>
    <asp:Panel ID="pnlG" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblSafeProc" />
            <td>
                <asp:Label Text="Are safety procedures in place and known to staff" runat="server" ID="lblSafeProc" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSafeProcYes" runat="server" GroupName="rblSafeProc" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSafeProcNo" runat="server" GroupName="rblSafeProc" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSafeProcNA" runat="server" GroupName="rblSafeProc" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentSafeProc"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblDocs" />
            <td>
                <asp:Label Text="Are procedures documented" runat="server" ID="lblDocs" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoDocsYes" runat="server" GroupName="rblDocs" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoDocsNo" runat="server" GroupName="rblDocs" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoDocsNA" runat="server" GroupName="rblDocs" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentDocs"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblConcern" />
            <td>
                <asp:Label Text="Do staff know how to report concerns" runat="server" ID="lblConcern" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoConcernYes" runat="server" GroupName="rblConcern" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoConcernNo" runat="server" GroupName="rblConcern" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoConcernNA" runat="server" GroupName="rblConcern" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentConcern"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workH">7. Personal Protective Equipment</h3>
    <asp:Panel ID="pnlH" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblPersonEquipReq" />
            <td>
                <asp:Label Text="Is personal protective equipment required for any specific work" runat="server" ID="lblPersonEquipReq" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPersonEquipReqYes" runat="server" GroupName="rblPersonEquipReq" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPersonEquipReqNo" runat="server" GroupName="rblPersonEquipReq" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPersonEquipReqNA" runat="server" GroupName="rblPersonEquipReq" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentPersonEquipReq"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblEquipProp" />
            <td>
                <asp:Label Text="Do staff know how to use it properly and have been trained where appropriate (E.G. respirator fit test)" runat="server" ID="lblEquipProp" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEquipPropYes" runat="server" GroupName="rblEquipProp" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEquipPropNo" runat="server" GroupName="rblEquipProp" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEquipPropNA" runat="server" GroupName="rblEquipProp" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEquipProp"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblPPE" />
            <td>
                <asp:Label Text="Is it available, or do they know how to access PPE" runat="server" ID="lblPPE" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPPEYes" runat="server" GroupName="rblPPE" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPPENo" runat="server" GroupName="rblPPE" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPPENA" runat="server" GroupName="rblPPE" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentPPE"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workI">8. Strain, Sprain, Overexertion</h3>
    <asp:Panel ID="pnlI" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblLiftTech" />
            <td>
                <asp:Label Text="Are staff trained in proper lift techniques" runat="server" ID="lblLiftTech" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoLiftTechYes" runat="server" GroupName="rblLiftTech" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoLiftTechNo" runat="server" GroupName="rblLiftTech" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoLiftTechNA" runat="server" GroupName="rblLiftTech" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentLiftTech"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblPoorPosture" />
            <td>
                <asp:Label Text="Are workstations set up to reduce poor posture" runat="server" ID="lblPoorPosture" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPoorPostureYes" runat="server" GroupName="rblPoorPosture" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPoorPostureNo" runat="server" GroupName="rblPoorPosture" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoPoorPostureNA" runat="server" GroupName="rblPoorPosture" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentPoorPosture"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblHandle" />
            <td>
                <asp:Label Text="Are staff aware of safe handling procedures" runat="server" ID="lblHandle" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHandleYes" runat="server" GroupName="rblHandle" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHandleNo" runat="server" GroupName="rblHandle" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHandleNA" runat="server" GroupName="rblHandle" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentHandle"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblHandleProc" />
            <td>
                <asp:Label Text="Do staff know where to find safe handling procedures" runat="server" ID="lblHandleProc" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHandleProcYes" runat="server" GroupName="rblHandleProc" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHandleProcNo" runat="server" GroupName="rblHandleProc" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoHandleProcNA" runat="server" GroupName="rblHandleProc" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentHandleProc"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workJ">9. WHMIS / Hazardous Materials</h3>
    <asp:Panel ID="pnlJ" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblMSDSandOHSAH" />
            <td>
                <asp:Label Text="Are Material Safety Data Sheets (MSDS) accessible for staff (via a binder or on-line link to OHSAH)" runat="server" ID="lblMSDSandOHSAH" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMSDSandOHSAHYes" runat="server" GroupName="rblMSDSandOHSAH" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMSDSandOHSAHNo" runat="server" GroupName="rblMSDSandOHSAH" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMSDSandOHSAHNA" runat="server" GroupName="rblMSDSandOHSAH" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentMSDSandOHSAH"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblWHMISTrain" />
            <td>
                <asp:Label Text="Have staff who work with hazardous products had WHMIS training" runat="server" ID="lblWHMISTrain" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoWHMISTrainYes" runat="server" GroupName="rblWHMISTrain" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoWHMISTrainNo" runat="server" GroupName="rblWHMISTrain" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoWHMISTrainNA" runat="server" GroupName="rblWHMISTrain" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentWHMISTrain"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblFourQuestions" />
            <td>
                <asp:Label Text="Worker can answer the following four questions: 1. What are the hazards of the products you are using? 2. How do you protect yourself from the hazards of these products? 3. What do you do in the event of an emergency? 4. Where can additional information be found?" runat="server" ID="lblFourQuestions" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoFourQuestionsYes" runat="server" GroupName="rblFourQuestions" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoFourQuestionsNo" runat="server" GroupName="rblFourQuestions" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoFourQuestionsNA" runat="server" GroupName="rblFourQuestions" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentFourQuestions"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblOnLineTrain" />
            <td>
                <asp:Label Text="Do staff know how to access the on-line training module" runat="server" ID="lblOnLineTrain" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOnLineTrainYes" runat="server" GroupName="rblOnLineTrain" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOnLineTrainNo" runat="server" GroupName="rblOnLineTrain" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOnLineTrainNA" runat="server" GroupName="rblOnLineTrain" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentsOnLineTrain"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblSpill" />
            <td>
                <asp:Label Text="Do staff know what to do in the event of a spill" runat="server" ID="lblSpill" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSpillYes" runat="server" GroupName="rblSpill" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSpillNo" runat="server" GroupName="rblSpill" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoSpillNA" runat="server" GroupName="rblSpill" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentSpill"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workK">10. Fire Safety and Emergency Response</h3>
    <asp:Panel ID="pnlK" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblEvacAlarm" />
            <td>
                <asp:Label Text="Do staff know what to do in the event of an evacuation alarm" runat="server" ID="lblEvacAlarm" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEvacAlarmYes" runat="server" GroupName="rblEvacAlarm" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEvacAlarmNo" runat="server" GroupName="rblEvacAlarm" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEvacAlarmNA" runat="server" GroupName="rblEvacAlarm" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEvacAlarm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblMuster" />
            <td>
                <asp:Label Text="Do staff know where the muster station is in the event of an evacuation" runat="server" ID="lblMuster" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMusterYes" runat="server" GroupName="rblMuster" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMusterNo" runat="server" GroupName="rblMuster" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMusterNA" runat="server" GroupName="rblMuster" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentMuster"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblWarden" />
            <td>
                <asp:Label Text="Are there designated fire wardens and have they had appropriate training" runat="server" ID="lblWarden" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoWardenYes" runat="server" GroupName="rblWarden" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoWardenNo" runat="server" GroupName="rblWarden" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoWardenNA" runat="server" GroupName="rblWarden" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentWarden"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblExtinguishWork" />
            <td>
                <asp:Label Text="Are fire extinguishers in working condition" runat="server" ID="lblExtinguishWork" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExtinguishWorkYes" runat="server" GroupName="rblExtinguishWork" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExtinguishWorkNo" runat="server" GroupName="rblExtinguishWork" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoExtinguishWorkNA" runat="server" GroupName="rblExtinguishWork" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentExtinguishWork"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblOfficeClear" />
            <td>
                <asp:Label Text="Are corridors outside the office area clear and free of storage" runat="server" ID="lblOfficeClear" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOfficeClearYes" runat="server" GroupName="rblOfficeClear" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOfficeClearNo" runat="server" GroupName="rblOfficeClear" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoOfficeClearNA" runat="server" GroupName="rblOfficeClear" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentOfficeClear"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workL">11. Comments</h3>
    <asp:Panel ID="pnlL" CssClass="panel" runat="server">
        <asp:TextBox TextMode="MultiLine" Wrap="true" Width="795px" Height="200px" ID="tbxCommentOfficeComments" runat="server"></asp:TextBox>
    </asp:Panel>

</div>

</asp:Content>
