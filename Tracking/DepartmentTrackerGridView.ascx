<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DepartmentTrackerGridView.ascx.cs" Inherits="Tracking_DepartmentTrackerGridView" %>

<asp:GridView ID="gdvDepartmentTracker" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center">
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
                    Text="Report" />
                <asp:Button ID="btnRowViewEmployee" runat="server" CommandName="RowViewEmployee"
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Employee" />
                <asp:Button ID="btnRowViewCourses" runat="server" CommandName="RowViewCourses" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                    Text="Courses" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="" ItemStyle-Width="0" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Button ID="btnRowViewLabInspections" runat="server" CommandName="RowViewLabInspections"
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Lab Inspections" />
                <asp:Button ID="btnRowViewOfficeInspections" runat="server" CommandName="RowViewOfficeInspections"
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" Text="Office Inspections" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
<EmptyDataTemplate>
No incident reports found.</EmptyDataTemplate>
</asp:GridView>