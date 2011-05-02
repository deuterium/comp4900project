<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Lab.aspx.cs" Inherits="Inspections_Lab_Lab" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
</asp:Content>


<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>
<asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="true"
CollapseControlID="labA" ExpandControlID="labA" TargetControlID="pnlA">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="true"
CollapseControlID="labB" ExpandControlID="labB" TargetControlID="pnlB">
</asp:CollapsiblePanelExtender>

<div>
    <h3 id="labA">A. Department</h3>
    <asp:Panel ID="pnlA" CssClass="panel" runat="server">
    <div class="divline"></div>
    <br />

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
                Supervisor: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxSupervisor"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Room: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxRoom" />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                Inspectors: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxInspectors"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Lab Manager:
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlLabManager"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Date of Inspection: 
            </td>
            <td>
                //Calendar Goes Here//
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                Date of Follow Up: 
            </td>
            <td>
                //Calendar Goes Here//
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="labB">B. Emergency & Information Material</h3>
    <asp:Panel ID="pnlB" CssClass="panel" runat="server">
    <div class="divline"></div>
    <br />

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
            <td>
                <asp:Label Text="Fire evacuation route posted on exits in each section/floor" runat="server" ID="lblFireEvac" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoFireEvacYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoFireEvacNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoFireEvacNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentFireEvac"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Fire extinguisher in working condition" runat="server" ID="lblFireExtinguish" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoFireExtinguishYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoFireExtinguishNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoFireExtinguishNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentFireExtinguish"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Blood and Body Fluid protocol posted" runat="server" ID="lblBloodandBody" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoBloodandBodyYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoBloodandBodyNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoBloodandBodyNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentBloodandBody"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Injury on Duty Flow Chart posted" runat="server" ID="lblInjuryonDuty" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoInjuryonDutyYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoInjuryonDutyNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoInjuryonDutyNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentInjuryonDuty"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Emergency numbers posted" runat="server" ID="lblEmergencyNumber" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyNumberYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyNumberNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyNumberNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEmergencyNumber"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="MSDS binder/computer station accessible & up to date" runat="server" ID="lblMSDS" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMSDSYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMSDSNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoMSDSNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentMSDS"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Emergency Shower available/accessible" runat="server" ID="lblEmergencyShower" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEmergencyShower"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Emergency Shower tested monthly (if located in section)" runat="server" ID="lblEmergencyShowerTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerTestYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerTestNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEmergencyShowerTestNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEmergencyShowerTest"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Eyewash available/accessible" runat="server" ID="lblEyewash" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEyewash"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Eyewash tested weekly if not sterile/sealed (& if in section)" runat="server" ID="lblEyewashTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashTestYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashTestNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoEyewashTestNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentEyewashTest"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Chemical spill kit accessible/stocked adequately" runat="server" ID="lblChemicalSpill" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoChemicalSpillYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoChemicalSpillNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoChemicalSpillNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentChemicalSpill"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Biohazard spill kit accessible/stocked adequately" runat="server" ID="lblBiohazard" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoBiohazardYes" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoBiohazardNo" runat="server" />
            </td>
            <td class="tblYesNoNA">
                <asp:RadioButton ID="rdoBiohazardNA" runat="server" />
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxCommentBiohazard"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

</div>

</asp:Content>