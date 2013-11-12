<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="NoQuestionaires.aspx.cs" Inherits="profiles_NoQuestionaires"
    Title="There Are Currently No Questionaires Available" %>

<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="child-content">
        <br />
        <br />
        <h1>
            There Are Currently No Questionaires Available....</h1>
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
            <input type="button" value="Return to Home Page" onclick="location.href='/CTC/Default.aspx';" />
           </center>
        </div>
    <%--</div>--%>
    <uc1:sidebar ID="sidebar1" runat="server" />
</asp:Content>

