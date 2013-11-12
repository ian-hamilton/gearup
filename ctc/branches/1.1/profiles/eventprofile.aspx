<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true" CodeFile="eventprofile.aspx.cs" Inherits="profiles_eventprofile" Title="Event Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<p id="page-header">Event Profile...</p><br />

    <asp:Label ID="LabelError" runat="server" Text="All profile questions must be answered." Visible="False" ForeColor="Red" Font-Bold="True"></asp:Label>
    <asp:Literal ID="LiteralForm" runat="server"></asp:Literal>
     <asp:PlaceHolder ID="PlaceHolderForm" runat="server"></asp:PlaceHolder><br /><br />
   <table cellspacing="15"><tr><td> <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" 
        onclick="ButtonSubmit_Click" /></td>
        <td><asp:Button ID="ButtonDone" runat="server" Text="Done" 
                onclick="ButtonDone_Click" /></td>
        </tr></table>
</div>
   
</asp:Content>

