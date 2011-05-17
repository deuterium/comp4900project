<%@ Page Title="Summary" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Summary_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 161px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="true"
CollapseControlID="inspectionLookUp" ExpandControlID="inspectionLookUp" TargetControlID="pnlA"
ImageControlID="imgExpandCollapseInspectionLookUp" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="true"
CollapseControlID="courseLookUp" ExpandControlID="courseLookUp" TargetControlID="pnlB"
ImageControlID="imgExpandCollapseCourseLookUp" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeC" runat="server" Collapsed="true"
CollapseControlID="labInspectionLookUp" ExpandControlID="labInspectionLookUp" TargetControlID="pnlC"
ImageControlID="imgExpandCollapseLabInspectionLookUp" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeD" runat="server" Collapsed="true"
CollapseControlID="officeInspectionLookUp" ExpandControlID="officeInspectionLookUp" TargetControlID="pnlD"
ImageControlID="imgExpandCollapseOfficeInspectionLookUp" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeE" runat="server" Collapsed="true"
CollapseControlID="statistics" ExpandControlID="statistics" TargetControlID="pnlE"
ImageControlID="imgExpandCollapseStatistics" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeF" runat="server" Collapsed="true"
CollapseControlID="incident" ExpandControlID="incident" TargetControlID="pnlF"
ImageControlID="imgExpandCollapseIncident" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeG" runat="server" Collapsed="true"
CollapseControlID="incidentA" ExpandControlID="incidentA" TargetControlID="pnlIncidentA"
ImageControlID="imgExpandCollapseIncidentA" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeH" runat="server" Collapsed="true"
CollapseControlID="incidentB" ExpandControlID="incidentB" TargetControlID="pnlIncidentB"
ImageControlID="imgExpandCollapseIncidentB" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeI" runat="server" Collapsed="true"
CollapseControlID="incidentC" ExpandControlID="incidentC" TargetControlID="pnlIncidentC"
ImageControlID="imgExpandCollapseIncidentC" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeJ" runat="server" Collapsed="true"
CollapseControlID="incidentD" ExpandControlID="incidentD" TargetControlID="pnlIncidentD"
ImageControlID="imgExpandCollapseIncidentD" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeK" runat="server" Collapsed="true"
CollapseControlID="incidentC" ExpandControlID="incidentE" TargetControlID="pnlIncidentE"
ImageControlID="imgExpandCollapseIncidentE" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeL" runat="server" Collapsed="true"
CollapseControlID="incidentF" ExpandControlID="incidentF" TargetControlID="pnlIncidentF"
ImageControlID="imgExpandCollapseIncidentF" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeM" runat="server" Collapsed="true"
CollapseControlID="incidentG" ExpandControlID="incidentG" TargetControlID="pnlIncidentG"
ImageControlID="imgExpandCollapseIncidentG" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeN" runat="server" Collapsed="true"
CollapseControlID="incidentH" ExpandControlID="incidentH" TargetControlID="pnlIncidentH"
ImageControlID="imgExpandCollapseIncidentH" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>
Summary Page:

