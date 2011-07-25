<%@ Page Title="BCCA - Tracking" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Tracking_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script language="javascript" src="../Print.js" ></script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="body">
    <asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
    </asp:ToolkitScriptManager>
    <div id="divCollapsiblePanelExtenders" visible="false">
        <asp:CollapsiblePanelExtender ID="cpeFilters" runat="server" Collapsed="false" CollapseControlID="hr3Filters"
            ExpandControlID="hr3Filters" TargetControlID="pnlFilters" CollapsedText="(Show Details)"
            ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseFilters" TextLabelID="lblExpandCollapseFilters"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="false" CollapseControlID="hr3A"
            ExpandControlID="hr3A" TargetControlID="pnlA" CollapsedText="(Show Details)"
            ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseA" TextLabelID="ExpandCollapseA"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="true" CollapseControlID="hr3B"
            ExpandControlID="hr3B" TargetControlID="pnlB" CollapsedText="(Show Details)"
            ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseB" TextLabelID="ExpandCollapseB"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeC" runat="server" Collapsed="true" CollapseControlID="hr3C"
            ExpandControlID="hr3C" TargetControlID="pnlC" CollapsedText="(Show Details)"
            ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseC" TextLabelID="ExpandCollapseC"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeD" runat="server" Collapsed="true" CollapseControlID="hr3D"
            ExpandControlID="hr3D" TargetControlID="pnlD" CollapsedText="(Show Details)"
            ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseD" TextLabelID="ExpandCollapseD"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeE" runat="server" Collapsed="true" CollapseControlID="hr3E"
            ExpandControlID="hr3E" TargetControlID="pnlE" CollapsedText="(Show Details)"
            ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseE" TextLabelID="ExpandCollapseE"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeResults" runat="server" Collapsed="true" CollapseControlID="hr3Results"
            ExpandControlID="hr3Results" TargetControlID="pnlResults" ImageControlID="imgExpandCollapseResults"
            TextLabelID="lblExpandCollapseResults" CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>

        <asp:CollapsiblePanelExtender ID="cpeEmployees" runat="server" Collapsed="true"
            CollapseControlID="hr3Emps" ExpandControlID="hr3Emps" TargetControlID="pnlEmployees"
            CollapsedText="(Show Details)" ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseEmp"
            TextLabelID="lblExpandCollapseEmp" CollapsedImage="../images/expand.jpg"
            ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>   
        <asp:CollapsiblePanelExtender ID="cpeTraining" runat="server" Collapsed="true"
            CollapseControlID="hr3Training" ExpandControlID="hr3Training" TargetControlID="pnlTraining"
            CollapsedText="(Show Details)" ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseTraining"
            TextLabelID="lblExpandCollapseTraining" CollapsedImage="../images/expand.jpg"
            ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeIncidents" runat="server" Collapsed="true"
            CollapseControlID="hr3Incidents" ExpandControlID="hr3Incidents" TargetControlID="pnlIncidents"
            CollapsedText="(Show Details)" ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseIncidents"
            TextLabelID="lblExpandCollapseIncidents" CollapsedImage="../images/expand.jpg"
            ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeLabInspections" runat="server" Collapsed="true"
            CollapseControlID="hr3LabInspections" ExpandControlID="hr3LabInspections" TargetControlID="pnlLabInspections"
            CollapsedText="(Show Details)" ExpandedText="(Hide Details)" ImageControlID="imgExpandCollapseLabInspections"
            TextLabelID="lblExpandCollapseLabInspections" CollapsedImage="../images/expand.jpg"
            ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
        <asp:CollapsiblePanelExtender ID="cpeOfficeInspections" runat="server" Collapsed="true"
            CollapseControlID="hr3OfficeInspections" ExpandControlID="hr3OfficeInspections"
            TargetControlID="pnlOfficeInspections" CollapsedText="(Show Details)" ExpandedText="(Hide Details)"
            ImageControlID="imgExpandCollapseOfficeInspections" TextLabelID="lblExpandCollapseOfficeInspections"
            CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
        </asp:CollapsiblePanelExtender>
    </div>
    <asp:Label ID="lblUnauthorizedMsg" runat="server" Text="Only Safety Officer and Administrators can access this page. Please visit another page."
        Visible="false" />
    <asp:Panel ID="pnlAllContent" runat="server">
        <h3 id="hr3Filters">
            <asp:Image ID="imgExpandCollapseFilters" runat="server" />
            Incident Form Filters
            <asp:Label ID="lblExpandCollapseFilters" runat="server" Text=""></asp:Label></h3>
        <asp:Panel ID="pnlFilters" CssClass="wideParentPanel" runat="server">
            <h3 id="hr3A">
                <asp:Image ID="imgExpandCollapseA" runat="server" />
                A. Incident/Accident Information
                <asp:Label ID="ExpandCollapseA" runat="server" Text=""></asp:Label></h3>
            <asp:Panel ID="pnlA" CssClass="wideChildPanel" runat="server">
                <div id="divABottomPanel">
                    <h4>
                        Action Following Incident:</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox ID="cbx_p1_action_report" Text="Report Only" runat="server" />
                            </td>
                            <td>
                                <asp:CheckBox ID="cbx_p1_action_firstAid" Text="First Aid" runat="server" />
                            </td>
                            <td>
                                <asp:CheckBox ID="cbx_p1_action_medicalGP" Text="Medical Aid (GP / Clinic)" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="tbx_p1_action_medicalGP_date" runat="server" MaxLength="10"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="tweMedicalGpDate" runat="server" TargetControlID="tbx_p1_action_medicalGP_date"
                                    WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="cexMedicalGpDate" runat="server" TargetControlID="tbx_p1_action_medicalGP_date"
                                    Format="M/d/yyyy">
                                </asp:CalendarExtender>
                                <asp:RegularExpressionValidator ID="revMedicalGpDate" runat="server" ValidationGroup="vgpPanelA"
                                    ControlToValidate="tbx_p1_action_medicalGP_date" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                    ErrorMessage="Medical Aid (GP / Clinic) date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="cbx_p1_action_lostTime" Text="Lost time (missed/will miss next scheduled shift due to injury)"
                                    runat="server" />
                            </td>
                            <td>
                                <asp:CheckBox ID="cbx_p1_action_medicalER" Text="Medical Aid (ER)" runat="server" />
                            </td>
                            <td>
                                <asp:TextBox ID="tbx_p1_action_medicalER_date" runat="server" MaxLength="10"></asp:TextBox>
                                <asp:TextBoxWatermarkExtender ID="tweMedicalErDate" runat="server" TargetControlID="tbx_p1_action_medicalER_date"
                                    WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                                </asp:TextBoxWatermarkExtender>
                                <asp:CalendarExtender ID="cexMedicalErDate" runat="server" TargetControlID="tbx_p1_action_medicalER_date"
                                    Format="M/d/yyyy">
                                </asp:CalendarExtender>
                                <asp:RegularExpressionValidator ID="revMedicalErDate" runat="server" ValidationGroup="vgpPanelA"
                                    ControlToValidate="tbx_p1_action_medicalER_date" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                                    ErrorMessage="Medical Aid (ER) date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                </div>
                <%--<asp:RegularExpressionValidator ID="revMedicalAidDate" runat="server" ValidationGroup="vgpPanelA"
        ControlToValidate="tbxMedicalAidDate" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
        ErrorMessage="Medical Aid date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                --%>
                <asp:ValidationSummary ID="vsyPanelA" runat="server" ValidationGroup="vgpPanelA"
                    DisplayMode="BulletList" />
            </asp:Panel>
            <h3 id="hr3B">
                <asp:Image ID="imgExpandCollapseB" runat="server" />
                B. Nature of Injury
                <asp:Label ID="ExpandCollapseB" runat="server" Text=""></asp:Label></h3>
            <asp:Panel ID="pnlB" CssClass="wideChildPanel" runat="server">
                <h4>
                    Nature of Injury</h4>
                <div id="divBLeftPanel">
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="124" ID="cbx_p1_nature_no" Text="No Injury (Near Miss/ Unsafe Condition)"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="124" ID="cbx_p1_nature_musculoskeletal" Text="Musculoskeletal Injyry (Strain / Sprain)"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="124" ID="cbx_p1_nature_bruise" Text="Bruise / Confusion"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="124" ID="cbx_p1_nature_burn" Text="Burn (Heat or Cold)" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="125" ID="cbx_p1_nature_cut" Text="Cut / Scratch / Abrasion / Laceration / Puncture (Non BBF)"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="125" ID="cbx_p1_nature_puncture" Text="Puncture Wound (BBF)"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divBRightPanel">
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="125" ID="cbx_p1_nature_skinIrritation" Text="Skin Irritation"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="125" ID="cbx_p1_nature_skinMucous" Text="Skin / Mucous Membrane Exposure (incl. eye)"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="126" ID="cbx_p1_nature_eye" Text="Eye Irritation" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="126" ID="cbx_p1_nature_allergic" Text="Allergic Response"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="126" ID="cbx_p1_nature_psychological" Text="Psychological Trauma / Aggressive Incident"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="126" ID="cbx_p1_nature_respiratory" Text="Respiratory Irritation"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <h3 id="hr3C">
                <asp:Image ID="imgExpandCollapseC" runat="server" />
                C. Accident Investigation
                <asp:Label ID="ExpandCollapseC" runat="server" Text=""></asp:Label></h3>
            <asp:Panel ID="pnlC" CssClass="wideChildPanel" runat="server">
                <div id="divCLeftPanel">
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="125" ID="cbx_p2_activity_no" Text="No Injury" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Patient Handling</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_repositioning" Text="Repositioning"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_transferring" Text="Transferring (incl. to seclusion)"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_assistedWalking" Text="Assisted Walking"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_assistedFloor" Text="Assisted from Floor"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_fall" Text="Preventing a fall" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_holding" Text="Holding / Assisting during procedure (incl. patient restraint)"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="127" ID="cbx_p2_activity_toileting" Text="Toileting" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Patient Handling Details</h4>
                    <table>
                        <tr>
                            <td>
                                Equipment used at time of Injury:
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_ceilingLift" Text="Ceiling Lift"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_sitStandLift" Text="Sit-Stand Lift"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_floorLift" Text="Floor Lift" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_manualLift" Text="Manual Lift" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplPatientOther" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_other" Text="Other: " runat="server"
                                            AutoPostBack="true" />
                                        <asp:TextBox TabIndex="128" ID="tbx_p2_patient_otherSpecify" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_patient_otherSpecify_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_patient_otherSpecify" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Was adaquate assistance available?
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButtonList ID="rbl_p2_patient_adequateAssist" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem TabIndex="129" Text="Yes" Value="1"></asp:ListItem>
                                    <asp:ListItem TabIndex="130" Text="No" Value="2"></asp:ListItem>
                                    <asp:ListItem TabIndex="131" Text="Unknown" Value="3"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                How many employees involved in activity at time of incident?
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox TabIndex="132" ID="tbx_p1_numEmployeesInvolved" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="cpvEmployeesInvolved" runat="server" ValidationGroup="vgpCInvestigation"
                                    ControlToValidate="tbx_p1_numEmployeesInvolved" Type="Integer" Operator="DataTypeCheck"
                                    ErrorMessage="The number of employees involved must be a whole number."></asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Patient Care</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_washing" Text="Washing / Bathing"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_dressing" Text="Dressing" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_changing" Text="Changing" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_feeding" Text="Feeding" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_prep" Text="Prep / Dispensing Meds"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_dressingChanges" Text="Dressing Changes"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplOtherPatientCare" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_otherPatientCare" Text="Other: "
                                            runat="server" AutoPostBack="true" />
                                        <asp:TextBox TabIndex="132" ID="tbx_p2_activity_otherPatientCare" runat="server"
                                            AutoPostBack="true" OnTextChanged="tbx_p2_activity_otherPatientCare_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherPatientCare" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divCRightPanel">
                    <h4>
                        Sharps Handling</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="133" ID="cbx_p2_activity_recapping" Text="Re-capping" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="133" ID="cbx_p2_activity_puncture" Text="Veno Puncture / Arterio Puncture"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="133" ID="cbx_p2_activity_sharpsDisposal" Text="Sharps Disposal"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="133" ID="cbx_p2_activity_otherSharps" Text="Other Sharps / Instruments"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Using Material / Equipment</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_lift" Text="Lift / Lower" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_push" Text="Push / Pull" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_carry" Text="Carry" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplOtherMat" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherMat" Text="Other Material Description: "
                                            runat="server" AutoPostBack="true" />
                                        <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherMat" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_activity_otherMat_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherMat" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_driving" Text="Equipment Operation - Driving"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplOtherEquip" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherEquip" Text="Equipment Operation - Other: "
                                            runat="server" AutoPostBack="true" />
                                        <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherEquip" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_activity_otherEquip_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherEquip" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherEquipDesc" Text="Other Equipment Description: "
                                            runat="server" AutoPostBack="true" />
                                        <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherEquipDesc" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_activity_otherEquipDesc_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherEquipDesc" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_equipMain" Text="Equipment Maintenance"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_comp" Text="Office Work - Computer"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_nonComp" Text="Office Work - Non Computer"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Other</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_walking" Text="Walking / Running"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_bending" Text="Bending" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_reading" Text="Reading" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_spill" Text="Spill Cleanup" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_cleaning" Text="Cleaning" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplActivityOther" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_other" Text="Other: " runat="server"
                                            AutoPostBack="true" />
                                        <asp:TextBox TabIndex="135" ID="tbx_p2_activity_other" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_activity_other_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_other" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <asp:ValidationSummary ID="vsyCInvestigation" runat="server" ValidationGroup="vgpCInvestigation"
                        DisplayMode="BulletList" />
                </div>
            </asp:Panel>
            <h3 id="hr3D">
                <asp:Image ID="imgExpandCollapseD" runat="server" />
                D. Cause
                <asp:Label ID="ExpandCollapseD" runat="server" Text=""></asp:Label></h3>
            <asp:Panel ID="pnlD" CssClass="wideChildPanel" runat="server">
                <div id="divDLeftPanel">
                    <h4>
                        Bite</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="136" ID="cbx_p2_cause_human" Text="Human" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="136" ID="cbx_p2_cause_animal" Text="Animal / Insect" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <h4>
                        BBF Exposure</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="137" ID="cbx_p2_cause_needle" Text="Needlestick" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="137" ID="cbx_p2_cause_otherSharps" Text="Other Sharps" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="137" ID="cbx_p2_cause_skin" Text="Skin/ Mucous Membrane (Splash / Spit)"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Ergonomic Factors</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="138" ID="cbx_p2_cause_awkwardPosture" Text="Awkward Posture"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="138" ID="cbx_p2_cause_staticPosture" Text="Static Posture"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="138" ID="cbx_p2_cause_contactStress" Text="Contact Stress"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="138" ID="cbx_p2_cause_force" Text="Force" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="138" ID="cbx_p2_cause_rep" Text="Repetition" runat="server" />
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Other</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_motor" Text="Motor Vehicle Accident"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_slip" Text="Slip and Fall" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_aggression" Text="Workplace Agression"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_undetermined" Text="Cause Undetermined"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_event" Text="Traumatic Event" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_underEquip" Text="Caught In / Under / Between Equipment"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_hit" Text="Hit / Struck By / Cut by Equipment"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplCauseOther" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_other" Text="Other: " runat="server"
                                            AutoPostBack="true" />
                                        <asp:TextBox TabIndex="139" ID="tbx_p2_cause_other" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_cause_other_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_cause_other" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divDAgressionDetailsPanel">
                    <h4>
                        Details for Workplace Aggression Incidents</h4>
                    Type of Incident:
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_verbal" Text="Verbal - threats of violence, verbal assault"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_biting" Text="Biting / Spitting"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_hitting" Text="Hitting / Kicking / Beating / Choking"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_squeezing" Text="Squeezing / Punching / Scratching / Twisting"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_assault" Text="Sexual assault"
                                    runat="server" />
                            </td>
                        </tr>
                    </table>
                    Incident Involved:
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_patient" Text="Patient / Resident"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_family" Text="Family member of Patient / Resident"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_public" Text="Other member of Public"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_worker" Text="Worker" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplAgressionOther" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_other" Text="Other: " runat="server"
                                            AutoPostBack="true" />
                                        <asp:TextBox TabIndex="141" ID="tbx_p2_cause_aggression_other" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_cause_aggression_other_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_cause_aggression_other" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divDRightPanel">
                    <h4>
                        Exposure</h4>
                    <table>
                        <tr>
                            <td>
                                Checmical Name:
                                <asp:TextBox ID="tbx_p2_cause_exposure_chemName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemInhalation" Text="Chemical Inhalation"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemIngest" Text="Chemical Ingestion"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemContact" Text="Chemical Skin / Eye Contact"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_latex" Text="Latex" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_dust" Text="Dust / Particulate" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_disease" Text="Communicable Diseases"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_temp" Text="Temperature Extremes" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_noise" Text="Noise" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_radiation" Text="Radiation" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_elec" Text="Electricity" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="142" ID="cbx_p2_cause_air" Text="Indoor Air Quality" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <h3 id="hr3E">
                <asp:Image ID="imgExpandCollapseE" runat="server" />
                E. Contributing Factors
                <asp:Label ID="ExpandCollapseE" runat="server" Text=""></asp:Label></h3>
            <asp:Panel ID="pnlE" CssClass="wideChildPanel" runat="server">
                <div id="divELeftPanel">
                    <h4>
                        Equipment / Device</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_malfunction" Text="Malfunctioning"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_improperUse" Text="Improper Use"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_signage" Text="Improper / Inadequate signage"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_notAvailable" Text="Not Available at Point of Use"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_poorDesign" Text="Poor Design" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplFactorsOtherEquip" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_otherEquip" Text="Other: " runat="server"
                                            AutoPostBack="true" />
                                        <asp:TextBox TabIndex="143" ID="tbx_p2_factors_otherEquip" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_factors_otherEquip_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherEquip" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Environment</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_temp" Text="Temperature" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_workplace" Text="Workplace" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_layout" Text="Layout / Design" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_limitedWorkspace" Text="Limited Workspace"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_slippery" Text="Floor Slippery / Uneven"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_lighting" Text="Lighting Inadequate"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_noise" Text="Exessive Noise" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_vent" Text="Ventilation Inadequate"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_storage" Text="Improper Storage"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplOtherEnv" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_otherEnv" Text="Other: " runat="server"
                                            AutoPostBack="true" />
                                        <asp:TextBox TabIndex="144" ID="tbx_p2_factors_otherEnv" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_factors_otherEnv_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherEnv" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divEMiddlePanel">
                    <h4>
                        Work Practice</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_assessment" Text="Improper Assessment of Client / Load"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_procedure" Text="Not Follow Appropriate Procedure"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_equip" Text="Not Use Designated / Appropriate Equipment"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_conduct" Text="Conduct" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_extended" Text="Task Performed for extended periods"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_comm" Text="Communication" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_unaccustomed" Text="Unaccustomed"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplOtherWorkPractice" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_otherWorkPractice" Text="Other: "
                                            runat="server" AutoPostBack="true" />
                                        <asp:TextBox TabIndex="145" ID="tbx_p2_factors_otherWorkPractice" runat="server"
                                            AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherWorkPractice_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherWorkPractice" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Patient Related Factors</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_directions" Text="Unable to Follow Directions"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_weight" Text="Inconsistent Weight Bearing"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_aggressive" Text="Patient Aggressive"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_patientResistive" Text="Patient Resistive"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_movement" Text="Made Unexpected Movement"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_confused" Text="Confused / Dementia"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_influence" Text="Under Influence of Drugs / Alcohol"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_lang" Text="Language Barriers" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplOtherPatient" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_otherPatient" Text="Other: " runat="server"
                                            AutoPostBack="true" />
                                        <asp:TextBox TabIndex="146" ID="tbx_p2_factors_otherPatient" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_factors_otherPatient_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherPatient" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divERightPanel">
                    <h4>
                        Organizational / Administrative</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_alone" Text="Working Alone" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_info" Text="Inadequate Information"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_scheduling" Text="Inappropriate Scheduling"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_training" Text="Lack of Training / Education"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_appropriateEquip" Text="Lack of Appropriate Equipment"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_personal" Text="Lack of Personal Protection Equipment"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_safe" Text="Lack of Safe Work Procedures"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_perceived" Text="Perceived Time Constraints"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplOtherOrganizational" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_otherOrganizational" Text="Other: "
                                            runat="server" AutoPostBack="true" />
                                        <asp:TextBox TabIndex="147" ID="tbx_p2_factors_otherOrganizational" runat="server"
                                            AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherOrganizational_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherOrganizational" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <h4>
                        Worker</h4>
                    <table>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_inexperienced" Text="Inexperienced"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_communication" Text="Communication Difficulties"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_fatigued" Text="Fatigued" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_distracted" Text="Distracted" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_preexisting" Text="Pre-existing Injury"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_sick" Text="Sick / Medicated" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:UpdatePanel ID="uplOtherWorker" runat="server">
                                    <ContentTemplate>
                                        <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_otherWorker" Text="Other: " runat="server"
                                            AutoPostBack="true" />
                                        <asp:TextBox TabIndex="148" ID="tbx_p2_factors_otherWorker" runat="server" AutoPostBack="true"
                                            OnTextChanged="tbx_p2_factors_otherWorker_OnTextChanged"></asp:TextBox>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherWorker" EventName="TextChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <asp:Button TabIndex="1112" ID="btnFilterReport" runat="server" Text="Find Reports"
                OnClick="btnFilterReport_Click" />
        </asp:Panel>
        <asp:Panel ID="pnlResultsContainer" runat="server" Visible="false">
            <h3 id="hr3Results">
                <asp:Image ID="imgExpandCollapseResults" runat="server" />
                Results by Department
                <asp:Label ID="lblExpandCollapseResults" runat="server" Text=""></asp:Label></h3>
            
            <asp:Panel ID="pnlResults" CssClass="panel" runat="server">
                <div id="divDeptsHeader">
                <asp:Panel ID="pnlFiltersSelectedContainer" runat="server">
                    <asp:Label ID="lblFilters" runat="server" Text="No filters selected." Font-Bold="true" />
                    <asp:Panel ID="pnlFiltersSelected" runat="server"></asp:Panel>
                    <br />
                    <table>
                        <tr>
                            <td>Results per page:</td>
                            <td>
                                <asp:TextBox ID="tbxDeptSearchPages" runat="server"></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="fteDeptSearchPages" runat="server" TargetControlID="tbxDeptSearchPages"
                                    ValidChars="0123456789" />
                                (leave blank to show all results)
                            </td>
                        </tr>
                        <tr>
                            <td>Department:</td>
                            <td>
                                <asp:TextBox ID="tbxDeptSearchDept" runat="server"></asp:TextBox>
                                <asp:CheckBox ID="cbxDeptSearchDept" Text="Exact match only" runat="server" />
                            </td>
                        </tr>
                    </table>
                
                    <asp:Button ID="btnDeptSearch" runat="server" Text="Search" OnClick="btnDeptSearch_Click" ValidationGroup="vgpDeptSearch" />
                    <asp:Button ID="btnDeptSearchReset" runat="server" Text="Reset" OnClick="btnDeptSearchReset_Click" />
                    <asp:Button ID="btnPrintDepts" runat="server" Text="Print" />
                    <asp:ValidationSummary ID="vsyDeptSearch" runat="server" DisplayMode="BulletList" ValidationGroup="vgpDeptSearch" />
                        
                    <br /><br />
                </asp:Panel>
                </div>        
                        
            <div id="divDepts">
            <asp:GridView ID="gdvDepts" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                    OnSelectedIndexChanged="gdvDepts_SelectedIndexChanged"
                    OnSorting="gdvDepts_Sorting" AllowSorting="true"
                    OnPageIndexChanging="gdvDepts_PageIndexChanging" AllowPaging="true" EnableViewState="true" 
                    PagerSettings-PageButtonCount="10" PagerSettings-Mode="NumericFirstLast" >
                <HeaderStyle BackColor="#89c123" ForeColor="White" />
                <PagerStyle CssClass="GridViewPagerStyle" />
                <Columns>
                    <asp:BoundField HeaderText="#" HeaderStyle-Width="25" DataField="deptNo" SortExpression="deptNo" ReadOnly="True" />
                    <asp:BoundField HeaderText="Department" ItemStyle-Width="160" DataField="deptName"
                        SortExpression="deptName" ReadOnly="True" />
                    <asp:BoundField HeaderText="Matching Incidents in Dept" ItemStyle-Width="110" ItemStyle-HorizontalAlign="Right"
                        DataField="matchesInDept" SortExpression="matchesInDept" ReadOnly="True" />
                    <asp:BoundField HeaderText="%" DataField="matchesInDeptPercent" ItemStyle-Width="45" ItemStyle-HorizontalAlign="Right"
                        SortExpression="matchesInDeptPercent" DataFormatString="{0:0%}" ReadOnly="True" />
                    <asp:BoundField HeaderText="Total Matching Incidents" ItemStyle-Width="110" ItemStyle-HorizontalAlign="Right"
                        DataField="totalMatches" SortExpression="totalMatches" ReadOnly="True" />
                    <asp:BoundField HeaderText="%" DataField="totalMatchesPercent" ItemStyle-Width="45" ItemStyle-HorizontalAlign="Right"
                        SortExpression="totalMatchesPercent" DataFormatString="{0:0%}" ReadOnly="True" />
                    <asp:BoundField HeaderText="Total Incidents" DataField="totalIncidents" ItemStyle-Width="110" ItemStyle-HorizontalAlign="Right"
                        SortExpression="totalIncidents" ReadOnly="True" />
                    <asp:BoundField HeaderText="%" DataField="totalIncidentsPercent" ItemStyle-Width="45" ItemStyle-HorizontalAlign="Right"
                        SortExpression="totalIncidentsPercent" DataFormatString="{0:0%}" ReadOnly="True" />
                    <asp:CommandField HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center" ShowSelectButton="True" SelectText="Select" ButtonType="Button" />
                </Columns>
                <EmptyDataTemplate>No departments found.</EmptyDataTemplate>
            </asp:GridView>
            </div>
        </asp:Panel>
         
    <h3 id="hr3Emps">
    <asp:Image ID="imgExpandCollapseEmp" runat="server" />
    Employees
    <asp:Label ID="lblExpandCollapseEmp" runat="server" Text=""></asp:Label></h3>
    <asp:Panel ID="pnlEmployees" runat="server" CssClass="panel" >
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
        <table>
            <tr>
                <td>Results per page:</td>
                <td>
                    <asp:TextBox ID="tbxEmpSearchPages" runat="server"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="fteEmpSearchPages" runat="server" TargetControlID="tbxEmpSearchPages"
                        ValidChars="0123456789" />
                    (leave blank to show all results)
                </td>
            </tr>
            <tr>
                <td>Department:</td>
                <td>
                    <asp:TextBox ID="tbxEmpSearchDept" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxEmpSearchDept" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Name:</td>
                <td>
                    <asp:TextBox ID="tbxEmpSearchName" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxEmpSearchName" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Employer:</td>
                <td>
                    <asp:TextBox ID="tbxEmpSearchEmployer" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxEmpSearchEmployer" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Show results: </td>
                <td><asp:CheckBox ID="cbxEmpSearchCurrent" Text="Include current employees" Checked="true" runat="server" /></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:CheckBox ID="cbxEmpSearchFormer" Text="Include former employees" runat="server" /></td>
            </tr>
        </table>
                
        <asp:Button ID="btnEmpSearch" runat="server" Text="Search" OnClick="btnEmpSearch_Click" ValidationGroup="vgpEmpSearch" />
        <asp:Button ID="btnEmpSearchReset" runat="server" Text="Reset" OnClick="btnEmpSearchReset_Click" />
        <asp:Button ID="btnPrintEmps" runat="server" Text="Print" />
        <asp:ValidationSummary ID="vsyEmpSearch" runat="server" DisplayMode="BulletList" ValidationGroup="vgpEmpSearch" />
        
        <br /><br />
        
        <div id="divEmps">
        <asp:GridView ID="gdvEmployees" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                OnSelectedIndexChanged="gdvEmployees_SelectedIndexChanged" OnRowDataBound="gdvEmployees_RowDataBound"
                OnSorting="gdvEmployees_Sorting" AllowSorting="true" ShowFooter="true"
                OnPageIndexChanging="gdvEmployees_PageIndexChanging" AllowPaging="true" EnableViewState="true" 
                PagerSettings-PageButtonCount="10" PagerSettings-Mode="NumericFirstLast" >
            <HeaderStyle BackColor="#89c123" ForeColor="White" />
            <PagerStyle CssClass="GridViewPagerStyle" />
            <FooterStyle BackColor="LightGray" ForeColor="Black" Font-Bold="false" />
            <Columns>
                <asp:BoundField HeaderText="#" DataField="empNo" SortExpression="empNo" ItemStyle-Width="30" ReadOnly="True" />
                <asp:BoundField HeaderText="Department" DataField="empDept" SortExpression="empDept" ItemStyle-Width="150" ReadOnly="True" />
                <asp:BoundField HeaderText="Name" DataField="empName" SortExpression="empName" ReadOnly="True" />
                <asp:BoundField HeaderText="Employer" DataField="employer" SortExpression="employer" ReadOnly="True" />
                <asp:BoundField HeaderText="Incidents" DataField="incidents" SortExpression="incidents" ReadOnly="True" />
                <asp:BoundField HeaderText="Courses" DataField="totalCourses" SortExpression="totalCourses" ReadOnly="True" />
                <asp:BoundField HeaderText="Valid" DataField="validCourses" SortExpression="validCourses" ReadOnly="True" />
                <asp:BoundField HeaderText="Expired" DataField="expiredCourses" SortExpression="expiredCourses" ReadOnly="True" />
                <asp:CommandField HeaderText="Click to View" HeaderStyle-Width="90" ItemStyle-HorizontalAlign="Center"
                    ShowSelectButton="True" SelectText="Record" ButtonType="Button" />
            </Columns>
            <EmptyDataTemplate>No employees found.</EmptyDataTemplate>
        </asp:GridView>
        </div>

        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnEmpSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnEmpSearchReset" EventName="Click" />
        </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    
    <h3 id="hr3Training">
    <asp:Image ID="imgExpandCollapseTraining" runat="server" />
    Training
    <asp:Label ID="lblExpandCollapseTraining" runat="server" Text=""></asp:Label></h3>
    <asp:Panel ID="pnlTraining" runat="server" CssClass="panel" >
        <asp:UpdatePanel ID="UpdatePanel9" runat="server">
        <ContentTemplate>

        <table>
            <tr>
                <td>Results per page:</td>
                <td>
                    <asp:TextBox ID="tbxTrainingSearchPages" runat="server"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="fteTrainingSearchPages" runat="server" TargetControlID="tbxTrainingSearchPages"
                        ValidChars="0123456789" />
                    (leave blank to show all results)
                </td>
            </tr>
            <tr>
                <td>Department:</td>
                <td>
                    <asp:TextBox ID="tbxTrainingSearchDept" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxTrainingSearchDept" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Employee name:</td>
                <td>
                    <asp:TextBox ID="tbxTrainingSearchEmp" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxTrainingSearchEmp" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Training name:</td>
                <td>
                    <asp:TextBox ID="tbxTrainingSearchCourse" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxTrainingSearchCourse" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Course date from: </td>
                <td>
                    <asp:TextBox ID="tbxEarliestCourseDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweEarliestCourseDate" runat="server" TargetControlID="tbxEarliestCourseDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexEarliestCourseDate" runat="server" Enabled="True"
                        TargetControlID="tbxEarliestCourseDate" Format="M/d/yyyy">
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revEarliestCourseDate" runat="server" ValidationGroup="vgpTrainingSearch"
                        Display="Dynamic" ControlToValidate="tbxEarliestCourseDate"
                        ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Earliest course date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvEarliestCourseDate" runat="server" ValidationGroup="vgpTrainingSearch"
                        Display="Dynamic" ErrorMessage="Earliest course date must be in the format 'MM/DD/YYYY'"
                        OnServerValidate="cmvEarliestDate_ServerValidate" ControlToValidate="tbxEarliestCourseDate" ></asp:CustomValidator>
                    to 
                    <asp:TextBox ID="tbxLatestCourseDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweLatestCourseDate" runat="server" TargetControlID="tbxLatestCourseDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexLatestCourseDate" runat="server" Enabled="True"
                        TargetControlID="tbxLatestCourseDate" Format="M/d/yyyy">
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revLatestCourseDate" runat="server" ValidationGroup="vgpTrainingSearch"
                        Display="Dynamic" ControlToValidate="tbxLatestCourseDate"
                        ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Latest course date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvLatestCourseDate" runat="server" ValidationGroup="vgpTrainingSearch"
                        Display="Dynamic" ErrorMessage="" OnServerValidate="cmvLatestCourseDate_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Expiry date from: </td>
                <td>
                    <asp:TextBox ID="tbxEarliestExpiryDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweEarliestExpiryDate" runat="server" TargetControlID="tbxEarliestExpiryDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexEarliestExpiryDate" runat="server" Enabled="True"
                        TargetControlID="tbxEarliestExpiryDate" Format="M/d/yyyy">
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revEarliestExpiryDate" runat="server" ValidationGroup="vgpTrainingSearch"
                        Display="Dynamic" ControlToValidate="tbxEarliestExpiryDate"
                        ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Earliest expiry date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvEarliestExpiryDate" runat="server" ValidationGroup="vgpTrainingSearch"
                        Display="Dynamic" ErrorMessage="Earliest expiry date must be in the format 'MM/DD/YYYY'"
                        OnServerValidate="cmvEarliestDate_ServerValidate" ControlToValidate="tbxEarliestExpiryDate" ></asp:CustomValidator>
                    to 
                    <asp:TextBox ID="tbxLatestExpiryDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweLatestExpiryDate" runat="server" TargetControlID="tbxLatestExpiryDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexLatestExpiryDate" runat="server" Enabled="True"
                        TargetControlID="tbxLatestExpiryDate" Format="M/d/yyyy">
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revLatestExpiryDate" runat="server" ValidationGroup="vgpTrainingSearch"
                        Display="Dynamic" ControlToValidate="tbxLatestExpiryDate"
                        ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Latest expiry date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvLatestExpiryDate" runat="server" ValidationGroup="vgpTrainingSearch"
                        Display="Dynamic" ErrorMessage="" OnServerValidate="cmvLatestExpiryDate_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Show results: </td>
                <td>
                    <asp:RadioButtonList ID="rblMostRecent" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="All training" Value="all"></asp:ListItem>
                        <asp:ListItem Text="Most recent training" Value="mostRecent" Selected="True" ></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><asp:CheckBox ID="cbxIncludeDeleted" Text="Include deleted courses" runat="server" /></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:CheckBox ID="cbxIncludeValid" Text="Include valid courses" runat="server" Checked="True" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:CheckBox ID="cbxIncludeExpired" Text="Include expired courses" runat="server" Checked="True" />
                    &nbsp;(<asp:CheckBox ID="cbxHighlightExpired" Text="Highlight" runat="server" Checked="True" />)
                </td>
            </tr>
        </table>

        <asp:Button ID="btnTrainingSearch" runat="server" Text="Search" OnClick="btnTrainingSearch_Click" ValidationGroup="vgpTrainingSearch" />
        <asp:Button ID="btnTrainingSearchReset" runat="server" Text="Reset" OnClick="btnTrainingSearchReset_Click" />
        <asp:Button ID="btnPrintTraining" runat="server" Text="Print" />
        <asp:ValidationSummary ID="vsyTrainingSearch" runat="server" DisplayMode="BulletList" ValidationGroup="vgpTrainingSearch" />
        <br /><br />

        <div id="divTraining">
        <asp:GridView ID="gdvTraining" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                OnSelectedIndexChanged="gdvTraining_SelectedIndexChanged" OnRowDataBound="gdvTraining_RowDataBound"
                OnSorting="gdvTraining_Sorting" AllowSorting="true"
                OnPageIndexChanging="gdvTraining_PageIndexChanging" AllowPaging="true" EnableViewState="true" 
                PagerSettings-PageButtonCount="10" PagerSettings-Mode="NumericFirstLast" >
            <HeaderStyle BackColor="#89c123" ForeColor="White" />
            <PagerStyle CssClass="GridViewPagerStyle" />
            <Columns>
                <asp:BoundField HeaderText="#" SortExpression="ttNo" ItemStyle-Width="30" DataField="ttNo" ReadOnly="True" />
                <asp:BoundField HeaderText="Department" SortExpression="empDept" ItemStyle-Width="150" DataField="empDept" ReadOnly="True" />
                <asp:BoundField HeaderText="Name" SortExpression="empName" DataField="empName" ReadOnly="True" />
                <asp:BoundField HeaderText="Training" SortExpression="courseName" DataField="courseName" ReadOnly="True" />
                <asp:BoundField HeaderText="Course Date" SortExpression="courseDate" DataField="courseDate" ItemStyle-Width="90" DataFormatString="{0:M/d/yyyy}" ReadOnly="True" />
                <asp:BoundField HeaderText="Expiry Date" SortExpression="expiryDate" DataField="expiryDate" ItemStyle-Width="90" DataFormatString="{0:M/d/yyyy}" ReadOnly="True" />
                <asp:BoundField HeaderText="*" SortExpression="expired" DataField="expired" ReadOnly="True" />
                <asp:CommandField HeaderText="Click to View" HeaderStyle-Width="90" ItemStyle-HorizontalAlign="Center"
                    ShowSelectButton="True" SelectText="Record" ButtonType="Button" />
            </Columns>
            <EmptyDataTemplate>No training found.</EmptyDataTemplate>
        </asp:GridView>
        </div>
                
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnTrainingSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnTrainingSearchReset" EventName="Click" />
        </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>

    
    <h3 id="hr3Incidents">
    <asp:Image ID="imgExpandCollapseIncidents" runat="server" />
    Incident Reports
    <asp:Label ID="lblExpandCollapseIncidents" runat="server" Text=""></asp:Label></h3>
    <asp:Panel ID="pnlIncidents" runat="server" CssClass="panel" >
        
        <asp:UpdatePanel ID="UpdatePanel4" runat="server" >
        <ContentTemplate>

        <table>
            <tr>
                <td>Results per page:</td>
                <td>
                    <asp:TextBox ID="tbxIncidentSearchPages" runat="server"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="fteIncidentSearchPages" runat="server" TargetControlID="tbxIncidentSearchPages"
                        ValidChars="0123456789" />
                    (leave blank to show all results)
                </td>
            </tr>
            <tr>
                <td>Department:</td>
                <td>
                    <asp:TextBox ID="tbxIncSearchDept" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxIncSearchDept" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Employee:</td>
                <td>
                    <asp:TextBox ID="tbxIncSearchEmp" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxIncSearchEmp" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Submitter:</td>
                <td>
                    <asp:TextBox ID="tbxIncSearchSubmitter" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxIncSearchSubmitter" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Incident date from: </td>
                <td>
                    <asp:TextBox ID="tbxEarliestIncidentDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweEarliestIncidentDate" runat="server" TargetControlID="tbxEarliestIncidentDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexEarliestIncidentDate" runat="server" Enabled="True"
                        TargetControlID="tbxEarliestIncidentDate" Format="M/d/yyyy">
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revEarliestIncidentDate" runat="server" ValidationGroup="vgpIncidentSearch"
                        Display="Dynamic" ControlToValidate="tbxEarliestIncidentDate"
                        ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Earliest incident date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvEarliestIncidentDate" runat="server" ValidationGroup="vgpIncidentSearch"
                        Display="Dynamic" ErrorMessage="Earliest incident date must be in the format 'MM/DD/YYYY'"
                        OnServerValidate="cmvEarliestDate_ServerValidate" ControlToValidate="tbxEarliestIncidentDate" ></asp:CustomValidator>
                    to 
                    <asp:TextBox ID="tbxLatestIncidentDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweLatestIncidentDate" runat="server" TargetControlID="tbxLatestIncidentDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexLatestIncidentDate" runat="server" Enabled="True"
                        TargetControlID="tbxLatestIncidentDate" Format="M/d/yyyy">
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revLatestIncidentDate" runat="server" ValidationGroup="vgpIncidentSearch"
                        Display="Dynamic" ControlToValidate="tbxLatestIncidentDate"
                        ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Latest incident date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvLatestIncidentDate" runat="server" ValidationGroup="vgpIncidentSearch"
                        Display="Dynamic" ErrorMessage="" OnServerValidate="cmvLatestIncidentDate_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Report date from: </td>
                <td>
                    <asp:TextBox ID="tbxEarliestReportDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweEarliestReportDate" runat="server" TargetControlID="tbxEarliestReportDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexEarliestReportDate" runat="server" Enabled="True"
                        TargetControlID="tbxEarliestReportDate" Format="M/d/yyyy">
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revEarliestReportDate" runat="server" ValidationGroup="vgpIncidentSearch"
                        Display="Dynamic" ControlToValidate="tbxEarliestReportDate"
                        ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Earliest report date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvEarliestReportDate" runat="server" ValidationGroup="vgpIncidentSearch"
                        Display="Dynamic" ErrorMessage="Earliest report date must be in the format 'MM/DD/YYYY'"
                        OnServerValidate="cmvEarliestDate_ServerValidate" ControlToValidate="tbxEarliestReportDate" ></asp:CustomValidator>
                    to 
                    <asp:TextBox ID="tbxLatestReportDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweLatestReportDate" runat="server" TargetControlID="tbxLatestReportDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexLatestReportDate" runat="server" Enabled="True"
                        TargetControlID="tbxLatestReportDate" Format="M/d/yyyy">
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revLatestReportDate" runat="server" ValidationGroup="vgpIncidentSearch"
                        Display="Dynamic" ControlToValidate="tbxLatestReportDate"
                        ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Latest report date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvLatestReportDate" runat="server" ValidationGroup="vgpIncidentSearch"
                        Display="Dynamic" ErrorMessage="" OnServerValidate="cmvLatestReportDate_ServerValidate"></asp:CustomValidator>
                </td>                
            </tr>
        </table>
                
        <asp:Button ID="btnIncidentSearch" runat="server" Text="Search" OnClick="btnIncidentSearch_Click" ValidationGroup="vgpIncidentSearch" />
        <asp:Button ID="btnIncidentSearchReset" runat="server" Text="Reset" OnClick="btnIncidentSearchReset_Click" />
        <asp:Button ID="btnPrintIncidents" runat="server" Text="Print" />
        <asp:ValidationSummary ID="vsyIncidentSearch" runat="server" DisplayMode="BulletList" ValidationGroup="vgpIncidentSearch" />

        <br /><br />
        
        <%--<asp:UpdatePanel ID="UpdatePanel5" runat="server" >
        <ContentTemplate>--%>

        <div id="divIncidents">
        <asp:GridView ID="gdvIncidents" runat="server" AutoGenerateColumns="False" HorizontalAlign="Center"
                OnSelectedIndexChanged="gdvIncidents_SelectedIndexChanged"
                OnSorting="gdvIncidents_Sorting" AllowSorting="true" 
                OnPageIndexChanging="gdvIncidents_PageIndexChanging" AllowPaging="true" EnableViewState="true" 
                PagerSettings-PageButtonCount="10" PagerSettings-Mode="NumericFirstLast" >
            <HeaderStyle BackColor="#89c123" ForeColor="White" />
            <PagerStyle CssClass="GridViewPagerStyle" />
            <Columns>
                <asp:BoundField HeaderText="#" SortExpression="incidentNo" ItemStyle-Width="30" DataField="incidentNo" ReadOnly="True" />
                <asp:BoundField HeaderText="Department" SortExpression="deptName" ItemStyle-Width="150" DataField="deptName" ReadOnly="True" />
                <asp:BoundField HeaderText="Employee" SortExpression="employee" DataField="employee" ReadOnly="True" />
                <asp:BoundField HeaderText="Incident Date" SortExpression="incidentDate" DataField="incidentDate" DataFormatString="{0:M/d/yyyy}" ReadOnly="True" />
                <asp:BoundField HeaderText="Report Date" SortExpression="reportDate" DataField="reportDate" DataFormatString="{0:M/d/yyyy}" ReadOnly="True" />
                <asp:BoundField HeaderText="Submitter" SortExpression="submitter" DataField="submitter" ReadOnly="True" />
                <asp:CommandField HeaderText="Click to View" HeaderStyle-Width="90" ItemStyle-HorizontalAlign="Center"
                    ShowSelectButton="True" SelectText="Report" ButtonType="Button" />
            </Columns>
        <EmptyDataTemplate>No incident reports found.</EmptyDataTemplate>
        </asp:GridView>
        </div>
        
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnIncidentSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnIncidentSearchReset" EventName="Click" />
        </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>

    <h3 id="hr3LabInspections">
    <asp:Image ID="imgExpandCollapseLabInspections" runat="server" />
    Lab Inspections
    <asp:Label ID="lblExpandCollapseLabInspections" runat="server" Text=""></asp:Label></h3>
    <asp:Panel ID="pnlLabInspections" CssClass="panel" runat="server">
       <asp:UpdatePanel ID="UpdatePanel11" runat="server">
       <ContentTemplate>
       
       <table>
            <tr>
                <td>Results per page:</td>
                <td>
                    <asp:TextBox ID="tbxLabInspPages" runat="server"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="fteLabInspPages" runat="server" TargetControlID="tbxLabInspPages"
                        ValidChars="0123456789" />
                    (leave blank to show all results)
                </td>
            </tr>
            <tr>
                <td>Department:</td>
                <td>
                    <asp:TextBox ID="tbxLabInspDept" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxLabInspDept" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Inspector:</td>
                <td>
                    <asp:TextBox ID="tbxLabInspInspector" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxLabInspInspector" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Room:</td>
                <td>
                    <asp:TextBox ID="tbxLabInspRoom" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxLabInspRoom" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Lab Manager:</td>
                <td>
                    <asp:TextBox ID="tbxLabInspLabMgr" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxLabInspLabMgr" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Inspection date: </td>
                <td>
                    <asp:TextBox ID="tbxLabInspDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweLabInspDate" runat="server" TargetControlID="tbxLabInspDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexLabInspDate" runat="server" Enabled="True"
                        TargetControlID="tbxLabInspDate" Format="M/d/yyyy">
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revLabInspDate" runat="server" ValidationGroup="vgpLabInspSearch"
                        Display="Dynamic" ControlToValidate="tbxLabInspDate"
                        ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Inspection date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvLabInspDate" runat="server" ValidationGroup="vgpLabInspSearch"
                        Display="Dynamic" ErrorMessage="Inspection date must be in the format 'MM/DD/YYYY'"
                        OnServerValidate="cmvEarliestDate_ServerValidate" ControlToValidate="tbxLabInspDate" ></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Follow-up:</td>
                <td>
                    <asp:RadioButtonList ID="rblLabInspFollowup" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="no" ></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>

        <asp:Button ID="btnLabInspSearch" runat="server" Text="Search" OnClick="btnLabInspSearch_Click" ValidationGroup="vgpLabInspSearch" />
        <asp:Button ID="btnLabInspSearchReset" runat="server" Text="Reset" OnClick="btnLabInspSearchReset_Click" />
        <asp:Button ID="btnPrintLabInsps" runat="server" Text="Print" />
        <asp:ValidationSummary ID="vsyLabInspSearch" runat="server" DisplayMode="BulletList" ValidationGroup="vgpLabInspSearch" />
        
        <br /><br />
        
        <div id="divLabInsps">
        <asp:GridView ID="gdvLabInspections" runat="server" AutoGenerateColumns="False" 
                OnSelectedIndexChanged="gdvLabInspections_SelectedIndexChanged"
                OnSorting="gdvLabInspections_Sorting" AllowSorting="true" 
                OnPageIndexChanging="gdvIncidents_PageIndexChanging" AllowPaging="true" EnableViewState="true" 
                PagerSettings-PageButtonCount="10" PagerSettings-Mode="NumericFirstLast" >
            <HeaderStyle BackColor="#89c123" ForeColor="White" />
            <PagerStyle CssClass="GridViewPagerStyle" />
            <Columns>
                <asp:BoundField DataField="labInspectionNo" HeaderText="#" ItemStyle-Width="30" ReadOnly="True" SortExpression="labInspectionNo" />
                <asp:BoundField DataField="deptName" HeaderText="Department" ItemStyle-Width="150" ReadOnly="True" SortExpression="deptName" />
                <asp:BoundField DataField="inspectionDate" HeaderText="Date" ItemStyle-Width="75" SortExpression="inspectionDate" DataFormatString="{0:M/d/yyyy}" ReadOnly="True" />
                <asp:BoundField DataField="followup" HeaderText="Follow-Up" ItemStyle-Width="75" ReadOnly="True" SortExpression="followup" />
                <asp:BoundField DataField="inspector" HeaderText="Inspector" ReadOnly="True" SortExpression="inspector" />
                <asp:BoundField DataField="room" HeaderText="Room" ReadOnly="True" SortExpression="room" />
                <asp:BoundField DataField="labMgr" HeaderText="Lab Manager" ReadOnly="True" SortExpression="room" />
                <asp:CommandField HeaderText="Click to View" HeaderStyle-Width="90" ItemStyle-HorizontalAlign="Center"
                    ShowSelectButton="True" SelectText="Checklist" ButtonType="Button" />
            </Columns>
            <EmptyDataTemplate>No lab inspections found.</EmptyDataTemplate>
        </asp:GridView>
        </div>
        
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnLabInspSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnLabInspSearchReset" EventName="Click" />
        </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    
    <h3 id="hr3OfficeInspections">
    <asp:Image ID="imgExpandCollapseOfficeInspections" runat="server" />
    Office Inspections
    <asp:Label ID="lblExpandCollapseOfficeInspections" runat="server" Text=""></asp:Label></h3>
    <asp:Panel ID="pnlOfficeInspections" CssClass="panel" runat="server">
       <asp:UpdatePanel ID="UpdatePanel12" runat="server">
       <ContentTemplate>
       
       <table>
           <tr>
                <td>Results per page:</td>
                <td>
                    <asp:TextBox ID="tbxOffInspPages" runat="server"></asp:TextBox>
                    <asp:FilteredTextBoxExtender ID="fteOffInspPages" runat="server" TargetControlID="tbxOffInspPages"
                        ValidChars="0123456789" />
                    (leave blank to show all results)
                </td>
            </tr>
            <tr>
                <td>Department:</td>
                <td>
                    <asp:TextBox ID="tbxOffInspDept" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxOffInspDept" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Inspector:</td>
                <td>
                    <asp:TextBox ID="tbxOffInspInspector" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxOffInspInspector" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Area:</td>
                <td>
                    <asp:TextBox ID="tbxOffInspArea" runat="server"></asp:TextBox>
                    <asp:CheckBox ID="cbxOffInspArea" Text="Exact match only" runat="server" />
                </td>
            </tr>
            <tr>
                <td>Inspection date: </td>
                <td>
                    <asp:TextBox ID="tbxOffInspDate" runat="server"></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweOffInspDate" runat="server" TargetControlID="tbxOffInspDate"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY">
                    </asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexOffInspDate" runat="server" Enabled="True"
                        TargetControlID="tbxOffInspDate" Format="M/d/yyyy">
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revOffInspDate" runat="server" ValidationGroup="vgpOffInspSearch"
                        Display="Dynamic" ControlToValidate="tbxOffInspDate"
                        ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Inspection date must be in the format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cmvOffInspDate" runat="server" ValidationGroup="vgpOffInspSearch"
                        Display="Dynamic" ErrorMessage="Inspection date must be in the format 'MM/DD/YYYY'"
                        OnServerValidate="cmvEarliestDate_ServerValidate" ControlToValidate="tbxOffInspDate" ></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Follow-up:</td>
                <td>
                    <asp:RadioButtonList ID="rblOffInspFollowup" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Yes" Value="yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="no" ></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>

        <asp:Button ID="btnOffInspSearch" runat="server" Text="Search" OnClick="btnOffInspSearch_Click" ValidationGroup="vgpOffInspSearch" />
        <asp:Button ID="btnOffInspSearchReset" runat="server" Text="Reset" OnClick="btnOffInspSearchReset_Click" />
        <asp:Button ID="btnPrintOffInsps" runat="server" Text="Print" />
        <asp:ValidationSummary ID="vsyOfInspSearch" runat="server" DisplayMode="BulletList" ValidationGroup="vgpOffInspSearch" />
        
        <br /><br />

        <div id="divOffInsps">
        <asp:GridView ID="gdvOfficeInspections" runat="server" AutoGenerateColumns="False" 
                OnSelectedIndexChanged="gdvOfficeInspections_SelectedIndexChanged"
                OnSorting="gdvOfficeInspections_Sorting" AllowSorting="true" 
                OnPageIndexChanging="gdvOfficeInspections_PageIndexChanging" AllowPaging="true" EnableViewState="true" 
                PagerSettings-PageButtonCount="10" PagerSettings-Mode="NumericFirstLast" >
            <HeaderStyle BackColor="#89c123" ForeColor="White" />
            <PagerStyle CssClass="GridViewPagerStyle" />
            <Columns>
                <asp:BoundField DataField="officeInspectionNo" HeaderText="#" ItemStyle-Width="30" ReadOnly="True" SortExpression="officeInspectionNo" />
                <asp:BoundField DataField="deptName" HeaderText="Department" ItemStyle-Width="150" ReadOnly="True" SortExpression="deptName" />
                <asp:BoundField DataField="inspectionDate" HeaderText="Date" ItemStyle-Width="75" DataFormatString="{0:M/d/yyyy}" ReadOnly="True" />
                <asp:BoundField DataField="followup" HeaderText="Follow-Up" ItemStyle-Width="75" ReadOnly="True" SortExpression="deptName" />
                <asp:BoundField DataField="inspector" HeaderText="Inspector" ReadOnly="True" SortExpression="inspector" />
                <asp:BoundField DataField="area" HeaderText="Area" ReadOnly="True" SortExpression="area" />
                <asp:CommandField HeaderText="Click to View" HeaderStyle-Width="90" ItemStyle-HorizontalAlign="Center"
                    ShowSelectButton="True" SelectText="Checklist" ButtonType="Button" />
            </Columns>
            <EmptyDataTemplate>No office inspections found.</EmptyDataTemplate>
        </asp:GridView>
        </div>
        
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnOffInspSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnOffInspSearchReset" EventName="Click" />
        </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    </asp:Panel>
    </asp:Panel>

    <div id="divPop" visible="false">
            <asp:Panel ID="pnlPop" BackColor="White" Width="400px" Height="100px" CssClass="popPanel"
                runat="server">
                <table width="100%" cellpadding="5">
                    <tr>
                        <td>
                            <asp:Label ID="lblPnlPop" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="btnPnlPopClose" runat="server" Text="Close" OnClick="btnPnlPopClose_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Button runat="server" ID="btnHidden" CssClass="hidden" />
            <asp:ModalPopupExtender ID="mpePop" runat="server" PopupControlID="pnlPop" TargetControlID="btnHidden"
                DropShadow="true" BackgroundCssClass="modalBackground" OkControlID="btnPnlPopClose" />
    </div>
    <div>&nbsp;</div>
</asp:Content>
