<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="Admin_test" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">


    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:ModalPopupExtender ID="MPE" runat="server" OkControlID="btnOK" 
        PopupControlID="Panel1" TargetControlID="A" DropShadow=true BackgroundCssClass="modalBackground">
    </asp:ModalPopupExtender>
    <asp:Button Text="BUtton!" runat="server" onclick="Unnamed1_Click" id="A"/>
    <asp:Panel ID="Panel1" runat="server" Width="160" Height="80" BackColor="White">
        test
        <asp:Button ID="btnOK" runat="server" Text="Button" />
    </asp:Panel>
</asp:Content>