<h3 id="inspectionLookUp"><asp:Image ID="imgExpandCollapseInspectionLookUp" runat="server" /> Inspection Lookup:</h3>
    <asp:Panel ID="pnlA" CssClass="panel" runat="server">
        <h3 id="labInspectionLookUp"><asp:Image ID="imgExpandCollapseLabInspectionLookUp" runat="server" /> Lab Inspection:</h3>
        <asp:Panel ID="pnlC" CssClass="panel" runat="server">
            <table>
            <tr id="departmentRow" runat="server">
                <td>
                    Department: 
                </td>
                <td>
                    <asp:DropDownList Width="155px" runat="server" ID="ddlLabDepartment" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Department" Value="none" />
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp&nbsp&nbsp&nbsp&nbsp
                </td>
            </tr>
            <tr>
                <td>
                    Lab Manager:
                </td>
                <td>
                    <asp:DropDownList Width="155px" runat="server" ID="ddlLabLabManager" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Lab Manager" Value="none" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Date of Inspection: 
                </td>
                <td>
                    <asp:TextBox ID="tbxLabInspectionDate" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="cexLabInspectionDate" runat="server" TargetControlID="tbxLabInspectionDate" Format="M/d/yyyy"></asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revLabInspectionDate" runat="server" ValidationGroup="vgrLabInspectionLookUp"
                        ControlToValidate="tbxLabInspectionDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Date of Inspection must be 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp&nbsp&nbsp&nbsp&nbsp
                </td>
            </tr>
            <tr>
            <td>
                <asp:Button ID="btnLabInspectionLookUp" ValidationGroup="vgrLabInspectionLookUp" 
                    runat="server" Text="Search" onclick="btnLabInspectionLookUp_Click" />
            </td>
            </tr>
        </table>
            <asp:ValidationSummary ID="vsuLabInspectionLookUp" ValidationGroup="vgrLabInspectionLookUp" runat="server" />
            <asp:GridView ID="grvLabInspections" Width="790px" runat="server" AutoGenerateColumns="False"
                autogenerateselectbutton="True" DataKeyNames="labInsNo" onselectedindexchanged="grvLabInspections_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="labInsNo" HeaderText="Inspection" ReadOnly="True" 
                        SortExpression="labInsNo" />
                    <asp:BoundField DataField="deptName" HeaderText="Department" 
                        SortExpression="deptName" />
                    <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:M/dd/yyyy}" SortExpression="date" />
                    <asp:BoundField DataField="followupDate" HeaderText="Followup" 
                        SortExpression="followupDate" />
                    <asp:BoundField DataField="inspector" HeaderText="Inspector" 
                        SortExpression="inspector" />
                    <asp:BoundField DataField="labMgr" HeaderText="Lab Manager" 
                        SortExpression="labMgr" />
                    <asp:BoundField DataField="supervisor" HeaderText="Supervisor" 
                        SortExpression="supervisor" />
                    <asp:BoundField DataField="room" HeaderText="Room" 
                        SortExpression="room" />
                </Columns>
                <EmptyDataTemplate>No results were found.</EmptyDataTemplate>
            </asp:GridView> 
            <asp:GridView ID="grvLabInspectionResults" runat="server" AutoGenerateColumns="false"
            DataKeyNames="labInsItem" Width="790px" OnRowDataBound="grvLabInspectionResults_DataBinding">
            <Columns>
                    <asp:BoundField DataField="labInsItem" HeaderText="Item" ReadOnly="True" 
                        SortExpression="labInsItem" />

                    <asp:BoundField DataField="checkbox" HeaderText="Checked (yes/no)" 
                        SortExpression="checkbox" />

                    <asp:BoundField DataField="comments" HeaderText="Comment" 
                        SortExpression="comments" />

                </Columns>

            </asp:GridView>
            </asp:Panel>
        
        <h3 id="officeInspectionLookUp"><asp:Image ID="imgExpandCollapseOfficeInspectionLookUp" runat="server" /> Office Inspection:</h3>
        <asp:Panel ID="pnlD" CssClass="panel" runat="server">
                    <table>
            <tr>
                <td>
                    Department: 
                </td>
                <td>
                    <asp:DropDownList Width="155px" runat="server" ID="ddlOfficeDepartment" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Department" Value="none" />
                    </asp:DropDownList>
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
                    <asp:CalendarExtender ID="cexOfficeInspectionDate" runat="server" TargetControlID="tbxOfficeInspectionDate" Format="MM/dd/yyyy"></asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revOfficeInspectionDate" runat="server" ValidationGroup="vgrOfficeInspectionLookUp"
                        ControlToValidate="tbxOfficeInspectionDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Date of Inspection must be 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp&nbsp&nbsp&nbsp&nbsp
                </td>
            </tr>
            <tr>
            <td>
                <asp:Button ID="btnOfficeInspectionLookUp" ValidationGroup="vgrOfficeInspectionLookUp" 
                    runat="server" Text="Search" onclick="btnOfficeInspectionLookUp_Click" />
            </td>
            </tr>
        </table>
            <asp:ValidationSummary ID="vsuOfficeInspectionLookUp" ValidationGroup="vgrOfficeInspectionLookUp" runat="server" />
            <asp:GridView ID="grvOfficeInspections" Width="790px" runat="server" AutoGenerateColumns="False"
                autogenerateselectbutton="True" DataKeyNames="officeInsNo" onselectedindexchanged="grvOfficeInspections_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="officeInsNo" HeaderText="Office Inspection" ReadOnly="True" 
                        SortExpression="officeInsNo" />
                    <asp:BoundField DataField="deptName" HeaderText="Department" 
                        SortExpression="deptName" />
                    <asp:BoundField DataField="insDate" HeaderText="Date" DataFormatString="{0:M/dd/yyyy}" SortExpression="insDate" />
                    <asp:BoundField DataField="inspector" HeaderText="Inspector" 
                        SortExpression="inspector" />
                    <asp:BoundField DataField="area" HeaderText="Area" 
                        SortExpression="Area" />
                </Columns>
                <EmptyDataTemplate>No results were found.</EmptyDataTemplate>
            </asp:GridView> 
            <asp:GridView ID="grvOfficeInspectionResults" Width="790px" runat="server" AutoGenerateColumns="false"
            DataKeyNames="officeInsName" OnRowDataBound="grvOfficeInspectionResults_DataBinding">
            <Columns>
                    <asp:BoundField DataField="officeInsName" HeaderText="Item" ReadOnly="True" 
                        SortExpression="officeInsName" />

                    <asp:BoundField DataField="checkbox" HeaderText="Checked (yes/no)" 
                        SortExpression="checkbox" />

                    <asp:BoundField DataField="comments" HeaderText="Comment" 
                        SortExpression="comments" />

                </Columns>

            </asp:GridView>
        </asp:Panel> 
    </asp:Panel>

    <h3 id="courseLookUp"><asp:Image ID="imgExpandCollapseCourseLookUp" runat="server" /> Course Lookup:</h3>
    <asp:Panel ID="pnlB" CssClass="panel" runat="server">
        <asp:Button ID="btnValidCourses" ValidationGroup="vgrCourseLookUp" 
            runat="server" Text="List all Valid Courses" 
            onclick="btnCourseLookUp_Click" Width="210px" />

        <%-- Valid Courses Panel--%>
        <div id="divExpiringCourses">
        <asp:Panel ID="grvPanelValidCourses" runat="server"></asp:Panel>
        <table id="tblExpireCourses">
        <tr>
            <td class="style3">
                Enter number of months:</td>
            <td>
                <asp:TextBox ID="tbxMonthsRange" runat="server" Width="33px"></asp:TextBox>
                <asp:Button ID="btnExpiringCourses" runat="server" 
                    onclick="btnExpiringCourses_Click" Text="List all Expiring Courses" 
                    ValidationGroup="vgrExpiringCourseLookUp" Width="210px" />
                <asp:RequiredFieldValidator ID="rfvMonths" runat="server" ControlToValidate="tbxMonthsRange" 
                    ErrorMessage="You must enter a number." ValidationGroup="vgrExpiringCourseLookUp"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revMonths" runat="server" ControlToValidate="tbxMonthsRange" 
                    ErrorMessage="Numbers between (1 - 60)" ValidationExpression="^\d+$" ValidationGroup="vgrExpiringCourseLookUp"></asp:RegularExpressionValidator>
                <asp:ValidationSummary ID="vsuExpiringCourses" ValidationGroup="vgrExpiringCourseLookUp" runat="server" />
            </td>
        </tr>
    </table>
        <asp:Panel ID="grvPanelExpiringCourses" runat="server"></asp:Panel>
    </div>
    </asp:Panel>

    <h3 id="statistics"><asp:Image ID="imgExpandCollapseStatistics" runat="server" /> Statistics:</h3>
    <asp:Panel ID="pnlE" CssClass="panel" runat="server">
        <asp:Button ID="btnStatistics" runat="server" Text="Statistics Lookup" 
            onclick="btnStatistics_Click" />
    </asp:Panel>

    <h3 id="incident"><asp:Image ID="imgExpandCollapseIncident" runat="server" /> Incident Lookup:</h3>
