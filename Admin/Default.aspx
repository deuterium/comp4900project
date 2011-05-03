<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server" />
    <asp:CollapsiblePanelExtender ID="cpeUsers" runat="server" CollapseControlID="hr3Users"
        ExpandControlID="hr3Users" TargetControlID="pnlUsers" Collapsed="true" />
    <div id="divContent">
        <div id="divUsers">
            <h3 id="hr3Users">
                System User Administration</h3>
            <asp:Panel ID="pnlUsers" CssClass="panel" runat="server">
                Select a user from the System Users to edit them, or fill out the Username and Password
                fields and click "Create User" to create a new System User.
                <table id="tblUsers">
                    <tr>
                        <td>
                            Selection Mode:
                            <asp:RadioButtonList ID="rblUsers" runat="server" 
                                onselectedindexchanged="rblUsers_SelectedIndexChanged"
                                AutoPostBack="true">
                                <asp:ListItem Text="Create" Value="Create" />
                                <asp:ListItem Text="Edit" Value="Edit" />
                            </asp:RadioButtonList>
                        </td>
                        <td width="50">
                        </td>
                        <td>
                            System Users:
                            <br />
                            <asp:ListBox ID="lbxUsers" runat="server" Height="100" Width="100">
                                <asp:ListItem Text="chris" Value="chris" Enabled="true"/>
                                <asp:ListItem Text="mike" Value="mike" />
                                <asp:ListItem Text="kalen" Value="kalen" />
                            </asp:ListBox>
                        </td>
                        <td width="50">
                        </td>
                        <td>
                            <asp:Button ID="btnUser" runat="server" Text="< Create User" />
                        </td>
                        <td width="50">
                        </td>
                        <td>
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
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
