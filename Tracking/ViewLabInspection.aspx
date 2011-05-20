<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewLabInspection.aspx.cs" Inherits="Tracking_ViewLabInspection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

<asp:Label ID="lblUserMsg" runat="server" />

<h3 id="hr3Title"><asp:Label ID="lblTitle" runat="server" Text="Viewing Lab Inspection #" Font-Bold="true" Visible="false" /></h3>

<asp:Panel ID="pnlHeader" CssClass="panel" runat="server">
    <div id="divViewLiLeft">
        <table>
            <tr>
                <td><span class="spanBold">Department:</span></td>
                <td><asp:Label ID="lblDepartment" runat="server" /></td>
            </tr>
            <tr>
                <td><span class="spanBold">Supervisor:</span></td>
                <td><asp:Label ID="lblSupervisor" runat="server" /></td>
            </tr>
            <tr>
                <td><span class="spanBold">Room:</span></td>
                <td><asp:Label ID="lblRoom" runat="server" /></td>
            </tr>
            <tr>
                <td><span class="spanBold">Inspector:</span></td>
                <td><asp:Label runat="server" ID="lblInspector" /></td>
            </tr>
            <tr>
                <td><span class="spanBold">Lab Manager:</span></td>
                <td><asp:Label ID="lblManager" runat="server" /></td>
            </tr>
            <tr>
                <td><span class="spanBold">Date of Inspection:</span></td>
                <td><asp:Label ID="lblInspectionDate" runat="server" /></td>
            </tr>
        </table>
    </div>
    <div id="divViewLiRight">
        <table>
            <tr>
                <td><span class="spanBold">Follow Up Status:</span></td>
                <td><asp:Label ID="lblFollowUpStatus" runat="server" /></td>
            </tr>
            <tr>
                <td><span class="spanBold">Follow Up Date:</span></td>
                <td><asp:Label ID="lblFollowUpDate" runat="server" /></td>
            </tr>
            <tr>
                <td><span class="spanBold">Follow Up Submitter:</span></td>
                <td><asp:Label ID="lblFollowUpSubmitter" runat="server" /></td>
            </tr>
        </table>
    </div>
</asp:Panel>

<asp:Panel ID="pnlChecklist" CssClass="panel" runat="server">
<asp:GridView ID="gdvLabInspection" runat="server" AutoGenerateColumns="False" CellPadding="10" >
    <Columns>
        <asp:BoundField DataField="labInsItemNo" HeaderText="#" ReadOnly="True" SortExpression="labInsItemNo" />
        <asp:BoundField DataField="labInsItemName" HeaderText="Item" ReadOnly="True" SortExpression="labInsItemName" />
        <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center" >
            <ItemTemplate>
                <asp:Label ID="lblChecked" runat="server" Text='<%# Bind("checkbox") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Inspection Comments" >
            <ItemTemplate>
                <asp:Label ID="lblInspectionComments" runat="server" Text='<%# Bind("inspectionComment") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Follow Up Comments" >
            <ItemTemplate>
                <asp:Label ID="lblFollowUpComments" runat="server" Text='<%# Bind("followUpComment") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>No inspection data found.</EmptyDataTemplate>
</asp:GridView>
</asp:Panel>

<asp:Panel ID="pnlComments" CssClass="panel" runat="server">
    <table cellpadding="10" >
        <tr><td><span class="spanBold">Inspection Comment:</span></td></tr>
        <tr><td><asp:Label ID="lblInspectionComment" runat="server" Width="785px" BackColor="White" ></asp:Label></td></tr>
        <tr><td><span class="spanBold">Follow Up Comment:</span></td></tr>
        <tr><td><asp:Label ID="lblFollowUpComment" runat="server" Width="785px" BackColor="White" ></asp:Label></td></tr>
    </table>
</asp:Panel>

<div>&nbsp;</div>

</asp:Content>
