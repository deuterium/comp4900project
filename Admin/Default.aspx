<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
    </asp:ToolkitScriptManager>
    <asp:CollapsiblePanelExtender ID="cpeUsers" runat="server" CollapseControlID="hr3Users" 
        ExpandControlID="hr3Users" TargetControlID="pnlUsers" Collapsed="true">
    </asp:CollapsiblePanelExtender>
    <div id="divContent">
        <div id="divUsers">
            <h3 id="hr3Users">System User Administration</h3>
            <asp:Panel ID="pnlUsers" CssClass="panel" runat="server">
             test
            </asp:Panel>
        </div>
    </div>
</asp:Content>