<h3 id="incidentEmployee">Employee Information</h3>
<asp:Panel ID="pnlF" CssClass="panel" runat="server">
<asp:GridView ID="gdvTracker" runat="server" AutoGenerateColumns="False" 
    OnSelectedIndexChanged="gdvTracker_SelectedIndexChanged" OnRowCommand="gdvTracker_RowCommand" >
    <Columns>
        <asp:TemplateField HeaderText="Incident No.">
            <ItemTemplate>
                <asp:Label ID="lblIncidentNo" runat="server" Text='<%# Bind("incidentNo") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnRowViewReport" runat="server" 
                    CommandName="RowViewReport" 
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                    Text="View Report" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>No incident reports found.</EmptyDataTemplate>
</asp:GridView>
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
                    <asp:TextBox TabIndex="100" ID="tbxLastName" runat="server" ClientID="tbxLastNameClient" MaxLength="20" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweLastName" runat="server" TargetControlID="tbxLastName"
                        WatermarkCssClass="watermarked" WatermarkText="Required field"></asp:TextBoxWatermarkExtender>
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
                    <asp:TextBox TabIndex="101" ID="tbxFirstName" runat="server" MaxLength="20" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweFirstName" runat="server" TargetControlID="tbxFirstName"
                        WatermarkCssClass="watermarked" WatermarkText="Required field"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxFirstName" ErrorMessage="First name is required."></asp:RequiredFieldValidator>  
                    <asp:RegularExpressionValidator ID="revFirstName" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxFirstName" ErrorMessage="First name can only contain letters."
                        ValidationExpression="^[A-Za-z']+$" ></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
    </div>

    <div id="divEmpInfoMiddlePanel">
        <table>
            <tr>
                <td>Position:</td>
                <td>
                    <asp:DropDownList TabIndex="102" ID="ddlPositions" runat="server" OnSelectedIndexChanged="ddlPositions_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                    <asp:UpdatePanel ID="uplPosition" runat="server">
                        <ContentTemplate>
                            <asp:TextBox TabIndex="103" ID="tbxPosition" runat="server" Visible="false" MaxLength="50" ></asp:TextBox>
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
                            <asp:TextBox TabIndex="105" ID="tbxEmployer" runat="server" Visible="false" MaxLength="10" ></asp:TextBox>
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
                <td><asp:TextBox TabIndex="107" ID="tbxRoom" runat="server" MaxLength="50" ></asp:TextBox></td>
            </tr>
            <tr>
                <td>Supervisor:</td>
                <td>
                    <asp:TextBox TabIndex="108" ID="tbxSupervisor" runat="server" MaxLength="50" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweSupervisor" runat="server" TargetControlID="tbxSupervisor"
                        WatermarkCssClass="watermarked" WatermarkText="First Last"></asp:TextBoxWatermarkExtender>
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
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexStartDate" runat="server" TargetControlID="tbxStartDate" Format="M/d/yyyy" >
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revStartDate" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxStartDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Start date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>End date:</td>
                <td>
                    <asp:TextBox TabIndex="110" ID="tbxEndDate" runat="server" MaxLength="10" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="twxEndDate" runat="server" TargetControlID="tbxEndDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexEndDate" runat="server" TargetControlID="tbxEndDate" Format="M/d/yyyy" >
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revEndDate" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxEndDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="End date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
<%--                    <asp:CompareValidator ID="cpvStartEndDates" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbxEndDate" ControlToCompare="tbxStartDate" Operator="GreaterThan" Type="Date"
                        ErrorMessage="End date must be later than start date." ></asp:CompareValidator>--%>
                </td>
            </tr>
        </table>
    </div>

    <div id="divEmpInfoButtons" >
        <asp:Button TabIndex="111" ID="btnGetEmployee" runat="server" ValidationGroup="vgpEmpInfo" 
            Text="Get Employee" onclick="btnGetEmployee_Click" />
        <asp:Button TabIndex="1112" ID="btnLoadReport" runat="server" 
            Text="Load Report" onclick="btnLoadReport_Click" />
        <asp:Button TabIndex="1112" ID="btnFilterReport" runat="server" 
            Text="Search Reports" onclick="btnFilterReport_Click" />
        <p><asp:Label ID="lblResults" runat="server" Text="" Visible="false" ></asp:Label></p>
        
        
        <asp:ValidationSummary ID="vsyEmployeeInfo" runat="server" ValidationGroup="vgpEmpInfo" DisplayMode="BulletList" />
    </div>
</asp:Panel>

