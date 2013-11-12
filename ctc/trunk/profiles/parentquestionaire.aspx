<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="parentquestionaire.aspx.cs" Inherits="profiles_parentquestionaire"
    Title="Parent Questionnaire" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p id="page-header">
        Parent Questionnaire...</p>
    <br />
    <asp:Label ID="LabelError" runat="server" Text="All profile questions must be answered."
        Visible="False" ForeColor="Red" Font-Bold="True"></asp:Label>
    <table class="tlabel">
        <tr class="label">
            <td>
                Parent/Guardian<br />
                First Name
            </td>
            <td>
                Last Name
            </td>
            <td>
                Phone Number<br />
                (XXX-XXX-XXXX)
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="PGuarFName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarFName" runat="server"
                    ErrorMessage="Your First Name is required information" Display="None" EnableClientScript="true"
                    ControlToValidate="PGuarFName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuarFName" Display="None"
                    ErrorMessage="Please enter your first name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="RequiredFieldValidatorPGuarFName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender19" runat="server" TargetControlID="RegularExpressionValidator5" />
            </td>
            <td>
                <asp:TextBox ID="PGuarLName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarLName" runat="server"
                    ErrorMessage="Your Last Name is required information" Display="None" EnableClientScript="true"
                    ControlToValidate="PGuarLName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuarLName" Display="None"
                    ErrorMessage="Please enter your last name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="RequiredFieldValidatorPGuarLName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender20" runat="server" TargetControlID="RegularExpressionValidator6" />
            </td>
            <td align="left">
                <table>
                    <tr>
                        <td style="padding: 0px 0px 0px 0px">
                            <asp:Label ID="Label16" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                            <asp:TextBox ID="TextBoxPhoneAreaCode" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="\d{3}"
                                runat="server" EnableClientScript="true" ControlToValidate="TextBoxPhoneAreaCode"
                                Display="None" ErrorMessage="Your 3 Digit Area Code is required" />
             <%--               <asp:RequiredFieldValidator ID="TextBoxPhoneAreaCodeRequired" runat="server" ErrorMessage="Your 3 Digit Area Code is required information"
                                Display="None" EnableClientScript="true" ControlToValidate="TextBoxPhoneAreaCode" />--%>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="RegularExpressionValidator1" />
                          <%--  <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender13" runat="server" TargetControlID="TextBoxPhoneAreaCodeRequired" />--%>
                            <asp:Label ID="Label17" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                        </td>
                        <td style="padding: 0px 0px 0px 0px">
                            <asp:Label ID="Label18" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                        </td>
                        <td style="padding: 0px 0px 0px 0px">
                            <asp:TextBox ID="TextBoxPhonePrefix" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="\d{3}"
                                runat="server" EnableClientScript="true" ControlToValidate="TextBoxPhonePrefix"
                                Display="None" ErrorMessage="Your Complete Phone Number is required" />
                          <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Your Complete Phone Number is required information"
                                Display="None" EnableClientScript="true" ControlToValidate="TextBoxPhonePrefix" />--%>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender14" runat="server" TargetControlID="RegularExpressionValidator2" />
                          <%--  <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender15" runat="server" TargetControlID="RequiredFieldValidator1" />--%>
                        </td>
                        <td style="padding: 0px 0px 0px 0px">
                            <asp:Label ID="Label19" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                        </td>
                        <td style="padding: 0px 0px 0px 0px">
                            <asp:TextBox ID="TextBoxPhoneNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationExpression="\d{4}"
                                runat="server" EnableClientScript="true" ControlToValidate="TextBoxPhoneNumber"
                                Display="None" ErrorMessage="Your Complete Phone Number is required" />
                          <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Your Complete Phone Number is required information"
                                Display="None" EnableClientScript="true" ControlToValidate="TextBoxPhoneNumber" />--%>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender16" runat="server" TargetControlID="RegularExpressionValidator3" />
                   <%--         <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender17" runat="server" TargetControlID="RequiredFieldValidator2" />--%>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr class="label">
            <td>
                Address
            </td>
            <td>
                City
            </td>
            <td>
                Zip
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="PGuarAddress" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarAddress" runat="server"
                    ErrorMessage="Your complete address is required information" Display="None" EnableClientScript="true"
                    ControlToValidate="PGuarAddress" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" TargetControlID="RequiredFieldValidatorPGuarAddress" />
            </td>
            <td>
                <asp:TextBox ID="PGuarCity" runat="server" MaxLength="30" Text="Chicago" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarCity" runat="server" ErrorMessage="Your City is required information required information"
                    Display="None" EnableClientScript="true" ControlToValidate="PGuarCity" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" TargetControlID="RequiredFieldValidatorPGuarCity" />
            </td>
            <td>
                <asp:TextBox ID="PGuarZip" runat="server" MaxLength="10" Text="606"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarZip" runat="server" ErrorMessage="Your Zip Code is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="PGuarZip" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuarZip" Display="None"
                    ErrorMessage="Your Complete 5 Digit Zip Code is required" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender12" runat="server" TargetControlID="RequiredFieldValidatorPGuarZip" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender18" runat="server" TargetControlID="RegularExpressionValidator4" />
            </td>
        </tr>
    </table>
    <div style="text-align: center;">
        Information about your child going into 11th or 12th grade
        <br />
        (use a separate questionnaire for each child):
    </div>
    <table class="tlabel">
        <tr class="label">
            <td colspan="3">
                Please enter your child's CPS ID
                <br />
                (Student ID Number found on their CPS ID card):<br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxCPS" runat="server" MaxLength="8"></asp:TextBox>
                <asp:RegularExpressionValidator ID="CPSIDVAL" ValidationExpression="\d{8}" runat="server"
                    EnableClientScript="true" ControlToValidate="TextBoxCPS" Display="None" ErrorMessage="Your Childs 8 Digit CPS ID is required" />
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorStuFname" runat="server" ErrorMessage="Your Student's First Name required information"
                    Display="None" EnableClientScript="true" ControlToValidate="StuFname" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="StuFName" Display="None"
                    ErrorMessage="Please enter your student's first name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorStuFname" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender21" runat="server" TargetControlID="RegularExpressionValidator7" />
            </td>
            <td>
                <asp:TextBox ID="StuMidName" runat="server" MaxLength="30" />
            </td>
            <td>
                <asp:TextBox ID="StuLName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorStuLName" runat="server" ErrorMessage="Your Student's Last Name is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="StuLName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="StuLName" Display="None"
                    ErrorMessage="Please enter your Student's last name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidatorStuLName" />
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" runat="server" ErrorMessage="Your Student's date of birth is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="DOB" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RequiredFieldValidatorDOB" />
                <cc1:MaskedEditExtender TargetControlID="DOB" MaskType="Date" MessageValidatorTip="true"
                    runat="server" Mask="99/99/9999" />
                <asp:CompareValidator id="dateValidator" runat="server" 
                    Type="Date" Operator="DataTypeCheck" ControlToValidate="DOB" Display="None"
                    ErrorMessage="Please enter a valid date. MM/DD/YYYY">
                    </asp:CompareValidator>
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender13" runat="server" TargetControlID="dateValidator" />
            </td>
            <td>
                <asp:TextBox ID="School" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSchool" runat="server" ErrorMessage="Your Student's current School is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="School" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ValidationExpression="^[a-zA-Z\s\'\-]{1,100}$"
                    runat="server" EnableClientScript="true" ControlToValidate="School" Display="None"
                    ErrorMessage="Please enter your Student's current School name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="RequiredFieldValidatorSchool" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender24" runat="server" TargetControlID="RegularExpressionValidator10" />
            </td>
            <td>
                <asp:TextBox ID="Grade" runat="server" MaxLength="2" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGrade" runat="server" ErrorMessage="Your Student's current Grade is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="Grade" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ValidationExpression="\d{2}"
                    runat="server" EnableClientScript="true" ControlToValidate="Grade" Display="None"
                    ErrorMessage="Please enter your Student's 2 digit grade only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RequiredFieldValidatorGrade" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender23" runat="server" TargetControlID="RegularExpressionValidator9" />
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
    <br />
</asp:Content>
