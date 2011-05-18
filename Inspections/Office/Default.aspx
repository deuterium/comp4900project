<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Inspections_Office_Office" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head"></asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="body">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server"></asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="true"
CollapseControlID="workA" ExpandControlID="workA" TargetControlID="pnlA"
ImageControlID="imgExpandCollapseA" TextLabelID="ExpandCollapseA" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="true"
CollapseControlID="workB" ExpandControlID="workB" TargetControlID="pnlB"
ImageControlID="imgExpandCollapseB" TextLabelID="ExpandCollapseB" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeC" runat="server" Collapsed="true"
CollapseControlID="workC" ExpandControlID="workC" TargetControlID="pnlC"
ImageControlID="imgExpandCollapseC" TextLabelID="ExpandCollapseC" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeD" runat="server" Collapsed="true"
CollapseControlID="workD" ExpandControlID="workD" TargetControlID="pnlD"
ImageControlID="imgExpandCollapseD" TextLabelID="ExpandCollapseD" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeE" runat="server" Collapsed="true"
CollapseControlID="workE" ExpandControlID="workE" TargetControlID="pnlE"
ImageControlID="imgExpandCollapseE" TextLabelID="ExpandCollapseE" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeF" runat="server" Collapsed="true"
CollapseControlID="workF" ExpandControlID="workF" TargetControlID="pnlF"
ImageControlID="imgExpandCollapseF" TextLabelID="ExpandCollapseF" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeG" runat="server" Collapsed="true"
CollapseControlID="workG" ExpandControlID="workG" TargetControlID="pnlG"
ImageControlID="imgExpandCollapseG" TextLabelID="ExpandCollapseG" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeH" runat="server" Collapsed="true"
CollapseControlID="workH" ExpandControlID="workH" TargetControlID="pnlH"
ImageControlID="imgExpandCollapseH" TextLabelID="ExpandCollapseH" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeI" runat="server" Collapsed="true"
CollapseControlID="workI" ExpandControlID="workI" TargetControlID="pnlI"
ImageControlID="imgExpandCollapseI" TextLabelID="ExpandCollapseI" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeJ" runat="server" Collapsed="true"
CollapseControlID="workJ" ExpandControlID="workJ" TargetControlID="pnlJ"
ImageControlID="imgExpandCollapseJ" TextLabelID="ExpandCollapseJ" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeK" runat="server" Collapsed="true"
CollapseControlID="workK" ExpandControlID="workK" TargetControlID="pnlK"
ImageControlID="imgExpandCollapseK" TextLabelID="ExpandCollapseK" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeL" runat="server" Collapsed="true"
CollapseControlID="workL" ExpandControlID="workL" TargetControlID="pnlL"
ImageControlID="imgExpandCollapseL" TextLabelID="ExpandCollapseL" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<div>

    <h3 id="workA"><asp:Image ID="imgExpandCollapseA" runat="server" />Inspection Information</h3>
    <asp:Panel ID="pnlA" CssClass="panel" runat="server">
        <p>This form is to be used by departments to conduct monthly workplace safety inspections. The intent is to document the process, 
            identify concerns or issues that require corrective action, delegate responsibility for addressing the issue and following up 
            outstanding issues during subsequent inspections.</p> 
        <p><b>How often should inspections be conducted:</b> Monthly</p>
        <p><b>Who should be involved:</b> A manager/supervisor and employee/s</p>
        <p><b>When:</b> Set a standard day and time of the month so it becomes part of the departmental process</p>
        <p><b>Actions:</b> Some actions may require outside help (eg: an Ergonomics Advisor assisting with a specific ergonomics issue or 
            Facilities fixing a piece of equipment), so please ensure if you delegate responsibility for a task, that the responsible person 
            is informed or a request is made via the appropriate channel.</p>
        <p><b>Date Completed: </b> This should be filled out to ensure the follow up loop is completed</p>
        <p><b>Where should records be kept:</b> Within the department, as it is a departmental responsibility</p>
        <p><b>Y = </b>No action required <b>N = </b>Corrective action required</p>
    </asp:Panel>

    <div id="officeHeader" class="headerPanel">
        <table>
            <tr>
                <td>
                    Department: 
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlOfficeDepartment"></asp:DropDownList>
                    <asp:RequiredFieldValidator ControlToValidate="ddlOfficeDepartment" ValidationGroup="vgpOfficeA" runat="server" 
                        ID="rfvDepart" ErrorMessage="Department is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp&nbsp&nbsp&nbsp&nbsp
                </td>
                <td>
                    Area: 
                </td>
                <td>
                    <asp:TextBox runat="server" ID="tbxOfficeArea" />
                    <asp:RequiredFieldValidator ControlToValidate="tbxOfficeArea" ValidationGroup="vgpOfficeA" runat="server" 
                        ID="rfvArea" ErrorMessage="Area is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Date of Inspection: 
                </td>
                <td>
                    <asp:TextBox ID="tbxOfficeInspectionDate" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="cexOfficeInspectionDate" runat="server" TargetControlID="tbxOfficeInspectionDate" 
                        Format="MM/dd/yyyy"></asp:CalendarExtender>
                    <asp:RequiredFieldValidator ControlToValidate="tbxOfficeInspectionDate" ValidationGroup="vgpOfficeA" runat="server" 
                        ID="rfvCalendar" ErrorMessage="Date of Inspection is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revLabInspectionDate" runat="server" ValidationGroup="vgpOfficeA"
                        ControlToValidate="tbxOfficeInspectionDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Date of Inspection must be 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp&nbsp&nbsp&nbsp&nbsp
                </td>
                <td>
                    Inspectors: 
                </td>
                <td>
                    <asp:TextBox runat="server" ID="tbxOfficeInspectors"></asp:TextBox>
                    <asp:RequiredFieldValidator ControlToValidate="tbxOfficeInspectors" ValidationGroup="vgpOfficeA" runat="server" 
                        ID="rfvInspect" ErrorMessage="Inspector is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    </div>

    <h3 id="workB"><asp:Image ID="imgExpandCollapseB" runat="server" /> 1. General Safety</h3>
    <asp:Panel ID="pnlB" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are worker incident/injury forms available / do staff know when to use them" runat="server" ID="lblWorkForm" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblWorkForm">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblWorkForm" ValidationGroup="vgpOfficeB" runat="server" ID="rfvWorkForm" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentWorkForm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are new employees informed of work hazards" runat="server" ID="lblNewWorkHaz" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblNewWorkHaz">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblNewWorkHaz" ValidationGroup="vgpOfficeB" runat="server" ID="rfvNewWorkHaz" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentNewWorkHaz"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Do staff know how to contact first aid" runat="server" ID="lblConFirstA" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblConFirstA">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblConFirstA" ValidationGroup="vgpOfficeB" runat="server" ID="rfvConFirstA" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentConFirstA"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Is safety and health training provided" runat="server" ID="lblSafeHealth" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblSafeHealth">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblSafeHealth" ValidationGroup="vgpOfficeB" runat="server" ID="rfvSafeHealth" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentSafeHealth"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are staff encouraged to take H&S training" runat="server" ID="lblHSTrain" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblHSTrain">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblHSTrain" ValidationGroup="vgpOfficeB" runat="server" ID="rfvHSTrain" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentHSTrain"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are all exit signs working" runat="server" ID="lblExitSignWork" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblExitSignWork">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblExitSignWork" ValidationGroup="vgpOfficeB" runat="server" 
                    ID="rfvExitSignWork" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentExitSignWork"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are fire exits kept clear" runat="server" ID="lblExitClear" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblExitClear">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblExitClear" ValidationGroup="vgpOfficeB" runat="server" ID="rfvExitClear" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentExitClear"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are fire extinguishers inspected and up to date" runat="server" ID="lblExtinguishDate" />
            </td>
            <td class="tblYesNoNA" colspan="3">
               <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                ID="rblExtinguishDate">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblExtinguishDate" ValidationGroup="vgpOfficeB" runat="server" 
                    ID="rfvExtinguishDate" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentExtinguishDate"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Do emergency procedures/floor plans exist" runat="server" ID="lblEmProcFloor" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblEmProcFloor">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblEmProcFloor" ValidationGroup="vgpOfficeB" runat="server" 
                    ID="rfvEmProcFloor" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentEmProcFloor"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workC"><asp:Image ID="imgExpandCollapseC" runat="server" /> 2. Work Areas</h3>
    <asp:Panel ID="pnlC" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Is adequate space provided to work safely" runat="server" ID="lblSpace" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblSpace">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblSpace" ValidationGroup="vgpOfficeC" runat="server" ID="rfvSpace" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentSpace"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Is work area free of glare and reflection" runat="server" ID="lblGlareReflect" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblGlareReflect">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblGlareReflect" ValidationGroup="vgpOfficeC" runat="server" 
                    ID="rfvGlareReflect" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentGlareReflect"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are appropriate chairs available (5 castors, adjustments etc)" runat="server" ID="lblChairs" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblChairs">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblChairs" ValidationGroup="vgpOfficeC" runat="server" ID="rfvChairs" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentChairs"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Is area free of clutter (housekeeping)" runat="server" ID="lblHousekeep" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblHousekeep">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblHousekeep" ValidationGroup="vgpOfficeC" runat="server" ID="rfvHousekeep" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentHousekeep"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are shelves kept free of overstacking" runat="server" ID="lblOverstack" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblOverstack">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblOverstack" ValidationGroup="vgpOfficeC" runat="server" ID="rfvOverstack" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentOverstack"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are working surfaces at appropriate heights to limit posture concerns" runat="server" ID="lblPosture" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblPosture">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblPosture" ValidationGroup="vgpOfficeC" runat="server" ID="rfvPosture" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentPosture"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workD"><asp:Image ID="imgExpandCollapseD" runat="server" /> 3. Support and Structure</h3>
    <asp:Panel ID="pnlD" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are surfaces level and even" runat="server" ID="lblLevel" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblLevel">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblLevel" ValidationGroup="vgpOfficeD" runat="server" ID="rfvLevel" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentLevel"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Is area free of hazards that may cause trips, slips and falls" runat="server" ID="lblTripSlipFall" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblTripSlipFall">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblTripSlipFall" ValidationGroup="vgpOfficeD" runat="server" 
                    ID="rfvTripSlipFall" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentTripSlipFall"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are surfaces slip resistant where necessary" runat="server" ID="lblSlipRes" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblSlipRes">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblSlipRes" ValidationGroup="vgpOfficeD" runat="server" ID="rfvSlipRes" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentSlipRes"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are steps in good condition" runat="server" ID="lblSteps" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblSteps">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblSteps" ValidationGroup="vgpOfficeD" runat="server" ID="rfvSteps" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentSteps"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workE"><asp:Image ID="imgExpandCollapseE" runat="server" /> 4. Electrical</h3>
    <asp:Panel ID="pnlE" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are switch panels free of clutter and accessible" runat="server" ID="lblSwitchPanel" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblSwitchPanel">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblSwitchPanel" ValidationGroup="vgpOfficeE" runat="server" 
                    ID="rfvSwitchPanel" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentSwitchPanel"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are cords and plugs in good condition" runat="server" ID="lblCordPlug" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblCordPlug">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblCordPlug" ValidationGroup="vgpOfficeE" runat="server" ID="rfvCordPlug" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentCordPlug"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are circuits free of overload" runat="server" ID="lblOverload" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblOverload">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblOverload" ValidationGroup="vgpOfficeE" runat="server" ID="rfvOverload" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentOverload"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are cords out of the way as not to contribute to tripping hazards" runat="server" ID="lblTripCord" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblTripCord">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblTripCord" ValidationGroup="vgpOfficeE" runat="server" ID="rfvTripCord" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentTripCord"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workF"><asp:Image ID="imgExpandCollapseF" runat="server" /> 5. Ventilation, Illumination, Noise</h3>
    <asp:Panel ID="pnlF" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Does there appear to be adequate ventilation (may have to ask staff to find out about complaints)" 
                    runat="server" ID="lblVent" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblVent">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblVent" ValidationGroup="vgpOfficeF" runat="server" ID="rfvVent" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentVent"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Is the workplace free of excessive noise" runat="server" ID="lblNoise" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblNoise">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblNoise" ValidationGroup="vgpOfficeF" runat="server" ID="rfvNoise" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentNoise"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Is there adequate lighting (overhead or task)" runat="server" ID="lblLighting" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblLighting">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblLighting" ValidationGroup="vgpOfficeF" runat="server" ID="rfvLighting" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentLighting"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workG"><asp:Image ID="imgExpandCollapseG" runat="server" /> 6. Work Practices Section</h3>
    <asp:Panel ID="pnlG" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are safety procedures in place and known to staff" runat="server" ID="lblSafeProc" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblSafeProc">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblSafeProc" ValidationGroup="vgpOfficeG" runat="server" ID="rfvSafeProc" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentSafeProc"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are procedures documented" runat="server" ID="lblDocs" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblDocs">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblDocs" ValidationGroup="vgpOfficeG" runat="server" ID="rfvDocs" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentDocs"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Do staff know how to report concerns" runat="server" ID="lblConcern" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblConcern">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblConcern" ValidationGroup="vgpOfficeG" runat="server" ID="rfvConcern" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentConcern"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workH"><asp:Image ID="imgExpandCollapseH" runat="server" /> 7. Personal Protective Equipment</h3>
    <asp:Panel ID="pnlH" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Is personal protective equipment required for any specific work" runat="server" ID="lblPersonEquipReq" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblPersonEquipReq">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblPersonEquipReq" ValidationGroup="vgpOfficeH" runat="server" 
                    ID="rfvPersonEquipReq" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentPersonEquipReq"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Do staff know how to use it properly and have been trained where appropriate (E.G. respirator fit test)" 
                    runat="server" ID="lblEquipProp" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblEquipProp">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblEquipProp" ValidationGroup="vgpOfficeH" runat="server" ID="rfvEquipProp" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentEquipProp"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Is it available, or do they know how to access PPE" runat="server" ID="lblPPE" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" 
                    runat="server" ID="rblPPE">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblPPE" ValidationGroup="vgpOfficeH" runat="server" ID="rfvPPE" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentPPE"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workI"><asp:Image ID="imgExpandCollapseI" runat="server" /> 8. Strain, Sprain, Overexertion</h3>
    <asp:Panel ID="pnlI" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are staff trained in proper lift techniques" runat="server" ID="lblLiftTech" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" 
                    runat="server" ID="rblLiftTech">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblLiftTech" ValidationGroup="vgpOfficeI" runat="server" 
                    ID="rfvLiftTech" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentLiftTech"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are workstations set up to reduce poor posture" runat="server" ID="lblPoorPosture" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblPoorPosture">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblPoorPosture" ValidationGroup="vgpOfficeI" runat="server" 
                    ID="rfvPoorPosture" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentPoorPosture"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are staff aware of safe handling procedures" runat="server" ID="lblHandle" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblHandle">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblHandle" ValidationGroup="vgpOfficeI" runat="server" ID="rfvHandle" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentHandle"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Do staff know where to find safe handling procedures" runat="server" ID="lblHandleProc" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblHandleProc">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblHandleProc" ValidationGroup="vgpOfficeI" runat="server" 
                    ID="rfvHandleProc" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentHandleProc"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workJ"><asp:Image ID="imgExpandCollapseJ" runat="server" /> 9. WHMIS / Hazardous Materials</h3>
    <asp:Panel ID="pnlJ" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are Material Safety Data Sheets (MSDS) accessible for staff (via a binder or on-line link to OHSAH)" 
                    runat="server" ID="lblMSDSandOHSAH" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblMSDSandOHSAH">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblMSDSandOHSAH" ValidationGroup="vgpOfficeJ" runat="server" 
                    ID="rfvMSDSandOHSAH" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentMSDSandOHSAH"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Have staff who work with hazardous products had WHMIS training" runat="server" ID="lblWHMISTrain" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblWHMISTrain">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblWHMISTrain" ValidationGroup="vgpOfficeJ" runat="server" 
                    ID="rfvWHMISTrain" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentWHMISTrain"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Worker can answer the following four questions: 1. What are the hazards of the products you are using? 
                    2. How do you protect yourself from the hazards of these products? 3. What do you do in the event of an emergency? 
                    4. Where can additional information be found?" runat="server" ID="lblFourQuestions" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblFourQuestions">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblFourQuestions" ValidationGroup="vgpOfficeJ" runat="server" 
                    ID="rfvFourQuestions" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentFourQuestions"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Do staff know how to access the on-line training module" runat="server" ID="lblOnLineTrain" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblOnLineTrain">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblOnLineTrain" ValidationGroup="vgpOfficeJ" runat="server" 
                    ID="rfvOnLineTrain" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentOnLineTrain"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Do staff know what to do in the event of a spill" runat="server" ID="lblSpill" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblSpill">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblSpill" ValidationGroup="vgpOfficeJ" runat="server" ID="rfvSpill" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentSpill"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workK"><asp:Image ID="imgExpandCollapseK" runat="server" /> 10. Fire Safety and Emergency Response</h3>
    <asp:Panel ID="pnlK" CssClass="panel" runat="server">
    <table>
        <tr>
            <td class="tblItem">
                <h3>Item</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>Yes</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>No</h3>
            </td>
            <td class="tblYesNoNA">
                <h3>N/A</h3>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Do staff know what to do in the event of an evacuation alarm" runat="server" ID="lblEvacAlarm" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblEvacAlarm">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblEvacAlarm" ValidationGroup="vgpOfficeK" runat="server" 
                    ID="rfvEvacAlarm" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentEvacAlarm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Do staff know where the muster station is in the event of an evacuation" runat="server" ID="lblMuster" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblMuster">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblMuster" ValidationGroup="vgpOfficeK" runat="server" ID="rfvMuster" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentMuster"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are there designated fire wardens and have they had appropriate training" runat="server" ID="lblWarden" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblWarden">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblWarden" ValidationGroup="vgpOfficeK" runat="server" ID="rfvWarden" 
                    ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentWarden"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are fire extinguishers in working condition" runat="server" ID="lblExtinguishWork" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblExtinguishWork">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblExtinguishWork" ValidationGroup="vgpOfficeK" runat="server" 
                    ID="rfvExtinguishWork" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentExtinguishWork"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Are corridors outside the office area clear and free of storage" runat="server" ID="lblOfficeClear" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" 
                    ID="rblOfficeClear">
                    <asp:ListItem Text="" Value="Yes" />
                    <asp:ListItem Text="" Value="No" />
                    <asp:ListItem Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblOfficeClear" ValidationGroup="vgpOfficeK" runat="server" 
                    ID="rfvOfficeClear" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" TextMode="MultiLine" Wrap="true" ID="tbxCommentOfficeClear"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="workL"><asp:Image ID="imgExpandCollapseL" runat="server" /> 11. Comments</h3>
    <asp:Panel ID="pnlL" CssClass="panel" runat="server">
        <asp:TextBox TextMode="MultiLine" Wrap="true" Width="795px" Height="200px" ID="tbxCommentOfficeComments" runat="server"></asp:TextBox>
    </asp:Panel>

    <asp:Button ID="btnOfficeInspectionSubmit" runat="server" Text="Submit" onclick="btnOfficeInspectionSubmit_Click" />

    <asp:Panel ID="pnlPop" BackColor="White" CssClass="popPanel" runat="server">
        <table width="100%" cellpadding="5">
            <tr>
                <td>
                    <asp:Label ID="lblPnlPop" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="btnPnlPopClose" runat="server" Text="Close" 
                        onclick="btnPnlPopClose_Click" />
                </td>
            </tr>
        </table>
    </asp:Panel>

    <asp:Button runat="server" ID="btnHidden" CssClass="hidden" />

    <asp:ModalPopupExtender ID="mpePop" runat="server" PopupControlID="pnlPop" TargetControlID="btnHidden"
        DropShadow="true" BackgroundCssClass="modalBackground" />

</div>

</asp:Content>
