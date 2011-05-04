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

</div>

</asp:Content>