<h3 id="incidentA"><asp:Image ID="imgExpandCollapseIncidentA" runat="server" /> A. Incident/Accident Information <asp:Label ID="ExpandCollapseIncidentA" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlIncidentA" CssClass="panel" runat="server">
    <div id="divATopPanel">
        <table>
            <tr>
                <td>Date of Incident:</td>
                <td>
                    <asp:TextBox TabIndex="112" ID="tbx_p1_dateOfIncident" runat="server" MaxLength="10" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweDateOfIncident" runat="server" TargetControlID="tbx_p1_dateOfIncident"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexDateOfIncident" runat="server" TargetControlID="tbx_p1_dateOfIncident" Format="M/d/yyyy" >
                    </asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rfvDateOfIncident" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_dateOfIncident" ErrorMessage="Date of incident is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revDateOfIncident" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_dateOfIncident" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Date reported must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                </td>
                <td colspan="2" ><span class="spanBold" >Witness 1:</span></td>
            </tr>
            <tr>
                <td>Time of Incident:</td>
                <td>
                    <asp:TextBox TabIndex="113" ID="tbx_p1_timeOfIncident" runat="server" MaxLength="8" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweTimeOfIncident" runat="server" TargetControlID="tbx_p1_timeOfIncident"
                        WatermarkCssClass="watermarked" WatermarkText="HH:MM"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="rfvTimeOfIncident" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_timeOfIncident" ErrorMessage="Time of incident is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTimeOfIncident" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_timeOfIncident" ValidationExpression="^((([01]?[0-9]{1}|[2]{1}[0-3]{1}){1}(:[0-5]{1}[0-9]{1}){1})|(([0]?[0-9]{1}|[1]{1}[012]{1}){1}(:[0-5]{1}[0-9]{1})? ?(am|AM|pm|PM){1}))$" 
                        ErrorMessage="Time of incident must be in one of the following formats: H pm, H:MM AM, HH:MM"></asp:RegularExpressionValidator>
                </td>
                <td>Name:</td>
                <td>
                    <asp:TextBox TabIndex="117" ID="tbx_p1_witnessName1" runat="server" MaxLength="20" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweWitnessName1" runat="server" TargetControlID="tbx_p1_witnessName1"
                        WatermarkCssClass="watermarked" WatermarkText="First Last"></asp:TextBoxWatermarkExtender>
                    <asp:RegularExpressionValidator ID="revWitnessName1" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_witnessName1" ErrorMessage="Witness 1 must have a first and last name separated by a space."
                        ValidationExpression="^[A-Za-z']+ [A-Za-z']+$" ></asp:RegularExpressionValidator>
                </td>
                <td>Phone:</td>
                <td>
                    <asp:TextBox TabIndex="118" ID="tbx_p1_witnessPhone1" runat="server" MaxLength="12" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweWitnessPhone1" runat="server" TargetControlID="tbx_p1_witnessPhone1"
                        WatermarkCssClass="watermarked" WatermarkText="###-###-####"></asp:TextBoxWatermarkExtender>
                    <asp:RegularExpressionValidator ID="revWitnessPhone1" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_witnessPhone1" ValidationExpression="^[0-9]{3}-{1}[0-9]{3}-{1}[0-9]{4}$"
                        ErrorMessage="Phone number for witness 1 must be in format '###-###-####'. You can add an extension afterwards."></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Date Reported:</td>
                <td>
                    <asp:TextBox TabIndex="114" ID="tbx_p1_dateReported" runat="server" MaxLength="10" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweDateReported" runat="server" TargetControlID="tbx_p1_dateReported"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexDateReported" runat="server" TargetControlID="tbx_p1_dateReported" Format="M/d/yyyy" >
                    </asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="rfvDateReported" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_dateReported" ErrorMessage="Date reported is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revDateReported" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_dateReported" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Date reported must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <%--<asp:CompareValidator ID="cpvDateReported" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_dateReported" ControlToCompare="tbx_p1_dateOfIncident"
                        Type="Date" Operator="GreaterThanEqual"
                        ErrorMessage="Date reported must be the on or later than the date of the incident."></asp:CompareValidator>--%>
                </td>
                <td colspan="2" ><span class="spanBold" >Witness 2:</span></td>
            </tr>
            <tr>
                <td>Time Reported:</td>
                <td>
                    <asp:TextBox TabIndex="115" ID="tbx_p1_timeReported" runat="server" MaxLength="8" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweTimeReported" runat="server" TargetControlID="tbx_p1_timeReported"
                        WatermarkCssClass="watermarked" WatermarkText="HH:MM"></asp:TextBoxWatermarkExtender>
                    <asp:RequiredFieldValidator ID="rfvTimeReported" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_timeReported" ErrorMessage="Time reported is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTimeReported" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_timeReported" ValidationExpression="^((([01]?[0-9]{1}|[2]{1}[0-3]{1}){1}(:[0-5]{1}[0-9]{1}){1})|(([0]?[0-9]{1}|[1]{1}[012]{1}){1}(:[0-5]{1}[0-9]{1})? ?(am|AM|pm|PM){1}))$" 
                        ErrorMessage="Time reported must be in one of the following formats: H pm, H:MM AM, HH:MM"></asp:RegularExpressionValidator>
                </td>
                <td>Name:</td>
                <td>
                    <asp:TextBox TabIndex="119" ID="tbx_p1_witnessName2" runat="server" MaxLength="20" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweWitnessName2" runat="server" TargetControlID="tbx_p1_witnessName2"
                        WatermarkCssClass="watermarked" WatermarkText="First Last"></asp:TextBoxWatermarkExtender>
                    <asp:RegularExpressionValidator ID="rexWitnessName2" runat="server" ValidationGroup="vgpEmpInfo"
                        ControlToValidate="tbx_p1_witnessName2" ErrorMessage="Witness 2 must have a first and last name separated by a space."
                        ValidationExpression="^[A-Za-z']+ [A-Za-z']+$" ></asp:RegularExpressionValidator>
                </td>
                <td>Phone:</td>
                <td>
                    <asp:TextBox TabIndex="120" ID="tbx_p1_witnessPhone2" runat="server" MaxLength="12" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweWitnessPhone2" runat="server" TargetControlID="tbx_p1_witnessPhone2"
                        WatermarkCssClass="watermarked" WatermarkText="###-###-####"></asp:TextBoxWatermarkExtender>
                    <asp:RegularExpressionValidator ID="revWitnessPhone2" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_witnessPhone2" ValidationExpression="^[0-9]{3}-{1}[0-9]{3}-{1}[0-9]{4}$" 
                        ErrorMessage="Phone number for witness 2 must be in format '###-###-####'. You can add an extension afterwards."></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <br />
    </div>

    <div id="divABottomPanel">
        <h4>Incident Description:</h4>
        <table>
            <tr>
                <td><asp:TextBox TabIndex="116" ID="tbx_p1_incidentDesc" runat="server" CssClass="commentBoxReporting" TextMode="MultiLine" Width="770px" MaxLength="255" ></asp:TextBox></td>
            </tr>
        </table>
        <h4>Action Following Incident:</h4>
        <table>
            <tr>
	            <td><asp:CheckBox ID="cbx_p1_action_report" Text="Report Only" runat="server" /></td>
	            <td><asp:CheckBox ID="cbx_p1_action_firstAid" Text="First Aid" runat="server" /></td>
	            <td><asp:CheckBox ID="cbx_p1_action_medicalGP" Text="Medical Aid (GP / Clinic)" runat="server" /></td>
	            <td>Date:</td>
	            <td>
                    <asp:TextBox ID="tbx_p1_action_medicalGP_date" runat="server" MaxLength="10" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweMedicalGpDate" runat="server" TargetControlID="tbx_p1_action_medicalGP_date"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexMedicalGpDate" runat="server" TargetControlID="tbx_p1_action_medicalGP_date" Format="M/d/yyyy" >
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revMedicalGpDate" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_action_medicalGP_date" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Medical Aid (GP / Clinic) date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
	            <td colspan="2" ><asp:CheckBox ID="cbx_p1_action_lostTime" Text="Lost time (missed/will miss next scheduled shift due to injury)" runat="server" /></td>
	            <td><asp:CheckBox ID="cbx_p1_action_medicalER" Text="Medical Aid (ER)" runat="server" /></td>
	            <td>Date:</td>
	            <td>
                    <asp:TextBox ID="tbx_p1_action_medicalER_date" runat="server" MaxLength="10" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweMedicalErDate" runat="server" TargetControlID="tbx_p1_action_medicalER_date"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexMedicalErDate" runat="server" TargetControlID="tbx_p1_action_medicalER_date" Format="M/d/yyyy" >
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revMedicalErDate" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_action_medicalER_date" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Medical Aid (ER) date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
    </div>

    <asp:Button TabIndex="123" ID="btnCheckPanelA" runat="server" Text="Check" ValidationGroup="vgpPanelA" />

    <%--<asp:RegularExpressionValidator ID="revMedicalAidDate" runat="server" ValidationGroup="vgpPanelA"
        ControlToValidate="tbxMedicalAidDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
        ErrorMessage="Medical Aid date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
    --%>
    <asp:ValidationSummary ID="vsyPanelA" runat="server" ValidationGroup="vgpPanelA"
        DisplayMode="BulletList" />

</asp:Panel>

<h3 id="incidentB"><asp:Image ID="imgExpandCollapseIncidentB" runat="server" /> B. Nature of Injury <asp:Label ID="ExpandCollapseIncidentB" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlIncidentB" CssClass="panel" runat="server">
    <h4>Nature of Injury</h4>
    <div id="divBLeftPanel">
        <table>
            <tr><td><asp:CheckBox TabIndex="124" ID="cbx_p1_nature_no" Text="No Injury (Near Miss/ Unsafe Condition)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="124" ID="cbx_p1_nature_musculoskeletal" Text="Musculoskeletal Injyry (Strain / Sprain)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="124" ID="cbx_p1_nature_bruise" Text="Bruise / Confusion" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="124" ID="cbx_p1_nature_burn" Text="Burn (Heat or Cold)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="125" ID="cbx_p1_nature_cut" Text="Cut / Scratch / Abrasion / Laceration / Puncture (Non BBF)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="125" ID="cbx_p1_nature_puncture" Text="Puncture Wound (BBF)" runat="server" /></td></tr>
         </table>
    </div>
    <div id="divBRightPanel">
        <table>
            <tr><td><asp:CheckBox TabIndex="125" ID="cbx_p1_nature_skinIrritation" Text="Skin Irritation" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="125" ID="cbx_p1_nature_skinMucous" Text="Skin / Mucous Membrane Exposure (incl. eye)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="126" ID="cbx_p1_nature_eye" Text="Eye Irritation" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="126" ID="cbx_p1_nature_allergic" Text="Allergic Response" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="126" ID="cbx_p1_nature_psychological" Text="Psychological Trauma / Aggressive Incident" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="126" ID="cbx_p1_nature_respiratory" Text="Respiratory Irritation" runat="server" /></td></tr>
        </table>
    </div>
