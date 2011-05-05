<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Training.aspx.cs" Inherits="Training_Training" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeReportInfo" runat="server" Collapsed="true"
CollapseControlID="hr3ReportInfo" ExpandControlID="hr3ReportInfo" TargetControlID="pnlReportInfo"
ImageControlID="imgExpandCollapseReportInfo" TextLabelID="ExpandCollapseA" CollapsedImage="../images/expand.jpg" 
ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeCourses" runat="server" Collapsed="false"
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
        <h2>Training and Orientation</h2>
        
        <div id="divReportInfo">
            <h3 id="hr3ReportInfo"><asp:Image ID="imgExpandCollapseReportInfo" runat="server" /> Report Info <asp:Label ID="ExpandCollapseReportInfo" runat="server" Text=""></asp:Label></h3>
            <asp:Panel ID="pnlReportInfo" CssClass="panel" runat="server">
                <div id="divRecordHeaderLeft">
                  <table>
                    <tr>
                        <td class="trainingTableWidth">
                            ID:</td>
                        <td>
                            <asp:TextBox ID="tbxId" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="trainingTableWidth">
                            Last name:</td>
                        <td>
                          <asp:TextBox ID="tbxFirstName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="trainingTableWidth">
                            First name:</td>
                        <td>
                            <asp:TextBox ID="tbxLastName" runat="server"></asp:TextBox>
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
                            <asp:DropDownList ID="ddlPositions" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="trainingTableWidth">
                            Employer:</td>
                        <td>
                            <asp:DropDownList ID="ddlEmployers" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="trainingTableWidth">
                            Department:</td>
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
                            <asp:CalendarExtender ID="cexStartDate" runat="server" TargetControlID="tbxStartDate" Format="yyyy/MM/dd" >
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                            <tr>
                        <td class="trainingTableWidth">
                            End Date:</td>
                        <td>
                            <asp:TextBox ID="tbxEndDate" runat="server"></asp:TextBox><br />
                            <asp:CalendarExtender ID="cexEndDate" runat="server" TargetControlID="tbxEndDate" Format="yyyy/MM/dd" >
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    </table>
                </div>
                <asp:Button ID="btnUpdateEmployee" runat="server" Text="Update Employee" />
                <asp:Button ID="btnGetCourses" runat="server" Text="Get Courses" />
            </asp:Panel>
        </div>

        <div id="divCourses">
            <h3 id="hr3Courses"><asp:Image ID="imgExpandCollapseCourses" runat="server" /> Courses <asp:Label ID="ExpandCollapseCourses" runat="server" Text=""></asp:Label></h3>
            <asp:Panel ID="pnlCourses" CssClass="panel" runat="server">
                <h4 id="hr4CoursesCompleted"><asp:Image ID="imgExpandCollapseCoursesCompleted" runat="server" /> Completed: <asp:Label ID="ExpandCollapseCoursesCompleted" runat="server" Text=""></asp:Label></h4>
                <asp:Panel ID="pnlCoursesCompleted" CssClass="panel" runat="server">
                    <asp:GridView ID="gdvCoursesCompleted" runat="server" ForeColor="Green">
                    </asp:GridView>
                </asp:Panel>
                <h4 id="hr4CoursesExpired"><asp:Image ID="imgExpandCollapseCoursesExpired" runat="server" /> Expired: <asp:Label ID="ExpandCollapseCoursesExpired" runat="server" Text=""></asp:Label></h4>
                <asp:Panel ID="pnlCoursesExpired" CssClass="panel" runat="server">
                    <asp:GridView ID="gdvCoursesExpired" runat="server" ForeColor="#F87217">
                    </asp:GridView>
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