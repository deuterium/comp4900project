<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Tracking_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="body">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server">
</asp:ToolkitScriptManager>

<div ID="divCollapsiblePanelExtenders" visible="false">
<asp:CollapsiblePanelExtender ID="cpeFilters" runat="server" Collapsed="false"
CollapseControlID="hr3Filters" ExpandControlID="hr3Filters" TargetControlID="pnlFilters"
ImageControlID="imgExpandCollapseFilters" TextLabelID="lblExpandCollapseFilters" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="false"
CollapseControlID="hr3A" ExpandControlID="hr3A" TargetControlID="pnlA"
ImageControlID="imgExpandCollapseA" TextLabelID="ExpandCollapseA" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="true"
CollapseControlID="hr3B" ExpandControlID="hr3B" TargetControlID="pnlB"
ImageControlID="imgExpandCollapseB" TextLabelID="ExpandCollapseB" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeC" runat="server" Collapsed="true"
CollapseControlID="hr3C" ExpandControlID="hr3C" TargetControlID="pnlC"
ImageControlID="imgExpandCollapseC" TextLabelID="ExpandCollapseC" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeD" runat="server" Collapsed="true"
CollapseControlID="hr3D" ExpandControlID="hr3D" TargetControlID="pnlD"
ImageControlID="imgExpandCollapseD" TextLabelID="ExpandCollapseD" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeE" runat="server" Collapsed="true"
CollapseControlID="hr3E" ExpandControlID="hr3E" TargetControlID="pnlE"
ImageControlID="imgExpandCollapseE" TextLabelID="ExpandCollapseE" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeResults" runat="server" Collapsed="true"
CollapseControlID="hr3Results" ExpandControlID="hr3Results" TargetControlID="pnlResults"
ImageControlID="imgExpandCollapseResults" TextLabelID="lblExpandCollapseResults" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeEmpInfo" runat="server" Collapsed="true"
CollapseControlID="hr3EmpInfo" ExpandControlID="hr3EmpInfo" TargetControlID="pnlEmployeeInfo"
ImageControlID="imgExpandCollapseEmpInfo" TextLabelID="lblExpandCollapseEmpInfo" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeEmployeeCourses" runat="server" Collapsed="true"
CollapseControlID="hr3EmpCourses" ExpandControlID="hr3EmpCourses" TargetControlID="pnlEmployeeCourses"
ImageControlID="imgExpandCollapseEmpCourses" TextLabelID="ExpandCollapseEmpCourses" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeLabInspections" runat="server" Collapsed="true"
CollapseControlID="hr3LabInspections" ExpandControlID="hr3LabInspections" TargetControlID="pnlLabInspections"
ImageControlID="imgExpandCollapseLabInspections" TextLabelID="lblExpandCollapseLabInspections" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeOfficeInspections" runat="server" Collapsed="true"
CollapseControlID="hr3OfficeInspections" ExpandControlID="hr3OfficeInspections" TargetControlID="pnlOfficeInspections"
ImageControlID="imgExpandCollapseOfficeInspections" TextLabelID="lblExpandCollapseOfficeInspections" 
CollapsedImage="../images/expand.jpg" ExpandedImage="../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

</div>