</asp:Panel>

<h3 id="incidentC"><asp:Image ID="imgExpandCollapseIncidentC" runat="server" /> C. Accident Investigation <asp:Label ID="ExpandCollapseIncidentC" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlIncidentC" CssClass="panel" runat="server">
    <div id="divCLeftPanel">
        <table>
            <tr><td><asp:CheckBox TabIndex="125" ID="cbx_p2_activity_no" Text="No Injury" runat="server" /></td></tr>
        </table>
    
        <h4>Patient Handling</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_repositioning" Text="Repositioning" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_transferring" Text="Transferring (incl. to seclusion)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_assistedWalking" Text="Assisted Walking" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_assistedFloor" Text="Assisted from Floor" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_fall" Text="Preventing a fall" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_holding" Text="Holding / Assisting during procedure (incl. patient restraint)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_toileting" Text="Toileting" runat="server" /></td></tr>
        </table>

        <h4>Patient Handling Details</h4>
        <table>
            <tr><td>Equipment used at time of Injury:</td></tr>
            <tr><td><asp:CheckBox TabIndex="128" ID="cbx_p2_patient_ceilingLift" Text="Ceiling Lift" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="128" ID="cbx_p2_patient_sitStandLift" Text="Sit-Stand Lift" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="128" ID="cbx_p2_patient_floorLift" Text="Floor Lift" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="128" ID="cbx_p2_patient_manualLift" Text="Manual Lift" runat="server" /></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplPatientOther" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_other" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="128" ID="tbx_p2_patient_otherSpecify" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_patient_otherSpecify_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_patient_otherSpecify" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
            <tr><td>Was adaquate assistance available?</td></tr>
            <tr><td>
                <asp:RadioButtonList ID="rbl_p2_patient_adequateAssist" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem TabIndex="129" Text="Yes" Value="1" ></asp:ListItem>
                    <asp:ListItem TabIndex="130" Text="No" Value="2" ></asp:ListItem>
                    <asp:ListItem TabIndex="131" Text="Unknown" Value="3" ></asp:ListItem>
                </asp:RadioButtonList>
            </td></tr>
            <tr><td>How many employees involved in activity at time of incident?</td></tr>
            <tr><td>
                <asp:TextBox TabIndex="132" ID="tbx_p1_numEmployeesInvolved" runat="server" ></asp:TextBox>
                <asp:CompareValidator ID="cpvEmployeesInvolved" runat="server" ValidationGroup="vgpCInvestigation"
                    ControlToValidate="tbx_p1_numEmployeesInvolved" Type="Integer" Operator="DataTypeCheck"
                    ErrorMessage="The number of employees involved must be a whole number." ></asp:CompareValidator>
            </td></tr>
        </table>
  
        <h4>Patient Care</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_washing" Text="Washing / Bathing" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_dressing" Text="Dressing" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_changing" Text="Changing" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_feeding" Text="Feeding" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_prep" Text="Prep / Dispensing Meds" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_dressingChanges" Text="Dressing Changes" runat="server" /></td></tr>
            <tr><td>
                 <asp:UpdatePanel ID="uplOtherPatientCare" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_otherPatientCare" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="132" ID="tbx_p2_activity_otherPatientCare" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_activity_otherPatientCare_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherPatientCare" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>

    </div>

    <div id="divCRightPanel">
        <h4>Sharps Handling</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="133" ID="cbx_p2_activity_recapping" Text="Re-capping" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="133" ID="cbx_p2_activity_puncture" Text="Veno Puncture / Arterio Puncture" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="133" ID="cbx_p2_activity_sharpsDisposal" Text="Sharps Disposal" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="133" ID="cbx_p2_activity_otherSharps" Text="Other Sharps / Instruments" runat="server" /></td></tr>
        </table>

        <h4>Using Material / Equipment</h4>
        <table>
            <tr><td>Material / Equipment Description (stretchers, carts, boxes, etc):</td></tr>
            <tr><td><asp:TextBox TabIndex="134" ID="tbx_p2_activity_material" runat="server" Width="350px"></asp:TextBox></td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_lift" Text="Lift / Lower" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_push" Text="Push / Pull" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_carry" Text="Carry" runat="server" /></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherMat" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherMat" Text="Other Material Description: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherMat" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_activity_otherMat_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherMat" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_driving" Text="Equipment Operation - Driving" runat="server" /></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherEquip" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherEquip" Text="Equipment Operation - Other: " runat="server" AutoPostBack="true"/>
                        <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherEquip" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_activity_otherEquip_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherEquip" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
            <tr><td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherEquipDesc" Text="Other Equipment Description: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherEquipDesc" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_activity_otherEquipDesc_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherEquipDesc" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_equipMain" Text="Equipment Maintenance" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_comp" Text="Office Work - Computer" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_nonComp" Text="Office Work - Non Computer" runat="server" /></td></tr>
        </table>

        <h4>Other</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="135" ID="cbx_p2_activity_walking" Text="Walking / Running" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="135" ID="cbx_p2_activity_bending" Text="Bending" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="135" ID="cbx_p2_activity_reading" Text="Reading" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="135" ID="cbx_p2_activity_spill" Text="Spill Cleanup" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="135" ID="cbx_p2_activity_cleaning" Text="Cleaning" runat="server" /></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplActivityOther" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_other" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="135" ID="tbx_p2_activity_other" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_activity_other_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_other" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
        
        <asp:ValidationSummary ID="vsyCInvestigation" runat="server" ValidationGroup="vgpCInvestigation" DisplayMode="BulletList" />

    </div>
</asp:Panel>

