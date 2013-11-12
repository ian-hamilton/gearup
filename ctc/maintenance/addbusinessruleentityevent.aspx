<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="addbusinessruleentityevent.aspx.cs" Inherits="maintenance_addbusinessruleentity" Title="Dreams - Add Entities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<p id="page-header">Add Entity...</p><br />

        <asp:GridView ID="GridViewSelectedEntity" 
        runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" OnSelectedIndexChanged="GridViewSelectedEntity_SelectedIndexChanged"
            Width="478px" DataKeyNames="entity_id" GridLines="None">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:CommandField SelectText="Remove" ShowSelectButton="True" 
            ButtonType="Image" 
            SelectImageUrl="~/App_Themes/ThemeCTC/images/delete.gif" />
        <asp:HyperLinkField HeaderText="Entity Name"
                 DataTextField="display_reverse_full_name"
                 DataNavigateUrlFields="entity_id"
                 DataNavigateUrlFormatString="/CTC/info/entityview.aspx?ID={0}" Target="_blank" 
                 HeaderStyle-HorizontalAlign="Left"/>
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
                <asp:Label ID="Label1" runat="server" Text="Entity Search" Width="101px"></asp:Label><br />
                <asp:TextBox ID="TextBoxEntityName" runat="server"></asp:TextBox></td>
            <td style="width: 89px; height: 16px" valign="bottom">
                <br />
                <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search" /></td>
            <td valign="bottom">
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
         <asp:GridView ID="GridViewEntity" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" OnSelectedIndexChanged="GridViewEntity_SelectedIndexChanged"
            Width="481px" DataKeyNames="entity_id" GridLines="None">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField SelectText="Add" ShowSelectButton="True" ButtonType="Image" 
                    SelectImageUrl="~/App_Themes/ThemeCTC/images/add.gif" />
                  <asp:HyperLinkField HeaderText="Entity Name"
                 DataTextField="display_reverse_full_name"
                 DataNavigateUrlFields="entity_id"
                 DataNavigateUrlFormatString="/CTC/info/entityview.aspx?ID={0}" Target="_blank" 
                 HeaderStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="EntityTypeDesc" HeaderText="Entity Type" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
              
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

