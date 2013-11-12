<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="registrationconfirmation.aspx.cs" Inherits="profiles_registrationconfirmation"
    Title="Confirmation" %>

<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="child-content">
        <br />
        <br />
        <h1>
            Thank You....</h1>
        <br />
        <h1>
            your Registration has been submitted.</h1>
        <br />
        <div>
            Please retain this document identifier for your records:
            <asp:Label ID="LabelDocId" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            <br/>
            <br/>
            
            <input type="button" value="Return to Home Page" onclick="location.href='/CTC/Default.aspx';" />
           
        </div>
    </div>
    <uc1:sidebar ID="sidebar1" runat="server" />
</asp:Content>
