<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Training_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="body">

    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeCourses" runat="server" Collapsed="true"
CollapseControlID="hr3Courses" ExpandControlID="hr3Courses" TargetControlID="pnlCourses"
ImageControlID="imgExpandCollapseCourses" TextLabelID="ExpandCollapseCourses" CollapsedImage="../images/expand.jpg" 
ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

    <asp:CollapsiblePanelExtender ID="cpeCoursesCompleted" runat="server" Collapsed="true"
    CollapseControlID="hr4CoursesCompleted" ExpandControlID="hr4CoursesCompleted" TargetControlID="pnlCoursesCompleted"
    ImageControlID="imgExpandCollapseCoursesCompleted" TextLabelID="ExpandCollapseCoursesCompleted" CollapsedImage="../images/expand.jpg" 
    ExpandedImage="../images/collapse.jpg">
    </asp:CollapsiblePanelExtender>

    <asp:CollapsiblePanelExtender ID="cpeCoursesExpired" runat="server" Collapsed="true"
    CollapseControlID="hr4CoursesExpired" ExpandControlID="hr4CoursesExpired" TargetControlID="pnlCoursesExpired"
    ImageControlID="imgExpandCollapseCoursesExpired" TextLabelID="ExpandCollapseCoursesExpired" CollapsedImage="../images/expand.jpg" 
    ExpandedImage="../images/collapse.jpg">
    </asp:CollapsiblePanelExtender>

    <asp:CollapsiblePanelExtender ID="cpeCoursesNotCompleted" runat="server" Collapsed="true"
    CollapseControlID="hr4CoursesNotCompleted" ExpandControlID="hr4CoursesNotCompleted" TargetControlID="pnlCoursesNotCompleted"
    ImageControlID="imgExpandCollapseCoursesNotCompleted" TextLabelID="ExpandCollapseCoursesNotCompleted" CollapsedImage="../images/expand.jpg" 
    ExpandedImage="../images/collapse.jpg">
    </asp:CollapsiblePanelExtender>

    <asp:CollapsiblePanelExtender ID="cpeCoursesCatalog" runat="server" Collapsed="true"
    CollapseControlID="hr4CoursesCatalog" ExpandControlID="hr4CoursesCatalog" TargetControlID="pnlCoursesCatalog"
    ImageControlID="imgExpandCollapseCoursesCatalog" TextLabelID="ExpandCollapseCoursesCatalog" CollapsedImage="../images/expand.jpg" 
    ExpandedImage="../images/collapse.jpg">
    </asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeCourseDetails" runat="server" Collapsed="true"
CollapseControlID="hr3CourseDetails" ExpandControlID="hr3CourseDetails" TargetControlID="pnlCourseDetails"
ImageControlID="imgExpandCollapseCoursesDetails" TextLabelID="ExpandCollapseCoursesDetails" CollapsedImage="../images/expand.jpg" 
ExpandedImage="../images/collapse.jpg">
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
                    <asp:TextBox TabIndex="100" ID="tbxLastName" runat="server" ClientID="tbxLastNameClient" ></asp:TextBox>
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
                    <asp:TextBox TabIndex="110" ID="tbxEndDate" runat="server"></asp:TextBox>
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
        <asp:Button TabIndex="111" ID="btnCreateEmployee" runat="server" ValidationGroup="vgpEmpInfo" 
            Text="Create Employee" onclick="btnCreateEmployee_Click" />
        <asp:Button TabIndex="1112" ID="btnUpdateEmployee" runat="server" ValidationGroup="vgpEmpInfo" 
            Text="Update  Employee" onclick="btnUpdateEmployee_Click" />
        <asp:Button TabIndex="1112" ID="btnClear" runat="server" 
            Text="Clear" onclick="btnClear_Click" />
        <p><asp:Label ID="lblResults" runat="server" Text="" Visible="false" ></asp:Label></p>

        <asp:ValidationSummary ID="vsyEmployeeInfo" runat="server" ValidationGroup="vgpEmpInfo" DisplayMode="BulletList" />
    </div>
