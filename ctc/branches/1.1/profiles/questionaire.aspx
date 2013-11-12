<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="questionaire.aspx.cs" Inherits="profiles_questionaire" Title="Student Questionnaire" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Student Questionnaire...</p>
        <br />
        <div>
            <p>
               
            </p>
        </div>
        <asp:Label ID="LabelError" runat="server" Text="All profile questions must be answered."
            Visible="False" ForeColor="Red" Font-Bold="True"></asp:Label>
        <table width="500">
            <tr>
                <td width="500" align="left">
                    Please enter your CPS ID (Student ID Number found on your CPS ID card)<br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBoxCPS" runat="server" MaxLength="50" 
                        ontextchanged="TextBoxCPS_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCPS" runat="server" ErrorMessage="Missing required information"
                        Display="None" EnableClientScript="true" ControlToValidate="TextBoxCPS" />
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorCPS" />
                    <asp:RegularExpressionValidator ID="CPSIDVAL" ValidationExpression="\d{8}" runat="server" EnableClientScript="true" ControlToValidate="TextBoxCPS" Display="None" ErrorMessage="Your 8 Digit CPS ID is required" />
                 <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="CPSIDVAL" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Literal ID="LiteralForm" runat="server"></asp:Literal>
        <asp:PlaceHolder ID="PlaceHolderForm" runat="server"></asp:PlaceHolder>
        <br />
        <br />
        <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
    </div>
</asp:Content>