<h3 id="hr3Filters"><asp:Image ID="imgExpandCollapseFilters" runat="server" /> Incident Form Filters <asp:Label ID="lblExpandCollapseFilters" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlFilters" CssClass="panel" runat="server">
<h3 id="hr3A"><asp:Image ID="imgExpandCollapseA" runat="server" /> A. Incident/Accident Information <asp:Label ID="ExpandCollapseA" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlA" CssClass="panel" runat="server" >
    <div id="divABottomPanel">
        <h4>Action Following Incident:</h4>
        <table>
            <tr>
	            <td><asp:CheckBox ID="cbx_p1_action_report" Text="Report Only" runat="server" /></td>
	            <td><asp:CheckBox ID="cbx_p1_action_firstAid" Text="First Aid" runat="server" /></td>
	            <td><asp:CheckBox ID="cbx_p1_action_medicalGP" Text="Medical Aid (GP / Clinic)" runat="server" /></td>
	            <td>
                    <asp:TextBox ID="tbx_p1_action_medicalGP_date" runat="server" MaxLength="10" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweMedicalGpDate" runat="server" TargetControlID="tbx_p1_action_medicalGP_date"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexMedicalGpDate" runat="server" TargetControlID="tbx_p1_action_medicalGP_date" Format="M/d/yyyy" >
                    </asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="revMedicalGpDate" runat="server" ValidationGroup="vgpPanelA"
                        ControlToValidate="tbx_p1_action_medicalGP_date" ValidationExpression="^[0-9]{1,2}/{1}[0-9]{1,2}/{1}[0-9]{4}$"
                        ErrorMessage="Medical Aid (GP / Clinic) date must be in  format 'MM/DD/YYYY'"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
	            <td colspan="2" ><asp:CheckBox ID="cbx_p1_action_lostTime" Text="Lost time (missed/will miss next scheduled shift due to injury)" runat="server" /></td>
	            <td><asp:CheckBox ID="cbx_p1_action_medicalER" Text="Medical Aid (ER)" runat="server" /></td>
	            <td>
                    <asp:TextBox ID="tbx_p1_action_medicalER_date" runat="server" MaxLength="10" ></asp:TextBox>
                    <asp:TextBoxWatermarkExtender ID="tweMedicalErDate" runat="server" TargetControlID="tbx_p1_action_medicalER_date"
                        WatermarkCssClass="watermarked" WatermarkText="MM/DD/YYYY"></asp:TextBoxWatermarkExtender>
                    <asp:CalendarExtender ID="cexMedicalErDate" runat="server" TargetControlID="tbx_p1_action_medicalER_date" Format="M/d/yyyy" >
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

<h3 id="hr3B"><asp:Image ID="imgExpandCollapseB" runat="server" /> B. Nature of Injury <asp:Label ID="ExpandCollapseB" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlB" CssClass="panel" runat="server">
    <h4>Nature of Injury</h4>
    <div id="divBLeftPanel">
        <table>
            <tr><td><asp:CheckBox TabIndex="124" ID="cbx_p1_nature_no" Text="No Injury (Near Miss/ Unsafe Condition)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="124" ID="cbx_p1_nature_musculoskeletal" Text="Musculoskeletal Injyry (Strain / Sprain)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="124" ID="cbx_p1_nature_bruise" Text="Bruise / Confusion" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="124" ID="cbx_p1_nature_burn" Text="Burn (Heat or Cold)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="125" ID="cbx_p1_nature_cut" Text="Cut / Scratch / Abrasion / Laceration / Puncture (Non BBF)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="125" ID="cbx_p1_nature_puncture" Text="Puncture Wound (BBF)" runat="server" /></td></tr>
         </table>
    </div>
    <div id="divBRightPanel">
        <table>
            <tr><td><asp:CheckBox TabIndex="125" ID="cbx_p1_nature_skinIrritation" Text="Skin Irritation" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="125" ID="cbx_p1_nature_skinMucous" Text="Skin / Mucous Membrane Exposure (incl. eye)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="126" ID="cbx_p1_nature_eye" Text="Eye Irritation" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="126" ID="cbx_p1_nature_allergic" Text="Allergic Response" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="126" ID="cbx_p1_nature_psychological" Text="Psychological Trauma / Aggressive Incident" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="126" ID="cbx_p1_nature_respiratory" Text="Respiratory Irritation" runat="server" /></td></tr>
        </table>
    </div>
</asp:Panel>

