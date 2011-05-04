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

<div>

    <h3 id="workA">A. Inspection Information</h3>
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
                //Calendar Goes Here//
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workB">B. General Safety</h3>
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

    <h3 id="workC">C. Work Areas</h3>
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

    <h3 id="workD">D. Support and Structure</h3>
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

    <h3 id="workE">E. Electrical</h3>
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

    <h3 id="workF">E. Ventilation, Illumination, Noise</h3>
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

    <h3 id="workG">G. Work Practices Section</h3>
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

</div>

</asp:Content>
