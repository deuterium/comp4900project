<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Training.aspx.cs" Inherits="Training_Training" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="body">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeReportInfo" runat="server" Collapsed="false"
CollapseControlID="hr3ReportInfo" ExpandControlID="hr3ReportInfo" TargetControlID="pnlReportInfo"
ImageControlID="imgExpandCollapseReportInfo" TextLabelID="ExpandCollapseA" CollapsedImage="../images/expand.jpg" 
ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

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
            <asp:Panel ID="pnlReportInfo" CssClass="panel" runat="server">
            <div id="divRecordHeaderLeft">
                  <table>
                    <tr>
                        <td class="trainingTableWidth">
                            ID:
                        </td>
                        <td>
                            <asp:TextBox ID="tbxId" runat="server" Enabled="False" Height="22px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="trainingTableWidth">
                            Last name*:
                        </td>
                        <td>
                          <asp:TextBox ID="tbxLastName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="trainingTableWidth">
                            First name*:</td>
                        <td>
                            <asp:TextBox ID="tbxFirstName" runat="server" ></asp:TextBox>
                        </td>
                    </tr>
                  </table>
                </div>
                <div id="divRecordHeaderMiddle">
                    <table>
                    <tr>
                        <td class="trainingTableWidth">
                            Position:</td>
                        <td>
                            <asp:DropDownList ID="ddlPositions" runat="server" OnSelectedIndexChanged="ddlPositions_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:UpdatePanel ID="uplPosition" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="tbxPosition" runat="server" Visible="false"></asp:TextBox>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlPositions" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="trainingTableWidth">
                            Employer:</td>
                        <td>
                            <asp:DropDownList ID="ddlEmployers" runat="server" OnSelectedIndexChanged="ddlEmployers_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:UpdatePanel ID="uplEmployer" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="tbxEmployer" runat="server" Visible="false"></asp:TextBox>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlEmployers" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="trainingTableWidth">
                            Department:
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlDepartments" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    </table>
                </div>
                <div id="divRecordHeaderRight">
                    <table>
                    <tr>
                        <td class="trainingTableWidth">
                            Room:</td>
                        <td>
                            <asp:TextBox ID="tbxRoom" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="trainingTableWidth">
                            Supervisor:</td>
                        <td>
                            <asp:TextBox ID="tbxSupervisor" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="trainingTableWidth">
                            Start Date:</td>
                        <td>
                            <asp:TextBox ID="tbxStartDate" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="cexStartDate" runat="server" TargetControlID="tbxStartDate" Format="DD/MM/YYYY" >
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                            <tr>
                        <td class="trainingTableWidth">
                            End Date:</td>
                        <td>
                            <asp:TextBox ID="tbxEndDate" runat="server"></asp:TextBox><br />
                            <asp:CalendarExtender ID="cexEndDate" runat="server" TargetControlID="tbxEndDate" Format="DD/MM/YYYY" >
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    </table>
                </div>
                <asp:Button ID="btnGetEmployee" ValidationGroup="vgpHeader" runat="server" 
                    Text="Get Employee" onclick="btnGetEmployee_Click" />
                <asp:Button ID="btnUpdateEmployee0" runat="server" Text="Update Employee" onclick="btnUpdateEmployee_Click" 
                    />
                <asp:Button ID="btnCreateEmployee" runat="server" 
                    onclick="btnCreateEmployee_Click" Text="Create Employee" />
                <asp:Button ID="btnClear" runat="server" 
                    Text="Clear" onclick="btnClear_Click" />
            <p>
                <asp:Label ID="lblResults" runat="server" Text="" Visible="false" ></asp:Label>
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </p>

            <asp:RegularExpressionValidator ID="revFirstName" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxFirstName" ErrorMessage="First name can only contain letters."
                ValidationExpression="^[A-Za-z']+$" ></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="revLastName" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxLastName" ErrorMessage="Last name can only contain letters."
                ValidationExpression="^[A-Za-z']+$" ></asp:RegularExpressionValidator>
            
            <asp:RegularExpressionValidator ID="revRoom" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxRoom" ValidationExpression="^[0-9\-, ]+$" 
                ErrorMessage="Room can only contain digits, dashes, commas, and spaces."></asp:RegularExpressionValidator>

            <asp:RegularExpressionValidator ID="revSupervisor" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxSupervisor" ErrorMessage="Supervisor must have a first and last name separated by a space."
                ValidationExpression="^[A-Za-z']+ [A-Za-z']+$" ></asp:RegularExpressionValidator>

            <asp:RegularExpressionValidator ID="revStartDate" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxStartDate" ValidationExpression="^[0-9]{4}/{1}[0-9]{2}/{1}[0-9]{2}$" 
                ErrorMessage="Start date must be in format 'DD/MM/YYYY'"></asp:RegularExpressionValidator>
            <asp:RangeValidator ID="rgvStartDate" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxStartDate" ErrorMessage="Start date must be between 1900/01/01 and 2500/01/01."
                MaximumValue="2500/01/01" MinimumValue="1900/01/01"></asp:RangeValidator>

            <asp:RegularExpressionValidator ID="revEndDate" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxEndDate" ValidationExpression="^[0-9]{4}/{1}[0-9]{2}/{1}[0-9]{2}$" 
                ErrorMessage="End date must be in format 'DD/MM/YYYY'"></asp:RegularExpressionValidator>
            <asp:RangeValidator ID="rgvEndDate" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxEndDate" ErrorMessage="End date must be between 1900/01/01 and 2500/01/01."
                MaximumValue="2500/01/01" MinimumValue="1900/01/01"></asp:RangeValidator>
            <asp:CompareValidator ID="cpvStartEndDates" runat="server" ValidationGroup="vgpHeader"
                ControlToValidate="tbxEndDate" ControlToCompare="tbxStartDate" Operator="GreaterThan" Type="Date"
                ErrorMessage="End date must be later than start date." ></asp:CompareValidator>

            <asp:ValidationSummary ID="vsmHeader" runat="server" ValidationGroup="vgpHeader"
                DisplayMode="BulletList" />
                
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
                        onrowupdating="grvValidCourses_RowUpdating">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:TemplateField></asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    
                </asp:Panel>
                <h4 id="hr4CoursesExpired"><asp:Image ID="imgExpandCollapseCoursesExpired" runat="server" /> Expired: <asp:Label ID="ExpandCollapseCoursesExpired" runat="server" Text=""></asp:Label></h4>
                <asp:Panel ID="pnlCoursesExpired" CssClass="panel" runat="server">
                </asp:Panel>
                <h4 id="hr4CoursesNotCompleted"><asp:Image ID="imgExpandCollapseCoursesNotCompleted" runat="server" /> Not Completed: <asp:Label ID="ExpandCollapseCoursesNoteCompleted" runat="server" Text=""></asp:Label></h4>
                <asp:Panel ID="pnlCoursesNotCompleted" CssClass="panel" runat="server">
                    <asp:GridView ID="gdvCoursesNotCompleted" runat="server" ForeColor="Red">
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
        </div>
    </div>
</asp:Content>