<h3 id="hr3C"><asp:Image ID="imgExpandCollapseC" runat="server" /> C. Accident Investigation <asp:Label ID="ExpandCollapseC" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlC" CssClass="panel" runat="server">
    <div id="divCLeftPanel">
        <table>
            <tr><td><asp:CheckBox TabIndex="125" ID="cbx_p2_activity_no" Text="No Injury" runat="server" /></td></tr>
        </table>
    
        <h4>Patient Handling</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_repositioning" Text="Repositioning" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_transferring" Text="Transferring (incl. to seclusion)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_assistedWalking" Text="Assisted Walking" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_assistedFloor" Text="Assisted from Floor" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_fall" Text="Preventing a fall" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_holding" Text="Holding / Assisting during procedure (incl. patient restraint)" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="127" ID="cbx_p2_activity_toileting" Text="Toileting" runat="server" /></td></tr>
        </table>

        <h4>Patient Handling Details</h4>
        <table>
            <tr><td>Equipment used at time of Injury:</td></tr>
            <tr><td><asp:CheckBox TabIndex="128" ID="cbx_p2_patient_ceilingLift" Text="Ceiling Lift" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="128" ID="cbx_p2_patient_sitStandLift" Text="Sit-Stand Lift" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="128" ID="cbx_p2_patient_floorLift" Text="Floor Lift" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="128" ID="cbx_p2_patient_manualLift" Text="Manual Lift" runat="server" /></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplPatientOther" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="128" ID="cbx_p2_patient_other" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="128" ID="tbx_p2_patient_otherSpecify" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_patient_otherSpecify_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_patient_otherSpecify" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
            <tr><td>Was adaquate assistance available?</td></tr>
            <tr><td>
                <asp:RadioButtonList ID="rbl_p2_patient_adequateAssist" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem TabIndex="129" Text="Yes" Value="1" ></asp:ListItem>
                    <asp:ListItem TabIndex="130" Text="No" Value="2" ></asp:ListItem>
                    <asp:ListItem TabIndex="131" Text="Unknown" Value="3" ></asp:ListItem>
                </asp:RadioButtonList>
            </td></tr>
            <tr><td>How many employees involved in activity at time of incident?</td></tr>
            <tr><td>
                <asp:TextBox TabIndex="132" ID="tbx_p1_numEmployeesInvolved" runat="server" ></asp:TextBox>
                <asp:CompareValidator ID="cpvEmployeesInvolved" runat="server" ValidationGroup="vgpCInvestigation"
                    ControlToValidate="tbx_p1_numEmployeesInvolved" Type="Integer" Operator="DataTypeCheck"
                    ErrorMessage="The number of employees involved must be a whole number." ></asp:CompareValidator>
            </td></tr>
        </table>
  
        <h4>Patient Care</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_washing" Text="Washing / Bathing" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_dressing" Text="Dressing" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_changing" Text="Changing" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_feeding" Text="Feeding" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_prep" Text="Prep / Dispensing Meds" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="132" ID="cbx_p2_activity_dressingChanges" Text="Dressing Changes" runat="server" /></td></tr>
            <tr><td>
                 <asp:UpdatePanel ID="uplOtherPatientCare" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="132" ID="cbx_p2_activity_otherPatientCare" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="132" ID="tbx_p2_activity_otherPatientCare" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_activity_otherPatientCare_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherPatientCare" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>

    </div>

    <div id="divCRightPanel">
        <h4>Sharps Handling</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="133" ID="cbx_p2_activity_recapping" Text="Re-capping" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="133" ID="cbx_p2_activity_puncture" Text="Veno Puncture / Arterio Puncture" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="133" ID="cbx_p2_activity_sharpsDisposal" Text="Sharps Disposal" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="133" ID="cbx_p2_activity_otherSharps" Text="Other Sharps / Instruments" runat="server" /></td></tr>
        </table>

        <h4>Using Material / Equipment</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_lift" Text="Lift / Lower" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_push" Text="Push / Pull" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_carry" Text="Carry" runat="server" /></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherMat" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherMat" Text="Other Material Description: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherMat" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_activity_otherMat_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherMat" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_driving" Text="Equipment Operation - Driving" runat="server" /></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherEquip" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherEquip" Text="Equipment Operation - Other: " runat="server" AutoPostBack="true"/>
                        <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherEquip" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_activity_otherEquip_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherEquip" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
            <tr><td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="134" ID="cbx_p2_activity_otherEquipDesc" Text="Other Equipment Description: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="134" ID="tbx_p2_activity_otherEquipDesc" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_activity_otherEquipDesc_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_otherEquipDesc" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_equipMain" Text="Equipment Maintenance" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_comp" Text="Office Work - Computer" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="134" ID="cbx_p2_activity_nonComp" Text="Office Work - Non Computer" runat="server" /></td></tr>
        </table>

        <h4>Other</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="135" ID="cbx_p2_activity_walking" Text="Walking / Running" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="135" ID="cbx_p2_activity_bending" Text="Bending" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="135" ID="cbx_p2_activity_reading" Text="Reading" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="135" ID="cbx_p2_activity_spill" Text="Spill Cleanup" runat="server" /></td></tr>
            <tr><td><asp:CheckBox TabIndex="135" ID="cbx_p2_activity_cleaning" Text="Cleaning" runat="server" /></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplActivityOther" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="135" ID="cbx_p2_activity_other" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="135" ID="tbx_p2_activity_other" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_activity_other_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_activity_other" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
        
        <asp:ValidationSummary ID="vsyCInvestigation" runat="server" ValidationGroup="vgpCInvestigation" DisplayMode="BulletList" />

    </div>