<h3 id="incidentD"><asp:Image ID="imgExpandCollapseIncidentD" runat="server" /> D. Cause <asp:Label ID="ExpandCollapseIncidentD" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlIncidentD" CssClass="panel" runat="server">
    <div id="divDLeftPanel">
        <h4>Bite</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="136" ID="cbx_p2_cause_human" Text="Human" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="136" ID="cbx_p2_cause_animal" Text="Animal / Insect" runat="server"/></td></tr>
        </table>

        <h4>BBF Exposure</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="137" ID="cbx_p2_cause_needle" Text="Needlestick" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="137" ID="cbx_p2_cause_otherSharps" Text="Other Sharps" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="137" ID="cbx_p2_cause_skin" Text="Skin/ Mucous Membrane (Splash / Spit)" runat="server"/></td></tr>
        </table>

        <h4>Ergonomic Factors</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="138" ID="cbx_p2_cause_awkwardPosture" Text="Awkward Posture" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="138" ID="cbx_p2_cause_staticPosture" Text="Static Posture" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="138" ID="cbx_p2_cause_contactStress" Text="Contact Stress" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="138" ID="cbx_p2_cause_force" Text="Force" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="138" ID="cbx_p2_cause_rep" Text="Repetition" runat="server"/></td></tr>
        </table>

        <h4>Other</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_motor" Text="Motor Vehicle Accident" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_slip" Text="Slip and Fall" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_aggression" Text="Workplace Agression" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_undetermined" Text="Cause Undetermined" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_event" Text="Traumatic Event" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_underEquip" Text="Caught In / Under / Between Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_hit" Text="Hit / Struck By / Cut by Equipment" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplCauseOther" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_other" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="139" ID="tbx_p2_cause_other" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_cause_other_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_cause_other" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    </div>
    
    <div id="divDAgressionDetailsPanel">
        <h4>Details for Workplace Aggression Incidents</h4>
        Type of Incident:
        <table>
            <tr><td><asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_verbal" Text="Verbal - threats of violence, verbal assault" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_biting" Text="Biting / Spitting" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_hitting" Text="Hitting / Kicking / Beating / Choking" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_squeezing" Text="Squeezing / Punching / Scratching / Twisting" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_assault" Text="Sexual assault" runat="server"/></td></tr>
        </table>
        Incident Involved:
        <table>
            <tr><td><asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_patient" Text="Patient / Resident" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_family" Text="Family member of Patient / Resident" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_public" Text="Other member of Public" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_worker" Text="Worker" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplAgressionOther" runat="server">
                    <ContentTemplate>
                       <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_other" Text="Other: " runat="server" AutoPostBack="true" />
                       <asp:TextBox TabIndex="141" ID="tbx_p2_cause_aggression_other" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_cause_aggression_other_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_cause_aggression_other" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    </div>

    <div id="divDRightPanel">
        <h4>Exposure</h4>
        <table>
            <tr><td>Checmical Name: <asp:TextBox ID="tbx_p2_cause_exposure_chemName" runat="server"></asp:TextBox></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemInhalation" Text="Chemical Inhalation" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemIngest" Text="Chemical Ingestion" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemContact" Text="Chemical Skin / Eye Contact" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_latex" Text="Latex" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_dust" Text="Dust / Particulate" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_disease" Text="Communicable Diseases" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_temp" Text="Temperature Extremes" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_noise" Text="Noise" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_radiation" Text="Radiation" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_elec" Text="Electricity" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_air" Text="Indoor Air Quality" runat="server"/></td></tr>
        </table>
    </div>
</asp:Panel>

<h3 id="incidentE"><asp:Image ID="imgExpandCollapseIncidentE" runat="server"/> E. Contributing Factors <asp:Label ID="ExpandCollapseIncidentE" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlIncidentE" CssClass="panel" runat="server">
    <div id="divELeftPanel" >
        <h4>Equipment / Device</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="143" ID="cbx_p2_factors_malfunction" Text="Malfunctioning" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="143" ID="cbx_p2_factors_improperUse" Text="Improper Use" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="143" ID="cbx_p2_factors_signage" Text="Improper / Inadequate signage" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="143" ID="cbx_p2_factors_notAvailable" Text="Not Available at Point of Use" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="143" ID="cbx_p2_factors_poorDesign" Text="Poor Design" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplFactorsOtherEquip" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_otherEquip" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="143" ID="tbx_p2_factors_otherEquip" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherEquip_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherEquip" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    
        <h4>Environment</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_temp" Text="Temperature" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_workplace" Text="Workplace" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_layout" Text="Layout / Design" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_limitedWorkspace" Text="Limited Workspace" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_slippery" Text="Floor Slippery / Uneven" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_lighting" Text="Lighting Inadequate" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_noise" Text="Exessive Noise" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_vent" Text="Ventilation Inadequate" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_storage" Text="Improper Storage" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherEnv" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_otherEnv" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="144" ID="tbx_p2_factors_otherEnv" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherEnv_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherEnv" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    </div>

    <div id="divEMiddlePanel">
        <h4>Work Practice</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_assessment" Text="Improper Assessment of Client / Load" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_procedure" Text="Not Follow Appropriate Procedure" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_equip" Text="Not Use Designated / Appropriate Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_conduct" Text="Conduct" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_extended" Text="Task Performed for extended periods" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_comm" Text="Communication" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_unaccustomed" Text="Unaccustomed" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherWorkPractice" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_otherWorkPractice" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="145" ID="tbx_p2_factors_otherWorkPractice" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherWorkPractice_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherWorkPractice" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>

        <h4>Patient Related Factors</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_directions" Text="Unable to Follow Directions" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_weight" Text="Inconsistent Weight Bearing" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_aggressive" Text="Patient Aggressive" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_patientResistive" Text="Patient Resistive" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_movement" Text="Made Unexpected Movement" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_confused" Text="Confused / Dementia" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_influence" Text="Under Influence of Drugs / Alcohol" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_lang" Text="Language Barriers" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherPatient" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_otherPatient" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="146" ID="tbx_p2_factors_otherPatient" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherPatient_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherPatient" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    </div>

    <div id="divERightPanel">
        <h4>Organizational / Administrative</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_alone" Text="Working Alone" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_info" Text="Inadequate Information" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_scheduling" Text="Inappropriate Scheduling" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_training" Text="Lack of Training / Education" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_appropriateEquip" Text="Lack of Appropriate Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_personal" Text="Lack of Personal Protection Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_safe" Text="Lack of Safe Work Procedures" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_perceived" Text="Perceived Time Constraints" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherOrganizational" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_otherOrganizational" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="147" ID="tbx_p2_factors_otherOrganizational" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherOrganizational_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherOrganizational" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>

        <h4>Worker</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_inexperienced" Text="Inexperienced" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_communication" Text="Communication Difficulties" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_fatigued" Text="Fatigued" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_distracted" Text="Distracted" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_preexisting" Text="Pre-existing Injury" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_sick" Text="Sick / Medicated" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherWorker" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_otherWorker" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="148" ID="tbx_p2_factors_otherWorker" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherWorker_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherWorker" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    </div>
</asp:Panel>

