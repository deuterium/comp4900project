<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Followup.aspx.cs" Inherits="Followup_Followup" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ PreviousPageType VirtualPath="Default.aspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server" />
    </asp:ToolkitScriptManager>
    <div id="divFollowupReport">
        <asp:GridView ID="gvwLabFollowup" Width="800" runat="server" AutoGenerateColumns="False"
            OnRowDataBound="gvwLabFollowup_RowDataBound">
            <Columns>
                <asp:BoundField DataField="labInsItem" HeaderText="Item" ReadOnly="True" SortExpression="labInsItem" />
                <asp:BoundField DataField="checkbox" HeaderText="Checked (yes/no)" SortExpression="checkbox" />
                <asp:BoundField DataField="comments" HeaderText="Comment" SortExpression="comments" />
            </Columns>
            <EmptyDataTemplate>
                No report data was found.</EmptyDataTemplate>
        </asp:GridView>
    </div>
    <div id="divFollowupIncident" runat="server" visible="false">
        <h3 id="hr3F">
            <asp:Image ID="imgExpandCollapseF" runat="server" />
            F. Corrective Action
            <asp:Label ID="ExpandCollapseF" runat="server" Text=""></asp:Label></h3>
        <asp:Panel ID="pnlF" CssClass="panel" runat="server">
            <table>
                <tr>
                    <td>
                        Person assigned to corrective action:
                    </td>
                    <td>
                        <asp:TextBox TabIndex="149" ID="tbx_p2_corrective_person" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="vgpEmpInfo"
                            ControlToValidate="tbx_p2_corrective_person" ErrorMessage="Person assigned must have a first and last name separated by a space."
                            ValidationExpression="^[A-Za-z']+ [A-Za-z']+$"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        Date:
                        <asp:TextBox TabIndex="150" ID="tbx_p2_corrective_personDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexCorrectivePersonDate" runat="server" TargetControlID="tbx_p2_corrective_personDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revPersonDate" runat="server" ValidationGroup="vgpFCorrective"
                            ControlToValidate="tbx_p2_corrective_personDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Person assigned date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Maintenance Requisition Submitted:
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbl_p2_corrective_maintenance" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem TabIndex="151" Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem TabIndex="152" Text="No" Value="2"></asp:ListItem>
                            <asp:ListItem TabIndex="153" Text="N/A" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        Date:
                        <asp:TextBox TabIndex="154" ID="tbx_p2_corrective_maintenanceDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexMaintenanceDate" runat="server" TargetControlID="tbx_p2_corrective_maintenanceDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revMaintenanceDate" runat="server" ValidationGroup="vgpFCorrective"
                            ControlToValidate="tbx_p2_corrective_maintenanceDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Maintenance date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Corrective Action Communicated to Staff:
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbl_p2_corrective_communicated" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem TabIndex="155" Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem TabIndex="156" Text="No" Value="2"></asp:ListItem>
                            <asp:ListItem TabIndex="157" Text="N/A" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        Date:
                        <asp:TextBox TabIndex="158" ID="tbx_p2_corrective_communicatedDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexCommToStaffDate" runat="server" TargetControlID="tbx_p2_corrective_communicatedDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revCommToStaffDate" runat="server" ValidationGroup="vgpFCorrective"
                            ControlToValidate="tbx_p2_corrective_communicatedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Communicated to staff date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Any time loss subsequent to injury:
                    </td>
                    <td>
                        <asp:RadioButtonList ID="rbl_p2_corrective_time" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem TabIndex="159" Text="Yes" Value="1"></asp:ListItem>
                            <asp:ListItem TabIndex="160" Text="No" Value="2"></asp:ListItem>
                            <asp:ListItem TabIndex="161" Text="N/A" Value="3"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td>
                        Date:
                        <asp:TextBox TabIndex="161" ID="tbx_p2_corrective_timeDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexTimeLossDate" runat="server" TargetControlID="tbx_p2_corrective_timeDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revTimeLossDate" runat="server" ValidationGroup="vgpFCorrective"
                            ControlToValidate="tbx_p2_corrective_timeDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Time loss date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="vsyFCorrectiveAction" runat="server" ValidationGroup="vgpFCorrective"
                DisplayMode="BulletList" />
        </asp:Panel>
        <h3 id="hr3G">
            <asp:Image ID="imgExpandCollapseG" runat="server" />
            G. Relavant Corrective Actions and Follow Up
            <asp:Label ID="ExpandCollapseG" runat="server" Text=""></asp:Label></h3>
        <asp:Panel ID="pnlG" CssClass="panel" runat="server">
            <p>
                Full descriptions and target completion dates for corrective actions are required.</p>
            <table>
                <tr>
                    <td>
                        Written Safe Work Procedures Required / Updated:
                        <br />
                        <asp:TextBox TabIndex="162" ID="tbx_p2_corrective_written" runat="server" CssClass="commentBoxReporting"
                            TextMode="MultiLine" Width="590px"></asp:TextBox>
                    </td>
                    <td>
                        Target Completion Date:
                        <br />
                        <asp:TextBox TabIndex="163" ID="tbx_p2_corrective_writtenTargetDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexWrittenTargetDate" runat="server" TargetControlID="tbx_p2_corrective_writtenTargetDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revWrittenTargetDate" runat="server" ValidationGroup="vgpGRelevant"
                            ControlToValidate="tbx_p2_corrective_writtenTargetDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Written target date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                        <br />
                        Date completed:
                        <br />
                        <asp:TextBox TabIndex="164" ID="tbx_p2_corrective_writtenCompletedDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexWrittenCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_writtenCompletedDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revWrittenCompletedDate" runat="server" ValidationGroup="vgpGRelevant"
                            ControlToValidate="tbx_p2_corrective_writtenCompletedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Written date completed must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Education or Training Required / Provided for Specific Task:
                        <br />
                        <asp:TextBox TabIndex="165" ID="tbx_p2_corrective_education" runat="server" CssClass="commentBoxReporting"
                            TextMode="MultiLine" Width="590px"></asp:TextBox>
                    </td>
                    <td>
                        Target Completion Date:
                        <br />
                        <asp:TextBox TabIndex="166" ID="tbx_p2_corrective_educationTargetDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexEducationTargetDate" runat="server" TargetControlID="tbx_p2_corrective_educationTargetDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revEducationTargetDate" runat="server" ValidationGroup="vgpGRelevant"
                            ControlToValidate="tbx_p2_corrective_educationTargetDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Education target date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                        <br />
                        Date completed:
                        <br />
                        <asp:TextBox TabIndex="167" ID="tbx_p2_corrective_educationCompletedDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexEducationCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_educationCompletedDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revEducationCompletedDate" runat="server" ValidationGroup="vgpGRelevant"
                            ControlToValidate="tbx_p2_corrective_educationCompletedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Education date completed must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Equipment - Repair / Replace / Purchase
                        <br />
                        <asp:TextBox TabIndex="168" ID="tbx_p2_corrective_equipment" runat="server" CssClass="commentBoxReporting"
                            TextMode="MultiLine" Width="590px"></asp:TextBox>
                    </td>
                    <td>
                        Target Completion Date:
                        <br />
                        <asp:TextBox TabIndex="169" ID="tbx_p2_corrective_equipmentTargetDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexEquipmentTargetDate" runat="server" TargetControlID="tbx_p2_corrective_equipmentTargetDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revEquipmentTargetDate" runat="server" ValidationGroup="vgpGRelevant"
                            ControlToValidate="tbx_p2_corrective_equipmentTargetDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Equipment target date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                        <br />
                        Date completed:
                        <br />
                        <asp:TextBox TabIndex="170" ID="tbx_p2_corrective_equipmentCompletedDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexEquipmentCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_equipmentCompletedDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revEquipmentCompletedDate" runat="server" ValidationGroup="vgpGRelevant"
                            ControlToValidate="tbx_p2_corrective_equipmentCompletedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Eqipment date completed must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Environment - Change / Modify Workstation or subsitute / Eliminate Product:
                        <br />
                        <asp:TextBox TabIndex="171" ID="tbx_p2_corrective_environment" runat="server" CssClass="commentBoxReporting"
                            TextMode="MultiLine" Width="590px"></asp:TextBox>
                    </td>
                    <td>
                        Target Completion Date:
                        <br />
                        <asp:TextBox TabIndex="172" ID="tbx_p2_corrective_environmentTargetDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexEnvironmentTargetDate" runat="server" TargetControlID="tbx_p2_corrective_environmentTargetDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="rexEnvironmentTargetDate" runat="server" ValidationGroup="vgpGRelevant"
                            ControlToValidate="tbx_p2_corrective_environmentTargetDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Environment target date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                        <br />
                        Date completed:
                        <br />
                        <asp:TextBox TabIndex="173" ID="tbx_p2_corrective_environmentCompletedDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexEnvironmentCompleteDate" runat="server" TargetControlID="tbx_p2_corrective_environmentCompletedDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revEnvironmentCompletedDate" runat="server" ValidationGroup="vgpGRelevant"
                            ControlToValidate="tbx_p2_corrective_environmentCompletedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Environment date completed must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Patient/Resident Related Incidents - Lift / Transfer Re-Accessed or Care Plan /
                        ADL Card Updated:
                        <br />
                        <asp:TextBox TabIndex="174" ID="tbx_p2_corrective_patient" runat="server" CssClass="commentBoxReporting"
                            TextMode="MultiLine" Width="590px"></asp:TextBox>
                    </td>
                    <td>
                        Target Completion Date:
                        <br />
                        <asp:TextBox TabIndex="175" ID="tbx_p2_corrective_patientTargetDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexPatientTargetDate" runat="server" TargetControlID="tbx_p2_corrective_patientTargetDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="rexPatientTargetDate" runat="server" ValidationGroup="vgpGRelevant"
                            ControlToValidate="tbx_p2_corrective_patientTargetDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Patient/Resident target date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                        <br />
                        Date completed:
                        <br />
                        <asp:TextBox TabIndex="176" ID="tbx_p2_corrective_patientCompletedDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="cexPatientCompletedDate" runat="server" TargetControlID="tbx_p2_corrective_patientCompletedDate"
                            Format="M/d/yyyy">
                        </asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="revPatientCompletedDate" runat="server" ValidationGroup="vgpGRelevant"
                            ControlToValidate="tbx_p2_corrective_patientCompletedDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                            ErrorMessage="Patient/Resident date completed must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="vsyGRelative" runat="server" ValidationGroup="vgpGRelevant"
                DisplayMode="BulletList" />
        </asp:Panel>
        <h3 id="hr3H">
            <asp:Image ID="imgExpandCollapseH" runat="server" />
            H. Managers Report
            <asp:Label ID="ExpandCollapseH" runat="server" Text=""></asp:Label></h3>
        <asp:Panel ID="pnlH" CssClass="panel" runat="server">
            <table>
                <tr>
                    <td>
                        Do you know of any previous pain/disability in the area of the worker's present
                        injury? If YES, please explain.
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox TabIndex="177" ID="tbx_p2_manager_previous" runat="server" CssClass="commentBoxReporting"
                            TextMode="MultiLine" Width="770px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Do you have any objections to the claim being accepted? If YES, please explain.
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox TabIndex="178" ID="tbx_p2_manager_objections" runat="server" CssClass="commentBoxReporting"
                            TextMode="MultiLine" Width="770px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Is alternative light duty or modified work available?
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox TabIndex="179" ID="tbx_p2_manager_alternative" runat="server" CssClass="commentBoxReporting"
                            TextMode="MultiLine" Width="770px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Does the worker work a fixed shift rotation? If yes, please provide:
                        <br />
                        <table>
                            <thead>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        Sun
                                    </td>
                                    <td>
                                        Mon
                                    </td>
                                    <td>
                                        Tue
                                    </td>
                                    <td>
                                        Wed
                                    </td>
                                    <td>
                                        Thu
                                    </td>
                                    <td>
                                        Fri
                                    </td>
                                    <td>
                                        Sat
                                    </td>
                                </tr>
                            </thead>
                            <tr>
                                <td>
                                    Week1
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week1_sun" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week1_mon" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week1_tue" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week1_wed" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week1_thu" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week1_fri" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week1_sat" runat="server" Width="20px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Week2
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week2_sun" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week2_mon" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week2_tue" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week2_wed" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week2_thu" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week2_fri" runat="server" Width="20px" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbx_p2_manager_week2_sat" runat="server" Width="20px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:ValidationSummary ID="vsyHManagers" runat="server" ValidationGroup="vgpHManagers"
                DisplayMode="BulletList" />
        </asp:Panel>
    </div>
    <div id="divFollowupLab" runat="server" visible="false">
        test
    </div>
    <div id="divFollowupOffice" runat="server" visible="false">
        test
    </div>
</asp:Content>
