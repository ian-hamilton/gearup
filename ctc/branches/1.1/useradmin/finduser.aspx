<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="finduser.aspx.cs" Inherits="useradmin_finduser" Title="Untitled Page" %>

<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="child-content">
<p id="page-header">Find User...</p>
    <p>
        <table style="width: 469px">
            <tr>
                <td align="right" style="width: 145px">
                    <asp:Label ID="Label1" runat="server" Text="Search User:"></asp:Label></td>
                <td style="width: 60px">
                    <asp:TextBox ID="TextBoxSearch" runat="server"></asp:TextBox></td>
                    <td style="width: 200px">
                        <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search" /></td>
            </tr>
            <tr>
                <td >
                </td>
                <td style="width: 60px">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </td>
                <td style="width: 68px">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="GridViewusers" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True"
                        CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewusers_SelectedIndexChanged"
                        Width="464px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="UserName" />
                            <asp:BoundField DataField="Email" />
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </p>
</div>
    <uc1:sidebar ID="Sidebar1" runat="server" />
</asp:Content>

