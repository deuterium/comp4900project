<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Training_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="EntityDataSource1">
        <Columns>
            <asp:BoundField DataField="empNo" HeaderText="empNo" ReadOnly="True" 
                SortExpression="empNo" />
            <asp:BoundField DataField="trainingNo" HeaderText="trainingNo" ReadOnly="True" 
                SortExpression="trainingNo" />
            <asp:BoundField DataField="startDate" HeaderText="startDate" ReadOnly="True" 
                SortExpression="startDate" />
            <asp:BoundField DataField="endDate" HeaderText="endDate" ReadOnly="True" 
                SortExpression="endDate" />
            <asp:CommandField ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=BCCAEntities" DefaultContainerName="BCCAEntities" 
        EnableFlattening="False" EntitySetName="TrainingTakens" 
        Select="it.[empNo], it.[trainingNo], it.[startDate], it.[endDate]">
    </asp:EntityDataSource>
</asp:Content>

