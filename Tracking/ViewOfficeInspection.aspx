<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewOfficeInspection.aspx.cs" Inherits="Tracking_ViewOfficeInspection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">

<h3 id="hr3Title"><asp:Label ID="lblTitle" runat="server" Text="Viewing Office Inspection #" Font-Bold="true" Visible="false" /></h3>

<asp:Panel ID="pnlHeader" CssClass="panel" runat="server" Visible="false">
    <div id="divViewOiLeft">
        <table>
            <tr>
                <td><span class="spanBold">Department:</span></td>
                <td><asp:Label ID="lblDepartment" runat="server" /></td>
            <tr>
                <td><span class="spanBold">Area:</span></td>
                <td><asp:Label ID="lblOfficeArea" runat="server" /></td>
            </tr>
            <tr>
                <td><span class="spanBold">Date of Inspection:</span></td>
                <td><asp:Label ID="lblInspectionDate" runat="server" /></td>
            <tr>
                <td><span class="spanBold">Inspector:</span></td>
                <td><asp:Label ID="lblInspector" runat="server" /></td>
            </tr>
        </table>
    </div>
    <div id="divViewOiRight">
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
    <asp:GridView ID="gdvOfficeInspection" runat="server" AutoGenerateColumns="False" CellPadding="10" >
        <Columns>
            <asp:BoundField DataField="officeInsItemNo" HeaderText="#" ReadOnly="True"
                SortExpression="officeInsItemNo" />
            <asp:BoundField DataField="officeInsItemName" HeaderText="Item" ReadOnly="True"
                SortExpression="officeInsItem" />
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


