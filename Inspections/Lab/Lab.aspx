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

    <h3 id="labA"><asp:Image ID="imgExpandCollapseA" runat="server" /> A. Department <asp:Label ID="ExpandCollapseA" runat="server" Text=""></asp:Label></h3>
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

    <h3 id="labB"><asp:Image ID="imgExpandCollapseB" runat="server" /> B. Emergency & Information Material <asp:Label ID="ExpandCollapseB" runat="server" Text=""></asp:Label></h3>
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
            <td align="center" class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            
            <td>
                <asp:Label Text="Fire evacuation route posted on exits in each section/floor" runat="server" ID="lblFireEvac" />
            </td>
            <td class="tblYesNoNA" colspan="3">
                <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFireEvac">
                    <asp:ListItem ID="rdoFireEvacYes" runat="server" Text="" Value="Yes" />
                    <asp:ListItem ID="rdoFireEvacNo" runat="server" Text="" Value="No" />
                    <asp:ListItem ID="rdoFireEvacNA" runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
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
                    <asp:ListItem ID="rdoFireExtinguishYes" runat="server" Text="" Value="Yes" />
                    <asp:ListItem ID="rdoFireExtinguishNo" runat="server" Text="" Value="No" />
                    <asp:ListItem ID="rdoFireExtinguishNA" runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
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
                    <asp:ListItem ID="rdoBloodandBodyYes" runat="server" Text="" Value="Yes" />
                    <asp:ListItem ID="rdoBloodandBodyNo" runat="server" Text="" Value="No" />
                    <asp:ListItem ID="rdoBloodandBodyNA" runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
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
                    <asp:ListItem ID="rdoInjuryonDutyYes" runat="server" Text="" Value="Yes" />
                    <asp:ListItem ID="rdoInjuryonDutyNo" runat="server" Text="" Value="No" />
                    <asp:ListItem ID="rdoInjuryonDutyNA" runat="server" Text="" Value="NA" />
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentInjuryonDuty"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEmergencyNumber" />
            <td>
                <asp:Label Text="Emergency numbers posted" runat="server" ID="lblEmergencyNumber" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmergencyNumberYes" runat="server" GroupName="rblEmergencyNumber" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmergencyNumberNo" runat="server" GroupName="rblEmergencyNumber"  />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmergencyNumberNA" runat="server" GroupName="rblEmergencyNumber"  />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEmergencyNumber"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblMSDS" />
            <td>
                <asp:Label Text="MSDS binder/computer station accessible & up to date" runat="server" ID="lblMSDS" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoMSDSYes" runat="server" GroupName="rblMSDS" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoMSDSNo" runat="server" GroupName="rblMSDS" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoMSDSNA" runat="server" GroupName="rblMSDS" />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentMSDS"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEmergencyShower" />
            <td>
                <asp:Label Text="Emergency Shower available/accessible" runat="server" ID="lblEmergencyShower" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmergencyShowerYes" runat="server" GroupName="rblEmergencyShower" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmergencyShowerNo" runat="server" GroupName="rblEmergencyShower" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmergencyShowerNA" runat="server" GroupName="rblEmergencyShower" />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEmergencyShower"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEmergencyShowerTest" />
            <td>
                <asp:Label Text="Emergency Shower tested monthly (if located in section)" runat="server" ID="lblEmergencyShowerTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmergencyShowerTestYes" runat="server" GroupName="rblEmergencyShowerTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmergencyShowerTestNo" runat="server" GroupName="rblEmergencyShowerTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmergencyShowerTestNA" runat="server" GroupName="rblEmergencyShowerTest" />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEmergencyShowerTest"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEyewash" />
            <td>
                <asp:Label Text="Eyewash available/accessible" runat="server" ID="lblEyewash" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEyewashYes" runat="server" GroupName="rblEyewash" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEyewashNo" runat="server" GroupName="rblEyewash" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEyewashNA" runat="server" GroupName="rblEyewash" />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEyewash"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEyewashTest" />
            <td>
                <asp:Label Text="Eyewash tested weekly if not sterile/sealed (& if in section)" runat="server" ID="lblEyewashTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEyewashTestYes" runat="server" GroupName="rblEyewashTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEyewashTestNo" runat="server" GroupName="rblEyewashTest" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEyewashTestNA" runat="server" GroupName="rblEyewashTest" />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEyewashTest"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblChemicalSpill" />
            <td>
                <asp:Label Text="Chemical spill kit accessible/stocked adequately" runat="server" ID="lblChemicalSpill" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoChemicalSpillYes" runat="server" GroupName="rblChemicalSpill" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoChemicalSpillNo" runat="server" GroupName="rblChemicalSpill" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoChemicalSpillNA" runat="server" GroupName="rblChemicalSpill" />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentChemicalSpill"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBiohazard" />
            <td>
                <asp:Label Text="Biohazard spill kit accessible/stocked adequately" runat="server" ID="lblBiohazard" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBiohazardYes" runat="server" GroupName="rblBiohazard" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBiohazardNo" runat="server" GroupName="rblBiohazard" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBiohazardNA" runat="server" GroupName="rblBiohazard" />
            </td>
            <td>
                &nbsp&nbsp&nbsp&nbsp&nbsp
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
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSafety" />
            <td>
                <asp:Label Text="Safety Glasses/Facial shield available and in good condition" runat="server" ID="lblSafety" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSafetyYes" runat="server" GroupName="rblSafety" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSafetyNo" runat="server" GroupName="rblSafety" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSafetyNA" runat="server" GroupName="rblSafety" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSafety"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblLabCoat" />
            <td>
                <asp:Label Text="Laboratory coat, gowns, gloves available/worn" runat="server" ID="lblLabCoat" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoLabCoatYes" runat="server" GroupName="rblLabCoat" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoLabCoatNo" runat="server" GroupName="rblLabCoat" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoLabCoatNA" runat="server" GroupName="rblLabCoat" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentLabCoat"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFootwear" />
            <td>
                <asp:Label Text="Substantial footwear worn (closed toe and heel)" runat="server" ID="lblFootwear" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFootwearYes" runat="server" GroupName="rblFootwear" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFootwearNo" runat="server" GroupName="rblFootwear" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFootwearNA" runat="server" GroupName="rblFootwear" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFootwear"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblRespirator" />
            <td>
                <asp:Label Text="Respirator(s) available/fit tested and documented" runat="server" ID="lblRespirator" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoRespiratorYes" runat="server" GroupName="rblRespirator" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoRespiratorNo" runat="server" GroupName="rblRespirator" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoRespiratorNA" runat="server" GroupName="rblRespirator" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentRespirator"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblVacuum" />
            <td>
                <asp:Label Text="Appropriate vacuum flask used on vacuum supply" runat="server" ID="lblVacuum" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoVacuumYes" runat="server" GroupName="rblVacuum" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoVacuumNo" runat="server" GroupName="rblVacuum" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoVacuumNA" runat="server" GroupName="rblVacuum" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentVacuum"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSplashGuard" />
            <td>
                <asp:Label Text="Splash guards available where necessary" runat="server" ID="lblSplashGuard" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSplashGuardYes" runat="server" GroupName="rblSplashGuard" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSplashGuardNo" runat="server" GroupName="rblSplashGuard" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSplashGuardNA" runat="server" GroupName="rblSplashGuard" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSplashGuard"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblHealthSurv" />
            <td>
                <asp:Label Text="Appropriate health surveillance/immunization provided" runat="server" ID="lblHealthSurv" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoHealthSurvYes" runat="server" GroupName="rblHealthSurv" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoHealthSurvNo" runat="server" GroupName="rblHealthSurv" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoHealthSurvNA" runat="server" GroupName="rblHealthSurv" />
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
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBenchTidy" />
            <td>
                <asp:Label Text="Bench tops and sink areas tidy" runat="server" ID="lblBenchTidy" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBenchTidyYes" runat="server" GroupName="rblBenchTidy" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBenchTidyNo" runat="server" GroupName="rblBenchTidy" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBenchTidyNA" runat="server" GroupName="rblBenchTidy" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBenchTidy"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblTripHaz" />
            <td>
                <asp:Label Text="No tripping hazards observed" runat="server" ID="lblTripHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoTripHazYes" runat="server" GroupName="rblTripHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoTripHazNo" runat="server" GroupName="rblTripHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoTripHazNA" runat="server" GroupName="rblTripHaz" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentTripHaz"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblExits" />
            <td>
                <asp:Label Text="Laboratory exits clear and doors unlocked" runat="server" ID="lblExits" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoExitsYes" runat="server" GroupName="rblExits" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoExitsNo" runat="server" GroupName="rblExits" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoExitsNA" runat="server" GroupName="rblExits" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentExits"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFoodDrink" />
            <td>
                <asp:Label Text="No food and drink observed in laboratory area" runat="server" ID="lblFoodDrink" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFoodDrinkYes" runat="server" GroupName="rblFoodDrink" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFoodDrinkNo" runat="server" GroupName="rblFoodDrink" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFoodDrinkNA" runat="server" GroupName="rblFoodDrink" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFoodDrink"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblGlassTube" />
            <td>
                <asp:Label Text="Glassware and tubing in good working condition" runat="server" ID="lblGlassTube" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoGlassTubeYes" runat="server" GroupName="rblGlassTube" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoGlassTubeNo" runat="server" GroupName="rblGlassTube" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoGlassTubeNA" runat="server" GroupName="rblGlassTube" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentGlassTube"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFallHaz" />
            <td>
                <asp:Label Text="No falling object hazards identifiable" runat="server" ID="lblFallHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFallHazYes" runat="server" GroupName="rblFallHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFallHazNo" runat="server" GroupName="rblFallHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFallHazNA" runat="server" GroupName="rblFallHaz" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFallHaz"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblStool" />
            <td>
                <asp:Label Text="Step stool available for out-of-reach items" runat="server" ID="lblStool" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoStoolYes" runat="server" GroupName="rblStool" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoStoolNo" runat="server" GroupName="rblStool" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoStoolNA" runat="server" GroupName="rblStool" />
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
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSharpCont" />
            <td>
                <asp:Label Text="Separate collection containers for sharps available" runat="server" ID="lblSharpCont" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSharpContYes" runat="server" GroupName="rblSharpCont" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSharpContNo" runat="server" GroupName="rblSharpCont" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSharpContNA" runat="server" GroupName="rblSharpCont" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSharpCont"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblYellowCont" />
            <td>
                <asp:Label Text="Biohazard needles/sharps in yellow 'Sharps' container" runat="server" ID="lblYellowCont" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoYellowContYes" runat="server" GroupName="rblYellowCont" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoYellowContNo" runat="server" GroupName="rblYellowCont" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoYellowContNA" runat="server" GroupName="rblYellowCont" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentYellowCont"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblYellowBagHSS" />
            <td>
                <asp:Label Text="Other biohazard waste disposed in yellow bags/HSS tubs" runat="server" ID="lblYellowBagHSS" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoYellowBagHSSYes" runat="server" GroupName="rblYellowBagHSS" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoYellowBagHSSNo" runat="server" GroupName="rblYellowBagHSS" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoYellowBagHSSNA" runat="server" GroupName="rblYellowBagHSS" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentYellowBagHSS"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblCyto" />
            <td>
                <asp:Label Text="Cytotoxic waste containers available" runat="server" ID="lblCyto" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoCytoYes" runat="server" GroupName="rblCyto" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoCytoNo" runat="server" GroupName="rblCyto" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoCytoNA" runat="server" GroupName="rblCyto" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentCyto"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBulkLabel" />
            <td>
                <asp:Label Text="Bulk solvent waste containers closed and labelled" runat="server" ID="lblBulkLabel" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBulkLabelYes" runat="server" GroupName="rblBulkLabel" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBulkLabelNo" runat="server" GroupName="rblBulkLabel" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBulkLabelNA" runat="server" GroupName="rblBulkLabel" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBulkLabel"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBulk25L" />
            <td>
                <asp:Label Text="Bulk Solvent waste containers > 25L stored in flammable storage cabinet" runat="server" ID="lblBulk25L" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBulk25LYes" runat="server" GroupName="rblBulk25L" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBulk25LNo" runat="server" GroupName="rblBulk25L" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBulk25LNA" runat="server" GroupName="rblBulk25L" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBulk25L"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblInterim" />
            <td>
                <asp:Label Text="Interim solvent waste containers closed" runat="server" ID="lblInterim" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoInterimYes" runat="server" GroupName="rblInterim" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoInterimNo" runat="server" GroupName="rblInterim" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoInterimNA" runat="server" GroupName="rblInterim" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentInterim"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEthidium" />
            <td>
                <asp:Label Text="Ethidium bromide waste segregated" runat="server" ID="lblEthidium" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEthidiumYes" runat="server" GroupName="rblEthidium" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEthidiumNo" runat="server" GroupName="rblEthidium" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEthidiumNA" runat="server" GroupName="rblEthidium" />
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
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblDisenfect" />
            <td>
                <asp:Label Text="Appropriate disinfectant(s) in correct concentration available" runat="server" ID="lblDisenfect" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoDisenfectYes" runat="server" GroupName="rblDisenfect" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoDisenfectNo" runat="server" GroupName="rblDisenfect" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoDisenfectNA" runat="server" GroupName="rblDisenfect" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentDisenfect"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBioHazSign" />
            <td>
                <asp:Label Text="Biological hazard signs posted" runat="server" ID="lblBioHazSign" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBioHazSignYes" runat="server" GroupName="rblBioHazSign" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBioHazSignNo" runat="server" GroupName="rblBioHazSign" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBioHazSignNA" runat="server" GroupName="rblBioHazSign" />
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
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSash" />
            <td>
                <asp:Label Text="Sash at recommended height and air flow on" runat="server" ID="lblSash" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSashYes" runat="server" GroupName="rblSash" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSashNo" runat="server" GroupName="rblSash" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSashNA" runat="server" GroupName="rblSash" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSash"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBioCabCert" />
            <td>
                <asp:Label Text="Biological safety cabinets certified" runat="server" ID="lblBioCabCert" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBioCabCertYes" runat="server" GroupName="rblBioCabCert" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBioCabCertNo" runat="server" GroupName="rblBioCabCert" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBioCabCertNA" runat="server" GroupName="rblBioCabCert" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBioCabCert"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBioCabClean" />
            <td>
                <asp:Label Text="Biological safety cabinets clean and tidy" runat="server" ID="lblBioCabClean" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBioCabCleanYes" runat="server" GroupName="rblBioCabClean" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBioCabCleanNo" runat="server" GroupName="rblBioCabClean" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBioCabCleanNA" runat="server" GroupName="rblBioCabClean" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBioCabClean"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFumeFunc" />
            <td>
                <asp:Label Text="Fume hood(s) functioning properly" runat="server" ID="lblFumeFunc" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFumeFuncYes" runat="server" GroupName="rblFumeFunc" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFumeFuncNo" runat="server" GroupName="rblFumeFunc" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFumeFuncNA" runat="server" GroupName="rblFumeFunc" />
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
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblVacuumPump" />
            <td>
                <asp:Label Text="Vacuum pumps stored safely and belts guarded" runat="server" ID="lblVacuumPump" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoVacuumPumpYes" runat="server" GroupName="rblVacuumPump" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoVacuumPumpNo" runat="server" GroupName="rblVacuumPump" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoVacuumPumpNA" runat="server" GroupName="rblVacuumPump" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentVacuumPump"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFrayedCords" />
            <td>
                <asp:Label Text="No frayed or cracked electrical cords observed" runat="server" ID="lblFrayedCords" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFrayedCordsYes" runat="server" GroupName="rblFrayedCords" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFrayedCordsNo" runat="server" GroupName="rblFrayedCords" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFrayedCordsNA" runat="server" GroupName="rblFrayedCords" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFrayedCords"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblOutlets" />
            <td>
                <asp:Label Text="Electrical outlets are not overloaded" runat="server" ID="lblOutlets" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoOutletsYes" runat="server" GroupName="rblOutlets" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoOutletsNo" runat="server" GroupName="rblOutlets" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoOutletsNA" runat="server" GroupName="rblOutlets" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentOutlets"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblPowerBar" />
            <td>
                <asp:Label Text="Power bars have a circuit breaker and not 'daisy-chained'" runat="server" ID="lblPowerBar" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPowerBarYes" runat="server" GroupName="rblPowerBar" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPowerBarNo" runat="server" GroupName="rblPowerBar" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPowerBarNA" runat="server" GroupName="rblPowerBar" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentPowerBar"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEmPower" />
            <td>
                <asp:Label Text="Critical equipment connected to emergency power" runat="server" ID="lblEmPower" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmPowerYes" runat="server" GroupName="rblEmPower" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmPowerNo" runat="server" GroupName="rblEmPower" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEmPowerNA" runat="server" GroupName="rblEmPower" />
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
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblFlam" />
            <td>
                <asp:Label Text="Flammables stored in appropriate refrigerator/cabinet" runat="server" ID="lblFlam" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFlamYes" runat="server" GroupName="rblFlam" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFlamNo" runat="server" GroupName="rblFlam" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoFlamNA" runat="server" GroupName="rblFlam" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentFlam"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSolventCab" />
            <td>
                <asp:Label Text="Solvent storage cabinet available, clean and closed" runat="server" ID="lblSolventCab" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSolventCabYes" runat="server" GroupName="rblSolventCab" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSolventCabNo" runat="server" GroupName="rblSolventCab" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSolventCabNA" runat="server" GroupName="rblSolventCab" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSolventCab"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblSolventOutside" />
            <td>
                <asp:Label Text="Solvent Containers outside safety cabinet < 25L" runat="server" ID="lblSolventOutside" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSolventOutsideYes" runat="server" GroupName="rblSolventOutside" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSolventOutsideNo" runat="server" GroupName="rblSolventOutside" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoSolventOutsideNA" runat="server" GroupName="rblSolventOutside" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentSolventOutside"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblPropHaz" />
            <td>
                <asp:Label Text="Proper labelling of hazardous materials" runat="server" ID="lblPropHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPropHazYes" runat="server" GroupName="rblPropHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPropHazNo" runat="server" GroupName="rblPropHaz" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPropHazNA" runat="server" GroupName="rblPropHaz" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentPropHaz"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblPropCyto" />
            <td>
                <asp:Label Text="Proper labelling of cytotoxic materials" runat="server" ID="lblPropCyto" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPropCytoYes" runat="server" GroupName="rblPropCyto" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPropCytoNo" runat="server" GroupName="rblPropCyto" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPropCytoNA" runat="server" GroupName="rblPropCyto" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentPropCyto"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblCytoToDate" />
            <td>
                <asp:Label Text="Cytotoxic materials exposure records and inventory sheets completed and up to date." runat="server" ID="lblCytoToDate" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoCytoToDateYes" runat="server" GroupName="rblCytoToDate" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoCytoToDateNo" runat="server" GroupName="rblCytoToDate" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoCytoToDateNA" runat="server" GroupName="rblCytoToDate" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentCytoToDate"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblReagentSecure" />
            <td>
                <asp:Label Text="Reagent chemicals stored securely (lips on shelves or doors on cupboards)" runat="server" ID="lblReagentSecure" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoReagentSecureYes" runat="server" GroupName="rblReagentSecure" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoReagentSecureNo" runat="server" GroupName="rblReagentSecure" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoReagentSecureNA" runat="server" GroupName="rblReagentSecure" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentReagentSecure"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblIncompat" />
            <td>
                <asp:Label Text="Incompatible materials separated" runat="server" ID="lblIncompat" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoIncompatYes" runat="server" GroupName="rblIncompat" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoIncompatNo" runat="server" GroupName="rblIncompat" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoIncompatNA" runat="server" GroupName="rblIncompat" />
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
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblBiosafety" />
            <td>
                <asp:Label Text="Biosafety, chemical and cytotoxics safety training provided and documented" runat="server" ID="lblBiosafety" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBiosafetyYes" runat="server" GroupName="rblBiosafety" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBiosafetyNo" runat="server" GroupName="rblBiosafety" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoBiosafetyNA" runat="server" GroupName="rblBiosafety" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentBiosafety"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblWorkplaceSafety" />
            <td>
                <asp:Label Text="Workplace safety training provided and documented" runat="server" ID="lblWorkplaceSafety" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoWorkplaceSafetyYes" runat="server" GroupName="rblWorkplaceSafety" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoWorkplaceSafetyNo" runat="server" GroupName="rblWorkplaceSafety" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoWorkplaceSafetyNA" runat="server" GroupName="rblWorkplaceSafety" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentWorkplaceSafety"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblWHMIS" />
            <td>
                <asp:Label Text="WHMIS - all staff are trained (current and documented)" runat="server" ID="lblWHMIS" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoWHMISYes" runat="server" GroupName="rblWHMIS" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoWHMISNo" runat="server" GroupName="rblWHMIS" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoWHMISNA" runat="server" GroupName="rblWHMIS" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentWHMIS"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblTDG" />
            <td>
                <asp:Label Text="TDG training provided (if applicable) and documented" runat="server" ID="lblTDG" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoTDGYes" runat="server" GroupName="rblTDG" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoTDGNo" runat="server" GroupName="rblTDG" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoTDGNA" runat="server" GroupName="rblTDG" />
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
            <td class="tblComments">
                <h3>Comments</h3>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblStorageSeis" />
            <td>
                <asp:Label Text="Equipment/storage shelves seismically restrained" runat="server" ID="lblStorageSeis" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoStorageSeisYes" runat="server" GroupName="rblStorageSeis" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoStorageSeisNo" runat="server" GroupName="rblStorageSeis" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoStorageSeisNA" runat="server" GroupName="rblStorageSeis" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentStorageSeis"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblEquipGuards" />
            <td>
                <asp:Label Text="Appropriate equipment guard(s) provided" runat="server" ID="lblEquipGuards" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEquipGuardsYes" runat="server" GroupName="rblEquipGuards" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEquipGuardsNo" runat="server" GroupName="rblEquipGuards" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoEquipGuardsNA" runat="server" GroupName="rblEquipGuards" />
            </td>
            <td>
                <asp:TextBox CssClass="inspectionComments" runat="server" ID="tbxCommentEquipGuards"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <asp:RadioButtonList RepeatDirection="Horizontal" RepeatLayout="Table" CellPadding="5" CellSpacing="2" runat="server" ID="rblPressureTankSup" />
            <td>
                <asp:Label Text="Pressurized gas tanks restrained/supported" runat="server" ID="lblPressureTankSup" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPressureTankSupYes" runat="server" GroupName="rblPressureTankSup" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPressureTankSupNo" runat="server" GroupName="rblPressureTankSup" />
            </td>
            <td class="tblYesNoNA">
                <asp:ListItem ID="rdoPressureTankSupNA" runat="server" GroupName="rblPressureTankSup" />
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