<h3 id="incidentF"><asp:Image ID="imgExpandCollapseIncidentF" runat="server" /> F. Corrective Action <asp:Label ID="ExpandCollapseIncidentF" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlIncidentF" CssClass="panel" runat="server">
<table>
    <tr>
        <td>
            Person assigned to corrective action:
        </td>
        <td>
            <asp:TextBox TabIndex="149" ID="tbx_p2_corrective_person" runat="server"></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweCorrectivePerson" runat="server" TargetControlID="tbx_p2_corrective_person"
                        WatermarkCssClass="watermarked" WatermarkText="First Last"></asp:TextBoxWatermarkExtender>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="vgpEmpInfo"
                ControlToValidate="tbx_p2_corrective_person" ErrorMessage="Person assigned must have a first and last name separated by a space."
                ValidationExpression="^[A-Za-z']+ [A-Za-z']+$" ></asp:RegularExpressionValidator>
        </td>
        <td>
            Date:
            <asp:TextBox TabIndex="150" ID="tbx_p2_corrective_personDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweCorrectivePersonDate" runat="server" TargetControlID="tbx_p2_corrective_personDate"
                  WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexCorrectivePersonDate" runat="server" TargetControlID="tbx_p2_corrective_personDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revPersonDate" runat="server" ValidationGroup="vgpFCorrective"
                ControlToValidate="tbx_p2_corrective_personDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Person assigned date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            Maintenance Requisition Submitted:
        </td>
        <td>
            <asp:RadioButtonList ID="rbl_p2_corrective_maintenance" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem TabIndex="151" Text="Yes" Value="1" ></asp:ListItem>
                <asp:ListItem TabIndex="152" Text="No" Value="2" ></asp:ListItem>
                <asp:ListItem TabIndex="153" Text="N/A" Value="3" ></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td>
            Date:
            <asp:TextBox TabIndex="154" ID="tbx_p2_corrective_maintenanceDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweCorrectiveMaintebanceDate" runat="server" TargetControlID="tbx_p2_corrective_maintenanceDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexMaintenanceDate" runat="server" TargetControlID="tbx_p2_corrective_maintenanceDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revMaintenanceDate" runat="server" ValidationGroup="vgpFCorrective"
                ControlToValidate="tbx_p2_corrective_maintenanceDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Maintenance date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            Corrective Action Communicated to Staff:
        </td>
        <td>
            <asp:RadioButtonList ID="rbl_p2_corrective_communicated" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem TabIndex="155" Text="Yes" Value="1" ></asp:ListItem>
                <asp:ListItem TabIndex="156" Text="No" Value="2" ></asp:ListItem>
                <asp:ListItem TabIndex="157" Text="N/A" Value="3" ></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td>
            Date:
            <asp:TextBox TabIndex="158" ID="tbx_p2_corrective_communicatedDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweCorrectiveCommDate" runat="server" TargetControlID="tbx_p2_corrective_communicatedDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexCommToStaffDate" runat="server" TargetControlID="tbx_p2_corrective_communicatedDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revCommToStaffDate" runat="server" ValidationGroup="vgpFCorrective"
                ControlToValidate="tbx_p2_corrective_communicatedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Communicated to staff date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            Any time loss subsequent to injury:
        </td>
        <td>
            <asp:RadioButtonList ID="rbl_p2_corrective_time" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem TabIndex="159" Text="Yes" Value="1" ></asp:ListItem>
                <asp:ListItem TabIndex="160" Text="No" Value="2" ></asp:ListItem>
                <asp:ListItem TabIndex="161" Text="N/A" Value="3" ></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td>
            Date:
            <asp:TextBox TabIndex="161" ID="tbx_p2_corrective_timeDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweCorrectiveTimeDate" runat="server" TargetControlID="tbx_p2_corrective_timeDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexTimeLossDate" runat="server" TargetControlID="tbx_p2_corrective_timeDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revTimeLossDate" runat="server" ValidationGroup="vgpFCorrective"
                ControlToValidate="tbx_p2_corrective_timeDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Time loss date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
        </td>
    </tr>
</table>

<asp:ValidationSummary ID="vsyFCorrectiveAction" runat="server" ValidationGroup="vgpFCorrective" DisplayMode="BulletList" />

</asp:Panel>

