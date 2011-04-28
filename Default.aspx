<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="DivLogin">
        <table id="TblLogin" style="background-color: #EFF3FB; border-color: #B5C7DE; border-width: 1px;
            border-style: Solid; font-family: Verdana; font-size: 0.8em; border-collapse: collapse;
            margin-left: auto; margin-right: auto;">
            <tr>
                <td>
                    Username:
                </td>
                <td>
                    <asp:TextBox ID="TbxLoginUsername" runat="server" ValidationGroup="VlgLogin" />
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <asp:TextBox ID="TbxLoginPassword" runat="server" TextMode="Password" ValidationGroup="VlgLogin" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right">
                    <asp:Button ID="BtnLogin" Text="Login" runat="server" ValidationGroup="VlgLogin" />
                </td>
            </tr>
        </table>
    </div>
    <div id="DivLoginError">
        
    </div>
</asp:Content>

