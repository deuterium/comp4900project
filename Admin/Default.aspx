<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server" />
    <asp:CollapsiblePanelExtender ID="cpeUsers" runat="server" CollapseControlID="hr3Users"
        ExpandControlID="hr3Users" TargetControlID="pnlUsers" Collapsed="true" />
    <asp:CollapsiblePanelExtender ID="cpeDepartments" runat="server" CollapseControlID="hr3Departments"
        ExpandControlID="hr3Departments" TargetControlID="pnlDepartments" Collapsed="true" />
    <asp:CollapsiblePanelExtender ID="cpeRooms" runat="server" CollapseControlID="hr3Rooms"
        ExpandControlID="hr3Rooms" TargetControlID="pnlRooms" Collapsed="true" />
    <asp:CollapsiblePanelExtender ID="cpePositions" runat="server" CollapseControlID="hr3Positions"
        ExpandControlID="hr3Positions" TargetControlID="pnlPositions" Collapsed="true" />
    <asp:CollapsiblePanelExtender ID="cpeSupervisors" runat="server" CollapseControlID="hr3Supervisors"
        ExpandControlID="hr3Supervisors" TargetControlID="pnlSupervisors" Collapsed="true" />
    <asp:CollapsiblePanelExtender ID="cpeCourses" runat="server" CollapseControlID="hr3Courses"
        ExpandControlID="hr3Courses" TargetControlID="pnlCourses" Collapsed="true" />
    <div id="divContent">
        <div id="divUsers">
            <h3 id="hr3Users">
                Manage System Users</h3>
            <asp:Panel ID="pnlUsers" CssClass="panel" runat="server">
                Select a user from the System Users to edit them, or fill out the Username and Password
                fields and click "Create User" to create a new System User.
                <table id="tblUserMode">
                    <tr>
                        <td>
                            Selection Mode:
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rblUsers" runat="server" OnSelectedIndexChanged="rblUsers_SelectedIndexChanged"
                                AutoPostBack="true" RepeatDirection="Horizontal">
                                <asp:ListItem Text="Create" Value="Create" Enabled="true" />
                                <asp:ListItem Text="Edit" Value="Edit" />
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <div id="divUserManage" runat="server" visible="false">
                    <table cellspacing="5">
                        <tr>
                            <td id="tdUserSystemUsers" valign="top" runat="server" visible="false">
                                System Users:
                                <br />
                                <asp:ListBox ID="lbxUsers" runat="server" Height="100" Width="100">
                                    <asp:ListItem Text="chris" Value="chris" Enabled="true" />
                                    <asp:ListItem Text="mike" Value="mike" />
                                    <asp:ListItem Text="kalen" Value="kalen" />
                                </asp:ListBox>
                            </td>
                            <td valign="top">
                                <table>
                                    <tr>
                                        <td>
                                            Username:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbUsername" runat="server" ValidationGroup="vgrUsers"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Password:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbPassword" TextMode="Password" runat="server" ValidationGroup="vgrUsers"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td valign="top">
                                User Role:
                                <asp:RadioButtonList ID="rblUserRole" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblUserRole_SelectedIndexChanged">
                                    <asp:ListItem Text="Safety Officer" Value="rwAll" />
                                    <asp:ListItem Text="Lab Manager" Value="rInspections" />
                                </asp:RadioButtonList>
                            </td>
                            <td id="tdUserCreateLabDiv" valign="top" runat="server" visible="false">
                                <div id="divUserCreateLabManagerOption" runat="server">
                                    Lab to Manage:
                                    <br />
                                    <asp:DropDownList ID="ddlDepartments" runat="server" Width="100px">
                                    </asp:DropDownList>
                                </div>
                            </td>
                            <td valign="bottom">
                                <asp:Button ID="btnDelete" runat="server" Text="Delete User" width="100" visible="false"/>
                                <br />
                                <asp:Button ID="btnUser" runat="server" Text="Create User" width="100" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
        </div>
        <div id="divDepartments">
            <h3 id="hr3Departments">
                Manage Departments</h3>
            <asp:Panel ID="pnlDepartments" CssClass="panel" runat="server">
            </asp:Panel>
        </div>
        <div id="divRooms">
            <h3 id="hr3Rooms">
                Manage Rooms</h3>
            <asp:Panel ID="pnlRooms" CssClass="panel" runat="server">
            </asp:Panel>
        </div>
        <div id="divPositions">
            <h3 id="hr3Positions">
                Manage Positions</h3>
            <asp:Panel ID="pnlPositions" CssClass="panel" runat="server">
            </asp:Panel>
        </div>
        <div id="divSupervisors">
            <h3 id="hr3Supervisors">
                Manage Supervisors</h3>
            <asp:Panel ID="pnlSupervisors" CssClass="panel" runat="server">
            </asp:Panel>
        </div>
        <div id="divCourses">
            <h3 id="hr3Courses">
                Manage Courses</h3>
            <asp:Panel ID="pnlCourses" CssClass="panel" runat="server">
            </asp:Panel>
        </div>
    </div>
</asp:Content>
