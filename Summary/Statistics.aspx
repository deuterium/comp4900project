<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Statistics.aspx.cs" Inherits="Summary_Statistics" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Statistics</title>
    <style type="text/css">
        .style1
        {
            width: 166px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table>
            <tr>
                <td class="style1">
        Total Lab Records:  
                </td>
                <td>
                    <asp:Label ID="lblLabRecords" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Total Office Records:</td>
                <td>
                    <asp:Label ID="lblOfficeRecords" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Total Training Courses:</td>
                <td>
                    <asp:Label ID="lblTrainingCourses" runat="server" Text=""></asp:Label>
                </td>
            </tr>
                        <tr>
                <td class="style1">
                    Total Indicent Records:</td>
                <td>
                    <asp:Label ID="lblIncidents" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Total Departments:</td>
                <td>
                    <asp:Label ID="lblDepartments" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Total Employees:</td>
                <td>
                    <asp:Label ID="lblEmployeeRecords" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Total Follups Still Needed:</td>
                <td>
                    <asp:Label ID="lblFollowUpNeeded" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            </table>
    </form>
</body>
</html>
