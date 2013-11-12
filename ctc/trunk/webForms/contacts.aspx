<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="contacts.aspx.cs" Inherits="webForms_contacts" Title="Dreams - Contact Us" %>

<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="child-content"><p id="page-header">Contact Us</p>

<table width="400">
        <tr>
        <td style="width:150"></td>
        <td>
            <asp:Literal ID="LiteralContacts" runat="server"></asp:Literal>
        </td>
        </tr>
    </table>
    </div>

    <uc1:sidebar ID="Sidebar1" runat="server" />
    
    
</asp:Content>

