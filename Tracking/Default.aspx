<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Tracking_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeReportInfo" runat="server" Collapsed="false"
CollapseControlID="hr3ReportInfo" ExpandControlID="hr3ReportInfo" TargetControlID="pnlReportInfo">
</asp:CollapsiblePanelExtender>

    <div id="divContent">
        <div id="divReportInfo">
            <h3 id="hr3ReportInfo">Header Info:</h3>
            <asp:Panel ID="pnlReportInfo" CssClass="panel" runat="server">
            <table id="tblReportInfoForm">
                <tr>
                    <td>
                        Id:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxId" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Position:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPositions" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                       Room:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxRoom" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Last name:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxLastName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Employer:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEmployers" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        Supervisor:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxSupervisor" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        First name:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxFirstName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Department:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepartments" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        Start date:
                    </td>
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
                    <td>
                        End date: 
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEndDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexEndDate" runat="server" TargetControlID="tbxEndDate" Format="yyyy/MM/dd" >
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr> 
                    <td>
                        <asp:Button ID="btnSSearch" ValidationGroup="vgpHeader" runat="server" Text="Search" />
                    </td>
                </tr>
            </table>

            <asp:RegularExpressionValidator ID="revFirstName" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxFirstName" ErrorMessage="First name can only contain letters."
                ValidationExpression="^[A-Za-z']+$" ></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="revLastName" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxLastName" ErrorMessage="Last name can only contain letters."
                ValidationExpression="^[A-Za-z']+$" ></asp:RegularExpressionValidator>

            <asp:RegularExpressionValidator ID="revStartDate" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxStartDate" ValidationExpression="^[0-9]{4}/{1}[0-9]{2}/{1}[0-9]{2}$" 
                ErrorMessage="Start date must be in format 'YYYY/MM/DD'"></asp:RegularExpressionValidator>
            <asp:RangeValidator ID="rgvStartDate" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxStartDate" ErrorMessage="Start date must be between 2000/01/01 and 2500/01/01."
                MaximumValue="2500/01/01" MinimumValue="2000/01/01"></asp:RangeValidator>

            <asp:RegularExpressionValidator ID="revEndDate" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxEndDate" ValidationExpression="^[0-9]{4}/{1}[0-9]{2}/{1}[0-9]{2}$" 
                ErrorMessage="End date must be in format 'YYYY/MM/DD'"></asp:RegularExpressionValidator>
            <asp:RangeValidator ID="rgvEndDate" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxEndDate" ErrorMessage="End date must be between 2000/01/01 and 2500/01/01."
                MaximumValue="2500/01/01" MinimumValue="2000/01/01"></asp:RangeValidator>
            <asp:CompareValidator ID="cpvStartEndDates" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxEndDate" ControlToCompare="tbxStartDate" Operator="GreaterThan" Type="Date"
                ErrorMessage="End date must be later than start date." ></asp:CompareValidator>

            <asp:ValidationSummary ID="vsmHeader" runat="server" ValidationGroup="vgpHeader"
                DisplayMode="BulletList" />

            </asp:Panel>
        </div>

        


        
        

<asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>

</asp:Content>