</asp:Panel>

<h3 id="hr3D"><asp:Image ID="imgExpandCollapseD" runat="server" /> D. Cause <asp:Label ID="ExpandCollapseD" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlD" CssClass="panel" runat="server">
    <div id="divDLeftPanel">
        <h4>Bite</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="136" ID="cbx_p2_cause_human" Text="Human" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="136" ID="cbx_p2_cause_animal" Text="Animal / Insect" runat="server"/></td></tr>
        </table>

        <h4>BBF Exposure</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="137" ID="cbx_p2_cause_needle" Text="Needlestick" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="137" ID="cbx_p2_cause_otherSharps" Text="Other Sharps" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="137" ID="cbx_p2_cause_skin" Text="Skin/ Mucous Membrane (Splash / Spit)" runat="server"/></td></tr>
        </table>

        <h4>Ergonomic Factors</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="138" ID="cbx_p2_cause_awkwardPosture" Text="Awkward Posture" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="138" ID="cbx_p2_cause_staticPosture" Text="Static Posture" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="138" ID="cbx_p2_cause_contactStress" Text="Contact Stress" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="138" ID="cbx_p2_cause_force" Text="Force" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="138" ID="cbx_p2_cause_rep" Text="Repetition" runat="server"/></td></tr>
        </table>

        <h4>Other</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_motor" Text="Motor Vehicle Accident" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_slip" Text="Slip and Fall" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_aggression" Text="Workplace Agression" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_undetermined" Text="Cause Undetermined" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_event" Text="Traumatic Event" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_underEquip" Text="Caught In / Under / Between Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="139" ID="cbx_p2_cause_hit" Text="Hit / Struck By / Cut by Equipment" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplCauseOther" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="139" ID="cbx_p2_cause_other" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="139" ID="tbx_p2_cause_other" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_cause_other_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_cause_other" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    </div>
    
    <div id="divDAgressionDetailsPanel">
        <h4>Details for Workplace Aggression Incidents</h4>
        Type of Incident:
        <table>
            <tr><td><asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_verbal" Text="Verbal - threats of violence, verbal assault" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_biting" Text="Biting / Spitting" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_hitting" Text="Hitting / Kicking / Beating / Choking" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_squeezing" Text="Squeezing / Punching / Scratching / Twisting" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="140" ID="cbx_p2_cause_aggression_assault" Text="Sexual assault" runat="server"/></td></tr>
        </table>
        Incident Involved:
        <table>
            <tr><td><asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_patient" Text="Patient / Resident" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_family" Text="Family member of Patient / Resident" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_public" Text="Other member of Public" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_worker" Text="Worker" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplAgressionOther" runat="server">
                    <ContentTemplate>
                       <asp:CheckBox TabIndex="141" ID="cbx_p2_cause_aggression_other" Text="Other: " runat="server" AutoPostBack="true" />
                       <asp:TextBox TabIndex="141" ID="tbx_p2_cause_aggression_other" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_cause_aggression_other_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_cause_aggression_other" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    </div>

    <div id="divDRightPanel">
        <h4>Exposure</h4>
        <table>
            <tr><td>Checmical Name: <asp:TextBox ID="tbx_p2_cause_exposure_chemName" runat="server"></asp:TextBox></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemInhalation" Text="Chemical Inhalation" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemIngest" Text="Chemical Ingestion" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_chemContact" Text="Chemical Skin / Eye Contact" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_latex" Text="Latex" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_dust" Text="Dust / Particulate" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_disease" Text="Communicable Diseases" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_temp" Text="Temperature Extremes" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_noise" Text="Noise" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_radiation" Text="Radiation" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_elec" Text="Electricity" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="142" ID="cbx_p2_cause_air" Text="Indoor Air Quality" runat="server"/></td></tr>
        </table>
    </div>
