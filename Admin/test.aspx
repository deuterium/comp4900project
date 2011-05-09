<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="test.aspx.cs" Inherits="Admin_test" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Button ID="btnHidden" runat="server" CssClass="hidden" />
    <asp:ModalPopupExtender ID="MPE" runat="server" PopupControlID="pnlPop"
        TargetControlID="A" DropShadow="true" BackgroundCssClass="modalBackground" />
    <asp:Panel ID="pnlPop" runat="server" Width="160" Height="80" BackColor="White">
        test
        <asp:Button ID="btnOK" runat="server" Text="close" />
    </asp:Panel>
    <asp:Button Text="Button!" runat="server" ID="A" onclick="A_Click" CssClass="hidden" />

    <asp:Button Text="2!" runat="server" ID="B" ValidationGroup="r" 
        onclick="B_Click" />
</asp:Content>
