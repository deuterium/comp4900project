﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Training.aspx.cs" Inherits="Training_Training" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="frmTraining" runat="server">
    <div id="divContent" style="width: 900px; background-color: #C6DEFF; margin-left: auto; margin-right: auto;">
        <h2>Training and Orientation</h2>
        
        <div id="divReportInfo" style="background-color: #F778A1;">
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
                    </td>
                </tr>
                <tr>
                    <td>
                       End date: 
                    </td>
                    <td>
                        <asp:TextBox ID="tbxEndDate" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr> 
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
                    </td>
                </tr>
            </table>
            
        </div>

        <div id="divCourses" style="background-color: #F778A1;">
            <h3>Courses</h3>
            <asp:GridView ID="gdvCourses" runat="server">
            </asp:GridView>
        </div>

        <div id="divCourseDetails" style="background-color: #F778A1;">
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
    </form>
</body>
</html>