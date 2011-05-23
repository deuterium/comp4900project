<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server" />
    <br />
    <div id="divLogin">
        <table style="margin-left: auto; margin-right: auto;">
            <tr>
                <td class="loginTableWidth">
                    Username:
                </td>
                <td>
                    <asp:TextBox ID="tbxLoginUsername" Width="100" runat="server" ValidationGroup="vgrLogin" />
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required."
                        ControlToValidate="tbxLoginUsername" Display="Dynamic" ValidationGroup="vgrLogin"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="loginTableWidth">
                    Password:
                </td>
                <td>
                    <asp:TextBox ID="tbxLoginPassword" Width="100" runat="server" TextMode="Password"
                        ValidationGroup="vgrLogin" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required."
                        ControlToValidate="tbxLoginPassword" Display="Dynamic" ValidationGroup="vgrLogin"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <asp:Button ID="btnLogin" Text="Login" runat="server" ValidationGroup="vgrLogin"
                        OnClick="btnLogin_Click" Width="105px" />
                </td>
            </tr>
        </table>
    </div>
    <div id="divLoginError" style="text-align: center;">
        <asp:ValidationSummary ID="vsmLogin" runat="server" ValidationGroup="vgrLogin" DisplayMode="List"
            ForeColor="Red" />
        <asp:UpdatePanel ID="uplLoginError" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblLoginError" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnLogin" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>