</asp:Panel>

<h3 id="hr3E"><asp:Image ID="imgExpandCollapseE" runat="server"/> E. Contributing Factors <asp:Label ID="ExpandCollapseE" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlE" CssClass="panel" runat="server">
    <div id="divELeftPanel" >
        <h4>Equipment / Device</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="143" ID="cbx_p2_factors_malfunction" Text="Malfunctioning" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="143" ID="cbx_p2_factors_improperUse" Text="Improper Use" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="143" ID="cbx_p2_factors_signage" Text="Improper / Inadequate signage" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="143" ID="cbx_p2_factors_notAvailable" Text="Not Available at Point of Use" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="143" ID="cbx_p2_factors_poorDesign" Text="Poor Design" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplFactorsOtherEquip" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="143" ID="cbx_p2_factors_otherEquip" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="143" ID="tbx_p2_factors_otherEquip" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherEquip_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherEquip" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    
        <h4>Environment</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_temp" Text="Temperature" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_workplace" Text="Workplace" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_layout" Text="Layout / Design" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_limitedWorkspace" Text="Limited Workspace" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_slippery" Text="Floor Slippery / Uneven" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_lighting" Text="Lighting Inadequate" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_noise" Text="Exessive Noise" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_vent" Text="Ventilation Inadequate" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="144" ID="cbx_p2_factors_storage" Text="Improper Storage" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherEnv" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="144" ID="cbx_p2_factors_otherEnv" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="144" ID="tbx_p2_factors_otherEnv" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherEnv_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherEnv" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    </div>

    <div id="divEMiddlePanel">
        <h4>Work Practice</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_assessment" Text="Improper Assessment of Client / Load" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_procedure" Text="Not Follow Appropriate Procedure" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_equip" Text="Not Use Designated / Appropriate Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_conduct" Text="Conduct" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_extended" Text="Task Performed for extended periods" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_comm" Text="Communication" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="145" ID="cbx_p2_factors_unaccustomed" Text="Unaccustomed" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherWorkPractice" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="145" ID="cbx_p2_factors_otherWorkPractice" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="145" ID="tbx_p2_factors_otherWorkPractice" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherWorkPractice_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherWorkPractice" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>

        <h4>Patient Related Factors</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_directions" Text="Unable to Follow Directions" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_weight" Text="Inconsistent Weight Bearing" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_aggressive" Text="Patient Aggressive" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_patientResistive" Text="Patient Resistive" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_movement" Text="Made Unexpected Movement" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_confused" Text="Confused / Dementia" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_influence" Text="Under Influence of Drugs / Alcohol" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="146" ID="cbx_p2_factors_lang" Text="Language Barriers" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherPatient" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="146" ID="cbx_p2_factors_otherPatient" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="146" ID="tbx_p2_factors_otherPatient" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherPatient_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherPatient" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    </div>

    <div id="divERightPanel">
        <h4>Organizational / Administrative</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_alone" Text="Working Alone" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_info" Text="Inadequate Information" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_scheduling" Text="Inappropriate Scheduling" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_training" Text="Lack of Training / Education" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_appropriateEquip" Text="Lack of Appropriate Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_personal" Text="Lack of Personal Protection Equipment" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_safe" Text="Lack of Safe Work Procedures" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="147" ID="cbx_p2_factors_perceived" Text="Perceived Time Constraints" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherOrganizational" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="147" ID="cbx_p2_factors_otherOrganizational" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="147" ID="tbx_p2_factors_otherOrganizational" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherOrganizational_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherOrganizational" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>

        <h4>Worker</h4>
        <table>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_inexperienced" Text="Inexperienced" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_communication" Text="Communication Difficulties" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_fatigued" Text="Fatigued" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_distracted" Text="Distracted" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_preexisting" Text="Pre-existing Injury" runat="server"/></td></tr>
            <tr><td><asp:CheckBox TabIndex="148" ID="cbx_p2_factors_sick" Text="Sick / Medicated" runat="server"/></td></tr>
            <tr><td>
                <asp:UpdatePanel ID="uplOtherWorker" runat="server">
                    <ContentTemplate>
                        <asp:CheckBox TabIndex="148" ID="cbx_p2_factors_otherWorker" Text="Other: " runat="server" AutoPostBack="true" />
                        <asp:TextBox TabIndex="148" ID="tbx_p2_factors_otherWorker" runat="server" AutoPostBack="true" OnTextChanged="tbx_p2_factors_otherWorker_OnTextChanged" ></asp:TextBox>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tbx_p2_factors_otherWorker" EventName="TextChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td></tr>
        </table>
    </div>
