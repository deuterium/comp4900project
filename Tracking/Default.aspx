<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Tracking_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<div ID="divCollapsiblePanelExtenders" visible="false">

<asp:CollapsiblePanelExtender ID="cpeEmployeeInfo" runat="server" Collapsed="false"
CollapseControlID="hr3EmployeeInfo" ExpandControlID="hr3EmployeeInfo" TargetControlID="pnlEmployeeInfo"
ImageControlID="imgExpandCollapseReportInfo" TextLabelID="ExpandCollapseA" CollapsedImage="../images/expand.jpg" 
ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

</div>

<div id="divContent">
<div id="divReportInfo">

    <h3 id="hr3EmployeeInfo"><asp:Image ID="imgExpandCollapseReportInfo" runat="server" /> Employee Information<asp:Label ID="ExpandCollapseReportInfo" runat="server" Text=""></asp:Label></h3>
    <asp:Panel ID="pnlEmployeeInfo" CssClass="panel" runat="server">

    <div id="divEmpInfoLeftPanel" >
        <table>
            <tr>
                <td>Id:</td>
                <td><asp:TextBox ID="tbxId" runat="server" Enabled="false" BackColor="#E6E6E6" ></asp:TextBox></td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td>
                    <asp:TextBox TabIndex="100" ID="tbxLastName" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxLastName" ErrorMessage="Last name is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revLastName" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxLastName" ErrorMessage="Last name can only contain letters."
                        ValidationExpression="^[A-Za-z']+$" ></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>First name:</td>
                <td>
                    <asp:TextBox TabIndex="101" ID="tbxFirstName" runat="server" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxFirstName" ErrorMessage="First name is required."></asp:RequiredFieldValidator>  
                    <asp:RegularExpressionValidator ID="revFirstName" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxFirstName" ErrorMessage="First name can only contain letters."
                        ValidationExpression="^[A-Za-z']+$" ></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
    </div>

    <div id="divEmpInfoMiddlePanel" >
        <table>
            <tr>
                <td>Position:</td>
                <td>
                    <asp:DropDownList TabIndex="102" ID="ddlPositions" runat="server" OnSelectedIndexChanged="ddlPositions_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                    <asp:UpdatePanel ID="uplPosition" runat="server">
                        <ContentTemplate>
                            <asp:TextBox TabIndex="103" ID="tbxPosition" runat="server" Visible="false"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlPositions" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>Employer:</td>
                <td>
                    <asp:DropDownList TabIndex="104" ID="ddlEmployers" runat="server" OnSelectedIndexChanged="ddlEmployers_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                    <asp:UpdatePanel ID="uplEmployer" runat="server">
                        <ContentTemplate>
                            <asp:TextBox TabIndex="105" ID="tbxEmployer" runat="server" Visible="false"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlEmployers" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>Department:</td>
                <td>
                    <asp:DropDownList TabIndex="106" ID="ddlDepartments" runat="server" OnSelectedIndexChanged="ddlDepartments_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                    <asp:UpdatePanel ID="uplDepartment" runat="server">
                        <ContentTemplate>
                            <asp:TextBox TabIndex="103" ID="tbxDepartment" runat="server" Visible="false"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlDepartments" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>

    <div id="divEmpInfoRightPanel" >
        <table>
            <tr>
                <td>Room:</td>
                <td><asp:TextBox TabIndex="107" ID="tbxRoom" runat="server" ></asp:TextBox></td>
            </tr>
            <tr>
                <td>Supervisor:</td>
                <td>
                    <asp:TextBox TabIndex="108" ID="tbxSupervisor" runat="server" ></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revSupervisor" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxSupervisor" ErrorMessage="Supervisor must have a first and last name separated by a space."
                        ValidationExpression="^[A-Za-z']+ [A-Za-z']+$" ></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Start date:</td>
                <td>
                    <asp:TextBox TabIndex="109" ID="tbxStartDate" runat="server" MaxLength="10" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="twxStartDate" runat="server" TargetControlID="tbxStartDate"
                        WatermarkCssClass="watermarked" WatermarkText="M/D/YYYY"></asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexStartDate" runat="server" TargetControlID="tbxStartDate" Format="M/d/yyyy" >
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revStartDate" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxStartDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Start date must be in format 'M/D/YYYY'"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>End date:</td>
                <td>
                    <asp:TextBox TabIndex="110" ID="tbxEndDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="twxEndDate" runat="server" TargetControlID="tbxEndDate"
                        WatermarkCssClass="watermarked" WatermarkText="M/D/YYYY"></asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexEndDate" runat="server" TargetControlID="tbxEndDate" Format="M/d/yyyy" >
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revEndDate" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxEndDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="End date must be in format 'M/D/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="cpvStartEndDates" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxEndDate" ControlToCompare="tbxStartDate" Operator="GreaterThan" Type="Date"
                        ErrorMessage="End date must be later than start date." ></asp:CompareValidator>
                </td>
            </tr>
        </table>
    </div>

    <div>

        <p><asp:Label ID="lblResults" runat="server" Text="" Visible="false" ></asp:Label></p>

        <asp:ValidationSummary ID="vsyEmployeeInfo" runat="server" ValidationGroup="vgpEmpInfo" DisplayMode="BulletList" />
    </div>
</asp:Panel>

<asp:DropDownList ID="ddlActivity" runat="server" >
    <asp:ListItem Text="Activity" style="font-weight: bold;"></asp:ListItem>
    <asp:ListItem Text="No Injury" ></asp:ListItem>
</asp:DropDownList>

<asp:GridView ID="gdvReports" runat="server">
</asp:GridView>

</asp:Content>
