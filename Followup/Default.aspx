<%@ Page  Title="BCCA - Followup" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Followup_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="body" runat="Server">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server" />
    <asp:CollapsiblePanelExtender ID="cpeFollowupIncicents" runat="server" CollapseControlID="hr3Incidents"
        ExpandControlID="hr3Incidents" TargetControlID="pnlFollowupIncicents" Collapsed="true"
        ImageControlID="imgExpandCollapseFollowupIncicents" TextLabelID="lblExpandCollapseIncidents"
        CollapsedText="(Show Details)" ExpandedText="(Hide Details)" CollapsedImage="../images/expand.jpg"
        ExpandedImage="../images/collapse.jpg" />
    <asp:CollapsiblePanelExtender ID="cpeFollowupLabInspection" runat="server" CollapseControlID="hr3LabInspection"
        ExpandControlID="hr3LabInspection" TargetControlID="pnlFollowupLabInspection"
        Collapsed="true" ImageControlID="imgExpandCollapseLabInspection" TextLabelID="lblExpandCollapseLabInspection"
        CollapsedText="(Show Details)" ExpandedText="(Hide Details)" CollapsedImage="../images/expand.jpg"
        ExpandedImage="../images/collapse.jpg" />
    <asp:CollapsiblePanelExtender ID="cpeFollowupOfficeInspection" runat="server" CollapseControlID="hr3OfficeInspection"
        ExpandControlID="hr3OfficeInspection" TargetControlID="pnlFollowupOfficeInspection"
        Collapsed="true" ImageControlID="imgExpandOfficeInspection" TextLabelID="lblExpandOfficeInspection"
        CollapsedText="(Show Details)" ExpandedText="(Hide Details)" CollapsedImage="../images/expand.jpg"
        ExpandedImage="../images/collapse.jpg" />
    <asp:CollapsiblePanelExtender ID="cpeFollowupIncicentsCount" runat="server" CollapseControlID="hr3Incidents"
        ExpandControlID="hr3Incidents" TargetControlID="pnlFollowupIncicentsCount" />
    <asp:CollapsiblePanelExtender ID="cpeFollowupLabInspectionCount" runat="server" CollapseControlID="hr3LabInspection"
        ExpandControlID="hr3LabInspection" TargetControlID="pnlFollowupLabInspectionCount" />
    <asp:CollapsiblePanelExtender ID="cpeFollowupOfficeInspectionCount" runat="server" CollapseControlID="hr3OfficeInspection"
        ExpandControlID="hr3OfficeInspection" TargetControlID="pnlFollowupOfficeInspectionCount" />
    <div id="divContent">
        <div id="divFollowupIncicents">
            <h3 id="hr3Incidents">
                <asp:Image ID="imgExpandCollapseFollowupIncicents" runat="server" />
                Follow Up - Incident & Accident Reports
                <asp:Label ID="lblExpandCollapseIncidents" runat="server" />
            </h3>
            <asp:Panel ID="pnlFollowupIncicentsCount" runat="server">
                Incident/Accident Reports needing follow up:
                <asp:Label ID="lblFollowupIncicentsCount" Text="0" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pnlFollowupIncicents" CssClass="panel" runat="server">
                <asp:GridView ID="gvwFollowupIncidents" runat="server" AutoGenerateColumns="False"
                    OnSelectedIndexChanged="gvwFollowupIncidents_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField SelectText="Followup" ButtonType="Link" ShowSelectButton="True" />
                        <asp:BoundField DataField="incNo" HeaderText="Report Number" ReadOnly="True" SortExpression="incNo" />
                        <asp:BoundField DataField="incDate" HeaderText="Date of Incident" ReadOnly="True"
                            SortExpression="incDate" />
                        <asp:BoundField DataField="incEmpName" HeaderText="Incident Employee" ReadOnly="True"
                            SortExpression="incEmpName" />
                        <asp:BoundField DataField="incSubmitter" HeaderText="Incident Submitted by" ReadOnly="True"
                            SortExpression="incSubmitter" />
                    </Columns>
                    <EmptyDataTemplate>
                        No Incident/Accident reports currently need following up.</EmptyDataTemplate>
                </asp:GridView>
            </asp:Panel>
        </div>
        <div id="divFollowupLabInspection">
            <h3 id="hr3LabInspection">
                <asp:Image ID="imgExpandCollapseLabInspection" runat="server" />
                Follow Up - Lab Inspections
                <asp:Label ID="lblExpandCollapseLabInspection" runat="server" />
            </h3>
            <asp:Panel ID="pnlFollowupLabInspectionCount" runat="server">
                Lab Inspections needing follow up:
                <asp:Label ID="lblFollowupLabInspectionCount" Text="0" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pnlFollowupLabInspection" CssClass="panel" runat="server">
                <asp:GridView ID="gvwFollowupLabInspection" runat="server" AutoGenerateColumns="False"
                    OnSelectedIndexChanged="gvwFollowupLabInspection_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField SelectText="Followup" ButtonType="Link" ShowSelectButton="True" />
                        <asp:BoundField DataField="insNo" HeaderText="Inspection Number" ReadOnly="True"
                            SortExpression="insNo" />
                        <asp:BoundField DataField="insDate" HeaderText="Date of Inspection" ReadOnly="True"
                            SortExpression="insDate" />
                        <asp:BoundField DataField="insLoc" HeaderText="Location" ReadOnly="True" SortExpression="insLoc" />
                        <asp:BoundField DataField="insMgr" HeaderText="Lab Manager" ReadOnly="True" SortExpression="insMgr" />
                        <asp:BoundField DataField="insSubmitter" HeaderText="Inspection Submitted by" ReadOnly="True"
                            SortExpression="insSubmitter" />
                    </Columns>
                    <EmptyDataTemplate>
                        No Lab Inspections currently need following up.</EmptyDataTemplate>
                </asp:GridView>
            </asp:Panel>
        </div>
        <div id="divFollowupOfficeInspection">
            <h3 id="hr3OfficeInspection">
                <asp:Image ID="imgExpandOfficeInspection" runat="server" />
                Follow Up - Office Inspections
                <asp:Label ID="lblExpandOfficeInspection" runat="server" />
            </h3>
            <asp:Panel ID="pnlFollowupOfficeInspectionCount" runat="server">
                Office Inspections needing follow up:
                <asp:Label ID="lblFollowupOfficeInspectionCount" Text="0" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pnlFollowupOfficeInspection" CssClass="panel" runat="server">
                <asp:GridView ID="gvwFollowupOfficeInspection" runat="server" AutoGenerateColumns="False"
                    OnSelectedIndexChanged="gvwFollowupOfficeInspection_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField SelectText="Followup" ButtonType="Link" ShowSelectButton="True" />
                        <asp:BoundField DataField="insNo" HeaderText="Inspection Number" ReadOnly="True"
                            SortExpression="insNo" />
                        <asp:BoundField DataField="insDate" HeaderText="Date of Inspection" ReadOnly="True"
                            SortExpression="insDate" />
                        <asp:BoundField DataField="insLoc" HeaderText="Location" ReadOnly="True" SortExpression="insLoc" />
                        <asp:BoundField DataField="insIpt" HeaderText="Office Inspector" ReadOnly="True"
                            SortExpression="insMgr" />
                        <asp:BoundField DataField="insSubmitter" HeaderText="Inspection Submitted by" ReadOnly="True"
                            SortExpression="insSubmitter" />
                    </Columns>
                    <EmptyDataTemplate>
                        No Office Inspections currently need following up.</EmptyDataTemplate>
                </asp:GridView>
            </asp:Panel>
        </div>
    </div>
</asp:content>
