<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    Home page.
    <asp:Label ID="Label1" runat="server" Text="User: "></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Hash: "></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="Role: "></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="Dept: "></asp:Label>
</asp:Content>