</asp:Panel>

<asp:Button TabIndex="1112" ID="btnFilterReport" runat="server" 
    Text="Filter Reports" onclick="btnFilterReport_Click" />

</asp:Panel>

<asp:Panel ID="pnlResultsContainer" runat="server" Visible="false" >
<h3 id="hr3Results"><asp:Image ID="imgExpandCollapseResults" runat="server" /> Results <asp:Label ID="lblExpandCollapseResults" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlResults" CssClass="panel" runat="server">

<asp:Panel ID="pnlFiltersSelected" runat="server">
    <asp:Label ID="lblFilters" runat="server" Text="The filters you selected were:" Font-Bold="true" />
    <br />
</asp:Panel>

<br />

<asp:GridView ID="gdvTracker" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvTracker_RowCommand" HorizontalAlign="Center" >
    <Columns>
        <asp:TemplateField HeaderText="#" ItemStyle-Width="20" >
            <ItemTemplate>
                <asp:Label ID="lblIncidentNo" runat="server" Text='<%# Bind("incidentNo") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Center" >
            <ItemTemplate>
                <asp:Label ID="lblDateOfIncident" runat="server" Text='<%# Eval("date", "{0:M/d/yyyy}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Submitter" ItemStyle-HorizontalAlign="Center" >
            <ItemTemplate>
                <asp:Label ID="lblSubmitter" runat="server" Text='<%# Bind("submitter") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Employee" ItemStyle-HorizontalAlign="Center" >
            <ItemTemplate>
                <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("employee") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Click to View" ItemStyle-Width="250"  ItemStyle-HorizontalAlign="Center" >
            <ItemTemplate>
                <asp:Button ID="btnRowViewReport" runat="server" 
                    CommandName="RowViewReport" 
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                    Text="Report" />
                <asp:Button ID="btnRowViewEmployee" runat="server" 
                    CommandName="RowViewEmployee" 
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                    Text="Employee" />
                <asp:Button ID="btnRowViewCourses" runat="server" 
                    CommandName="RowViewCourses"
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                    Text="Courses" />
            </ItemTemplate>    
        </asp:TemplateField>
        <asp:TemplateField HeaderText="" ItemStyle-Width="0"  ItemStyle-HorizontalAlign="Center" >
            <ItemTemplate>
                <asp:Button ID="btnRowViewLabInspections" runat="server" 
                    CommandName="RowViewLabInspections" 
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                    Text="Lab Inspections" />
                <asp:Button ID="btnRowViewOfficeInspections" runat="server" 
                    CommandName="RowViewOfficeInspections" 
                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                    Text="Office Inpsections" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>No incident reports found.</EmptyDataTemplate>
