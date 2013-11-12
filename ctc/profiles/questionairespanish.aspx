<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="questionairespanish.aspx.cs" Inherits="profiles_questionairespanish"
    Title="Estudiantes Formulario" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p id="page-header">
        GEAR UP: Encuesta de Estudiantes 2010...</p>
    <br />
    <asp:Label ID="LabelError" runat="server" Text="Todas las preguntas del portafolio tienen que ser contestadas."
        Visible="False" ForeColor="Red" Font-Bold="True"></asp:Label>
    <table class="tlabel">
        <tr class="label">
            <td colspan="3">
                <br />
                Por favor ingrese la siguiente información:<br />
                Número de identificación
                <br />
                del estudiante (CPS ID):<br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxCPS" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCPS" runat="server" ErrorMessage="Tu número de 8 dígitos, de identificación de CPS es información requerida"
                    Display="None" EnableClientScript="true" ControlToValidate="TextBoxCPS" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorCPS" />
                <asp:RegularExpressionValidator ID="CPSIDVAL" ValidationExpression="\d{8}" runat="server"
                    EnableClientScript="true" ControlToValidate="TextBoxCPS" Display="None" ErrorMessage="Tu número de 8 dígitos, de identificación de CPS es información requerida" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="CPSIDVAL" />
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr class="label">
            <td>
                Nombre del Estudiante<br />
                Primer
            </td>
            <td>
                Segundo
            </td>
            <td>
                Apellido
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="StuFName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorStuFname" runat="server" ErrorMessage="Su primer nombre es información requerida"
                    Display="None" EnableClientScript="true" ControlToValidate="StuFname" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="StuFName" Display="None"
                    ErrorMessage="Por favor ingresa solamente tu primer nombre" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidatorStuFname" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender21" runat="server" TargetControlID="RegularExpressionValidator7" />
            </td>
            <td>
                <asp:TextBox ID="StuMidName" runat="server" MaxLength="30" />
            </td>
            <td>
                <asp:TextBox ID="StuLName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorStuLName" runat="server" ErrorMessage="Tu apellido es información requerida"
                    Display="None" EnableClientScript="true" ControlToValidate="StuLName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="StuLName" Display="None"
                    ErrorMessage="Por favor ingresa solamente tu apellido" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RequiredFieldValidatorStuLName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender22" runat="server" TargetControlID="RegularExpressionValidator8" />
            </td>
        </tr>
        <tr class="label">
            <td>
                Fecha de Nacimiento (MES/DIA/AÑO)<br />
                                     &nbsp &nbsp(00/00/0000)

            </td>
            <td>
                Escuela
            </td>
            <td>
                Grado
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="DOB" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" runat="server" ErrorMessage="Tu fecha de nacimiento es información requerida"
                    Display="None" EnableClientScript="true" ControlToValidate="DOB" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="RequiredFieldValidatorDOB" />
                <cc1:MaskedEditExtender ID="MaskedEditExtender1" TargetControlID="DOB" MaskType="Date"
                    MessageValidatorTip="true" runat="server" Mask="99/99/9999" />
                <asp:CompareValidator id="dateValidator" runat="server" 
                    Type="Date" Operator="DataTypeCheck" ControlToValidate="DOB" Display="None"
                    ErrorMessage="Please enter a valid date. MES/DIA/AÑO 00/00/0000 or MM/DD/YYYY 00/00/0000">
                    </asp:CompareValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender10" runat="server" TargetControlID="dateValidator" />
            </td>
            <td>
                <asp:TextBox ID="School" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSchool" runat="server" ErrorMessage="Tu escuela actual es información requerida"
                    Display="None" EnableClientScript="true" ControlToValidate="School" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ValidationExpression="^[a-zA-Z\s\'\-]{1,100}$"
                    runat="server" EnableClientScript="true" ControlToValidate="School" Display="None"
                    ErrorMessage="Por favor ingresa el nombre de tu escuela actual" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RequiredFieldValidatorSchool" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender24" runat="server" TargetControlID="RegularExpressionValidator10" />
            </td>
            <td>
                <asp:TextBox ID="Grade" runat="server" MaxLength="2" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGrade" runat="server" ErrorMessage="Tu grado actual es información requerida"
                    Display="None" EnableClientScript="true" ControlToValidate="Grade" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ValidationExpression="\d{2}"
                    runat="server" EnableClientScript="true" ControlToValidate="Grade" Display="None"
                    ErrorMessage="Por favor ingresa tu grado (2 dígitos)" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="RequiredFieldValidatorGrade" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender23" runat="server" TargetControlID="RegularExpressionValidator9" />
            </td>
        </tr>
    </table>
    <br />
    <table class="tlabel">
        <tr class="label">
            <td>
                Nombre del Padre / Guardián<br />
                Primer
            </td>
            <td>
                Apellido
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="PGuarFName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarFName" runat="server"
                    ErrorMessage="El primer nombre de tu padre/guardián es información requerida"
                    Display="None" EnableClientScript="true" ControlToValidate="PGuarFName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuarFName" Display="None"
                    ErrorMessage="Por favor ingresa solamente el primer nombre de tu padre/guardián" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="RequiredFieldValidatorPGuarFName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender19" runat="server" TargetControlID="RegularExpressionValidator5" />
            </td>
            <td>
                <asp:TextBox ID="PGuarLName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarLName" runat="server"
                    ErrorMessage="El apellido de tu padre/guardián es información requerida" Display="None"
                    EnableClientScript="true" ControlToValidate="PGuarLName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuarLName" Display="None"
                    ErrorMessage="Por favor ingresa solamente el apellido de tu padre/guardián" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="RequiredFieldValidatorPGuarLName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender20" runat="server" TargetControlID="RegularExpressionValidator6" />
            </td>
        </tr>
        <tr class="label">
            <td>
                Primer
            </td>
            <td>
                Apellido
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="PGuar2FName" runat="server" MaxLength="30" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuar2FName" Display="None"
                    ErrorMessage="Por favor ingresa solamente el primer nombre de tu padre/guardián" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" TargetControlID="RegularExpressionValidator1" />
            </td>
            <td>
                <asp:TextBox ID="PGuar2LName" runat="server" MaxLength="30" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuar2LName" Display="None"
                    ErrorMessage="Por favor ingresa solamente el apellido de tu padre/guardián" />
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
