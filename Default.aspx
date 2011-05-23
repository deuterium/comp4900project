<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server" />
    <pre>
    Welcome to The BC Cancer Agency Research Form Tracking.

    With our web application you can:
    -	View records (reports, training/orientation courses, and workplace inspections)
    -	Update records (add follow-ups)
    -	View filtered lists of records and statistics
            Search records based on report, training/orientation course, 
            and/or workplace inspection fields and get the number of results
    -	Record incident/accident reports, workplace inspections, and employee courses
    -	Create, Read, Update, and Delete on departments, rooms, positions, courses, users, and employees
</pre>
    To begin, simply login by clicking <a href="Login.aspx">Here</a>
</asp:Content>
