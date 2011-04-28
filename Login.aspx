<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divLogin">
        <table id="tblLogin" style="background-color: #EFF3FB; border-color: #B5C7DE; border-width: 1px;
            border-style: Solid; font-family: Verdana; font-size: 0.8em; border-collapse: collapse;
            margin-left: auto; margin-right: auto;" cellpadding="3">
            <tr>
                <td>
                    Username:
                </td>
                <td>
                    <asp:TextBox ID="tbxLoginUsername" runat="server" ValidationGroup="vgrLogin" />
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required."
                        ControlToValidate="tbxLoginUsername" Display="Dynamic" ForeColor="Red" ValidationGroup="vgrLogin">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <asp:TextBox ID="tbxLoginPassword" runat="server" TextMode="Password" ValidationGroup="vgrLogin" />
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required."
                        ControlToValidate="tbxLoginPassword" Display="Dynamic" ForeColor="Red" ValidationGroup="vgrLogin">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <asp:Button ID="btnLogin" Text="Login" runat="server" ValidationGroup="vgrLogin"
                        OnClick="btnLogin_Click" />
                </td>
            </tr>
        </table>
    </div>
    <div id="divLoginError">
        <asp:ValidationSummary ID="vsmLogin" runat="server" ValidationGroup="vgrLogin" 
            DisplayMode="List" ForeColor="Red" />
        <asp:Label ID="lblLoginError" runat="server" />
    </div>
</asp:Content>
