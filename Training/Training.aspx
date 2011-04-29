<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Training.aspx.cs" Inherits="Training_Training" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style>
        div.wrapper {

        }
    
        div#divContent {
            width: 100%;
            background-color: #E0FFFF;
            margin-left: auto;
            margin-right: auto;
            height: 750px;
        }
    
        div#divReportInfo 
        {
            float: left;
            width: 250px;
            background-color: #BDEDFF;
            padding-left: 10px;
            height: 750px;
        }
    
        div#divCourses 
        {
            float: left;
            padding-left: 10px;
            padding-right: 10px;
            width: 440px;
            background-color: #ADDFFF;
            height: 750px;
        }
    
        div#divCourseDetails
        {
            float: left;
            width: 230px;
            background-color: #B7CEEC;
            padding-left: 10px;
            height: 750px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
    </asp:ToolkitScriptManager>
    
    <div id="divContent">
        <h2>Training and Orientation</h2>
        
        <div id="divReportInfo">
            <h3>Report Info</h3>
            <table id="tblReportInfoForm">
                <tr>
                    <td>
                        Id:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxId" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Last name:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxLastName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        First name:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxFirstName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Position:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlPositions" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Employer:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEmployers" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Department:
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepartments" runat="server"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                       Room: 
                    </td>
                    <td>
                        <asp:TextBox ID="tbxRoom" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Supervisor:
                    </td>
                    <td>
                        <asp:TextBox ID="tbxSupervisor" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
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
            
        </div>

        <div id="divCourses">
            <h3>Courses</h3>
            Completed:
            <asp:GridView ID="gdvCoursesCompleted" runat="server" ForeColor="Green">
            </asp:GridView>
            Expired:
            <asp:GridView ID="gdvCoursesExpired" runat="server" ForeColor="#F87217">
            </asp:GridView>
            Not Completed:
            <asp:GridView ID="gdvCoursesNotCompleted" runat="server" ForeColor="Red">
            </asp:GridView>
            Catalog:
            <asp:GridView ID="gdvCoursesCatalog" runat="server" ForeColor="Black">
            </asp:GridView>
        </div>

        <div id="divCourseDetails">
            <h3>Course Details</h3>
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
        </div>
    </div>
</asp:Content>