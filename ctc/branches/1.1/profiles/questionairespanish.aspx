<%@ Page Title="Estudiantes Formulario" Language="C#" MasterPageFile="~/ctc_info.master"
    AutoEventWireup="true" CodeFile="questionairespanish.aspx.cs" Inherits="profiles_questionairespanish" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Cuestionario para Padres...</p>
        <br />
        <div>
            <p>
               
            </p>
        </div>
        <asp:Label ID="LabelError" runat="server" Text="Todas las preguntas del portafolio tienen que ser contestadas."
            Visible="False" ForeColor="Red" Font-Bold="True"></asp:Label>
        <table width="500">
            <tr>
                <td width="500" align="left">
                    Por favor ingrese su número de identificación de CPS (el número se encuentra en
                    la tarjeta de identificación de CPS-Escuelas Públicas de Chicago)<br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                   <asp:TextBox ID="TextBoxCPS" runat="server" MaxLength="50" 
                        ontextchanged="TextBoxCPS_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCPS" runat="server" ErrorMessage="Missing required information"
                        Display="None" EnableClientScript=true ControlToValidate="TextBoxCPS" />
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorCPS" />
                    <asp:RegularExpressionValidator ID=CPSIDVAL ValidationExpression="\d{8}" runat=server EnableClientScript=true ControlToValidate="TextBoxCPS" Display="None" ErrorMessage="Your 8 Digit CPS ID is required" />
                 <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="CPSIDVAL" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Literal ID="LiteralForm" runat="server"></asp:Literal>
        <asp:PlaceHolder ID="PlaceHolderForm" runat="server"></asp:PlaceHolder>
        <br />
        <br />
        <asp:Button ID="ButtonSubmit" runat="server" Text="Entregar" OnClick="ButtonSubmit_Click" />
    </div>
</asp:Content>