</asp:GridView>
</asp:Panel>
</asp:Panel>

<asp:Panel ID="pnlEmpInfoContainer" runat="server" Visible="false" >
<h3 id="hr3EmpInfo"><asp:Image ID="imgExpandCollapseEmpInfo" runat="server" /> Employee Information <asp:Label ID="lblExpandCollapseEmpInfo" runat="server" Text=""></asp:Label></h3>
<asp:Panel ID="pnlEmployeeInfo" CssClass="panel" runat="server">

    <div id="divEmpInfoLeftPanel" >
        <table>
            <tr>
                <td>Id:</td>
                <td><asp:Label ID="lblId" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td>Last name:</td>
                <td><asp:Label ID="lblLastName" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td>First name:</td>
                <td><asp:Label ID="lblFirstName" runat="server" ></asp:Label></td>
            </tr>
        </table>
    </div>

    <div id="divEmpInfoMiddlePanel" >
        <table>
            <tr>
                <td>Position:</td>
                <td><asp:Label ID="lblPosition" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td>Employer:</td>
                <td><asp:Label ID="lblEmployer" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td>Department:</td>
                <td><asp:Label ID="lblDepartment" runat="server" ></asp:Label></td>
            </tr>
        </table>
    </div>

    <div id="divEmpInfoRightPanel" >
        <table>
            <tr>
                <td>Room:</td>
                <td><asp:Label ID="lblRoom" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td>Supervisor:</td>
                <td><asp:Label ID="lblSupervisor" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td>Start date:</td>
                <td><asp:Label ID="lblStartDate" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td>End date:</td>
                <td><asp:Label ID="lblEndDate" runat="server" ></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Panel>
</asp:Panel>

<asp:Panel ID="pnlEmpCoursesContainer" runat="server" Visible="false" >
    <h3 id="hr3EmpCourses"><asp:Image ID="imgExpandCollapseEmpCourses" runat="server" /> Employee Courses <asp:Label ID="ExpandCollapseEmpCourses" runat="server" Text=""></asp:Label></h3>
    <asp:Panel ID="pnlEmployeeCourses" CssClass="panel" runat="server">

        <asp:GridView ID="gdvEmpCourses" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvTracker_RowCommand" >
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="lblCourseName" runat="server" Text='<%# Bind("courseName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="lblCourseStatus" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Completion Date">
                <ItemTemplate>
                    <asp:Label ID="lblCompletionDate" runat="server" Text='<%# Eval("completionDate", "{0:M/d/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Expiration Date">
                <ItemTemplate>
                    <asp:Label ID="lblExpirationDate" runat="server" Text='<%# Eval("expirationDate", "{0:M/d/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Required">
                <ItemTemplate>
                    <asp:Label ID="lblRequired" runat="server" Text='<%# Bind("required") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>No courses found.</EmptyDataTemplate>
    </asp:GridView>
    
    </asp:Panel>
</asp:Panel>

