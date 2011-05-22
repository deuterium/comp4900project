<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Training_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
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

<asp:CollapsiblePanelExtender ID="cpeCourses" runat="server" Collapsed="true"
CollapseControlID="hr3Courses" ExpandControlID="hr3Courses" TargetControlID="pnlCourses" 
CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
ImageControlID="imgExpandCollapseCourses" TextLabelID="ExpandCollapseCourses" CollapsedImage="../images/expand.jpg" 
ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeCoursesCompleted" runat="server" Collapsed="true"
CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
CollapseControlID="hr3CoursesCompleted" ExpandControlID="hr3CoursesCompleted" TargetControlID="pnlCoursesCompleted"
ImageControlID="imgExpandCollapseCoursesCompleted" TextLabelID="ExpandCollapseCoursesCompleted" CollapsedImage="../images/expand.jpg" 
ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeCoursesExpired" runat="server" Collapsed="true"
CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
CollapseControlID="hr3CoursesExpired" ExpandControlID="hr3CoursesExpired" TargetControlID="pnlCoursesExpired"
ImageControlID="imgExpandCollapseCoursesExpired" TextLabelID="ExpandCollapseCoursesExpired" CollapsedImage="../images/expand.jpg" 
ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeCoursesCatalog" runat="server" Collapsed="true"
CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
CollapseControlID="hr3CoursesCatalog" ExpandControlID="hr3CoursesCatalog" TargetControlID="pnlCoursesCatalog"
ImageControlID="imgExpandCollapseCoursesCatalog" TextLabelID="ExpandCollapseCoursesCatalog" CollapsedImage="../images/expand.jpg" 
ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeEmpInfo" runat="server" Collapsed="false" Enabled="true"
CollapseControlID="" ExpandControlID="" TargetControlID="pnlEmployeeInfo">
</asp:CollapsiblePanelExtender>

        <div id="divContent">
        <div id="divReportInfo">
            <h3 id="hr3ReportInfo">Header Info:</h3>
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
                    <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ValidationGroup="vgpGetEmp" 
                        ControlToValidate="tbxLastName" ErrorMessage="Last name is required."></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revLastName" runat="server" ValidationGroup="vgpGetEmp" 
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
                    <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ValidationGroup="vgpGetEmp" 
                        ControlToValidate="tbxFirstName" ErrorMessage="First name is required."></asp:RequiredFieldValidator>  
                    <asp:CustomValidator ID="cmvEmployeeExists" runat="server" ValidationGroup="vpgGetEmpFromDb"
                        ErrorMessage="Employee not found." OnServerValidate="cmvEmployeeExists_ServerValidate"></asp:CustomValidator>
                    <asp:RegularExpressionValidator ID="revFirstName" runat="server" ValidationGroup="vgpGetEmp" 
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
                    <asp:RegularExpressionValidator ID="revSupervisor" runat="server" ValidationGroup="vgpCreateEmp"
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
                    <asp:RegularExpressionValidator ID="revStartDate" runat="server" ValidationGroup="vgpCreateEmp"
                        ControlToValidate="tbxStartDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Start date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfvStartDate" runat="server" ValidationGroup="vgpCreateEmp"
                        ControlToValidate="tbxStartDate" ErrorMessage="Start date is required."></asp:RequiredFieldValidator>
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
                    <asp:RegularExpressionValidator ID="revEndDate" runat="server" ValidationGroup="vgpCreateEmp"
                        ControlToValidate="tbxEndDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="End date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvDates" runat="server" ValidationGroup="vgpCreateEmp"
                        ErrorMessage="End date must come after start date." OnServerValidate="cmvDates_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
        </table>
    </div>

    <div id="divEmpInfoButtons" class="summariesAndButtons" >
        <asp:Button TabIndex="111" ID="btnGetEmployee" runat="server"
            Text="Get Employee" onclick="btnGetEmployee_Click" />
        <asp:Button TabIndex="111" ID="btnCreateEmployee" runat="server"
            Text="Create Employee" onclick="btnCreateEmployee_Click" />
        <asp:Button TabIndex="1112" ID="btnUpdateEmployee" runat="server"
            Text="Update  Employee" onclick="btnUpdateEmployee_Click" />
        <asp:Button TabIndex="1112" ID="btnClear" runat="server" 
            Text="Clear" onclick="btnClear_Click" />
        <asp:ValidationSummary ID="vsyGetEmp" ValidationGroup="vgpGetEmp" runat="server" DisplayMode="BulletList" />
        <asp:ValidationSummary ID="vsyGetEmpFromDb" ValidationGroup="vpgGetEmpFromDb" runat="server" DisplayMode="BulletList" />
        <asp:ValidationSummary ID="vsyCreateEmp" ValidationGroup="vgpCreateEmp" runat="server" DisplayMode="BulletList" />
    </div>
