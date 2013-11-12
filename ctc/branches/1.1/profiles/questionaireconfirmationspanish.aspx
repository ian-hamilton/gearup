<%@ Page Title="Confirmación" Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="questionaireconfirmationspanish.aspx.cs" Inherits="profiles_questionaireconfirmationspanish" %>

<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="child-content">
        <br />
        <br />
        <h1>
            Gracias....</h1>
        <br />
        <h1>
            Su cuestionario ha sido ingresado.</h1>
        <br />
        <div>
            Por favor guarde este documento para sus registros:
            <asp:Label ID="LabelDocId" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br>
            <br>
            
            
            <input type="button" value="Regrese a la paginá principal" onclick="location.href='/CTC/Default.aspx';" />
            
            
        </div>
    </div>
    <uc1:sidebar ID="sidebar2" runat="server" />
</asp:Content>
