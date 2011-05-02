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
            <table id="tblReportInfoForm">
                <tr>
                    <td>
                        Id:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxId" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Position:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPositions" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                       Room: 
                    </td>
                    <td>
                        <asp:TextBox ID="tbxRoom" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Last name:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxLastName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Employer:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEmployers" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        Supervisor:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxSupervisor" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        First name:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxFirstName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        Department:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepartments" runat="server"></asp:DropDownList>
                    </td>
                    <td>
                        Start date:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxStartDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexStartDate" runat="server" TargetControlID="tbxStartDate" Format="yyyy/MM/dd" >
                        </asp:CalendarExtender>
                     </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>
                        End date: 
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEndDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexEndDate" runat="server" TargetControlID="tbxEndDate" Format="yyyy/MM/dd" >
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr> 
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
                    </td>
                </tr>
            </table>
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
            <table>
                <tr>
                    <td>
                        Date of Course:
                    </td>
                    <td>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        CL2 SOP Signed:
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblSigned" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem ID="limSigned" runat="server" Text="Yes" Value="Yes" />
                            <asp:ListItem ID="limNotSigned" runat="server" Text="No" Value="No" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Evaluation:
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblEvaluation" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem ID="limPassed" runat="server" Text="Yes" Value="Yes" />
                            <asp:ListItem ID="limFailed" runat="server" Text="No" Value="No" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Respirator Fit-Testing:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRespiratorFitTesting" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Spill Clean-up training:
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rblSpillCleanUpTraining" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem ID="limComplete" runat="server" Text="Yes" Value="Yes" />
                            <asp:ListItem ID="limNotComplete" runat="server" Text="No" Value="No" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>