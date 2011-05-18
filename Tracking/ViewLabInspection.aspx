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

<%--
<asp:GridView ID="grvLabInspections" Width="790px" runat="server" AutoGenerateColumns="False"
    autogenerateselectbutton="True" DataKeyNames="labInsNo" onselectedindexchanged="grvLabInspections_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="labInsNo" HeaderText="Inspection" ReadOnly="True" 
            SortExpression="labInsNo" />
        <asp:BoundField DataField="deptName" HeaderText="Department" 
            SortExpression="deptName" />
        <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:M/dd/yyyy}" SortExpression="date" />
        <asp:BoundField DataField="followupDate" HeaderText="Followup" 
            SortExpression="followupDate" />
        <asp:BoundField DataField="inspector" HeaderText="Inspector" 
            SortExpression="inspector" />
        <asp:BoundField DataField="labMgr" HeaderText="Lab Manager" 
            SortExpression="labMgr" />
        <asp:BoundField DataField="supervisor" HeaderText="Supervisor" 
            SortExpression="supervisor" />
        <asp:BoundField DataField="room" HeaderText="Room" 
            SortExpression="room" />
    </Columns>
    <EmptyDataTemplate>No results were found.</EmptyDataTemplate>
</asp:GridView> 


<asp:GridView ID="grvLabInspectionResults" runat="server" AutoGenerateColumns="false"
DataKeyNames="labInsItem" Width="790px" OnRowDataBound="grvLabInspectionResults_DataBinding">
    <Columns>
        <asp:BoundField DataField="labInsItem" HeaderText="Item" ReadOnly="True" 
            SortExpression="labInsItem" />
        <asp:BoundField DataField="checkbox" HeaderText="Checked (yes/no)" 
            SortExpression="checkbox" />
        <asp:BoundField DataField="comments" HeaderText="Comment" 
            SortExpression="comments" />
        <asp:BoundField DataField="comment" HeaderText="Corrective Action"
            SortExpression="comment" />
    </Columns>
</asp:GridView>--%>

</asp:Content>


