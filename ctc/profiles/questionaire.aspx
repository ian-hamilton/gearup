<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="questionaire.aspx.cs" Inherits="profiles_questionaire" Title="Student Questionnaire" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p id="page-header">
        Student Questionnaire...</p>
    <br />
    <asp:Label ID="LabelError" runat="server" Text="All profile questions must be answered."
        Visible="False" ForeColor="Red" Font-Bold="True"></asp:Label>
    <table class="tlabel">
        <tr class="label">
            <td colspan="3">
                <br />
                Please enter your CPS ID
                <br />
                (Student ID Number found on your CPS ID card):<br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxCPS" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCPS" runat="server" ErrorMessage="Your 8 Digit CPS ID is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="TextBoxCPS" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorCPS" />
                <asp:RegularExpressionValidator ID="CPSIDVAL" ValidationExpression="\d{8}" runat="server"
                    EnableClientScript="true" ControlToValidate="TextBoxCPS" Display="None" ErrorMessage="Your 8 Digit CPS ID is required" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="CPSIDVAL" />
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr class="label">
            <td>
                Student First Name
            </td>
            <td>
                Middle Name
            </td>
            <td>
                Last Name
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="StuFName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorStuFname" runat="server" ErrorMessage="Your First Name is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="StuFname" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="StuFName" Display="None"
                    ErrorMessage="Please enter your First Name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidatorStuFname" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender21" runat="server" TargetControlID="RegularExpressionValidator7" />
            </td>
            <td>
                <asp:TextBox ID="StuMidName" runat="server" MaxLength="30" />
            </td>
            <td>
                <asp:TextBox ID="StuLName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorStuLName" runat="server" ErrorMessage="Your Last Name is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="StuLName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="StuLName" Display="None"
                    ErrorMessage="Please enter your Last Name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RequiredFieldValidatorStuLName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender22" runat="server" TargetControlID="RegularExpressionValidator8" />
            </td>
        </tr>
        <tr class="label">
            <td>
                Date of Birth (MM/DD/YYYY)
            </td>
            <td>
                School
            </td>
            <td>
                Grade (XX)
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="DOB" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" runat="server" ErrorMessage="Your date of birth is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="DOB" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="RequiredFieldValidatorDOB" />
                <cc1:MaskedEditExtender ID="MaskedEditExtender1" TargetControlID="DOB" MaskType="Date"
                    MessageValidatorTip="true" runat="server" Mask="99/99/9999" />
               <asp:CompareValidator id="dateValidator" runat="server" 
                    Type="Date" Operator="DataTypeCheck" ControlToValidate="DOB" Display="None"
                    ErrorMessage="Please enter a valid date. MM/DD/YYYY">
                    </asp:CompareValidator>
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" TargetControlID="dateValidator" />
            </td>
            <td>
                <asp:TextBox ID="School" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSchool" runat="server" ErrorMessage="Your current School is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="School" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ValidationExpression="^[a-zA-Z\s\'\-]{1,100}$"
                    runat="server" EnableClientScript="true" ControlToValidate="School" Display="None"
                    ErrorMessage="Please enter your current School name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RequiredFieldValidatorSchool" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender24" runat="server" TargetControlID="RegularExpressionValidator10" />
            </td>
            <td>
                <asp:TextBox ID="Grade" runat="server" MaxLength="2" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGrade" runat="server" ErrorMessage="Your current Grade is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="Grade" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ValidationExpression="\d{2}"
                    runat="server" EnableClientScript="true" ControlToValidate="Grade" Display="None"
                    ErrorMessage="Please enter your 2 digit grade only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="RequiredFieldValidatorGrade" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender23" runat="server" TargetControlID="RegularExpressionValidator9" />
            </td>
        </tr>
    </table>
    <br />
    <table class="tlabel">
        <tr class="label">
            <td>
                Parent/Guardian<br />
                First Name
            </td>
            <td>
                Last Name
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="PGuarFName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarFName" runat="server"
                    ErrorMessage="Your Parent/Guardian's First Name is required information" Display="None"
                    EnableClientScript="true" ControlToValidate="PGuarFName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuarFName" Display="None"
                    ErrorMessage="Please enter your Parent/Guardian's First Name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="RequiredFieldValidatorPGuarFName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender19" runat="server" TargetControlID="RegularExpressionValidator5" />
            </td>
            <td>
                <asp:TextBox ID="PGuarLName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarLName" runat="server"
                    ErrorMessage="Your Parent/Guardian's Last Name is required information" Display="None"
                    EnableClientScript="true" ControlToValidate="PGuarLName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuarLName" Display="None"
                    ErrorMessage="Please enter your Parent/Guardian's Last Name only!" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="RequiredFieldValidatorPGuarLName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender20" runat="server" TargetControlID="RegularExpressionValidator6" />
            </td>
        </tr>
        <tr class="label">
            <td>
                First Name
            </td>
            <td>
                Last Name
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="PGuar2FName" runat="server" MaxLength="30" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuar2FName" Display="None"
                    ErrorMessage="Please enter your Parent/Guardian's First Name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" TargetControlID="RegularExpressionValidator1" />
            </td>
            <td>
                <asp:TextBox ID="PGuar2LName" runat="server" MaxLength="30" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuar2LName" Display="None"
                    ErrorMessage="Please enter your Parent/Guardian's Last Name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender13" runat="server" TargetControlID="RegularExpressionValidator2" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Literal ID="LiteralForm" runat="server"></asp:Literal>
    <asp:PlaceHolder ID="PlaceHolderForm" runat="server"></asp:PlaceHolder>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <br />
    <center>
        <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
    </center>
</asp:Content>
