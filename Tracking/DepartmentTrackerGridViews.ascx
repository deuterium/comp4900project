<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DepartmentTrackerGridViews.ascx.cs" Inherits="Tracking_DepartmentTrackerGridViews" %>

<asp:GridView ID="gdvIncidents" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center">
    <Columns>
        <asp:TemplateField HeaderText="#" ItemStyle-Width="20">
            <ItemTemplate>
                <asp:Label ID="lblIncidentNo" runat="server" Text='<%# Bind("incidentNo") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label ID="lblDateOfIncident" runat="server" Text='<%# Eval("date", "{0:M/d/yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Submitter" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label ID="lblSubmitter" runat="server" Text='<%# Bind("submitter") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Employee" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("employee") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Click to View" ItemStyle-Width="250" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Button ID="btnRowViewReport" runat="server" CommandName="RowViewReport" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                    Text="Incident Report" />
                <asp:Button ID="btnRowViewEmpCourses" runat="server" CommandName="RowViewEmpCourses"
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Employee and Courses" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
<EmptyDataTemplate>
No incident reports found.</EmptyDataTemplate>
</asp:GridView>

<asp:GridView ID="gdvOfficeInspections" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:TemplateField HeaderText="#">
            <ItemTemplate>
                <asp:Label ID="lblOfficeInspectionNo" runat="server" Text='<%# Bind("officeInspectionNo") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="deptName" HeaderText="Department" ReadOnly="True" SortExpression="deptName" />
        <asp:BoundField DataField="inspectionDate" HeaderText="Date" DataFormatString="{0:M/dd/yyyy}"
            SortExpression="inspectionDate" />
        <asp:BoundField DataField="followup" HeaderText="Follow-up" ReadOnly="True" SortExpression="deptName" />
        <asp:BoundField DataField="inspector" HeaderText="Inspector" ReadOnly="True" SortExpression="inspector" />
        <asp:BoundField DataField="area" HeaderText="Area" ReadOnly="True" SortExpression="area" />
        <asp:TemplateField HeaderText="Click to View">
            <ItemTemplate>
                <asp:Button ID="btnRowViewLabInspection" runat="server" CommandName="RowViewOfficeInspection"
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Checklist" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>No office inspections found.</EmptyDataTemplate>
</asp:GridView>

<asp:GridView ID="gdvLabInspections" runat="server" AutoGenerateColumns="False" >
    <Columns>
        <asp:TemplateField HeaderText="#">
            <ItemTemplate>
                <asp:Label ID="lblLabInspectionNo" runat="server" Text='<%# Bind("labInspectionNo") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="deptName" HeaderText="Department" ReadOnly="True" SortExpression="deptName" />
        <asp:TemplateField HeaderText="Inspection Date">
            <ItemTemplate>
                <asp:Label ID="lblInspectionDate" runat="server" Text='<%# Eval("inspectionDate", "{0:M/d/yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="followup" HeaderText="Follow-Up" ReadOnly="True" SortExpression="followup" />
        <asp:BoundField DataField="inspector" HeaderText="Inspector" ReadOnly="True" SortExpression="inspector" />
        <asp:BoundField DataField="labManager" HeaderText="Lab Manager" ReadOnly="True" SortExpression="labManager" />
        <asp:BoundField DataField="supervisor" HeaderText="Supervisor" ReadOnly="True" SortExpression="supervisor" />
        <asp:BoundField DataField="room" HeaderText="Room" ReadOnly="True" SortExpression="room" />
        <asp:TemplateField HeaderText="Click to View">
            <ItemTemplate>
                <asp:Button ID="btnRowViewLabInspection" runat="server" CommandName="RowViewLabInspection"
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Checklist" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>No lab inspections found.</EmptyDataTemplate>
</asp:GridView>