﻿<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="NoParentQuestionairesSpanish.aspx.cs" Inherits="profiles_NoParentQuestionairesSpanish"
    Title="No hay cuestionarios para padres por el momento" %>

<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div id="child-content">
        <br />
        <br />
        <h1>
            No hay cuestionarios para padres por el momento....</h1>
        <br />
        <br />
       <%-- <h1>
            your Registration has been submitted.</h1>
        <br />
        <div>
            Please retain this document identifier for your records:
            <asp:Label ID="LabelDocId" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br/>
            <br/>--%>
            <center>
            <input type="button" value="Regreso a la página principal" onclick="location.href='/CTC/Default.aspx';" />
           </center>
        </div>
    <%--</div>--%>
    <uc1:sidebar ID="sidebar1" runat="server" />
</asp:Content>

