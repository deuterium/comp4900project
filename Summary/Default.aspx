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

<asp:CollapsiblePanelExtender ID="cpeC" runat="server" Collapsed="true"
CollapseControlID="labInspectionLookUp" ExpandControlID="labInspectionLookUp" TargetControlID="pnlC"
ImageControlID="imgExpandCollapseLabInspectionLookUp" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeD" runat="server" Collapsed="true"
CollapseControlID="officeInspectionLookUp" ExpandControlID="officeInspectionLookUp" TargetControlID="pnlD"
ImageControlID="imgExpandCollapseOfficeInspectionLookUp" CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>
Summary Page:

<h3 id="inspectionLookUp"><asp:Image ID="imgExpandCollapseInspectionLookUp" runat="server" /> Inspection Lookup:</h3>
    <asp:Panel ID="pnlA" CssClass="panel" runat="server">
        <h3 id="labInspectionLookUp"><asp:Image ID="imgExpandCollapseLabInspectionLookUp" runat="server" /> Lab Inspection:</h3>
        <asp:Panel ID="pnlC" CssClass="panel" runat="server">
            <table>
            <tr>
                <td>
                    Department: 
                </td>
                <td>
                    <asp:DropDownList Width="155px" runat="server" ID="ddlLabDepartment" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Department" Value="none" />
                    </asp:DropDownList>
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
                </td>
            </tr>
            <tr>
                <td>
                    Date of Inspection: 
                </td>
                <td>
                    <asp:TextBox ID="tbxLabInspectionDate" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="cexLabInspectionDate" runat="server" TargetControlID="tbxLabInspectionDate" Format="M/d/yyyy"></asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revLabInspectionDate" runat="server" ValidationGroup="vgrLabInspectionLookUp"
                        ControlToValidate="tbxLabInspectionDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Date of Inspection must be 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp&nbsp&nbsp&nbsp&nbsp
                </td>
            </tr>
            <tr>
            <td>
                <asp:Button ID="btnLabInspectionLookUp" ValidationGroup="vgrLabInspectionLookUp" 
                    runat="server" Text="Search" onclick="btnLabInspectionLookUp_Click" />
            </td>
            </tr>
        </table>
            <asp:ValidationSummary ID="vsuLabInspectionLookUp" ValidationGroup="vgrLabInspectionLookUp" runat="server" />
            <asp:GridView ID="grvLabInspections" Width="790px" runat="server" AutoGenerateColumns="False"
                autogenerateselectbutton="True" DataKeyNames="labInsNo" onselectedindexchanged="grvLabInspections_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="labInsNo" HeaderText="Inspection" ReadOnly="True" 
                        SortExpression="labInsNo" />
                    <asp:BoundField DataField="deptName" HeaderText="Department" 
                        SortExpression="deptName" />
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
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
        
        <h3 id="officeInspectionLookUp"><asp:Image ID="imgExpandCollapseOfficeInspectionLookUp" runat="server" /> Office Inspection:</h3>
        <asp:Panel ID="pnlD" CssClass="panel" runat="server">
                    <table>
            <tr>
                <td>
                    Department: 
                </td>
                <td>
                    <asp:DropDownList Width="155px" runat="server" ID="ddlOfficeDepartment" AppendDataBoundItems="true">
                        <asp:ListItem Text="Select Department" Value="none" />
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp&nbsp&nbsp&nbsp&nbsp
                </td>
            </tr>
            <tr>
                <td>
                    Date of Inspection: 
                </td>
                <td>
                    <asp:TextBox ID="tbxOfficeInspectionDate" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="cexOfficeInspectionDate" runat="server" TargetControlID="tbxOfficeInspectionDate" Format="yyyy/MM/dd"></asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revOfficeInspectionDate" runat="server" ValidationGroup="vgrOfficeInspectionLookUp"
                        ControlToValidate="tbxOfficeInspectionDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Date of Inspection must be 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp&nbsp&nbsp&nbsp&nbsp
                </td>
            </tr>
            <tr>
            <td>
                <asp:Button ID="btnOfficeInspectionLookUp" ValidationGroup="vgrOfficeInspectionLookUp" 
                    runat="server" Text="Search" onclick="btnOfficeInspectionLookUp_Click" />
            </td>
            </tr>
        </table>
            <asp:ValidationSummary ID="vsuOfficeInspectionLookUp" ValidationGroup="vgrOfficeInspectionLookUp" runat="server" />
            <asp:GridView ID="grvOfficeInspections" Width="800px" runat="server" AutoGenerateColumns="False"
                autogenerateselectbutton="True" DataKeyNames="labInsNo" onselectedindexchanged="grvOfficeInspections_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="officeInsNo" HeaderText="Office Inspection" ReadOnly="True" 
                        SortExpression="officeInsNo" />
                    <asp:BoundField DataField="deptNo" HeaderText="Department" 
                        SortExpression="deptNo" />
                    <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
                    <asp:BoundField DataField="inspector" HeaderText="Inspector" 
                        SortExpression="inspector" />
                    <asp:BoundField DataField="supervisor" HeaderText="Supervisor" 
                        SortExpression="supervisor" />
                </Columns>
            </asp:GridView> 
            <asp:GridView ID="grvOfficeInspectionResults" runat="server" AutoGenerateColumns="false"
            DataKeyNames="officeInsItem" OnRowDataBound="grvOfficeInspectionResults_DataBinding">
            <Columns>
                    <asp:BoundField DataField="officeInsItem" HeaderText="Item" ReadOnly="True" 
                        SortExpression="officeInsItem" />

                    <asp:BoundField DataField="checkbox" HeaderText="Checked (yes/no)" 
                        SortExpression="checkbox" />

                    <asp:BoundField DataField="comments" HeaderText="Comment" 
                        SortExpression="comments" />

                </Columns>

            </asp:GridView>
        </asp:Panel> 
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
                <asp:ValidationSummary ID="vsuExpiringCourses" ValidationGroup="vgrExpiringCourseLookUp" runat="server" />
            </td>
        </tr>
    </table>
        <asp:Panel ID="grvPanelExpiringCourses" runat="server"></asp:Panel>
    </div>
    </asp:Panel>

</asp:Content>
