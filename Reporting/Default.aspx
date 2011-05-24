<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Reporting_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="body">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
    </asp:ToolkitScriptManager>
    <div id="divCollapsiblePanelExtenders" visible="false">
        <asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="true" CollapseControlID="hr3A"
            ExpandControlID="hr3A" TargetControlID="pnlA" ImageControlID="imgExpandCollapseA"
            TextLabelID="ExpandCollapseA" CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="true" CollapseControlID="hr3B"
            ExpandControlID="hr3B" TargetControlID="pnlB" ImageControlID="imgExpandCollapseB"
            TextLabelID="ExpandCollapseB" CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeC" runat="server" Collapsed="true" CollapseControlID="hr3C"
            ExpandControlID="hr3C" TargetControlID="pnlC" ImageControlID="imgExpandCollapseC"
            TextLabelID="ExpandCollapseC" CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeD" runat="server" Collapsed="true" CollapseControlID="hr3D"
            ExpandControlID="hr3D" TargetControlID="pnlD" ImageControlID="imgExpandCollapseD"
            TextLabelID="ExpandCollapseD" CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeE" runat="server" Collapsed="true" CollapseControlID="hr3E"
            ExpandControlID="hr3E" TargetControlID="pnlE" ImageControlID="imgExpandCollapseE"
            TextLabelID="ExpandCollapseE" CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeEmpInfo" runat="server" Collapsed="false" Enabled="true"
            CollapseControlID="" ExpandControlID="" TargetControlID="pnlEmployeeInfo">
        </asp:CollapsiblePanelExtender>
    </div>

    <div id="divReportInfo">
        <h3 id="hr3EmployeeInfo">
            Employee Information</h3>
        <asp:Panel ID="pnlEmployeeInfo" CssClass="panel" runat="server">
            <div id="divEmpInfoLeftPanel">
                <table>
                    <tr>
                        <td>
                            Id:
                        </td>
                        <td>
                            <asp:TextBox ID="tbxId" runat="server" Enabled="false" BackColor="#E6E6E6"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Last name:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="100" ID="tbxLastName" runat="server" ClientID="tbxLastNameClient"
                                MaxLength="50"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweLastName" runat="server" TargetControlID="tbxLastName"
                                WatermarkCssClass="watermarked" WatermarkText="Required field">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RequiredFieldValidator ID="rfvLastNameVgpEmpName" runat="server" ValidationGroup="vgpEmpName"
                                Display="Dynamic" ControlToValidate="tbxLastName" ErrorMessage="Last name is required."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revLastNameVgpEmpName" runat="server" ValidationGroup="vgpEmpName"
                                Display="Dynamic" ControlToValidate="tbxLastName" ErrorMessage="Last name can only contain letters."
                                ValidationExpression="^[A-Za-z']+$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvLastNameVgpCreate" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ControlToValidate="tbxLastName" ErrorMessage="Last name is required."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revLastNameVgpCreate" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ControlToValidate="tbxLastName" ErrorMessage="Last name can only contain letters."
                                ValidationExpression="^[A-Za-z']+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            First name:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="101" ID="tbxFirstName" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweFirstName" runat="server" TargetControlID="tbxFirstName"
                                WatermarkCssClass="watermarked" WatermarkText="Required field">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RequiredFieldValidator ID="rfvFirstNameVgpEmpName" runat="server" ValidationGroup="vgpEmpName"
                                Display="Dynamic" ControlToValidate="tbxFirstName" ErrorMessage="First name is required."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revFirstNameVgpEmpName" runat="server" ValidationGroup="vgpEmpName"
                                Display="Dynamic" ControlToValidate="tbxFirstName" ErrorMessage="First name can only contain letters."
                                ValidationExpression="^[A-Za-z']+$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ControlToValidate="tbxFirstName" ErrorMessage="First name is required."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revFirstName" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ControlToValidate="tbxFirstName" ErrorMessage="First name can only contain letters."
                                ValidationExpression="^[A-Za-z']+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divEmpInfoMiddlePanel">
                <table>
                    <tr>
                        <td>
                            Position:
                        </td>
                        <td>
                            <asp:DropDownList TabIndex="102" ID="ddlPositions" runat="server" OnSelectedIndexChanged="ddlPositions_SelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:UpdatePanel ID="uplPosition" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox TabIndex="103" ID="tbxPosition" runat="server" Visible="false" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPosition" runat="server" ValidationGroup="vgpAllEmpInfo" Enabled="false"
                                        Display="Dynamic" ControlToValidate="tbxPosition" ErrorMessage="Position is required if you select 'Other (specify)' from the Positions drop down list."></asp:RequiredFieldValidator>
                                    <asp:FilteredTextBoxExtender ID="ftePosition" runat="server" TargetControlID="tbxPosition"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlPositions" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Employer:
                        </td>
                        <td>
                            <asp:DropDownList TabIndex="104" ID="ddlEmployers" runat="server" OnSelectedIndexChanged="ddlEmployers_SelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:UpdatePanel ID="uplEmployer" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox TabIndex="105" ID="tbxEmployer" runat="server" Visible="false" MaxLength="10"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmployer" runat="server" ValidationGroup="vgpAllEmpInfo" Enabled="false"
                                        Display="Dynamic" ControlToValidate="tbxEmployer" ErrorMessage="Employer is required if you select 'Other (specify)' from the Employers drop down list."></asp:RequiredFieldValidator>
                                    <asp:FilteredTextBoxExtender ID="fteEmployer" runat="server" TargetControlID="tbxEmployer"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlEmployers" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Department:
                        </td>
                        <td>
                            <asp:DropDownList TabIndex="106" ID="ddlDepartments" runat="server" OnSelectedIndexChanged="ddlDepartments_SelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:UpdatePanel ID="uplDepartment" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox TabIndex="106" ID="tbxDepartment" runat="server" Visible="false" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDepartment" runat="server" ValidationGroup="vgpAllEmpInfo" Enabled="false"
                                        Display="Dynamic" ControlToValidate="tbxDepartment" ErrorMessage="Department is required if you select 'Other (specify)' from the Departments drop down list."></asp:RequiredFieldValidator>
                                    <asp:FilteredTextBoxExtender ID="fteDepartment" runat="server" TargetControlID="tbxDepartment"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlDepartments" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divEmpInfoRightPanel">
                <table>
                    <tr>
                        <td>
                            Room:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="107" ID="tbxRoom" runat="server" MaxLength="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Supervisor:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="108" ID="tbxSupervisor" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweSupervisor" runat="server" TargetControlID="tbxSupervisor"
                                WatermarkCssClass="watermarked" WatermarkText="First Last">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RegularExpressionValidator ID="revSupervisor" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ControlToValidate="tbxSupervisor" ErrorMessage="Supervisor must have a first and last name separated by a space. Only letters and apostrophes are allowed in names."
                                ValidationExpression="^[A-Za-z']+ [A-Za-z']+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Start date:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="109" ID="tbxStartDate" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="twxStartDate" runat="server" TargetControlID="tbxStartDate"
                                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                            </asp:TextBoxWatermarkExtender>
                            <asp:CalendarExtender ID="cexStartDate" runat="server" TargetControlID="tbxStartDate"
                                Format="M/d/yyyy">
                            </asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ControlToValidate="tbxStartDate" ErrorMessage="Start date is required."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revStartDate" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ControlToValidate="tbxStartDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                ErrorMessage="Start date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cmvStartDate" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ErrorMessage="Start date must be in  format 'MM/DD/YYYY'" OnServerValidate="cmvStartDate_ServerValidate"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            End date:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="110" ID="tbxEndDate" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="twxEndDate" runat="server" TargetControlID="tbxEndDate"
                                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                            </asp:TextBoxWatermarkExtender>
                            <asp:CalendarExtender ID="cexEndDate" runat="server" TargetControlID="tbxEndDate"
                                Format="M/d/yyyy">
                            </asp:CalendarExtender>
                            <asp:RegularExpressionValidator ID="revEndDate" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ControlToValidate="tbxEndDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                ErrorMessage="End date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cmvEmpDates" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ErrorMessage="End date must be later than start date." OnServerValidate="cmvEmpDates_ServerValidate"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divEmpInfoButtons" class="summariesAndButtons">
                <asp:Button TabIndex="111" ID="btnGetEmployee" runat="server" ValidationGroup="vgpEmpName"
                    Text="Get Employee" OnClick="btnGetEmployee_Click" />
                <asp:Button TabIndex="111" ID="btnCreateEmployee" runat="server" ValidationGroup="vgpAllEmpInfo"
                    Text="Create Employee" OnClick="btnCreateEmployee_Click" />
                <asp:Button TabIndex="111" ID="btnUpdateEmployee" runat="server" ValidationGroup="vgpAllEmpInfo"
                    Text="Update  Employee" OnClick="btnUpdateEmployee_Click" />
                <asp:Button TabIndex="111" ID="btnCreateReport" runat="server" ValidationGroup="vgpPanelA"
                    Text="Create Report" OnClick="btnCreateReport_Click" />
                <asp:Button TabIndex="111" ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                <asp:ConfirmButtonExtender ID="cbeClear" runat="server"
                    ConfirmText="Are you sure you want to clear the form? All unsaved data will be permanently lost." Enabled="True"
                    TargetControlID="btnClear" ConfirmOnFormSubmit="false"></asp:ConfirmButtonExtender>
                <asp:ValidationSummary ID="vsyGetEmp" ValidationGroup="vgpEmpName" runat="server"
                    DisplayMode="BulletList" />
                <asp:ValidationSummary ID="vsyCreateEmp" ValidationGroup="vgpAllEmpInfo" runat="server"
                    DisplayMode="BulletList" />
            </div>
        </asp:Panel>
        <h3 id="hr3A">
            <asp:Image ID="imgExpandCollapseA" runat="server" />
            A. Incident/Accident Information
            <asp:Label ID="ExpandCollapseA" runat="server" Text=""></asp:Label></h3>
        <asp:Panel ID="pnlA" CssClass="panel" runat="server">
            <div id="divATopPanel">
                <table>
                    <tr>
                        <td>
                            Date of Incident:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="112" ID="tbx_p1_dateOfIncident" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweDateOfIncident" runat="server" TargetControlID="tbx_p1_dateOfIncident"
                                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                            </asp:TextBoxWatermarkExtender>
                            <asp:CalendarExtender ID="cexDateOfIncident" runat="server" TargetControlID="tbx_p1_dateOfIncident"
                                Format="M/d/yyyy">
                            </asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="rfvDateOfIncident" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_dateOfIncident" ErrorMessage="Date of incident is required."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revDateOfIncident" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_dateOfIncident" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                ErrorMessage="Date reported must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                        </td>
                        <td colspan="2">
                            <span class="spanBold">Witness 1:</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Time of Incident:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="113" ID="tbx_p1_timeOfIncident" runat="server" MaxLength="8"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweTimeOfIncident" runat="server" TargetControlID="tbx_p1_timeOfIncident"
                                WatermarkCssClass="watermarked" WatermarkText="HH:MM">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RequiredFieldValidator ID="rfvTimeOfIncident" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_timeOfIncident" ErrorMessage="Time of incident is required."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revTimeOfIncident" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_timeOfIncident" ValidationExpression="^(((([1-9]{1})|([01]{1}[012])){1} {1}(am|AM|pm|PM){1}){1}|((([0]?[1-9]{1})|([1]{1}[012]{1})){1}:{1}[0-5]{1}[0-9]{1} {1}(am|AM|pm|PM){1}){1}|((([0]?[1-9]{1})|([01]{1}[0-9]{1})|([2]{1}[0123])){1}:{1}[0-5]{1}[0-9]{1}$){1})$"
                                ErrorMessage="Time of incident must be in one of the following formats: H pm, H:MM AM, HH:MM."></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            Name:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="116" ID="tbx_p1_witnessName1" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweWitnessName1" runat="server" TargetControlID="tbx_p1_witnessName1"
                                WatermarkCssClass="watermarked" WatermarkText="First Last">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RegularExpressionValidator ID="revWitnessName1" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_witnessName1" ErrorMessage="Witness 1 must have a first and last name separated by a space."
                                ValidationExpression="^[A-Za-z']+ [A-Za-z']+$"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            Phone:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="116" ID="tbx_p1_witnessPhone1" runat="server" MaxLength="12"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweWitnessPhone1" runat="server" TargetControlID="tbx_p1_witnessPhone1"
                                WatermarkCssClass="watermarked" WatermarkText="###-###-####">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RegularExpressionValidator ID="revWitnessPhone1" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_witnessPhone1" ValidationExpression="^[0-9]{3}-{1}[0-9]{3}-{1}[0-9]{4}$"
                                ErrorMessage="Phone number for witness 1 must be in format '###-###-####'."></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Date Reported:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="114" ID="tbx_p1_dateReported" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweDateReported" runat="server" TargetControlID="tbx_p1_dateReported"
                                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                            </asp:TextBoxWatermarkExtender>
                            <asp:CalendarExtender ID="cexDateReported" runat="server" TargetControlID="tbx_p1_dateReported"
                                Format="M/d/yyyy">
                            </asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="rfvDateReported" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_dateReported" ErrorMessage="Date reported is required."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revDateReported" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_dateReported" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                ErrorMessage="Date reported must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                        </td>
                        <td colspan="2">
                            <span class="spanBold">Witness 2:</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Time Reported:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="115" ID="tbx_p1_timeReported" runat="server" MaxLength="8"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweTimeReported" runat="server" TargetControlID="tbx_p1_timeReported"
                                WatermarkCssClass="watermarked" WatermarkText="HH:MM">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RequiredFieldValidator ID="rfvTimeReported" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_timeReported" ErrorMessage="Time reported is required."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revTimeReported" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_timeReported" ValidationExpression="^(((([1-9]{1})|([01]{1}[012])){1} {1}(am|AM|pm|PM){1}){1}|((([0]?[1-9]{1})|([1]{1}[012]{1})){1}:{1}[0-5]{1}[0-9]{1} {1}(am|AM|pm|PM){1}){1}|((([0]?[1-9]{1})|([01]{1}[0-9]{1})|([2]{1}[0123])){1}:{1}[0-5]{1}[0-9]{1}$){1})$"
                                ErrorMessage="Time reported must be in one of the following formats: 7 am, 7:30 pm, or 23:59."></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cmvReportDate" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ErrorMessage="The date/time reported must be later than the date/time the incident occured."
                                OnServerValidate="cmvReportDate_ServerValidate"></asp:CustomValidator>
                        </td>
                        <td>
                            Name:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="117" ID="tbx_p1_witnessName2" runat="server" MaxLength="50"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweWitnessName2" runat="server" TargetControlID="tbx_p1_witnessName2"
                                WatermarkCssClass="watermarked" WatermarkText="First Last">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RegularExpressionValidator ID="rexWitnessName2" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_witnessName2" ErrorMessage="Witness 2 must have a first and last name separated by a space."
                                ValidationExpression="^[A-Za-z']+ [A-Za-z']+$"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            Phone:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="117" ID="tbx_p1_witnessPhone2" runat="server" MaxLength="12"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweWitnessPhone2" runat="server" TargetControlID="tbx_p1_witnessPhone2"
                                WatermarkCssClass="watermarked" WatermarkText="###-###-####">
                            </asp:TextBoxWatermarkExtender>
                            <asp:RegularExpressionValidator ID="revWitnessPhone2" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_witnessPhone2" ValidationExpression="^[0-9]{3}-{1}[0-9]{3}-{1}[0-9]{4}$"
                                ErrorMessage="Phone number for witness 2 must be in format '###-###-####'."></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Department of Incident:
                        </td>
                        <td>
                            <asp:DropDownList TabIndex="115" ID="ddlReportDepts" runat="server">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
            <div id="divABottomPanel">
                <span class="spanBold">Incident Description:</span>
                <asp:RequiredFieldValidator ID="rfvIncidentDesc" runat="server" ValidationGroup="vgpPanelA"
                    ControlToValidate="tbx_p1_incidentDesc" ErrorMessage="Incident description is required."></asp:RequiredFieldValidator>
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:TextBox TabIndex="118" ID="tbx_p1_incidentDesc" CssClass="resizeableTextArea" 
                                runat="server" TextMode="MultiLine" MaxLength="8000" ></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <br />
                <span class="spanBold">Action Following Incident:</span>
                <asp:CustomValidator ID="cmvActionFollowing" runat="server" ValidationGroup="vgpPanelA"
                    ErrorMessage="You must select at least one Action Following checkbox." OnServerValidate="cmvActionFollowing_ServerValidate"></asp:CustomValidator>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="119" ID="cbx_p1_action_report" Text="Report Only" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox TabIndex="121" ID="cbx_p1_action_firstAid" Text="First Aid" runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox TabIndex="122" ID="cbx_p1_action_medicalGP" Text="Medical Aid (GP / Clinic)" runat="server"
                                OnCheckedChanged="cbx_p1_action_medicalGP_CheckChanged" />
                        </td>
                        <td>
                            Date:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="122" ID="tbx_p1_action_medicalGP_date" runat="server" MaxLength="10" Width="150px"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweMedicalGpDate" runat="server" TargetControlID="tbx_p1_action_medicalGP_date"
                                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                            </asp:TextBoxWatermarkExtender>
                            <asp:CalendarExtender ID="cexMedicalGpDate" runat="server" TargetControlID="tbx_p1_action_medicalGP_date"
                                Format="M/d/yyyy">
                            </asp:CalendarExtender>
                            <asp:RegularExpressionValidator ID="revMedicalGpDate" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_action_medicalGP_date" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                ErrorMessage="Medical Aid (GP / Clinic) date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvMedicalAidGpDate" runat="server" ValidationGroup="vgpPanelA"
                                Enabled="false" Display="Dynamic" ControlToValidate="tbx_p1_action_medicalGP_date"
                                ErrorMessage="Date is required for Medical Aid (GP / Clinic)."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:CheckBox TabIndex="120" ID="cbx_p1_action_lostTime" Text="Lost time (missed/will miss next scheduled shift due to injury)"
                                runat="server" />
                        </td>
                        <td>
                            <asp:CheckBox TabIndex="123" ID="cbx_p1_action_medicalER" Text="Medical Aid (ER)" runat="server"
                                OnCheckedChanged="cbx_p1_action_medicalER_CheckChanged" />
                        </td>
                        <td>
                            Date:
                        </td>
                        <td>
                            <asp:TextBox TabIndex="123" ID="tbx_p1_action_medicalER_date" runat="server" MaxLength="10" Width="150px"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweMedicalErDate" runat="server" TargetControlID="tbx_p1_action_medicalER_date"
                                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                            </asp:TextBoxWatermarkExtender>
                            <asp:CalendarExtender ID="cexMedicalErDate" runat="server" TargetControlID="tbx_p1_action_medicalER_date"
                                Format="M/d/yyyy">
                            </asp:CalendarExtender>
                            <asp:RegularExpressionValidator ID="revMedicalErDate" runat="server" ValidationGroup="vgpPanelA"
                                Display="Dynamic" ControlToValidate="tbx_p1_action_medicalER_date" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                ErrorMessage="Medical Aid (ER) date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="rfvMedicalAidErDate" runat="server" ValidationGroup="vgpPanelA"
                                Enabled="false" Display="Dynamic" ControlToValidate="tbx_p1_action_medicalER_date"
                                ErrorMessage="Date is required for Medical Aid (ER)."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divSummariesAndButtons" class="summariesAndButtons">
                <asp:ValidationSummary ID="vsyPanelA" runat="server" ValidationGroup="vgpPanelA"
                    DisplayMode="BulletList" />
            </div>
        </asp:Panel>
        <h3 id="hr3B">
            <asp:Image ID="imgExpandCollapseB" runat="server" />
            B. Nature of Injury
            <asp:Label ID="ExpandCollapseB" runat="server" Text=""></asp:Label></h3>
        <asp:Panel ID="pnlB" CssClass="panel" runat="server">
            <h4>
                Nature of Injury</h4>
            <div id="divBLeftPanel">
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="124" ID="cbx_p1_nature_no" Text="No Injury (Near Miss/ Unsafe Condition)"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="124" ID="cbx_p1_nature_musculoskeletal" Text="Musculoskeletal Injury (Strain / Sprain)"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="124" ID="cbx_p1_nature_bruise" Text="Bruise / Confusion"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="124" ID="cbx_p1_nature_burn" Text="Burn (Heat or Cold)" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="125" ID="cbx_p1_nature_cut" Text="Cut / Scratch / Abrasion / Laceration / Puncture (Non BBF)"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="125" ID="cbx_p1_nature_puncture" Text="Puncture Wound (BBF)"
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divBRightPanel">
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="125" ID="cbx_p1_nature_skinIrritation" Text="Skin Irritation"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="125" ID="cbx_p1_nature_skinMucous" Text="Skin / Mucous Membrane Exposure (incl. eye)"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="126" ID="cbx_p1_nature_eye" Text="Eye Irritation" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="126" ID="cbx_p1_nature_allergic" Text="Allergic Response"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="126" ID="cbx_p1_nature_psychological" Text="Psychological Trauma / Aggressive Incident"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="126" ID="cbx_p1_nature_respiratory" Text="Respiratory Irritation"
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <h3 id="hr3C">
            <asp:Image ID="imgExpandCollapseC" runat="server" />
            C. Accident Investigation
            <asp:Label ID="ExpandCollapseC" runat="server" Text=""></asp:Label></h3>
        <asp:Panel ID="pnlC" CssClass="panel" runat="server">
            <div id="divCLeftPanel">
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_no" Text="No Injury" runat="server" />
                        </td>
                    </tr>
                </table>
                <h4>
                    Patient Handling</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_repositioning" Text="Repositioning"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_transferring" Text="Transferring (incl. to seclusion)"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_assistedWalking" Text="Assisted Walking"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_assistedFloor" Text="Assisted from Floor"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_fall" Text="Preventing a fall" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_holding" Text="Holding / Assisting during procedure (incl. patient restraint)"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_toileting" Text="Toileting" runat="server" />
                        </td>
                    </tr>
                </table>
                <h4>
                    Patient Handling Details</h4>
                <table>
                    <tr>
                        <td>
                            Equipment used at time of Injury:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_ceilingLift" Text="Ceiling Lift"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_sitStandLift" Text="Sit-Stand Lift"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_floorLift" Text="Floor Lift" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_manualLift" Text="Manual Lift" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplPatientOther" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_other" Text="Other: " runat="server"
                                        AutoPostBack="true" />
                                    <asp:TextBox TabIndex="128" ID="tbx_p2_patient_otherSpecify" runat="server" MaxLength="8000"
                                        AutoPostBack="true" OnTextChanged="tbx_p2_patient_otherSpecify_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="ftePatientOther" runat="server" TargetControlID="tbx_p2_patient_otherSpecify"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_patient_otherSpecify" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Was adequate assistance available?
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="rbl_p2_patient_adequateAssist" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem TabIndex="129" Text="Yes" Value="1"></asp:ListItem>
                                <asp:ListItem TabIndex="130" Text="No" Value="2"></asp:ListItem>
                                <asp:ListItem TabIndex="131" Text="Unknown" Value="3"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            How many employees involved in activity at time of incident?
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox TabIndex="132" ID="tbx_p1_numEmployeesInvolved" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="fteEmpInvolved" runat="server" TargetControlID="tbx_p1_numEmployeesInvolved"
                                ValidChars="0123456789" />
                        </td>
                    </tr>
                </table>
                <h4>
                    Patient Care</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_washing" Text="Washing / Bathing"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_dressing" Text="Dressing" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_changing" Text="Changing" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_feeding" Text="Feeding" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_prep" Text="Prep / Dispensing Meds"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_dressingChanges" Text="Dressing Changes"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplOtherPatientCare" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_otherPatientCare" Text="Other: "
                                        runat="server" AutoPostBack="true" />
                                    <asp:TextBox TabIndex="132" ID="tbx_p2_activity_otherPatientCare" runat="server"
                                        MaxLength="8000" AutoPostBack="true" OnTextChanged="tbx_p2_activity_otherPatientCare_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteOtherPatientCare" runat="server" TargetControlID="tbx_p2_activity_otherPatientCare"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherPatientCare" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divCRightPanel">
                <h4>
                    Sharps Handling</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="133" ID="cbx_p2_activity_recapping" Text="Re-capping" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="133" ID="cbx_p2_activity_puncture" Text="Veno Puncture / Arterio Puncture"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="133" ID="cbx_p2_activity_sharpsDisposal" Text="Sharps Disposal"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="133" ID="cbx_p2_activity_otherSharps" Text="Other Sharps / Instruments"
                                runat="server" />
                        </td>
                    </tr>
                </table>
                <h4>
                    Using Material / Equipment</h4>
                <table>
                    <tr>
                        <td>
                            Material / Equipment Description (stretchers, carts, boxes, etc):
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox TabIndex="134" ID="tbx_p2_activity_material" runat="server" Width="350px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_lift" Text="Lift / Lower" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_push" Text="Push / Pull" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_carry" Text="Carry" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplOtherMat" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherMat" Text="Other Material Description: "
                                        runat="server" AutoPostBack="true" />
                                    <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherMat" runat="server" AutoPostBack="true"
                                        MaxLength="50" OnTextChanged="tbx_p2_activity_otherMat_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteOtherMat" runat="server" TargetControlID="tbx_p2_activity_otherMat"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherMat" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_driving" Text="Equipment Operation - Driving"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplOtherEquip" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherEquip" Text="Equipment Operation - Other: "
                                        runat="server" AutoPostBack="true" />
                                    <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherEquip" runat="server" AutoPostBack="true"
                                        MaxLength="8000" OnTextChanged="tbx_p2_activity_otherEquip_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteOtherEquip" runat="server" TargetControlID="tbx_p2_activity_otherEquip"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherEquip" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherEquipDesc" Text="Other Equipment Description: "
                                        runat="server" AutoPostBack="true" />
                                    <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherEquipDesc" runat="server" AutoPostBack="true"
                                        MaxLength="8000" OnTextChanged="tbx_p2_activity_otherEquipDesc_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteOtherEquipDesc" runat="server" TargetControlID="tbx_p2_activity_otherEquipDesc"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherEquipDesc" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_equipMain" Text="Equipment Maintenance"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_comp" Text="Office Work - Computer"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_nonComp" Text="Office Work - Non Computer"
                                runat="server" />
                        </td>
                    </tr>
                </table>
                <h4>
                    Other</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_walking" Text="Walking / Running"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_bending" Text="Bending" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_reading" Text="Reading" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_spill" Text="Spill Cleanup" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_cleaning" Text="Cleaning" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplActivityOther" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_other" Text="Other: " runat="server"
                                        AutoPostBack="true" />
                                    <asp:TextBox TabIndex="135" ID="tbx_p2_activity_other" runat="server" AutoPostBack="true"
                                        MaxLength="8000" OnTextChanged="tbx_p2_activity_other_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteActivityOther" runat="server" TargetControlID="tbx_p2_activity_other"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_other" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <asp:ValidationSummary ID="vsyCInvestigation" runat="server" ValidationGroup="vgpCInvestigation"
                    DisplayMode="BulletList" />
            </div>
        </asp:Panel>
        <h3 id="hr3D">
            <asp:Image ID="imgExpandCollapseD" runat="server" />
            D. Cause
            <asp:Label ID="ExpandCollapseD" runat="server" Text=""></asp:Label></h3>
        <asp:Panel ID="pnlD" CssClass="panel" runat="server">
            <div id="divDLeftPanel">
                <h4>
                    Bite</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="136" ID="cbx_p2_cause_human" Text="Human" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="136" ID="cbx_p2_cause_animal" Text="Animal / Insect" runat="server" />
                        </td>
                    </tr>
                </table>
                <h4>
                    BBF Exposure</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="137" ID="cbx_p2_cause_needle" Text="Needlestick" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="137" ID="cbx_p2_cause_otherSharps" Text="Other Sharps" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="137" ID="cbx_p2_cause_skin" Text="Skin/ Mucous Membrane (Splash / Spit)"
                                runat="server" />
                        </td>
                    </tr>
                </table>
                <h4>
                    Ergonomic Factors</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="138" ID="cbx_p2_cause_awkwardPosture" Text="Awkward Posture"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="138" ID="cbx_p2_cause_staticPosture" Text="Static Posture"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="138" ID="cbx_p2_cause_contactStress" Text="Contact Stress"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="138" ID="cbx_p2_cause_force" Text="Force" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="138" ID="cbx_p2_cause_rep" Text="Repetition" runat="server" />
                        </td>
                    </tr>
                </table>
                <h4>
                    Other</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_motor" Text="Motor Vehicle Accident"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_slip" Text="Slip and Fall" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_aggression" Text="Workplace Agression"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_undetermined" Text="Cause Undetermined"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_event" Text="Traumatic Event" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_underEquip" Text="Caught In / Under / Between Equipment"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_hit" Text="Hit / Struck By / Cut by Equipment"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplCauseOther" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_other" Text="Other: " runat="server"
                                        AutoPostBack="true" />
                                    <asp:TextBox TabIndex="139" ID="tbx_p2_cause_other" runat="server" AutoPostBack="true"
                                        MaxLength="8000" OnTextChanged="tbx_p2_cause_other_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteCauseOther" runat="server" TargetControlID="tbx_p2_cause_other"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_cause_other" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divDAgressionDetailsPanel">
                <h4>
                    Details for Workplace Aggression Incidents</h4>
                Type of Incident:
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_verbal" Text="Verbal - threats of violence, verbal assault"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_biting" Text="Biting / Spitting"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_hitting" Text="Hitting / Kicking / Beating / Choking"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_squeezing" Text="Squeezing / Punching / Scratching / Twisting"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_assault" Text="Sexual assault"
                                runat="server" />
                        </td>
                    </tr>
                </table>
                Incident Involved:
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_patient" Text="Patient / Resident"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_family" Text="Family member of Patient / Resident"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_public" Text="Other member of Public"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_worker" Text="Worker" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplAgressionOther" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_other" Text="Other: " runat="server"
                                        AutoPostBack="true" />
                                    <asp:TextBox TabIndex="141" ID="tbx_p2_cause_aggression_other" runat="server" MaxLength="8000"
                                        AutoPostBack="true" OnTextChanged="tbx_p2_cause_aggression_other_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteCauseAggressionOther" runat="server" TargetControlID="tbx_p2_cause_aggression_other"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_cause_aggression_other" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divDRightPanel">
                <h4>
                    Exposure</h4>
                <table>
                    <tr>
                        <td>
                            Checmical Name:
                            <asp:TextBox TabIndex="142" ID="tbx_p2_cause_exposure_chemName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemInhalation" Text="Chemical Inhalation"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemIngest" Text="Chemical Ingestion"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemContact" Text="Chemical Skin / Eye Contact"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_latex" Text="Latex" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_dust" Text="Dust / Particulate" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_disease" Text="Communicable Diseases"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_temp" Text="Temperature Extremes" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_noise" Text="Noise" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_radiation" Text="Radiation" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_elec" Text="Electricity" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_air" Text="Indoor Air Quality" runat="server" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <h3 id="hr3E">
            <asp:Image ID="imgExpandCollapseE" runat="server" />
            E. Contributing Factors
            <asp:Label ID="ExpandCollapseE" runat="server" Text=""></asp:Label></h3>
        <asp:Panel ID="pnlE" CssClass="panel" runat="server">
            <div id="divELeftPanel">
                <h4>
                    Equipment / Device</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_malfunction" Text="Malfunctioning"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_improperUse" Text="Improper Use"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_signage" Text="Improper / Inadequate signage"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_notAvailable" Text="Not Available at Point of Use"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_poorDesign" Text="Poor Design" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplFactorsOtherEquip" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_otherEquip" Text="Other: " runat="server"
                                        AutoPostBack="true" />
                                    <asp:TextBox TabIndex="143" ID="tbx_p2_factors_otherEquip" runat="server" MaxLength="8000"
                                        AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherEquip_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteFactorsOtherEquip" runat="server" TargetControlID="tbx_p2_factors_otherEquip"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherEquip" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <h4>
                    Environment</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_temp" Text="Temperature" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_workplace" Text="Workplace" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_layout" Text="Layout / Design" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_limitedWorkspace" Text="Limited Workspace"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_slippery" Text="Floor Slippery / Uneven"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_lighting" Text="Lighting Inadequate"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_noise" Text="Excessive Noise" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_vent" Text="Ventilation Inadequate"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_storage" Text="Improper Storage"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplOtherEnv" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_otherEnv" Text="Other: " runat="server"
                                        MaxLength="8000" AutoPostBack="true" />
                                    <asp:TextBox TabIndex="144" ID="tbx_p2_factors_otherEnv" runat="server" AutoPostBack="true"
                                        OnTextChanged="tbx_p2_factors_otherEnv_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteFactorsOtherEnv" runat="server" TargetControlID="tbx_p2_factors_otherEnv"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherEnv" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divEMiddlePanel">
                <h4>
                    Work Practice</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_assessment" Text="Improper Assessment of Client / Load"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_procedure" Text="Not Follow Appropriate Procedure"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_equip" Text="Not Use Designated / Appropriate Equipment"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_conduct" Text="Conduct" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_extended" Text="Task Performed for extended periods"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_comm" Text="Communication" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_unaccustomed" Text="Unaccustomed"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplOtherWorkPractice" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_otherWorkPractice" Text="Other: "
                                        runat="server" AutoPostBack="true" />
                                    <asp:TextBox TabIndex="145" ID="tbx_p2_factors_otherWorkPractice" runat="server"
                                        MaxLength="8000" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherWorkPractice_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteFactorsOtherWork" runat="server" TargetControlID="tbx_p2_factors_otherWorkPractice"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherWorkPractice" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <h4>
                    Patient Related Factors</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_directions" Text="Unable to Follow Directions"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_weight" Text="Inconsistent Weight Bearing"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_aggressive" Text="Patient Aggressive"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_patientResistive" Text="Patient Resistive"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_movement" Text="Made Unexpected Movement"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_confused" Text="Confused / Dementia"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_influence" Text="Under Influence of Drugs / Alcohol"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_lang" Text="Language Barriers" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplOtherPatient" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_otherPatient" Text="Other: " runat="server"
                                        AutoPostBack="true" />
                                    <asp:TextBox TabIndex="146" ID="tbx_p2_factors_otherPatient" runat="server" MaxLength="8000"
                                        AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherPatient_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteFactorsOtherPatient" runat="server" TargetControlID="tbx_p2_factors_otherPatient"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherPatient" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="divERightPanel">
                <h4>
                    Organizational / Administrative</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_alone" Text="Working Alone" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_info" Text="Inadequate Information"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_scheduling" Text="Inappropriate Scheduling"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_training" Text="Lack of Training / Education"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_appropriateEquip" Text="Lack of Appropriate Equipment"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_personal" Text="Lack of Personal Protection Equipment"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_safe" Text="Lack of Safe Work Procedures"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_perceived" Text="Perceived Time Constraints"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplOtherOrganizational" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_otherOrganizational" Text="Other: "
                                        runat="server" AutoPostBack="true" />
                                    <asp:TextBox TabIndex="147" ID="tbx_p2_factors_otherOrganizational" runat="server"
                                        MaxLength="8000" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherOrganizational_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteFactorsOtherOrg" runat="server" TargetControlID="tbx_p2_factors_otherOrganizational"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherOrganizational" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <h4>
                    Worker</h4>
                <table>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_inexperienced" Text="Inexperienced"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_communication" Text="Communication Difficulties"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_fatigued" Text="Fatigued" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_distracted" Text="Distracted" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_preexisting" Text="Pre-existing Injury"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_sick" Text="Sick / Medicated" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="uplOtherWorker" runat="server">
                                <ContentTemplate>
                                    <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_otherWorker" Text="Other: " runat="server"
                                        AutoPostBack="true" />
                                    <asp:TextBox TabIndex="148" ID="tbx_p2_factors_otherWorker" runat="server" MaxLength="8000"
                                        AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherWorker_OnTextChanged"></asp:TextBox>
                                    <asp:FilteredTextBoxExtender ID="fteFactorsOtherWorker" runat="server" TargetControlID="tbx_p2_factors_otherWorker"
                                        FilterMode="InvalidChars" FilterType="Custom" InvalidChars="<>&#" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherWorker" EventName="TextChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlPop" BackColor="White" CssClass="popPanel" runat="server">
            <table width="100%" cellpadding="5">
                <tr>
                    <td>
                        <asp:Label ID="lblPnlPop" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnPnlPopClose" runat="server" Text="Close" OnClick="btnPnlPopClose_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Button runat="server" ID="btnHidden" CssClass="hidden" />
        <asp:ModalPopupExtender ID="mpePop" runat="server" PopupControlID="pnlPop" TargetControlID="btnHidden"
            DropShadow="true" BackgroundCssClass="modalBackground" OkControlID="btnPnlPopClose" />
    
    </div>

</asp:Content>