<asp:Panel ID="pnlLabInspectionsContainer" runat="server" Visible="false" >
    <h3 id="hr3LabInspections"><asp:Image ID="imgExpandCollapseLabInspections" runat="server" /> Lab Inspections <asp:Label ID="lblExpandCollapseLabInspections" runat="server" Text=""></asp:Label></h3>
    <asp:Panel ID="pnlLabInspections" CssClass="panel" runat="server" >
        <asp:GridView ID="gdvLabInspections" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvLabInspections_RowCommand" >
        <Columns>
            <asp:TemplateField HeaderText="#">
                <ItemTemplate>
                    <asp:Label ID="lblLabInspectionNo" runat="server" Text='<%# Bind("labInspectionNo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="deptName" HeaderText="Department" ReadOnly="True" SortExpression="deptName" />
            <asp:TemplateField HeaderText="Inspection Date">
                <ItemTemplate>
                    <asp:Label ID="lblInspectionDate" runat="server" Text='<%# Eval("inspectionDate", "{0:M/d/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="followup" HeaderText="Followed-Up?" ReadOnly="True" SortExpression="followup" />
            <asp:BoundField DataField="inspector" HeaderText="Inspector" ReadOnly="True" SortExpression="inspector" />
            <asp:BoundField DataField="labManager" HeaderText="Lab Manager" ReadOnly="True" SortExpression="labManager" />
            <asp:BoundField DataField="supervisor" HeaderText="Supervisor" ReadOnly="True" SortExpression="supervisor" />
            <asp:BoundField DataField="room" HeaderText="Room" ReadOnly="True" SortExpression="room" />
            <asp:TemplateField HeaderText="Click to View">
                <ItemTemplate>
                    <asp:Button ID="btnRowViewLabInspection" runat="server" 
                        CommandName="RowViewLabInspection" 
                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                        Text="Checklist" />
                </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>No lab inspections found.</EmptyDataTemplate>
    </asp:GridView>
    
    </asp:Panel>
</asp:Panel>

<asp:Panel ID="pnlOfficeInspectionsContainer" runat="server" Visible="false" >
    <h3 id="hr3OfficeInspections"><asp:Image ID="imgExpandCollapseOfficeInspections" runat="server" /> Office Inspections <asp:Label ID="lblExpandCollapseOfficeInspections" runat="server" Text=""></asp:Label></h3>
    <asp:Panel ID="pnlOfficeInspections" CssClass="panel" runat="server" >
        <asp:GridView ID="gdvOfficeInspections" runat="server" AutoGenerateColumns="False" OnRowCommand="gdvOfficeInspections_RowCommand" >
        <Columns>
            <asp:BoundField DataField="officeInspectionNo" HeaderText="#" ReadOnly="True" SortExpression="deptName" />
            <asp:BoundField DataField="deptName" HeaderText="Department" ReadOnly="True" SortExpression="deptName" />
            <asp:BoundField DataField="inspectionDate" HeaderText="Date" DataFormatString="{0:M/dd/yyyy}" SortExpression="inspectionDate" />
            <asp:BoundField DataField="followup" HeaderText="Follow-up" ReadOnly="True" SortExpression="deptName" />
            <asp:BoundField DataField="inspector" HeaderText="Inspector" ReadOnly="True" SortExpression="inspector" />
            <asp:BoundField DataField="area" HeaderText="Area" ReadOnly="True" SortExpression="area" />
            <asp:TemplateField HeaderText="Click to View">
                <ItemTemplate>
                    <asp:Button ID="btnRowViewLabInspection" runat="server" 
                        CommandName="RowViewOfficeInspection" 
                        CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                        Text="Checklist" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>No office inspections found.</EmptyDataTemplate>
    </asp:GridView>

    </asp:Panel>
</asp:Panel>

<div id="divPop" visible="false">
<asp:Panel ID="pnlPop" BackColor="White" Width="400px" Height="100px" CssClass="popPanel" runat="server">
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
    DropShadow="true" BackgroundCssClass="modalBackground" />
</div>

</asp:Content>
