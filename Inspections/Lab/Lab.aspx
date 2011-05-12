<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Lab.aspx.cs" Inherits="Inspections_Lab_Lab" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="body">

<asp:ToolkitScriptManager ID="tsmScriptManager" runat="server"></asp:ToolkitScriptManager>

<asp:CollapsiblePanelExtender ID="cpeA" runat="server" Collapsed="true"
CollapseControlID="labA" ExpandControlID="labA" TargetControlID="pnlA"
ImageControlID="imgExpandCollapseA" TextLabelID="ExpandCollapseA" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeB" runat="server" Collapsed="true"
CollapseControlID="labB" ExpandControlID="labB" TargetControlID="pnlB"
ImageControlID="imgExpandCollapseB" TextLabelID="ExpandCollapseB" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeC" runat="server" Collapsed="true"
CollapseControlID="labC" ExpandControlID="labC" TargetControlID="pnlC"
ImageControlID="imgExpandCollapseC" TextLabelID="ExpandCollapseC" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeD" runat="server" Collapsed="true"
CollapseControlID="labD" ExpandControlID="labD" TargetControlID="pnlD"
ImageControlID="imgExpandCollapseD" TextLabelID="ExpandCollapseD" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeE" runat="server" Collapsed="true"
CollapseControlID="labE" ExpandControlID="labE" TargetControlID="pnlE"
ImageControlID="imgExpandCollapseE" TextLabelID="ExpandCollapseE" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeF" runat="server" Collapsed="true"
CollapseControlID="labF" ExpandControlID="labF" TargetControlID="pnlF"
ImageControlID="imgExpandCollapseF" TextLabelID="ExpandCollapseF" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeG" runat="server" Collapsed="true"
CollapseControlID="labG" ExpandControlID="labG" TargetControlID="pnlG"
ImageControlID="imgExpandCollapseG" TextLabelID="ExpandCollapseG" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeH" runat="server" Collapsed="true"
CollapseControlID="labH" ExpandControlID="labH" TargetControlID="pnlH"
ImageControlID="imgExpandCollapseH" TextLabelID="ExpandCollapseH" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeI" runat="server" Collapsed="true"
CollapseControlID="labI" ExpandControlID="labI" TargetControlID="pnlI"
ImageControlID="imgExpandCollapseI" TextLabelID="ExpandCollapseI" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeJ" runat="server" Collapsed="true"
CollapseControlID="labJ" ExpandControlID="labJ" TargetControlID="pnlJ"
ImageControlID="imgExpandCollapseJ" TextLabelID="ExpandCollapseJ" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<asp:CollapsiblePanelExtender ID="cpeK" runat="server" Collapsed="true"
CollapseControlID="labK" ExpandControlID="labK" TargetControlID="pnlK"
ImageControlID="imgExpandCollapseK" TextLabelID="ExpandCollapseK" CollapsedText="(Show Details)"
ExpandedText="(Hide Details)" CollapsedImage="../../images/expand.jpg" ExpandedImage="../../images/collapse.jpg">
</asp:CollapsiblePanelExtender>

