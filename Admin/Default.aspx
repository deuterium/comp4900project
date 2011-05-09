<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server" />
    <asp:CollapsiblePanelExtender ID="cpeUsers" runat="server" CollapseControlID="hr3Users"
        ExpandControlID="hr3Users" TargetControlID="pnlUsers" Collapsed="true" />
    <asp:CollapsiblePanelExtender ID="cpeDropDowns" runat="server" CollapseControlID="hr3DropDowns"
        ExpandControlID="hr3DropDowns" TargetControlID="pnlDropDowns" Collapsed="true" />
    <asp:CollapsiblePanelExtender ID="cpeCourses" runat="server" CollapseControlID="hr3Courses"
        ExpandControlID="hr3Courses" TargetControlID="pnlCourses" Collapsed="true" />
    <asp:CollapsiblePanelExtender ID="cpeUsersDescription" runat="server" CollapseControlID="hr3Users"
        ExpandControlID="hr3Users" TargetControlID="pnlUsersDescription" Collapsed="false" />
    <asp:CollapsiblePanelExtender ID="cpeDropDownsDescription" runat="server" CollapseControlID="hr3DropDowns"
        ExpandControlID="hr3DropDowns" TargetControlID="pnlDropDownsDescription" Collapsed="false" />
    <asp:CollapsiblePanelExtender ID="cpeCoursesDescription" runat="server" CollapseControlID="hr3Courses"
        ExpandControlID="hr3Courses" TargetControlID="pnlCoursesDescription" Collapsed="false" />
    <asp:ModalPopupExtender ID="mpePop" runat="server" PopupControlID="pnlPop" TargetControlID="btnHidden"
        DropShadow="true" BackgroundCssClass="modalBackground" />
    <asp:EntityDataSource ID="edsRoles" runat="server" ConnectionString="name=BCCAEntities"
        DefaultContainerName="BCCAEntities" EnableFlattening="False" EntitySetName="Roles" />
    <asp:EntityDataSource ID="edsDepartments" runat="server" ConnectionString="name=BCCAEntities"
        DefaultContainerName="BCCAEntities" EnableFlattening="False" EntitySetName="Departments" />
    <asp:EntityDataSource ID="edsUsers" runat="server" ConnectionString="name=BCCAEntities"
        DefaultContainerName="BCCAEntities" EnableFlattening="False" EntitySetName="Users"
        Select="it.[userNo], it.[userName]">
    </asp:EntityDataSource>
    <div id="divContent">
        <div id="divUsers">
            <h3 id="hr3Users">
                Manage System Users</h3>
            <asp:Panel ID="pnlUsersDescription" runat="server">
                This section allows management of system user accounts which can access this web
                application. In this section you can create new users and edit existing user's credentials
                and account settings.
            </asp:Panel>
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
                                <asp:ListItem Text="Create" Value="Create" Selected="true" />
                                <asp:ListItem Text="Edit" Value="Edit" />
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <table cellspacing="5">
                    <tr>
                        <td id="tdUserSystemUsers" valign="top" runat="server" visible="false">
                            System Users:
                            <asp:RequiredFieldValidator ID="rfvUserDelete" runat="server" ErrorMessage="Select a user to delete"
                                ValidationGroup="vgrUserDelete" ControlToValidate="lbxUsers" />
                            <br />
                            <asp:ListBox ID="lbxUsers" runat="server" Height="100px" Width="100px" DataSourceID="edsUsers"
                                DataTextField="userName" DataValueField="userNo" AutoPostBack="True" 
                                onselectedindexchanged="lbxUsers_SelectedIndexChanged"></asp:ListBox>
                        </td>
                        <td valign="top">
                            <table>
                                <tr>
                                    <td>
                                        Username:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbUsername" runat="server" />
                                        <asp:TextBox ID="tbUsernameID" runat="server" CssClass="hidden" />
                                        <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username required"
                                            ValidationGroup="vgrUserNew" ControlToValidate="tbUsername" Display="Static" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Password:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbPassword" runat="server" onclick="this.value ='';" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password required"
                                            ValidationGroup="vgrUserNew" ControlToValidate="tbPassword" Display="Static" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" runat="server" id="tdUserCreateRoleDiv">
                            User Role:
                            <asp:RequiredFieldValidator ID="rfvUserRole" runat="server" ErrorMessage="Role required"
                                ControlToValidate="rblUserRole" Display="Dynamic" ValidationGroup="vgrUserNew" />
                            <asp:RadioButtonList ID="rblUserRole" runat="server" AutoPostBack="True" OnSelectedIndexChanged="rblUserRole_SelectedIndexChanged"
                                DataSourceID="edsRoles" DataTextField="role1" DataValueField="roleNo">
                            </asp:RadioButtonList>
                        </td>
                        <td id="tdUserCreateLabDiv" valign="top" runat="server" visible="false">
                            <div id="divUserCreateLabManagerOption" runat="server">
                                Lab to Manage:
                                <br />
                                <asp:DropDownList ID="ddlDepartments" runat="server" Width="100px" DataSourceID="edsDepartments"
                                    DataTextField="deptName" DataValueField="deptNo" AppendDataBoundItems="true">
                                    <asp:ListItem Text="" Value="" />
                                </asp:DropDownList>
                            </div>
                        </td>
                        <td valign="bottom">
                            <asp:CustomValidator ID="cvlUserNew" runat="server" ErrorMessage="Username already exists"
                                ForeColor="Red" OnServerValidate="cvlUserNew_ServerValidate" ValidationGroup="vgrUserNew"
                                Display="None"></asp:CustomValidator>
                            <br />
                            <asp:Button ID="btnUserDelete" runat="server" Text="Delete User" Width="120" Visible="false" 
                            ValidationGroup="vgrUserDelete" onclick="btnUserDelete_Click" />
                            <br />
                            <asp:Button ID="btnUserNew" runat="server" Text="Create User" Width="120" OnClick="btnUserNew_Click"
                            ValidationGroup="vgrUserNew" />
                        </td>
                        <td>
                            <asp:ValidationSummary ID="vsmUserNew" runat="server" ValidationGroup="vgrUserNew" />
                            <asp:ValidationSummary ID="vsmUserDelete" runat="server" ValidationGroup="vgrUserDelete" />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblUserError" runat="server" Visible="false" ForeColor="Red" />
            </asp:Panel>
        </div>
        <div id="divDropDowns">
            <h3 id="hr3DropDowns">
                Manage System Dropdown Menus</h3>
            <asp:Panel ID="pnlDropDownsDescription" runat="server">
                This section allows for the addition and removal of Departments, Rooms, Positions,
                and Supervisors in the default dropdown menus of this web application.
            </asp:Panel>
            <asp:Panel ID="pnlDropDowns" CssClass="panel" runat="server">
                <table>
                    <tr>
                        <td>
                            Item to Edit:
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rblDropDownEdit" runat="server" RepeatDirection="Horizontal"
                                AutoPostBack="True" OnSelectedIndexChanged="rblDropDownEdit_SelectedIndexChanged">
                                <asp:ListItem Text="Departments" Value="Departments" Selected="true" />
                                <asp:ListItem Text="Rooms" Value="Rooms" />
                                <asp:ListItem Text="Positions" Value="Positions" />
                                <asp:ListItem Text="Supervisors" Value="Supervisors" />
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                <table cellspacing="5">
                    <tr>
                        <td>
                            <asp:Label ID="lblDropDownsDelete" runat="server" Text="Departments in system:"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvDropDownsDelete" runat="server" ErrorMessage="Selection of item needed to delete"
                                ControlToValidate="lbDropDowns" ValidationGroup="vgrDropDownsDelete" Display="Dynamic" />
                            <br />
                            <asp:ListBox ID="lbDropDowns" runat="server" Width="180" Height="120" ValidationGroup="vgrDropDownsDelete" />
                        </td>
                        <td>
                            <asp:Button ID="btnDropDownsNew" runat="server" Text="< Add Department" Width="140"
                                ValidationGroup="vgrDropDownsNew" />
                            <br />
                            <asp:Button ID="btnDropDownsDelete" runat="server" Text="> Delete Department" Width="140"
                                ValidationGroup="vgrDropDownsDelete" />
                        </td>
                        <td width="140">
                            <asp:Label ID="lblDropDownsNew" runat="server" Text="Name of Department to add:"></asp:Label>
                            <asp:RequiredFieldValidator ID="rfvDropDownsNew" runat="server" ErrorMessage="Name of new item required to create new"
                                ValidationGroup="vgrDropDownsNew" ControlToValidate="tbxDropDownsNew" Display="Dynamic" />
                            <br />
                            <asp:TextBox ID="tbxDropDownsNew" runat="server" Width="160" />
                        </td>
                        <td>
                            <asp:ValidationSummary ID="vsmDropDownsNew" runat="server" ValidationGroup="vgrDropDownsNew" />
                            <asp:ValidationSummary ID="vsmDropDownsDelete" runat="server" ValidationGroup="vgrDropDownsDelete" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
        <div id="divCourses">
            <h3 id="hr3Courses">
                Manage Courses</h3>
            <asp:Panel ID="pnlCoursesDescription" runat="server">
                This section allows for the addition of courses that will show up in the Safety
                and Training form of this web application.
            </asp:Panel>
            <asp:Panel ID="pnlCourses" CssClass="panel" runat="server">
            </asp:Panel>
        </div>
        <asp:Panel ID="pnlPop" BackColor="White" CssClass="popPanel" runat="server">
            <table width="100%" cellpadding="5">
                <tr>
                    <td>
                        <asp:Label ID="lblPnlPop" runat="server" Text="Test panel"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnPnlPopClose" runat="server" Text="Close" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Button runat="server" ID="btnHidden" CssClass="hidden" />
    </div>
</asp:Content>
