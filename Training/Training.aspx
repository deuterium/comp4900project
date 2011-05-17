<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Training.aspx.cs" Inherits="Training_Training" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 309px;
    }
</style>
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
                    
                    <asp:GridView ID="grvValidCourses" runat="server" 
                        onrowcancelingedit="grvValidCourses_RowCancelingEdit" 
                        onrowediting="grvValidCourses_RowEditing" 
                        onrowupdating="grvValidCourses_RowUpdating" AutoGenerateColumns="False" 
                        onselectedindexchanged="grvValidCourses_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowSelectButton="True" SelectText="Details" />
                            <asp:BoundField DataField="coursename" HeaderText="Training Name" 
                                ReadOnly="True" SortExpression="coursename" />
                            <asp:BoundField DataField="ttNo" HeaderText="ttNo" SortExpression="ttNo" 
                                ReadOnly="True" />
                            <asp:TemplateField HeaderText="Start Date" SortExpression="startDate">
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
                            <asp:TemplateField HeaderText="End Date" SortExpression="endDate">
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
                    
                    <asp:Panel ID="pnlBioSafety" runat="server" CssClass="panel">
                        <div>
                            <table class="style1">
                                <tr>
                                    <td class="style2">
                                        Date of Course:</td>
                                    <td>
                                        <asp:TextBox ID="tbxCourseDate" runat="server"></asp:TextBox>
                                        <asp:CalendarExtender ID="tbxCourseDate_CalendarExtender" runat="server" 
                                            Enabled="True" TargetControlID="tbxCourseDate">
                                        </asp:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        CL2 SOP Signed:</td>
                                    <td>
                                        <asp:RadioButtonList ID="rblSigned" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem ID="limSigned" runat="server" Text="Yes" Value="Yes" />
                                            <asp:ListItem ID="limNotSigned" runat="server" Text="No" Value="No" />
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        Evaluation:</td>
                                    <td>
                                        <asp:RadioButtonList ID="rblEvaluation" runat="server" 
                                            RepeatDirection="Horizontal">
                                            <asp:ListItem ID="limPassed" runat="server" Text="Pass" Value="Pass" />
                                            <asp:ListItem ID="limFailed" runat="server" Text="Fail" Value="Fail" />
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;Respirator Fit-Testing:</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;&nbsp;&nbsp; Date of fit&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="tbxDateFit" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;&nbsp; &nbsp;Type of Respirator:</td>
                                    <td>
                                        <asp:TextBox ID="tbxRespType" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;&nbsp;&nbsp; Model:</td>
                                    <td>
                                        <asp:TextBox ID="tbxRespModel" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        &nbsp;&nbsp;&nbsp; Comments:</td>
                                    <td>
                                        <asp:TextBox ID="tbxRespComment" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        Date of Spill Clean-up training:</td>
                                    <td>
                                        <asp:TextBox ID="tbxSpillDate" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style2">
                                        Certificate Number:</td>
                                    <td>
                                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            &nbsp;<asp:Button ID="Button1" runat="server" Text="Save Details" />
                            <br />
                        </div>
                    </asp:Panel>
                    
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