</asp:Panel>

        </div>

        <div id="divCourses">
            <h3 id="hr3Courses"><asp:Image ID="imgExpandCollapseCourses" runat="server" /> Courses <asp:Label ID="ExpandCollapseCourses" runat="server" Text=""></asp:Label></h3>
            <asp:Panel ID="pnlCourses" CssClass="parentPanel" runat="server">
                <h3 id="hr3CoursesCompleted"><asp:Image ID="imgExpandCollapseCoursesCompleted" runat="server" /> Valid: <asp:Label ID="ExpandCollapseCoursesCompleted" runat="server" Text=""></asp:Label></h3>
                <asp:Panel ID="pnlCoursesCompleted" Width="790px" runat="server">
                    
                    <asp:GridView ID="grvValidCourses" runat="server" Width="790px"
                        onrowcancelingedit="grvValidCourses_RowCancelingEdit" 
                        onrowediting="grvValidCourses_RowEditing" 
                        onrowupdating="grvValidCourses_RowUpdating" AutoGenerateColumns="False" 
                        onselectedindexchanged="grvValidCourses_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowSelectButton="True" SelectText="Details" />
                            <asp:TemplateField HeaderText="Training Name" SortExpression="coursename">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("coursename") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("coursename") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ttNo" HeaderText="#" SortExpression="ttNo" 
                                ReadOnly="True" />
                            <asp:TemplateField HeaderText="Course Date" SortExpression="startDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("startDate", "{0:M/d/yyyy}") %>'></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBox3" Format="M/d/yyyy">
                                    </asp:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("startDate", "{0:M/d/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Expiry Date" SortExpression="endDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("endDate", "{0:M/d/yyy}") %>'></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBox1" Format="M/d/yyyy">
                                    </asp:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("endDate", "{0:M/d/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnAddCrs" runat="server" Text="Add Course" 
                        onclick="btnAddCrs_Click" Visible="False" />
                    <asp:Panel ID="pnlCrsDetails" runat="server" Width="600">
                        <div>
                        <asp:Panel ID="pnlBiosafetyInfo" runat="server" Width="600">
                        
                            <table ID="tblCrsDetails2">
                                <tr>
                                    <td class="style4">
                                        <asp:Label ID="lblBSCDate" runat="server" Text="Date of BSC Seminar"></asp:Label>
                                    </td>
                                    <td class="style2">
                                        <asp:TextBox ID="tbxBSCDate" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="tbxBSCDate_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="tbxBSCDate">
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
                                        <asp:RadioButtonList ID="rblEvaluation" runat="server" 
                                            RepeatDirection="Horizontal">
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
                            
                                <table ID="tblCrsDetails1">
                                    <tr>
                                        <td class="style4">
                                            <asp:Label ID="lblresp1" runat="server" Text="Respirator Fit-Testing:"></asp:Label>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="style4">
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="lblRespFit" runat="server" Text="Date of fit:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbxDateFit" runat="server"></asp:TextBox>
                                            <asp:CalendarExtender ID="tbxDateFit_CalendarExtender" runat="server" 
                                                Enabled="True" TargetControlID="tbxDateFit">
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
                                            <asp:Label ID="lblSpillDate" runat="server" 
                                                Text="Date of Spill Clean-up training:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbxSpillDate" runat="server"></asp:TextBox>
                                            <asp:CalendarExtender ID="tbxSpillDate_CalendarExtender" runat="server" 
                                                Enabled="True" TargetControlID="tbxSpillDate">
                                            </asp:CalendarExtender>
                                        </td>
                                    </tr>
                                </table>
                            
                            </asp:Panel>
                            <asp:Panel ID="pnlRadiationTrainingInfo" runat="server" Width="600">
                            
                                <table ID="tblCrsDetails0">
                                    <tr>
                                        <td class="radiation">
                                            <asp:Label ID="lblDosSubmitted" runat="server" 
                                                Text="Dosimeter request form submitted:"></asp:Label>
                                        </td>
                                        <td class="style2">
                                            <asp:RadioButtonList ID="rblDosSubmitted" runat="server" 
                                                RepeatDirection="Horizontal">
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
                                            <asp:RadioButtonList ID="rblDosIssued" runat="server" 
                                                RepeatDirection="Horizontal">
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
                                            <asp:RadioButtonList ID="rblRingIssued" runat="server" 
                                                RepeatDirection="Horizontal">
                                                <asp:ListItem ID="limSigned2" runat="server" Text="Yes" Value="Yes" />
                                                <asp:ListItem ID="limNotSigned2" runat="server" Text="No" Value="No" />
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </table>
                            
                            </asp:Panel>
                            &nbsp;<asp:Button ID="btnSaveCrsDetails" runat="server" Text="Save Details" 
                                onclick="btnSaveCrsDetails_Click" />
                            <br />
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlNewCourse" runat="server" Width="600">
                        <table>
                            <tr>
                                <td>
                                    Training Name</td>
                                <td>
                                    <asp:DropDownList ID="ddlNewCrs" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Course Date</td>
                                <td>
                                    <asp:TextBox ID="tbxNewCrsStart" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="tbxNewCrsStart_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="tbxNewCrsStart">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Expiry Date</td>
                                <td>
                                    <asp:TextBox ID="tbxNewCrsEnd" runat="server"></asp:TextBox>
                                    <asp:CalendarExtender ID="tbxNewCrsEnd_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="tbxNewCrsEnd">
                                    </asp:CalendarExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="btnAddCrsAction" runat="server" onclick="btnAddCrsAction_Click" 
                                        Text="Add" />
                                    <asp:Button ID="btnCancelAddCrs" runat="server" onclick="btnCancelAddCrs_Click" 
                                        Text="Cancel" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                    
                </asp:Panel>
                <h3 id="hr3CoursesExpired"><asp:Image ID="imgExpandCollapseCoursesExpired" runat="server" /> Expired: <asp:Label ID="ExpandCollapseCoursesExpired" runat="server" Text=""></asp:Label></h3>
                <asp:Panel ID="pnlCoursesExpired" CssClass="childPanel" runat="server">
                    <asp:GridView ID="grvExpiredCourses" runat="server" AutoGenerateColumns="False" 
                        onrowcancelingedit="grvExpiredCourses_RowCancelingEdit" 
                        onrowediting="grvExpiredCourses_RowEditing" 
                        onrowupdating="grvExpiredCourses_RowUpdating" 
                        onselectedindexchanged="grvExpiredCourses_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="coursename" HeaderText="Training Name" 
                                SortExpression="coursename" ReadOnly="True" />
                            <asp:BoundField DataField="ttNo" HeaderText="#" ReadOnly="True" 
                                SortExpression="ttNo" />
                            <asp:TemplateField HeaderText="Course Date" SortExpression="startdate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("startdate", "{0:M/d/yyy}") %>'></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBox1">
                                    </asp:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("startdate", "{0:M/d/yyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Expiry Date" SortExpression="enddate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("enddate", "{0:M/d/yyy}") %>'></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBox2">
                                    </asp:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("enddate", "{0:M/d/yyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Panel ID="pnlExpiredCourseDetails" runat="server">
                    
                        <asp:Panel ID="pnlCrsDetails0" runat="server" Width="600">
                            <div>
                                <asp:Panel ID="pnlBiosafetyInfoExp" runat="server" Width="600">
                                    <table ID="tblCrsDetails3">
                                        <tr>
                                            <td class="style4">
                                                <asp:Label ID="lblBSCDate0" runat="server" Text="Date of BSC Seminar"></asp:Label>
                                            </td>
                                            <td class="style2">
                                                <asp:TextBox ID="tbxBSCDateExp" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                                                <asp:CalendarExtender ID="tbxBSCDate_CalendarExtender0" runat="server" 
                                                    Enabled="True" TargetControlID="tbxBSCDate">
                                                </asp:CalendarExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="pnlGeneralCourseInfoExp" runat="server" Width="600">
                                    <table ID="tblCrsDetails4">
                                        <tr>
                                            <td class="style4">
                                                <asp:Label ID="lblSOPSignedExp" runat="server" Text="SOP Signed:"></asp:Label>
                                            </td>
                                            <td class="style2">
                                                <asp:RadioButtonList ID="rblSignedExp" runat="server" Enabled="False" 
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem ID="limSigned3" runat="server" Text="Yes" Value="Yes" />
                                                    <asp:ListItem ID="limNotSigned3" runat="server" Text="No" Value="No" />
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                <asp:Label ID="lblEval0" runat="server" Text="Evaluation:"></asp:Label>
                                            </td>
                                            <td class="style2">
                                                <asp:RadioButtonList ID="rblEvaluationExp" runat="server" Enabled="False" 
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem ID="limPassed0" runat="server" Text="Pass" Value="Pass" />
                                                    <asp:ListItem ID="limFailed0" runat="server" Text="Fail" Value="Fail" />
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                <asp:Label ID="lblCert0" runat="server" Text="Certificate Number:"></asp:Label>
                                            </td>
                                            <td class="style2">
                                                <asp:TextBox ID="tbxCertExp" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="pnlLabTrainingInfoExp" runat="server" Width="600">
                                    <table ID="tblCrsDetails5">
                                        <tr>
                                            <td class="style4">
                                                <asp:Label ID="lblresp2" runat="server" Text="Respirator Fit-Testing:"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                &nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="lblRespFit0" runat="server" Text="Date of fit:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbxDateFitExp" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                                <asp:CalendarExtender ID="tbxDateFit_CalendarExtender0" runat="server" 
                                                    Enabled="True" TargetControlID="tbxDateFit">
                                                </asp:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                &nbsp;&nbsp; &nbsp;<asp:Label ID="lblRespType0" runat="server" Text="Type of Respirator:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbxRespTypeExp" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                &nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="lblRespModel0" runat="server" Text="Model:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbxRespModelExp" runat="server" Enabled="False" 
                                                    ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                &nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="lblRespComment0" runat="server" Text="Comments:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbxRespCommentExp" runat="server" Enabled="False" 
                                                    ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style4">
                                                <asp:Label ID="lblSpillDate0" runat="server" 
                                                    Text="Date of Spill Clean-up training:"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbxSpillDateExp" runat="server" Enabled="False" 
                                                    ReadOnly="True"></asp:TextBox>
                                                <asp:CalendarExtender ID="tbxSpillDate_CalendarExtender0" runat="server" 
                                                    Enabled="True" TargetControlID="tbxSpillDate">
                                                </asp:CalendarExtender>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="pnlRadiationTrainingInfoExp" runat="server" Width="600">
                                    <table ID="tblCrsDetails6">
                                        <tr>
                                            <td class="radiation">
                                                <asp:Label ID="lblDosSubmitted0" runat="server" 
                                                    Text="Dosimeter request form submitted:"></asp:Label>
                                            </td>
                                            <td class="style2">
                                                <asp:RadioButtonList ID="rblDosSubmittedExp" runat="server" Enabled="False" 
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem ID="limSigned4" runat="server" Text="Yes" Value="Yes" />
                                                    <asp:ListItem ID="limNotSigned4" runat="server" Text="No" Value="No" />
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="radiation">
                                                <asp:Label ID="lblDosIssued0" runat="server" Text="Dosimeter issued:"></asp:Label>
                                            </td>
                                            <td class="style2">
                                                <asp:RadioButtonList ID="rblDosIssuedExp" runat="server" Enabled="False" 
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem ID="limSigned5" runat="server" Text="Yes" Value="Yes" />
                                                    <asp:ListItem ID="limNotSigned5" runat="server" Text="No" Value="No" />
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="radiation">
                                                <asp:Label ID="lblRingIssued0" runat="server" Text="Ring issued:"></asp:Label>
                                            </td>
                                            <td class="style2">
                                                <asp:RadioButtonList ID="rblRingIssuedExp" runat="server" Enabled="False" 
                                                    RepeatDirection="Horizontal">
                                                    <asp:ListItem ID="limSigned6" runat="server" Text="Yes" Value="Yes" />
                                                    <asp:ListItem ID="limNotSigned6" runat="server" Text="No" Value="No" />
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                                <br />
                            </div>
                        </asp:Panel>
                    
                    </asp:Panel>
                </asp:Panel>
                <h3 id="hr3CoursesCatalog"><asp:Image ID="imgExpandCollapseCoursesCatalog" runat="server" /> Catalogue <asp:Label ID="ExpandCollapseCoursesCatalog" runat="server" Text=""></asp:Label></h3>
                <asp:Panel ID="pnlCoursesCatalog" CssClass="childPanel" runat="server">
                    <asp:GridView ID="gdvCoursesCatalog" runat="server" ForeColor="Black" Width="300"
                        AutoGenerateColumns="False" DataSourceID="EntityDataSource1">
                        <Columns>
                            <asp:BoundField DataField="trainingName" HeaderText="trainingName" 
                                ReadOnly="True" SortExpression="trainingName" />
                        </Columns>
                    </asp:GridView>
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
                        ConnectionString="name=BCCAEntities" DefaultContainerName="BCCAEntities" 
                        EnableFlattening="False" EntitySetName="TrainingCourses" 
                        Select="it.[trainingName]">
                    </asp:EntityDataSource>
                </asp:Panel>
            </asp:Panel>
        </div>

        <div id="divCourseDetails">
            

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
<asp:Button runat="server" ID="btnHidden" CssClass="hidden" />
<asp:ModalPopupExtender ID="mpePop" runat="server" PopupControlID="pnlPop" TargetControlID="btnHidden"
    DropShadow="true" BackgroundCssClass="modalBackground" />
        </div>
    </div>
</asp:Content>