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
            <asp:RadioButtonList runat="server" ID="rblH&STrain" />
            <td>
                <asp:Label Text="Are staff encouraged to take H&S training" runat="server" ID="lblH&STrain" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoH&STrainYes" runat="server" GroupName="rblH&STrain" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoH&STrainNo" runat="server" GroupName="rblH&STrain"  />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoH&STrainNA" runat="server" GroupName="rblH&STrain"  />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentH&STrain"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblMSDS" />
            <td>
                <asp:Label Text="MSDS binder/computer station accessible & up to date" runat="server" ID="lblMSDS" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMSDSYes" runat="server" GroupName="rblMSDS" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMSDSNo" runat="server" GroupName="rblMSDS" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMSDSNA" runat="server" GroupName="rblMSDS" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentMSDS"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblEmergencyShower" />
            <td>
                <asp:Label Text="Emergency Shower available/accessible" runat="server" ID="lblEmergencyShower" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerYes" runat="server" GroupName="rblEmergencyShower" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerNo" runat="server" GroupName="rblEmergencyShower" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerNA" runat="server" GroupName="rblEmergencyShower" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEmergencyShower"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblEmergencyShowerTest" />
            <td>
                <asp:Label Text="Emergency Shower tested monthly (if located in section)" runat="server" ID="lblEmergencyShowerTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerTestYes" runat="server" GroupName="rblEmergencyShowerTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerTestNo" runat="server" GroupName="rblEmergencyShowerTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerTestNA" runat="server" GroupName="rblEmergencyShowerTest" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEmergencyShowerTest"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblEyewash" />
            <td>
                <asp:Label Text="Eyewash available/accessible" runat="server" ID="lblEyewash" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashYes" runat="server" GroupName="rblEyewash" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashNo" runat="server" GroupName="rblEyewash" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashNA" runat="server" GroupName="rblEyewash" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEyewash"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblEyewashTest" />
            <td>
                <asp:Label Text="Eyewash tested weekly if not sterile/sealed (& if in section)" runat="server" ID="lblEyewashTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashTestYes" runat="server" GroupName="rblEyewashTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashTestNo" runat="server" GroupName="rblEyewashTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashTestNA" runat="server" GroupName="rblEyewashTest" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEyewashTest"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblChemicalSpill" />
            <td>
                <asp:Label Text="Chemical spill kit accessible/stocked adequately" runat="server" ID="lblChemicalSpill" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoChemicalSpillYes" runat="server" GroupName="rblChemicalSpill" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoChemicalSpillNo" runat="server" GroupName="rblChemicalSpill" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoChemicalSpillNA" runat="server" GroupName="rblChemicalSpill" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentChemicalSpill"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList runat="server" ID="rblBiohazard" />
            <td>
                <asp:Label Text="Biohazard spill kit accessible/stocked adequately" runat="server" ID="lblBiohazard" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoBiohazardYes" runat="server" GroupName="rblBiohazard" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoBiohazardNo" runat="server" GroupName="rblBiohazard" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoBiohazardNA" runat="server" GroupName="rblBiohazard" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentBiohazard"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

</div>

</asp:Content>
