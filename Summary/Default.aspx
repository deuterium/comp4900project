<%@ Page Title="Summary" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Summary_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="false"
CollapseControlID="inspectionLookUp" ExpandControlID="inspectionLookUp" TargetControlID="pnlA"
ImageControlID="imgExpandCollapseInspectionLookUp" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>
Summary Page:

<h3 id="inspectionLookUp"><asp:Image ID="imgExpandCollapseInspectionLookUp" runat="server" /> Inspection Lookup:</h3>
    <asp:Panel ID="pnlA" CssClass="panel" runat="server">
    
        <table>
        <tr>
            <td>
                Department: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxLabDepartment"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvLabDepartment" runat="server" ErrorMessage="Please enter a Lab Department." 
                    ControlToValidate="tbxLabDepartment" validationgroup="vgrInspectionLookUp">
                </asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                Supervisor: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxLabSupervisor"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvLabSupervisor" runat="server" ErrorMessage="Please enter a Lab Supervisor." 
                    ControlToValidate="tbxLabSupervisor" validationgroup="vgrInspectionLookUp">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Room: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxLabRoom" />
                <asp:RequiredFieldValidator
                    ID="rfvLabRoom" runat="server" ErrorMessage="Please enter a Lab Room." 
                    ControlToValidate="tbxLabRoom" validationgroup="vgrInspectionLookUp">
                </asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                Inspectors: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxLabInspectors"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfvLabInspectors" runat="server" ErrorMessage="Please enter Lab Inspector." 
                    ControlToValidate="tbxLabInspectors" validationgroup="vgrInspectionLookUp">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Lab Manager:
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlLabLabManager"></asp:DropDownList>
                <asp:RequiredFieldValidator  
                 ID="rfvLabManger" runat="server" ErrorMessage="Please select a Lab Manger."
                 ControlToValidate="ddlLabLabManager" validationGroup="vgrInspectionLookUp"
                 InitialValue="Select A Lab Manger">  
        </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Date of Inspection: 
            </td>
            <td>
                <asp:TextBox ID="tbxLabInspectionDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="cexLabInspectionDate" runat="server" TargetControlID="tbxLabInspectionDate" Format="yyyy/MM/dd"></asp:CalendarExtender>
                <asp:RequiredFieldValidator
                    ID="rfvLabInspectionDate" runat="server" ErrorMessage="Please select a Lab Inspection Date." 
                    ControlToValidate="tbxLabInspectionDate" validationgroup="vgrInspectionLookUp">
                </asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                Date of Follow Up: 
            </td>
            <td>
                <asp:TextBox ID="tbxLabFollowupDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="cexLabFollowupDate" runat="server" TargetControlID="tbxLabFollowupDate" Format="yyyy/MM/dd"></asp:CalendarExtender>
                <asp:RequiredFieldValidator
                    ID="rfvLabFollowUpDate" runat="server" ErrorMessage="Please select a Lab Follow Up Date." 
                    ControlToValidate="tbxLabFollowupDate" validationgroup="vgrInspectionLookUp">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
        <td>
            <asp:Button ID="btnInspectionLookUp" ValidationGroup="vgrInspectionLookUp" runat="server" Text="Search" />
        </td>
        </tr>
    </table>
        <asp:ValidationSummary ID="vsuInspectionLookUp" ValidationGroup="vgrInspectionLookUp" runat="server" />
    </asp:Panel>
</asp:Content>
