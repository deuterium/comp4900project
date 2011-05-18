<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewOfficeInspection.aspx.cs" Inherits="Tracking_ViewOfficeInspection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

<h3 id="hr3Title"><asp:Label ID="lblTitle" runat="server" Text="Viewing Office Inspection #" Font-Bold="true" Visible="false" /></h3>

<asp:Panel ID="pnlHeader" CssClass="panel" runat="server" Visible="false">
    <table>
        <tr>
            <td><span class="spanBold">Department:</span></span></td>
            <td><asp:Label ID="lblDepartment" runat="server" /></td>
            <td>&nbsp&nbsp&nbsp&nbsp&nbsp</td>
            <td><span class="spanBold">Area:</span></td>
            <td><asp:Label ID="lblOfficeArea" runat="server" /></td>
        </tr>
        <tr>
            <td><span class="spanBold">Date of Inspection:</span></td>
            <td><asp:Label ID="lblInspectionDate" runat="server" /></td>
            <td>&nbsp&nbsp&nbsp&nbsp&nbsp</td>
            <td><span class="spanBold">Inspector:</span></td>
            <td><asp:Label ID="lblInspector" runat="server" /></td>
        </tr>
    </table>
</asp:Panel>

<asp:Panel ID="pnlChecklist" CssClass="panel" runat="server">
<asp:GridView ID="gdvOfficeInspection" runat="server" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="officeInsItemNo" HeaderText="#" ReadOnly="True" SortExpression="officeInsItemNo" />
        <asp:BoundField DataField="officeInsItem" HeaderText="Item" ReadOnly="True" SortExpression="officeInsItem" />
        <asp:TemplateField HeaderText="Checked (yes/no)" ItemStyle-HorizontalAlign="Center" >
            <ItemTemplate>
                <asp:Label ID="lblChecked" runat="server" Text='<%# Bind("checkbox") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Comments" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:TextBox ID="tbxComments" CssClass="trackingInspectionComments" runat="server" Text='<%# Bind("comments") %>' TextMode="MultiLine" ReadOnly="true" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>No report data was found.</EmptyDataTemplate>
</asp:GridView>
</asp:Panel>

</asp:Content>