<h3 id="incidentG"><asp:Image ID="imgExpandCollapseIncidentG" runat="server" /> G. Relavant Corrective Actions and Follow Up <asp:Label ID="ExpandCollapseIncidentG" runat="server" Text=""></asp:Label></h3>    
<asp:Panel ID="pnlIncidentG" CssClass="panel" runat="server">
<p>Full descriptions and target completion dates for corrective actions are required.</p>
<table>
    <tr>
        <td>
            Written Safe Work Procedures Required / Updated:
            <br />
            <asp:TextBox TabIndex="162" ID="tbx_p2_corrective_written" runat="server" CssClass="commentBoxReporting"
                TextMode="MultiLine" Width="590px" ></asp:TextBox>
        </td>
        <td>
            Target Completion Date:
            <br />
            <asp:TextBox TabIndex="163" ID="tbx_p2_corrective_writtenTargetDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweWrittenTargetDate" runat="server" TargetControlID="tbx_p2_corrective_writtenTargetDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexWrittenTargetDate" runat="server" TargetControlID="tbx_p2_corrective_writtenTargetDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revWrittenTargetDate" runat="server" ValidationGroup="vgpGRelevant"
                ControlToValidate="tbx_p2_corrective_writtenTargetDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Written target date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
            <br />
            Date completed:
            <br />
            <asp:TextBox TabIndex="164" ID="tbx_p2_corrective_writtenCompletedDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweWrittenCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_writtenCompletedDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexWrittenCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_writtenCompletedDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revWrittenCompletedDate" runat="server" ValidationGroup="vgpGRelevant"
                ControlToValidate="tbx_p2_corrective_writtenCompletedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Written date completed must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            Education or Training Required / Provided for Specific Task:
            <br />
            <asp:TextBox TabIndex="165" ID="tbx_p2_corrective_education" runat="server" CssClass="commentBoxReporting"
                TextMode="MultiLine" Width="590px" ></asp:TextBox>
        </td>
        <td>
            Target Completion Date:
            <br />
            <asp:TextBox TabIndex="166" ID="tbx_p2_corrective_educationTargetDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweEducationTargetDate" runat="server" TargetControlID="tbx_p2_corrective_educationTargetDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexEducationTargetDate" runat="server" TargetControlID="tbx_p2_corrective_educationTargetDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revEducationTargetDate" runat="server" ValidationGroup="vgpGRelevant"
                ControlToValidate="tbx_p2_corrective_educationTargetDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Education target date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
            <br />
            Date completed:
            <br />
            <asp:TextBox TabIndex="167" ID="tbx_p2_corrective_educationCompletedDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweEducationCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_educationCompletedDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexEducationCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_educationCompletedDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revEducationCompletedDate" runat="server" ValidationGroup="vgpGRelevant"
                ControlToValidate="tbx_p2_corrective_educationCompletedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Education date completed must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            
            Equipment - Repair / Replace / Purchase
            <br />
            <asp:TextBox TabIndex="168" ID="tbx_p2_corrective_equipment" runat="server" CssClass="commentBoxReporting"
                TextMode="MultiLine" Width="590px" ></asp:TextBox>
        </td>
        <td>
            Target Completion Date:
            <br />
            <asp:TextBox TabIndex="169" ID="tbx_p2_corrective_equipmentTargetDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweEquipmentTargetDate" runat="server" TargetControlID="tbx_p2_corrective_equipmentTargetDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexEquipmentTargetDate" runat="server" TargetControlID="tbx_p2_corrective_equipmentTargetDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revEquipmentTargetDate" runat="server" ValidationGroup="vgpGRelevant"
                ControlToValidate="tbx_p2_corrective_equipmentTargetDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Equipment target date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
            <br />
            Date completed:
            <br />
            <asp:TextBox TabIndex="170" ID="tbx_p2_corrective_equipmentCompletedDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweEquipmentCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_equipmentCompletedDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexEquipmentCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_equipmentCompletedDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revEquipmentCompletedDate" runat="server" ValidationGroup="vgpGRelevant"
                ControlToValidate="tbx_p2_corrective_equipmentCompletedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Eqipment date completed must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td>
            Environment - Change / Modify Workstation or subsitute / Eliminate Product:
            <br />
            <asp:TextBox TabIndex="171" ID="tbx_p2_corrective_environment" runat="server" CssClass="commentBoxReporting"
                TextMode="MultiLine" Width="590px" ></asp:TextBox>
        </td>
        <td>
            Target Completion Date:
            <br />
            <asp:TextBox TabIndex="172" ID="tbx_p2_corrective_environmentTargetDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweEnvironmentTargetDate" runat="server" TargetControlID="tbx_p2_corrective_environmentTargetDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexEnvironmentTargetDate" runat="server" TargetControlID="tbx_p2_corrective_environmentTargetDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="rexEnvironmentTargetDate" runat="server" ValidationGroup="vgpGRelevant"
                ControlToValidate="tbx_p2_corrective_environmentTargetDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$" 
                ErrorMessage="Environment target date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
            <br />
            Date completed:
            <br />
            <asp:TextBox TabIndex="173" ID="tbx_p2_corrective_environmentCompletedDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="tweEnvironmentCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_environmentCompletedDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexEnvironmentCompleteDate" runat="server" TargetControlID="tbx_p2_corrective_environmentCompletedDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revEnvironmentCompletedDate" runat="server" ValidationGroup="vgpGRelevant"
                ControlToValidate="tbx_p2_corrective_environmentCompletedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$" 
                ErrorMessage="Environment date completed must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
        </td>
    </tr>



    <tr>
        <td>
            Patient/Resident Related Incidents - Lift / Transfer Re-Accessed or Care Plan / ADL Card Updated:
            <br />
            <asp:TextBox TabIndex="174" ID="tbx_p2_corrective_patient" runat="server" CssClass="commentBoxReporting"
                TextMode="MultiLine" Width="590px" ></asp:TextBox>
        </td>
        <td>
            Target Completion Date:
            <br />
            <asp:TextBox TabIndex="175" ID="tbx_p2_corrective_patientTargetDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="twePatientTargetDate" runat="server" TargetControlID="tbx_p2_corrective_patientTargetDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexPatientTargetDate" runat="server" TargetControlID="tbx_p2_corrective_patientTargetDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="rexPatientTargetDate" runat="server" ValidationGroup="vgpGRelevant"
                ControlToValidate="tbx_p2_corrective_patientTargetDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$" 
                ErrorMessage="Patient/Resident target date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
            <br />
            Date completed:
            <br />
            <asp:TextBox TabIndex="176" ID="tbx_p2_corrective_patientCompletedDate" runat="server" MaxLength="10" ></asp:TextBox>
            <asp:TextBoxWatermarkExtender ID="twePatientCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_patientCompletedDate"
                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
            <asp:CalendarExtender ID="cexPatientCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_patientCompletedDate" Format="M/d/yyyy" >
            </asp:CalendarExtender>
            <asp:RegularExpressionValidator ID="revPatientCompletedDate" runat="server" ValidationGroup="vgpGRelevant"
                ControlToValidate="tbx_p2_corrective_patientCompletedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                ErrorMessage="Patient/Resident date completed must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
        </td>
    </tr>

</table>

<asp:ValidationSummary ID="vsyGRelative" runat="server" ValidationGroup="vgpGRelevant" DisplayMode="BulletList" />

</asp:Panel>

<h3 id="incidentH"><asp:Image ID="imgExpandCollapseIncidentH" runat="server" /> H. Managers Report <asp:Label ID="ExpandCollapseIncidentH" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlIncidentH" CssClass="panel" runat="server">
<table>
    <tr><td>Do you know of any previous pain/disability in the area of the worker's present injury? If YES, please explain.</td></tr>
    <tr><td><asp:TextBox TabIndex="177" ID="tbx_p2_manager_previous" runat="server" CssClass="commentBoxReporting" TextMode="MultiLine" Width="770px" ></asp:TextBox></td></tr>
    <tr><td>Do you have any objections to the claim being accepted? If YES, please explain.</td></tr>
    <tr><td><asp:TextBox TabIndex="178" ID="tbx_p2_manager_objections" runat="server" CssClass="commentBoxReporting" TextMode="MultiLine" Width="770px" ></asp:TextBox></td></tr>
    <tr><td>Is alternative light duty or modified work available?</td></tr>
    <tr><td><asp:TextBox TabIndex="179" ID="tbx_p2_manager_alternative" runat="server" CssClass="commentBoxReporting" TextMode="MultiLine" Width="770px" ></asp:TextBox></td></tr>
    <tr>
        <td>
            Does the worker work a fixed shift rotation? If yes, please provide:
            <br />
            <table>
                <thead>
                    <tr>
                        <td></td>
                        <td>Sun</td>
                        <td>Mon</td>
                        <td>Tue</td>
                        <td>Wed</td>
                        <td>Thu</td>
                        <td>Fri</td>
                        <td>Sat</td>
                    </tr>
                </thead>
                <tr>
                    <td>Week1</td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week1_sun" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week1_mon" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week1_tue" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week1_wed" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week1_thu" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week1_fri" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week1_sat" runat="server" Width="20px" />
                    </td>
                </tr>
                <tr>
                    <td>Week2</td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week2_sun" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week2_mon" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week2_tue" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week2_wed" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week2_thu" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week2_fri" runat="server" Width="20px" />
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_p2_manager_week2_sat" runat="server" Width="20px" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>

    <asp:ValidationSummary ID="vsyHManagers" runat="server" ValidationGroup="vgpHManagers" DisplayMode="BulletList" />

</asp:Panel>
<asp:Panel ID="pnlPop" BackColor="White" Width="400px" Height="100px" CssClass="popPanel" runat="server">
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
</asp:Panel>
<asp:Button runat="server" ID="btnHidden" CssClass="hidden" />
<asp:ModalPopupExtender ID="mpePop" runat="server" PopupControlID="pnlPop" TargetControlID="btnHidden"
    DropShadow="true" BackgroundCssClass="modalBackground" />
</asp:Content>