</asp:Panel>

        </div>

        <div id="divCourses">
            <h3 id="hr3Courses"><asp:Image ID="imgExpandCollapseCourses" runat="server" /> Courses <asp:Label ID="ExpandCollapseCourses" runat="server" Text=""></asp:Label></h3>
            <asp:Panel ID="pnlCourses" CssClass="panel" runat="server">
                <h4 id="hr4CoursesCompleted"><asp:Image ID="imgExpandCollapseCoursesCompleted" runat="server" /> Valid: <asp:Label ID="ExpandCollapseCoursesCompleted" runat="server" Text=""></asp:Label></h4>
                <asp:Panel ID="pnlCoursesCompleted" CssClass="panel" runat="server">
                    
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource1" AllowPaging="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="trainingName" HeaderText="trainingName" 
                                SortExpression="trainingName" ReadOnly="True" />
                            <asp:TemplateField HeaderText="startDate" SortExpression="startDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" 
                                        Text='<%# Bind("startDate", "{0:d}") %>'></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBox1">
                                    </asp:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("startDate", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="endDate" SortExpression="endDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" 
                                        Text='<%# Bind("endDate", "{0:d}") %>'></asp:TextBox>
                                    <asp:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBox2">
                                    </asp:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("endDate", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:comp4900t4waveturtleConnectionString %>" 
                        
                        SelectCommand="SELECT TrainingCourses.trainingName, TrainingTaken.startDate, TrainingTaken.endDate FROM TrainingTaken INNER JOIN Employee ON TrainingTaken.empNo = Employee.empNo INNER JOIN TrainingCourses ON TrainingTaken.trainingNo = TrainingCourses.trainingNo where TrainingTaken.endDate &gt;= GETDATE() OR TrainingTaken.endDate IS NULL ">
                    </asp:SqlDataSource>
                    
                    <asp:GridView ID="GridView1" runat="server">
                    </asp:GridView>
                    
                </asp:Panel>
                <h4 id="hr4CoursesExpired"><asp:Image ID="imgExpandCollapseCoursesExpired" runat="server" /> Expired: <asp:Label ID="ExpandCollapseCoursesExpired" runat="server" Text=""></asp:Label></h4>
                <asp:Panel ID="pnlCoursesExpired" CssClass="panel" runat="server">
                </asp:Panel>
                <h4 id="hr4CoursesNotCompleted"><asp:Image ID="imgExpandCollapseCoursesNotCompleted" runat="server" /> Not Completed: <asp:Label ID="ExpandCollapseCoursesNoteCompleted" runat="server" Text=""></asp:Label></h4>
                <asp:Panel ID="pnlCoursesNotCompleted" CssClass="panel" runat="server">
                    <asp:GridView ID="gdvCoursesNotCompleted" runat="server" ForeColor="Red" 
                        ClientIDMode="AutoID">
                    </asp:GridView>
                </asp:Panel>
                <h4 id="hr4CoursesCatalog"><asp:Image ID="imgExpandCollapseCoursesCatalog" runat="server" /> Catalog <asp:Label ID="ExpandCollapseCoursesCatalog" runat="server" Text=""></asp:Label></h4>
                <asp:Panel ID="pnlCoursesCatalog" CssClass="panel" runat="server">
                    <asp:GridView ID="gdvCoursesCatalog" runat="server" ForeColor="Black">
                    </asp:GridView>
                </asp:Panel>
            </asp:Panel>
        </div>

        <div id="divCourseDetails">
            <h3 id="hr3CourseDetails"><asp:Image ID="imgExpandCollapseCoursesDetails" runat="server" /> Course Details</h3>
            <asp:Panel ID="pnlCourseDetails" CssClass="panel" runat="server">
            <div>
                Date of Course:
                <br />
                CL2 SOP Signed:
                <asp:RadioButtonList ID="rblSigned" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem ID="limSigned" runat="server" Text="Yes" Value="Yes" />
                    <asp:ListItem ID="limNotSigned" runat="server" Text="No" Value="No" />
                </asp:RadioButtonList>
                Evaluation:
                <asp:RadioButtonList ID="rblEvaluation" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem ID="limPassed" runat="server" Text="Yes" Value="Yes" />
                    <asp:ListItem ID="limFailed" runat="server" Text="No" Value="No" />
                </asp:RadioButtonList>
                Respirator Fit-Testing:
                <asp:DropDownList ID="ddlRespiratorFitTesting" runat="server"></asp:DropDownList>
                <br />
                Spill Clean-up training:
                <asp:RadioButtonList ID="rblSpillCleanUpTraining" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem ID="limComplete" runat="server" Text="Yes" Value="Yes" />
                    <asp:ListItem ID="limNotComplete" runat="server" Text="No" Value="No" />
                </asp:RadioButtonList>
            </div>
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
<asp:Button runat="server" ID="btnHidden" CssClass="hidden" />
<asp:ModalPopupExtender ID="mpePop" runat="server" PopupControlID="pnlPop" TargetControlID="btnHidden"
    DropShadow="true" BackgroundCssClass="modalBackground" />
        </div>
    </div>
</asp:Content>
