<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="addbusinessruleprogram.aspx.cs" Inherits="maintenance_addbusinessruleprogram" Title="Dreams - Add Program" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<p id="page-header">Add Facility Progams...</p>
    <br />
    <asp:GridView ID="GridViewSelectedPrograms" runat="server" AutoGenerateColumns="False"
        CellPadding="4" DataKeyNames="program_id" ForeColor="#333333" GridLines="None"
        OnSelectedIndexChanged="GridViewSelectedPrograms_SelectedIndexChanged" Width="309px">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <Columns>
            <asp:CommandField NewText="Remove" SelectText="Remove" ShowSelectButton="True"
                ButtonType="Image" SelectImageUrl="~/App_Themes/ThemeCTC/images/delete.gif" />
            <asp:BoundField DataField="display_program_name" HeaderText="Program Name" HeaderStyle-HorizontalAlign="Left" />
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />

    
        <table style="width: 483px">
            <tr>
                <td style="width: 76px; height: 16px">
                    <asp:Label ID="Label1" runat="server" Text="Program Search" Width="101px"></asp:Label><br />
                    <asp:TextBox ID="TextBoxProgramName" runat="server"></asp:TextBox></td>
                <td style="width: 89px; height: 16px" valign="bottom">
                    <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search" /></td>
                <td style="width: 102px; height: 16px">
                </td>
            </tr>
            <tr>
                <td style="width: 76px; height: 16px">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </td>
                <td style="width: 89px; height: 16px" valign="bottom">
                </td>
                <td style="width: 102px; height: 16px">
                </td>
            </tr>
        </table>
 
    <p>
        <asp:GridView ID="GridViewProgram" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewProgram_SelectedIndexChanged"
            Width="308px" DataKeyNames="program_id">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField SelectText="Add" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/App_Themes/ThemeCTC/images/add.gif" />
                <asp:BoundField DataField="program_name" HeaderText="Program Name" HeaderStyle-HorizontalAlign="Left" />
            </Columns>
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <br />
        <asp:Button ID="ButtonDone" runat="server" OnClick="ButtonDone_Click" Text="Done"
            Width="77px" /></p>

</div>
</asp:Content>

