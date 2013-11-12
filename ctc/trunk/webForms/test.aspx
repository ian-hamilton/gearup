<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="webForms_test" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register src="../controls/sidebar.ascx" tagname="sidebar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="child-content">


   


</div>


    <uc1:sidebar ID="sidebar1" runat="server" />




</asp:Content>

