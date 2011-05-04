<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Training.aspx.cs" Inherits="Training_Training" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeReportInfo" runat="server" Collapsed="true"
CollapseControlID="hr3ReportInfo" ExpandControlID="hr3ReportInfo" TargetControlID="pnlReportInfo">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeCourses" runat="server" Collapsed="false"
CollapseControlID="hr3Courses" ExpandControlID="hr3Courses" TargetControlID="pnlCourses">
</asp:CollapsiblePanelExtender>
    <asp:CollapsiblePanelExtender ID="cpeCoursesCompleted" runat="server" Collapsed="true"
    CollapseControlID="hr4CoursesCompleted" ExpandControlID="hr4CoursesCompleted" TargetControlID="pnlCoursesCompleted">
    </asp:CollapsiblePanelExtender>
    <asp:CollapsiblePanelExtender ID="cpeCoursesExpired" runat="server" Collapsed="true"
    CollapseControlID="hr4CoursesExpired" ExpandControlID="hr4CoursesExpired" TargetControlID="pnlCoursesExpired">
    </asp:CollapsiblePanelExtender>
    <asp:CollapsiblePanelExtender ID="cpeCoursesNotCompleted" runat="server" Collapsed="true"
    CollapseControlID="hr4CoursesNotCompleted" ExpandControlID="hr4CoursesNotCompleted" TargetControlID="pnlCoursesNotCompleted">
    </asp:CollapsiblePanelExtender>
    <asp:CollapsiblePanelExtender ID="cpeCoursesCatalog" runat="server" Collapsed="true"
    CollapseControlID="hr4CoursesCatalog" ExpandControlID="hr4CoursesCatalog" TargetControlID="pnlCoursesCatalog">
    </asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender ID="cpeCourseDetails" runat="server" Collapsed="true"
CollapseControlID="hr3CourseDetails" ExpandControlID="hr3CourseDetails" TargetControlID="pnlCourseDetails">
</asp:CollapsiblePanelExtender>

    <div id="divContent">
        <h2>Training and Orientation</h2>
        
        <div id="divReportInfo">
            <h3 id="hr3ReportInfo">Report Info</h3>
            <asp:Panel ID="pnlReportInfo" CssClass="panel" runat="server">
                <div id="divRecordHeaderLeft">
                    Id:<asp:TextBox ID="tbxId" runat="server"></asp:TextBox><br />
                    Last name:<asp:TextBox ID="tbxFirstName" runat="server"></asp:TextBox><br />
                    First name:<asp:TextBox ID="tbxLastName" runat="server"></asp:TextBox>
                </div>
                <div id="divRecordHeaderMiddle">
                    Position:<asp:DropDownList ID="ddlPositions" runat="server"></asp:DropDownList><br />
                    Employer:<asp:DropDownList ID="ddlEmployers" runat="server"></asp:DropDownList><br />
                    Department:<asp:DropDownList ID="ddlDepartments" runat="server"></asp:DropDownList><br />
                </div>
                <div id="divRecordHeaderRight">
                    Room:<asp:TextBox ID="tbxRoom" runat="server"></asp:TextBox><br />
                    Supervisor:<asp:TextBox ID="tbxSupervisor" runat="server"></asp:TextBox><br />
                    Start date:
                    <asp:TextBox ID="tbxStartDate" runat="server"></asp:TextBox><br />
                    <asp:CalendarExtender ID="cexStartDate" runat="server" TargetControlID="tbxStartDate" Format="yyyy/MM/dd" >
                    </asp:CalendarExtender>
                    End date:
                    <asp:TextBox ID="tbxEndDate" runat="server"></asp:TextBox><br />
                    <asp:CalendarExtender ID="cexEndDate" runat="server" TargetControlID="tbxEndDate" Format="yyyy/MM/dd" >
                    </asp:CalendarExtender>
                </div>
                <asp:Button ID="btnUpdateEmployee" runat="server" Text="Update Employee" />
                <asp:Button ID="btnGetCourses" runat="server" Text="Get Courses" />
            </asp:Panel>
        </div>

        <div id="divCourses">
            <h3 id="hr3Courses">Courses</h3>
            <asp:Panel ID="pnlCourses" CssClass="panel" runat="server">
                <h4 id="hr4CoursesCompleted">Completed:</h4>
                <asp:Panel ID="pnlCoursesCompleted" CssClass="panel" runat="server">
                    <asp:GridView ID="gdvCoursesCompleted" runat="server" ForeColor="Green">
                    </asp:GridView>
                </asp:Panel>
                <h4 id="hr4CoursesExpired">Expired:</h4>
                <asp:Panel ID="pnlCoursesExpired" CssClass="panel" runat="server">
                    <asp:GridView ID="gdvCoursesExpired" runat="server" ForeColor="#F87217">
                    </asp:GridView>
                </asp:Panel>
                <h4 id="hr4CoursesNotCompleted">Not Completed:</h4>
                <asp:Panel ID="pnlCoursesNotCompleted" CssClass="panel" runat="server">
                    <asp:GridView ID="gdvCoursesNotCompleted" runat="server" ForeColor="Red">
                    </asp:GridView>
                </asp:Panel>
                <h4 id="hr4CoursesCatalog">Catalog</h4>
                <asp:Panel ID="pnlCoursesCatalog" CssClass="panel" runat="server">
                    <asp:GridView ID="gdvCoursesCatalog" runat="server" ForeColor="Black">
                    </asp:GridView>
                </asp:Panel>
            </asp:Panel>
        </div>

        <div id="divCourseDetails">
            <h3 id="hr3CourseDetails">Course Details</h3>
            <asp:Panel ID="pnlCourseDetails" CssClass="panel" runat="server">
            <div id="divCourseDetails">
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