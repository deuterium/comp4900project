<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Reporting_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 274px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
        <td>
        <h5>Patient Handling</h5>
        </td>
        <td class="style1">
        <h5>Patient Handling Details</h5>
        </td>
        </tr>
            <td>
            <asp:CheckBoxList ID="cblActivityPatientHandling0" runat="server">
                <asp:ListItem Text="Respositioning" ></asp:ListItem>
                <asp:ListItem Text="Transferring (incl. to seclusion)" ></asp:ListItem>
                <asp:ListItem Text="Assisted Walking" ></asp:ListItem>
                <asp:ListItem Text="Assisted from Floor" ></asp:ListItem>
                <asp:ListItem Text="Preventing a fall" ></asp:ListItem>
                <asp:ListItem Text="Holding / Assisting during procedure (incl. patient restraint)" ></asp:ListItem>
                <asp:ListItem Text="Toileting" ></asp:ListItem>
            </asp:CheckBoxList>    
            </td>
            <td class="style1">
                <h5>
                    &nbsp;</h5>
                Equipment used at time of Injury:
                <asp:RadioButtonList ID="rblPatientHandlingEquipmentUsed" runat="server">
                    <asp:ListItem Text="Ceiling Lift"></asp:ListItem>
                    <asp:ListItem Text="Sit-Stand Lift"></asp:ListItem>
                    <asp:ListItem Text="Floor Lift"></asp:ListItem>
                    <asp:ListItem Text="Manual Lift"></asp:ListItem>
                    <asp:ListItem Text="Other"></asp:ListItem>
                </asp:RadioButtonList>
                If other, please specifiy:
                <asp:TextBox ID="tbxPatientHandlingOther" runat="server"></asp:TextBox>
                <p>
                    Was adaquate assistance available?
                    <asp:RadioButtonList ID="rblPatientHandlingAssistanceAvailable" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Text="Yes"></asp:ListItem>
                        <asp:ListItem Text="No"></asp:ListItem>
                        <asp:ListItem Text="Unknown"></asp:ListItem>
                    </asp:RadioButtonList>
                </p>
            </td>
            </td>
        </tr>
        </table>
    </div>
    </form>
</body>
</html>
