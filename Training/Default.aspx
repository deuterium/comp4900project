<%@ Page Title="BCCA - Training and Orientation" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Training_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script language="javascript" src="../Print.js" ></script>
    <style type="text/css">
        .style2
        {
            width: 128px;
        }
        .style4
        {
            width: 221px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="body">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
    </asp:ToolkitScriptManager>
    <asp:CollapsiblePanelExtender ID="cpeCourses" runat="server" Collapsed="true" CollapseControlID="hr3Courses"
        ExpandControlID="hr3Courses" TargetControlID="pnlCourses" CollapsedText="(Show Details)"
        ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseCourses" TextLabelID="ExpandCollapseCourses"
        CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
    </asp:CollapsiblePanelExtender>
    <asp:CollapsiblePanelExtender ID="cpeCoursesCatalog" runat="server" Collapsed="true"
        CollapsedText="(Show Details)" ExpandedText="(Hide Details)" CollapseControlID="hr3CoursesCatalog"
        ExpandControlID="hr3CoursesCatalog" TargetControlID="pnlCoursesCatalog" ImageControlID="imgExpandCollapseCoursesCatalog"
        TextLabelID="ExpandCollapseCoursesCatalog" CollapsedImage="../images/expand.jpg"
        ExpandedImage="../images/collapse.jpg">
    </asp:CollapsiblePanelExtender>
    <asp:CollapsiblePanelExtender ID="cpeEmpInfo" runat="server" Collapsed="false" Enabled="true"
        CollapseControlID="" ExpandControlID="" TargetControlID="pnlEmployeeInfo">
    </asp:CollapsiblePanelExtender>
    <div id="divContent">
            <h3 id="hr3EmployeeInfo">Employee Information</h3>
            <asp:Panel ID="pnlEmployeeInfo" CssClass="panel" runat="server">
        <div id="divEmpInfo">
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
                            <asp:TextBox TabIndex="100" ID="tbxLastName" runat="server" MaxLength="50"></asp:TextBox>
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
                                ErrorMessage="Start date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cmvStartDate" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ErrorMessage="Start date must be in the format 'MM/DD/YYYY'" OnServerValidate="cmvStartDate_ServerValidate"></asp:CustomValidator>
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
                                ErrorMessage="End date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cmvEmpDates" runat="server" ValidationGroup="vgpAllEmpInfo"
                                Display="Dynamic" ErrorMessage="End date must be later than start date." OnServerValidate="cmvEmpDates_ServerValidate"></asp:CustomValidator>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
            <div id="divEmpInfoButtons" class="summariesAndButtons">
                <asp:Button TabIndex="111" ID="btnGetEmployee" runat="server" ValidationGroup="vgpEmpName"
                    Text="Get Employee" OnClick="btnGetEmployee_Click" />
                <asp:Button TabIndex="111" ID="btnCreateEmployee" runat="server" ValidationGroup="vgpAllEmpInfo"
                    Text="Create Employee" OnClick="btnCreateEmployee_Click" />
                <asp:Button TabIndex="111" ID="btnUpdateEmployee" runat="server" ValidationGroup="vgpAllEmpInfo"
                    Text="Update  Employee" OnClick="btnUpdateEmployee_Click" />
                <asp:Button TabIndex="111" ID="btnPrint" runat="server" Text="Print Record" />
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
         
        <div id="divCourses">
            <h3 id="hr3Courses">
                <asp:Image ID="imgExpandCollapseCourses" runat="server" />
                Courses
                <asp:Label ID="ExpandCollapseCourses" runat="server" Text=""></asp:Label></h3>
            <asp:Panel ID="pnlCourses" CssClass="panel" runat="server">
                
                <table>
                    <tr>
                        <td>Results per page:</td>
                        <td>
                            <asp:TextBox ID="tbxTrainingSearchPages" runat="server" ></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="fteTrainingSearchPages" runat="server" TargetControlID="tbxTrainingSearchPages"
                                ValidChars="0123456789" />
                            (leave blank to show all results)
                        </td>
                    </tr>
                    <tr>
                        <td>Training name:</td>
                        <td>
                            <asp:TextBox ID="tbxTrainingNameFilter" runat="server"></asp:TextBox>
                            <asp:CheckBox ID="cbxTrainingNameExactMatch" Text="Exact match only" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Course date from: </td>
                        <td>
                            <asp:TextBox ID="tbxEarliestCourseDate" runat="server"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweEarliestCourseDate" runat="server" TargetControlID="tbxEarliestCourseDate"
                                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                            </asp:TextBoxWatermarkExtender>
                            <asp:CalendarExtender ID="cexEarliestCourseDate" runat="server" Enabled="True"
                                TargetControlID="tbxEarliestCourseDate" Format="M/d/yyyy">
                            </asp:CalendarExtender>
                            <asp:RegularExpressionValidator ID="revEarliestCourseDate" runat="server" ValidationGroup="vgpValidCourseSearch"
                                Display="Dynamic" ControlToValidate="tbxEarliestCourseDate"
                                ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                ErrorMessage="Earliest course date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cmvEarliestCourseDate" runat="server" ValidationGroup="vgpValidCourseSearch"
                                Display="Dynamic" ErrorMessage="Earliest course date must be in the format 'MM/DD/YYYY'" OnServerValidate="cmvEarliestCourseDate_ServerValidate"></asp:CustomValidator>
                            to 
                            <asp:TextBox ID="tbxLatestCourseDate" runat="server"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweLatestCourseDate" runat="server" TargetControlID="tbxLatestCourseDate"
                                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                            </asp:TextBoxWatermarkExtender>
                            <asp:CalendarExtender ID="cexLatestCourseDate" runat="server" Enabled="True"
                                TargetControlID="tbxLatestCourseDate" Format="M/d/yyyy">
                            </asp:CalendarExtender>
                            <asp:RegularExpressionValidator ID="revLatestCourseDate" runat="server" ValidationGroup="vgpValidCourseSearch"
                                Display="Dynamic" ControlToValidate="tbxLatestCourseDate"
                                ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                ErrorMessage="Latest course date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cmvLatestCourseDate" runat="server" ValidationGroup="vgpValidCourseSearch"
                                Display="Dynamic" ErrorMessage="" OnServerValidate="cmvLatestCourseDate_ServerValidate"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Expiry date from: </td>
                        <td>
                            <asp:TextBox ID="tbxEarliestExpiryDate" runat="server"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweEarliestExpiryDate" runat="server" TargetControlID="tbxEarliestExpiryDate"
                                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                            </asp:TextBoxWatermarkExtender>
                            <asp:CalendarExtender ID="cexEarliestExpiryDate" runat="server" Enabled="True"
                                TargetControlID="tbxEarliestExpiryDate" Format="M/d/yyyy">
                            </asp:CalendarExtender>
                            <asp:RegularExpressionValidator ID="revEarliestExpiryDate" runat="server" ValidationGroup="vgpValidCourseSearch"
                                Display="Dynamic" ControlToValidate="tbxEarliestExpiryDate"
                                ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                ErrorMessage="Earliest expiry date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cmvEarliestExpiryDate" runat="server" ValidationGroup="vgpValidCourseSearch"
                                Display="Dynamic" ErrorMessage="Earliest expiry date must be in the format 'MM/DD/YYYY'" OnServerValidate="cmvEarliestExpiryDate_ServerValidate"></asp:CustomValidator>
                            to 
                            <asp:TextBox ID="tbxLatestExpiryDate" runat="server"></asp:TextBox>
                            <asp:TextBoxWatermarkExtender ID="tweLatestExpiryDate" runat="server" TargetControlID="tbxLatestExpiryDate"
                                WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                            </asp:TextBoxWatermarkExtender>
                            <asp:CalendarExtender ID="cexLatestExpiryDate" runat="server" Enabled="True"
                                TargetControlID="tbxLatestExpiryDate" Format="M/d/yyyy">
                            </asp:CalendarExtender>
                            <asp:RegularExpressionValidator ID="revLatestExpiryDate" runat="server" ValidationGroup="vgpValidCourseSearch"
                                Display="Dynamic" ControlToValidate="tbxLatestExpiryDate"
                                ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                ErrorMessage="Latest expiry date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cmvLatestExpiryDate" runat="server" ValidationGroup="vgpValidCourseSearch"
                                Display="Dynamic" ErrorMessage="" OnServerValidate="cmvLatestExpiryDate_ServerValidate"></asp:CustomValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Show results: </td>
                        <td>
                            <asp:RadioButtonList ID="rblMostRecent" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Text="All training" Value="all"></asp:ListItem>
                                <asp:ListItem Text="Most recent training" Value="mostRecent" Selected="True" ></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><asp:CheckBox ID="cbxIncludeDeleted" Text="Include deleted courses" runat="server" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><asp:CheckBox ID="cbxIncludeValid" Text="Include valid courses" runat="server" Checked="True" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="cbxIncludeExpired" Text="Include expired courses" runat="server" Checked="True" />
                            &nbsp;(<asp:CheckBox ID="cbxHighlightExpired" Text="Highlight" runat="server" Checked="True" />)
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btnValidCourseSearch" runat="server" Text="Search" OnClick="btnValidCourseSearch_Click" ValidationGroup="vgpValidCourseSearch" />
                <asp:Button ID="btnCourseSearchReset" runat="server" Text="Reset" OnClick="btnCourseSearchReset_Click" />
                <asp:ValidationSummary ID="vsyValidCourseSearch" runat="server" DisplayMode="BulletList" ValidationGroup="vgpValidCourseSearch" />
                    
                <br /><br />

                <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>--%>
                <div id="divPrint">
                <asp:GridView ID="grvValidCourses" runat="server" Width="790px" OnRowCancelingEdit="grvValidCourses_RowCancelingEdit"
                        OnRowEditing="grvValidCourses_RowEditing" OnRowUpdating="grvValidCourses_RowUpdating" OnRowDeleting="grvValidCourses_RowDeleting"
                        AutoGenerateColumns="False" OnSelectedIndexChanged="grvValidCourses_SelectedIndexChanged" OnRowDataBound="grvValidCourses_RowDataBound"
                        OnSorting="grvValidCourses_Sorting" AllowSorting="true"
                        OnPageIndexChanging="grvValidCourses_PageIndexChanging" AllowPaging="true" EnableViewState="true" 
                        PagerSettings-PageButtonCount="10" PagerSettings-Mode="NumericFirstLast"  >
                    <HeaderStyle BackColor="#89c123" ForeColor="White" />
                    <PagerStyle CssClass="GridViewPagerStyle" />
                    <Columns>
                        <asp:CommandField ShowEditButton="True" EditText="Edit" UpdateText="Update |" />
                        <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                <asp:LinkButton ID="lbnDelete" runat="server" CausesValidation="False" CommandName="Delete"
                                    Text='<%# (Eval("active") == null ? "Delete" : ((Eval("active").ToString() == "0" ? "Restore" : "Delete"))) %>' />  
                                </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" SelectText="Details" />
                        <asp:TemplateField HeaderText="Training Name" SortExpression="coursename">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("coursename") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("coursename") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ttNo" HeaderText="#" SortExpression="ttNo" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Course Date" SortExpression="startdate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("startdate", "{0:M/d/yyyy}") %>'></asp:TextBox>
                                <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="TextBox3" Format="M/d/yyyy">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("startdate", "{0:M/d/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Expiry Date" SortExpression="enddate">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("enddate", "{0:M/d/yyy}") %>'></asp:TextBox>
                                <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" Enabled="True"
                                    TargetControlID="TextBox1" Format="M/d/yyyy">
                                </asp:CalendarExtender>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblEndDate" runat="server" Text='<%# Bind("enddate", "{0:M/d/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="expired" HeaderText="*" SortExpression="expired" ReadOnly="True" />
                    </Columns>
                    <EmptyDataTemplate>No courses found.</EmptyDataTemplate>
                </asp:GridView>
                </div>
                <%--</ContentTemplate>
                </asp:UpdatePanel>--%>

                <asp:Button ID="btnAddCrs" runat="server" Text="Add Course" OnClick="btnAddCrs_Click"
                    Visible="False" />

                    <br /><br />
                    <asp:Panel ID="pnlCrsDetails" runat="server" Width="600">
                        <div>
                            <asp:Panel ID="pnlBiosafetyInfo" runat="server" Width="600">
                                <table id="tblCrsDetails2">
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="lblBSCDate" runat="server" Text="Date of BSC Seminar"></asp:Label>
                                        </td>
                                        <td class="style2">
                                            <asp:TextBox ID="tbxBSCDate" runat="server"></asp:TextBox>
                                            <asp:CalendarExtender ID="tbxBSCDate_CalendarExtender" runat="server" Enabled="True"
                                                TargetControlID="tbxBSCDate">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="pnlGeneralCourseInfo" runat="server" Width="600">
                                <table id="tblCrsDetails">
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="lblSOPSigned" runat="server" Text="SOP Signed:"></asp:Label>
                                        </td>
                                        <td class="style2">
                                            <asp:RadioButtonList ID="rblSigned" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem ID="limSigned" runat="server" Text="Yes" Value="Yes" />
                                                <asp:ListItem ID="limNotSigned" runat="server" Text="No" Value="No" />
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="lblEval" runat="server" Text="Evaluation:"></asp:Label>
                                        </td>
                                        <td class="style2">
                                            <asp:RadioButtonList ID="rblEvaluation" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem ID="limPassed" runat="server" Text="Pass" Value="Pass" />
                                                <asp:ListItem ID="limFailed" runat="server" Text="Fail" Value="Fail" />
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="lblCert" runat="server" Text="Certificate Number:"></asp:Label>
                                        </td>
                                        <td class="style2">
                                            <asp:TextBox ID="tbxCert" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="pnlLabTrainingInfo" runat="server" Width="600">
                                <table id="tblCrsDetails1">
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="lblresp1" runat="server" Text="Respirator Fit-Testing:"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblRespFit" runat="server" Text="Date of fit:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbxDateFit" runat="server"></asp:TextBox>
                                            <asp:CalendarExtender ID="tbxDateFit_CalendarExtender" runat="server" Enabled="True"
                                                TargetControlID="tbxDateFit">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            &nbsp;&nbsp; &nbsp;<asp:Label ID="lblRespType" runat="server" Text="Type of Respirator:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbxRespType" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblRespModel" runat="server" Text="Model:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbxRespModel" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblRespComment" runat="server" Text="Comments:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbxRespComment" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="lblSpillDate" runat="server" Text="Date of Spill Clean-up training:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbxSpillDate" runat="server"></asp:TextBox>
                                            <asp:CalendarExtender ID="tbxSpillDate_CalendarExtender" runat="server" Enabled="True"
                                                TargetControlID="tbxSpillDate">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel ID="pnlRadiationTrainingInfo" runat="server" Width="600">
                                <table id="tblCrsDetails0">
                                    <tr>
                                        <td class="radiation">
                                            <asp:Label ID="lblDosSubmitted" runat="server" Text="Dosimeter request form submitted:"></asp:Label>
                                        </td>
                                        <td class="style2">
                                            <asp:RadioButtonList ID="rblDosSubmitted" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem ID="limSigned0" runat="server" Text="Yes" Value="Yes" />
                                                <asp:ListItem ID="limNotSigned0" runat="server" Text="No" Value="No" />
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="radiation">
                                            <asp:Label ID="lblDosIssued" runat="server" Text="Dosimeter issued:"></asp:Label>
                                        </td>
                                        <td class="style2">
                                            <asp:RadioButtonList ID="rblDosIssued" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem ID="limSigned1" runat="server" Text="Yes" Value="Yes" />
                                                <asp:ListItem ID="limNotSigned1" runat="server" Text="No" Value="No" />
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="radiation">
                                            <asp:Label ID="lblRingIssued" runat="server" Text="Ring issued:"></asp:Label>
                                        </td>
                                        <td class="style2">
                                            <asp:RadioButtonList ID="rblRingIssued" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem ID="limSigned2" runat="server" Text="Yes" Value="Yes" />
                                                <asp:ListItem ID="limNotSigned2" runat="server" Text="No" Value="No" />
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Button ID="btnSaveCrsDetails" runat="server" Text="Save Details" OnClick="btnSaveCrsDetails_Click" />
                            <asp:Button ID="btnCancelSaveCrsDetails" runat="server" Text="Cancel" OnClick="btnCancelSaveCrsDetails_Click" />
                            <br />
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlNewCourse" runat="server" Width="600">
                        <table>
                            <tr>
                                <td>
                                    Training Name
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlNewCrs" runat="server" OnSelectedIndexChanged="ddlNewCrs_SelectedIndexChanged"
                                        AutoPostBack="True">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Course Date
                                </td>
                                <td>
                                    <asp:TextBox ID="tbxNewCrsStart" runat="server" OnTextChanged="tbxNewCrsStart_OnTextChanged"
                                        AutoPostBack="True" ></asp:TextBox>
                                    <asp:CalendarExtender ID="tbxNewCrsStart_CalendarExtender" runat="server" Enabled="True"
                                        TargetControlID="tbxNewCrsStart">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Expiry Date
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="uplExpiryDate" runat="server" >
                                        <ContentTemplate>
                                             <asp:TextBox ID="tbxNewCrsExpiry" runat="server"></asp:TextBox>
                                             <asp:CalendarExtender ID="tbxNewCrsExpiry_CalendarExtender" runat="server" Enabled="True"
                                                 TargetControlID="tbxNewCrsExpiry">
                                             </asp:CalendarExtender>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="tbxNewCrsStart" EventName="TextChanged" />
                                            <asp:AsyncPostBackTrigger ControlID="ddlNewCrs" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnAddCrsAction" runat="server" OnClick="btnAddCrsAction_Click" Text="Add" />
                                    <asp:Button ID="btnCancelAddCrs" runat="server" OnClick="btnCancelAddCrs_Click" Text="Cancel" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </asp:Panel>


                <h3 id="hr3CoursesCatalog">
                    <asp:Image ID="imgExpandCollapseCoursesCatalog" runat="server" />
                    Catalogue
                    <asp:Label ID="ExpandCollapseCoursesCatalog" runat="server" Text=""></asp:Label></h3>
                <asp:Panel ID="pnlCoursesCatalog" CssClass="childPanel" runat="server">
                    <asp:GridView ID="gdvCoursesCatalog" runat="server" AutoGenerateColumns="False" HeaderStyle-HorizontalAlign="Left">
                        <Columns>
                            <asp:BoundField DataField="trainingNo" HeaderText="#" ReadOnly="True"
                                SortExpression="trainingNo" ItemStyle-Width="50" />
                            <asp:BoundField DataField="trainingName" HeaderText="Course Name" ReadOnly="True"
                                SortExpression="trainingName" />
                            <asp:BoundField DataField="monthsValid" HeaderText="Months Valid" ReadOnly="True"
                                SortExpression="monthsValid" ItemStyle-Width="400"  />
                        </Columns>
                        <EmptyDataTemplate>No courses found.</EmptyDataTemplate>
                    </asp:GridView>
                </asp:Panel>
        </div>

            <asp:Panel ID="pnlPop" BackColor="White" Width="400px" Height="100px" CssClass="popPanel"
                runat="server">
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
</asp:Content>
