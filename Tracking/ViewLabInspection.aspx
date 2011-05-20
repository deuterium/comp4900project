<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewLabInspection.aspx.cs" Inherits="Tracking_ViewLabInspection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">


<h3 id="hr3Title"><asp:Label ID="lblTitle" runat="server" Text="Viewing Lab Inspection #" Font-Bold="true" Visible="false" /></h3>

<asp:Panel ID="pnlHeader" CssClass="panel" runat="server">
    <table>
        <tr>
            <td><span class="spanBold">Department:</span></td>
            <td><asp:Label ID="lblDepartment" runat="server" /></td>
            <td>&nbsp&nbsp&nbsp&nbsp&nbsp</td>
            <td><span class="spanBold">Supervisor:</span></td>
            <td><asp:Label ID="lblSupervisor" runat="server" /></td>
        </tr>
        <tr>
            <td><span class="spanBold">Room:</span></td>
            <td><asp:Label ID="lblRoom" runat="server" /></td>
            <td>&nbsp&nbsp&nbsp&nbsp&nbsp</td>
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
</asp:Panel>

<asp:Panel ID="pnlChecklist" CssClass="panel" runat="server">
<asp:GridView ID="gdvLabInspection" runat="server" AutoGenerateColumns="False" CellPadding="10" >
    <Columns>
        <asp:BoundField DataField="labInsItemNo" HeaderText="#" ReadOnly="True" SortExpression="labInsItemNo" />
        <asp:BoundField DataField="labInsItem" HeaderText="Item" ReadOnly="True" SortExpression="labInsItem" />
        <asp:TemplateField HeaderText="Checked (yes/no)" ItemStyle-HorizontalAlign="Center" >
            <ItemTemplate>
                <asp:Label ID="lblChecked" runat="server" Text='<%# Bind("checkbox") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Comments" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:Label ID="lblComments" runat="server" Text='<%# Bind("comments") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>No inspection data found.</EmptyDataTemplate>
</asp:GridView>
</asp:Panel>

</asp:Content>


