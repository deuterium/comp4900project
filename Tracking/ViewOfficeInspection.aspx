<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewOfficeInspection.aspx.cs" Inherits="Tracking_ViewOfficeInspection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

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

PUT INSPECTION DETAILS ON HERE TOO!!! (e.g. lab manager, date, etc...)

</asp:Content>


