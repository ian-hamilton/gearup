<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="addfacilityunit.aspx.cs" Inherits="maintenance_addbusinessrulefacility" Title="Add Facility Unit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<p id="page-header">Add Facility Unit...</p>
    <table style="width: 483px">
        <tr>
            <td style="width: 76px; height: 16px">
                <asp:Label ID="Label1" runat="server" Text="Facility Name Search:" Width="139px"></asp:Label><br />
                <asp:TextBox ID="TextBoxFacilityName" runat="server"></asp:TextBox></td>
            <td style="width: 89px; height: 16px" valign="bottom">
                <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search" /></td>
            <td style="width: 102px; height: 16px" valign="bottom">
        <asp:Button ID="ButtonDone" runat="server" OnClick="ButtonDone_Click" Text="Cancel"
            Width="77px" />
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
        <asp:GridView ID="GridViewFacility" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewFacility_SelectedIndexChanged"
            Width="446px" DataKeyNames="facility_id">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField SelectText="Add" ShowSelectButton="True" ButtonType="Image" 
                    SelectImageUrl="~/App_Themes/ThemeCTC/images/add.gif" />
                 <asp:HyperLinkField HeaderText="Facility Id"
                 DataTextField="facility_id"
                 DataNavigateUrlFields="facility_id"
                 DataNavigateUrlFormatString="/CTC/info/facilityview.aspx?ID={0}" Target="_blank" 
                 HeaderStyle-HorizontalAlign="Left"/>
                <asp:BoundField DataField="facility_name" HeaderText="Facility Name" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="address_1" HeaderText="Address" >
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="unit" HeaderText="Unit" >
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
        &nbsp;</p>
</div>
</asp:Content>

