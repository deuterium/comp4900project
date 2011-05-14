<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Followup.aspx.cs" Inherits="Followup_Followup" %>

<%@ PreviousPageType VirtualPath="Default.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:GridView ID="gvwLabFollowup" width="800" runat="server" 
        AutoGenerateColumns="False" onrowdatabound="gvwLabFollowup_RowDataBound" >
        <Columns>
            <asp:BoundField DataField="labInsItem" HeaderText="Item" ReadOnly="True" SortExpression="labInsItem" />
            <asp:BoundField DataField="checkbox" HeaderText="Checked (yes/no)" SortExpression="checkbox" />
            <asp:BoundField DataField="comments" HeaderText="Comment" SortExpression="comments" />
        </Columns>
    </asp:GridView>
</asp:Content>
