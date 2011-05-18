<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewLabInspection.aspx.cs" Inherits="Tracking_ViewLabInspection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

<asp:GridView ID="gdvLabInspection" Width="800px" runat="server" AutoGenerateColumns="False"
    OnRowDataBound="gdvLabInspection_RowDataBound">
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
                <asp:TextBox ID="tbxComments" CssClass="trackingInspectionComments" runat="server" Text='<%# Bind("comments") %>' TextMode="MultiLine" ReadOnly="true" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>No report data was found.</EmptyDataTemplate>
</asp:GridView>

PUT INSPECTION DETAILS ON HERE TOO!!! (e.g. lab manager, date, etc...)

</asp:Content>


