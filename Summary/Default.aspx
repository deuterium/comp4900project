<%@ Page Title="Summary" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Summary_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 161px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="false"
CollapseControlID="inspectionLookUp" ExpandControlID="inspectionLookUp" TargetControlID="pnlA"
ImageControlID="imgExpandCollapseInspectionLookUp" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="false"
CollapseControlID="courseLookUp" ExpandControlID="courseLookUp" TargetControlID="pnlB"
ImageControlID="imgExpandCollapseCourseLookUp" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>
Summary Page:

<h3 id="inspectionLookUp"><asp:Image ID="imgExpandCollapseInspectionLookUp" runat="server" /> Inspection Lookup:</h3>
    <asp:Panel ID="pnlA" CssClass="panel" runat="server">
    
        <table>
        <tr>
            <td>
                Department: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxLabDepartment"></asp:TextBox>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
        </tr>
        <tr>
            <td>
                Lab Manager:
            </td>
            <td>
                <asp:DropDownList Width="155px" runat="server" ID="ddlLabLabManager" AppendDataBoundItems="true">
                    <asp:ListItem Text="Select Lab Manager" Value="none" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator  
                 ID="rfvLabManger" runat="server" ErrorMessage="Please select a Lab Manger."
                 ControlToValidate="ddlLabLabManager" validationGroup="vgrInspectionLookUp"
                 InitialValue="none">  
        </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Date of Inspection: 
            </td>
            <td>
                <asp:TextBox ID="tbxLabInspectionDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="cexLabInspectionDate" runat="server" TargetControlID="tbxLabInspectionDate" Format="yyyy/MM/dd"></asp:CalendarExtender>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
        </tr>
        <tr>
        <td>
            <asp:Button ID="btnInspectionLookUp" ValidationGroup="vgrInspectionLookUp" 
                runat="server" Text="Search" onclick="btnInspectionLookUp_Click" />
        </td>
        </tr>
    </table>
        <asp:ValidationSummary ID="vsuInspectionLookUp" ValidationGroup="vgrInspectionLookUp" runat="server" />
        <asp:GridView ID="grvLabInspections" runat="server" AutoGenerateColumns="False"
            autogenerateselectbutton="True" DataKeyNames="labInsNo"> <%--DataSourceID="edsLabInspections">--%>
            <Columns>
                <asp:BoundField DataField="labInsNo" HeaderText="Lab Inspection #" ReadOnly="True" 
                    SortExpression="labInsNo" />
                <asp:BoundField DataField="deptNo" HeaderText="Department #" 
                    SortExpression="deptNo" />
                <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                <asp:BoundField DataField="followupDate" HeaderText="Followup Date" 
                    SortExpression="followupDate" />
                <asp:BoundField DataField="inspector" HeaderText="Inspector" 
                    SortExpression="inspector" />
                <asp:BoundField DataField="labMgr" HeaderText="Lab Manager" 
                    SortExpression="labMgr" />
                <asp:BoundField DataField="supervisor" HeaderText="Supervisor" 
                    SortExpression="supervisor" />
            </Columns>
        </asp:GridView> 
        <asp:GridView ID="grvLabInspectionResults" runat="server" AutoGenerateColumns="false"
        DataKeyNames="labInsItem" OnRowDataBound="grvLabInspectionResults_DataBinding">
        <Columns>
                <asp:BoundField DataField="labInsItem" HeaderText="Item" ReadOnly="True" 
                    SortExpression="labInsItem" />

                <asp:BoundField DataField="checkbox" HeaderText="Checked (yes/no)" 
                    SortExpression="checkbox" />

                <asp:BoundField DataField="comments" HeaderText="Comment" 
                    SortExpression="comments" />

            </Columns>

        </asp:GridView> 
    </asp:Panel>

    <h3 id="courseLookUp"><asp:Image ID="imgExpandCollapseCourseLookUp" runat="server" /> Course Lookup:</h3>
    <asp:Panel ID="pnlB" CssClass="panel" runat="server">
        <asp:Button ID="btnValidCourses" ValidationGroup="vgrCourseLookUp" 
            runat="server" Text="List all Valid Courses" 
            onclick="btnCourseLookUp_Click" Width="210px" />

        <%-- Valid Courses Panel--%>
        <div id="divExpiringCourses">
        <asp:Panel ID="grvPanelValidCourses" runat="server"></asp:Panel>
        <table id="tblExpireCourses">
        <tr>
            <td class="style3">
                Enter number of months:</td>
            <td>
                <asp:TextBox ID="tbxMonthsRange" runat="server" Width="33px"></asp:TextBox>
                <asp:Button ID="btnExpiringCourses" runat="server" 
                    onclick="btnExpiringCourses_Click" Text="List all Expiring Courses" 
                    ValidationGroup="vgrExpiringCourseLookUp" Width="210px" />
                <asp:RequiredFieldValidator ID="rfvMonths" runat="server" ControlToValidate="tbxMonthsRange" 
                    ErrorMessage="You must enter a number." ValidationGroup="vgrExpiringCourseLookUp"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revMonths" runat="server" ControlToValidate="tbxMonthsRange" 
                    ErrorMessage="Numbers between (1 - 60)" ValidationExpression="^\d+$" ValidationGroup="vgrExpiringCourseLookUp"></asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
        <asp:Panel ID="grvPanelExpiringCourses" runat="server"></asp:Panel>
    </div>
    </asp:Panel>

</asp:Content>