<div>

    <h3 id="labA"><asp:Image ID="imgExpandCollapseA" runat="server" />
    A. Department <asp:Label ID="ExpandCollapseA" runat="server" Text=""></asp:Label></h3>
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
            <td>
                Supervisor: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxLabSupervisor"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Room: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxLabRoom" />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                Inspectors: 
            </td>
            <td>
                <asp:TextBox runat="server" ID="tbxLabInspectors"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Lab Manager:
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlLabLabManager"></asp:DropDownList>
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
            <td>
                Date of Follow Up: 
            </td>
            <td>
                <asp:TextBox ID="tbxLabFollowupDate" runat="server"></asp:TextBox>
                <asp:CalendarExtender ID="cexLabFollowupDate" runat="server" TargetControlID="tbxLabFollowupDate" Format="yyyy/MM/dd"></asp:CalendarExtender>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="labB"><asp:Image ID="imgExpandCollapseB" runat="server" />
    B. Emergency & Information Material <asp:Label ID="ExpandCollapseB" runat="server" Text="" />
    <asp:Label ID="lblValB" runat="server" Text="" />
    </h3>
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
                <asp:Label Text="Fire evacuation route posted on exits in each section/floor" runat="server" ID="lblFireEvac" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFireEvac">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
                
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblFireEvac" ValidationGroup="vgpLab" runat="server" ID="rfvFireEvac" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFireEvac"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Fire extinguisher in working condition" runat="server" ID="lblFireExtinguish" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2"  runat="server" ID="rblFireExtinguish">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblFireExtinguish" ValidationGroup="vgpLab" runat="server" ID="rfvFireExtinguish" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFireExtinguish"></asp:TextBox>
            </td>
        </tr>
        <tr>      
            <td>
                <asp:Label Text="Blood and Body Fluid protocol posted" runat="server" ID="lblBloodandBody" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBloodandBody">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblBloodandBody" ValidationGroup="vgpLab" runat="server" ID="rfvBloodandBody" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBloodandBody"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Injury on Duty Flow Chart posted" runat="server" ID="lblInjuryonDuty" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblInjuryonDuty">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblInjuryonDuty" ValidationGroup="vgpLab" runat="server" ID="rfvInjuryonDuty" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentInjuryonDuty"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Emergency numbers posted" runat="server" ID="lblEmergencyNumber" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEmergencyNumber">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblEmergencyNumber" ValidationGroup="vgpLab" runat="server" ID="rfvEmergencyNumber" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEmergencyNumber"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="MSDS binder/computer station accessible & up to date" runat="server" ID="lblMSDS" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblMSDS">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblMSDS" ValidationGroup="vgpLab" runat="server" ID="rfvMSDS" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentMSDS"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Emergency Shower available/accessible" runat="server" ID="lblEmergencyShower" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEmergencyShower">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblEmergencyShower" ValidationGroup="vgpLab" runat="server" ID="rfvEmergencyShower" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEmergencyShower"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Emergency Shower tested monthly (if located in section)" runat="server" ID="lblEmergencyShowerTest" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEmergencyShowerTest">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblEmergencyShowerTest" ValidationGroup="vgpLab" runat="server" ID="rfvEmergencyShowerTest" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEmergencyShowerTest"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Eyewash available/accessible" runat="server" ID="lblEyewash" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEyewash">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblEyewash" ValidationGroup="vgpLab" runat="server" ID="rfvEyewash" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEyewash"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Eyewash tested weekly if not sterile/sealed (& if in section)" runat="server" ID="lblEyewashTest" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEyewashTest">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblEyewashTest" ValidationGroup="vgpLab" runat="server" ID="rfvEyewashTest" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEyewashTest"></asp:TextBox>
            </td>
        </tr>
        <tr> 
            <td>
                <asp:Label Text="Chemical spill kit accessible/stocked adequately" runat="server" ID="lblChemicalSpill" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblChemicalSpill">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblChemicalSpill" ValidationGroup="vgpLab" runat="server" ID="rfvChemicalSpill" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentChemicalSpill"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Biohazard spill kit accessible/stocked adequately" runat="server" ID="lblBiohazard" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBiohazard">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp
                <asp:RequiredFieldValidator ControlToValidate="rblBiohazard" ValidationGroup="vgpLab" runat="server" ID="rfvBiohazard" ErrorMessage="*" ForeColor="Red">*</asp:RequiredFieldValidator>
                &nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBiohazard"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>
    
    <h3 id="labC"><asp:Image ID="imgExpandCollapseC" runat="server" /> C. Personal Protection <asp:Label ID="ExpandCollapseC" runat="server" Text=""></asp:Label></h3>
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
                <asp:Label Text="Safety Glasses/Facial shield available and in good condition" runat="server" ID="lblSafety" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSafety">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSafety"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Laboratory coat, gowns, gloves available/worn" runat="server" ID="lblLabCoat" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblLabCoat">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentLabCoat"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Substantial footwear worn (closed toe and heel)" runat="server" ID="lblFootwear" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFootwear">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFootwear"></asp:TextBox>
            </td>
        </tr>
        <tr>
            
            <td>
                <asp:Label Text="Respirator(s) available/fit tested and documented" runat="server" ID="lblRespirator" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblRespirator">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentRespirator"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Appropriate vacuum flask used on vacuum supply" runat="server" ID="lblVacuum" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="RadioButtonList1">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentVacuum"></asp:TextBox>
            </td>
        </tr>
        <tr>
            
            <td>
                <asp:Label Text="Splash guards available where necessary" runat="server" ID="lblSplashGuard" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSplashGuard">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSplashGuard"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Appropriate health surveillance/immunization provided" runat="server" ID="lblHealthSurv" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblHealthSurv">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentHealthSurv"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="labD"><asp:Image ID="imgExpandCollapseD" runat="server" /> D. Housekeeping <asp:Label ID="ExpandCollapseD" runat="server" Text=""></asp:Label></h3>
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
                <asp:Label Text="Bench tops and sink areas tidy" runat="server" ID="lblBenchTidy" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBenchTidy">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBenchTidy"></asp:TextBox>
            </td>
        </tr>
        <tr>  
            <td>
                <asp:Label Text="No tripping hazards observed" runat="server" ID="lblTripHaz" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblTripHaz">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentTripHaz"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Laboratory exits clear and doors unlocked" runat="server" ID="lblExits" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblExits">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentExits"></asp:TextBox>
            </td>
        </tr>
        <tr> 
            <td>
                <asp:Label Text="No food and drink observed in laboratory area" runat="server" ID="lblFoodDrink" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFoodDrink">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFoodDrink"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Glassware and tubing in good working condition" runat="server" ID="lblGlassTube" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblGlassTube">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentGlassTube"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="No falling object hazards identifiable" runat="server" ID="lblFallHaz" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFallHaz">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFallHaz"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Step stool available for out-of-reach items" runat="server" ID="lblStool" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblStool">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentStool"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="labE"><asp:Image ID="imgExpandCollapseE" runat="server" /> E. Waste Management <asp:Label ID="ExpandCollapseE" runat="server" Text=""></asp:Label></h3>
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
                <asp:Label Text="Separate collection containers for sharps available" runat="server" ID="lblSharpCont" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSharpCont">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSharpCont"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Biohazard needles/sharps in yellow 'Sharps' container" runat="server" ID="lblYellowCont" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblYellowCont">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentYellowCont"></asp:TextBox>
            </td>
        </tr>
        <tr>

            <td>
                <asp:Label Text="Other biohazard waste disposed in yellow bags/HSS tubs" runat="server" ID="lblYellowBagHSS" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblYellowBagHSS">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentYellowBagHSS"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Cytotoxic waste containers available" runat="server" ID="lblCyto" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblCyto">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentCyto"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Bulk solvent waste containers closed and labelled" runat="server" ID="lblBulkLabel" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBulkLabel">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBulkLabel"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Bulk Solvent waste containers > 25L stored in flammable storage cabinet" runat="server" ID="lblBulk25L" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBulk25L">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBulk25L"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Interim solvent waste containers closed" runat="server" ID="lblInterim" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblInterim">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentInterim"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Ethidium bromide waste segregated" runat="server" ID="lblEthidium" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEthidium">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEthidium"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="labF"><asp:Image ID="imgExpandCollapseF" runat="server" /> F. Biohazards <asp:Label ID="ExpandCollapseF" runat="server" Text=""></asp:Label></h3>
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
                <asp:Label Text="Appropriate disinfectant(s) in correct concentration available" runat="server" ID="lblDisenfect" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblDisenfect">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentDisenfect"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Biological hazard signs posted" runat="server" ID="lblBioHazSign" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBioHazSign">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBioHazSign"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="labG"><asp:Image ID="imgExpandCollapseG" runat="server" /> G. Fume Hoods/Biological Safety Cabinets <asp:Label ID="ExpandCollapseG" runat="server" Text=""></asp:Label></h3>
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
                <asp:Label Text="Sash at recommended height and air flow on" runat="server" ID="lblSash" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSash">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSash"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Biological safety cabinets certified" runat="server" ID="lblBioCabCert" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBioCabCert">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBioCabCert"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Biological safety cabinets clean and tidy" runat="server" ID="lblBioCabClean" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBioCabClean">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBioCabClean"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Fume hood(s) functioning properly" runat="server" ID="lblFumeFunc" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFumeFunc">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFumeFunc"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="labH"><asp:Image ID="imgExpandCollapseH" runat="server" /> H. Electrical Apparatus <asp:Label ID="ExpandCollapseH" runat="server" Text="" /></h3>
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
                <asp:Label Text="Vacuum pumps stored safely and belts guarded" runat="server" ID="lblVacuumPump" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblVacuumPump">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentVacuumPump"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="No frayed or cracked electrical cords observed" runat="server" ID="lblFrayedCords" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFrayedCords">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFrayedCords"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Electrical outlets are not overloaded" runat="server" ID="lblOutlets" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblOutlets">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentOutlets"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Power bars have a circuit breaker and not 'daisy-chained'" runat="server" ID="lblPowerBar" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblPowerBar">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentPowerBar"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Critical equipment connected to emergency power" runat="server" ID="lblEmPower" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEmPower">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEmPower"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="labI"><asp:Image ID="imgExpandCollapseI" runat="server" /> I. Chemicals and Reagents <asp:Label ID="ExpandCollapseI" runat="server" Text=""></asp:Label></h3>
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
                <asp:Label Text="Flammables stored in appropriate refrigerator/cabinet" runat="server" ID="lblFlam" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFlam">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFlam"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Solvent storage cabinet available, clean and closed" runat="server" ID="lblSolventCab" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSolventCab">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSolventCab"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Solvent Containers outside safety cabinet < 25L" runat="server" ID="lblSolventOutside" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSolventOutside">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSolventOutside"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Proper labelling of hazardous materials" runat="server" ID="lblPropHaz" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblPropHaz">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentPropHaz"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Proper labelling of cytotoxic materials" runat="server" ID="lblPropCyto" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblPropCyto">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentPropCyto"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Cytotoxic materials exposure records and inventory sheets completed and up to date." runat="server" ID="lblCytoToDate" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblCytoToDate">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentCytoToDate"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Reagent chemicals stored securely (lips on shelves or doors on cupboards)" runat="server" ID="lblReagentSecure" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblReagentSecure">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentReagentSecure"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Incompatible materials separated" runat="server" ID="lblIncompat" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblIncompat">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentIncompat"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="labJ"><asp:Image ID="imgExpandCollapseJ" runat="server" /> J. Training <asp:Label ID="ExpandCollapseJ" runat="server" Text=""/></h3>
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
                <asp:Label Text="Biosafety, chemical and cytotoxics safety training provided and documented" runat="server" ID="lblBiosafety" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBiosafety">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBiosafety"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Workplace safety training provided and documented" runat="server" ID="lblWorkplaceSafety" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblWorkplaceSafety">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentWorkplaceSafety"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="WHMIS - all staff are trained (current and documented)" runat="server" ID="lblWHMIS" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblWHMIS">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentWHMIS"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="TDG training provided (if applicable) and documented" runat="server" ID="lblTDG" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblTDG">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentTDG"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <h3 id="labK"><asp:Image ID="imgExpandCollapseK" runat="server" /> K. Miscellaneous <asp:Label ID="ExpandCollapseK" runat="server" Text=""/></h3>
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
                <asp:Label Text="Equipment/storage shelves seismically restrained" runat="server" ID="lblStorageSeis" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblStorageSeis">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentStorageSeis"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Appropriate equipment guard(s) provided" runat="server" ID="lblEquipGuards" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEquipGuards">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEquipGuards"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label Text="Pressurized gas tanks restrained/supported" runat="server" ID="lblPressureTankSup" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblPressureTankSup">
                    <asp:ListItem runat="server" Text="" Value="Yes" />
                    <asp:ListItem runat="server" Text="" Value="No" />
                    <asp:ListItem runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentPressureTankSup"></asp:TextBox>
            </td>
        </tr>
    </table>
    </asp:Panel>

    <asp:Button ID="btnLabInspectionSubmit" runat="server" Text="Submit" onclick="btnLabInspectionSubmit_Click" />

</div>

</asp:Content>