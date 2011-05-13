<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Followup_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server" />
    <asp:CollapsiblePanelExtender ID="cpeFollowUpIncicents" runat="server" CollapseControlID="hr3Incidents"
        ExpandControlID="hr3Incidents" TargetControlID="pnlFollowUpIncicents" Collapsed="true"
        ImageControlID="imgExpandCollapseFollowUpIncicents" TextLabelID="lblExpandCollapseIncidents"
        CollapsedText="(Show Details)" ExpandedText="(Hide Details)" CollapsedImage="../images/expand.jpg"
        ExpandedImage="../images/collapse.jpg" />
    <asp:CollapsiblePanelExtender ID="cpeFollowUpLabInspection" runat="server" CollapseControlID="hr3LabInspection"
        ExpandControlID="hr3LabInspection" TargetControlID="pnlFollowUpLabInspection"
        Collapsed="true" ImageControlID="imgExpandCollapseLabInspection" TextLabelID="lblExpandCollapseLabInspection"
        CollapsedText="(Show Details)" ExpandedText="(Hide Details)" CollapsedImage="../images/expand.jpg"
        ExpandedImage="../images/collapse.jpg" />
    <asp:CollapsiblePanelExtender ID="cpeFollowUpOfficeInspection" runat="server" CollapseControlID="hr3OfficeInspection"
        ExpandControlID="hr3OfficeInspection" TargetControlID="pnlFollowUpOfficeInspection"
        Collapsed="true" ImageControlID="imgExpandOfficeInspection" TextLabelID="lblExpandOfficeInspection"
        CollapsedText="(Show Details)" ExpandedText="(Hide Details)" CollapsedImage="../images/expand.jpg"
        ExpandedImage="../images/collapse.jpg" />
    <div id="divContent">
        <div id="divFollowUpIncicents">
            <h3 id="hr3Incidents">
                <asp:Image ID="imgExpandCollapseFollowUpIncicents" runat="server" />
                Follow Up - Incident & Accident Reports
                <asp:Label ID="lblExpandCollapseIncidents" runat="server" />
            </h3>
            <asp:Panel ID="pnlFollowUpIncicents" CssClass="panel" runat="server">
                yo
            </asp:Panel>
        </div>
        <div id="divFollowUpLabInspection">
            <h3 id="hr3LabInspection">
                <asp:Image ID="imgExpandCollapseLabInspection" runat="server" />
                Follow Up - Lab Inspections
                <asp:Label ID="lblExpandCollapseLabInspection" runat="server" />
            </h3>
            <asp:Panel ID="pnlFollowUpLabInspection" CssClass="panel" runat="server">
                test
            </asp:Panel>
        </div>
        <div id="divFollowUpOfficeInspection">
            <h3 id="hr3OfficeInspection">
                <asp:Image ID="imgExpandOfficeInspection" runat="server" />
                Follow Up - Office Inspections
                <asp:Label ID="lblExpandOfficeInspection" runat="server" />
            </h3>
            <asp:Panel ID="pnlFollowUpOfficeInspection" CssClass="panel" runat="server">
                meow
            </asp:Panel>
        </div>
    </div>
</asp:Content>
