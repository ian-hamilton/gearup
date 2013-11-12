<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="FormType" Title="Dreams - Main" %>

<%@ Register Src="controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="child-content">
    <p id="page-header">Welcome to Dreams</p>
    
    <table width="400">
    <tr><th align="center"><h1>Announcements</h1></th></tr>
    <tr><td><table border="0" width="500">
        <tr><td style="height: 180px" valign="top"><asp:PlaceHolder ID="PlaceHolderAnnouncement" runat="server"></asp:PlaceHolder></td></tr>
        </table>
    </td></tr>
    
    </table>

</div>
    <uc1:sidebar ID="Sidebar1" runat="server" />
   
    
</asp:Content>

