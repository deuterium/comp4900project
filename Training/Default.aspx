<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Training_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="EntityDataSource1">
        <Columns>
            <asp:BoundField DataField="startDate" HeaderText="startDate" ReadOnly="True" 
                SortExpression="startDate" />
            <asp:BoundField DataField="endDate" HeaderText="endDate" ReadOnly="True" 
                SortExpression="endDate" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Eval("TrainingCourses.trainingName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=BCCAEntities" DefaultContainerName="BCCAEntities" 
        EnableFlattening="False" EntitySetName="TrainingTakens" Include="trainingName"
        Select="it.[startDate], it.[endDate]">
    </asp:EntityDataSource>
</asp:Content>

