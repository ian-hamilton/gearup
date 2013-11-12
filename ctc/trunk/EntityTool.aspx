<%@ Page Title="" Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true" CodeFile="EntityTool.aspx.cs" Inherits="EntityTool" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    Table Name:<asp:TextBox ID="TextBoxTableName" runat="server"></asp:TextBox>
    <asp:Button ID="ButtonSubmit" runat="server" Text="Button" 
        onclick="ButtonSubmit_Click" />
    <br />
    <br />

    <asp:TextBox ID="TextBoxResult" runat="server" TextMode="MultiLine" Width="750"></asp:TextBox>



</asp:Content>

