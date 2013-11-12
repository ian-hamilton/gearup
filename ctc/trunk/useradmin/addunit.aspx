<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="addunit.aspx.cs"
    Inherits="useradmin_addunit" Title="Add Units" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p id="page-header">
        Add Units...</p>
    <table>
        <tr>
            <td rowspan="3" style="width: 36px">
                <asp:ListBox ID="ListBoxUnits" runat="server" Height="97px" Width="89px"></asp:ListBox>
            </td>
            <td rowspan="3">
                &nbsp;<asp:LinkButton ID="LinkButtonRemove" runat="server" OnClick="LinkButtonRemove_Click">Remove Unit</asp:LinkButton>
            </td>
        </tr>
    </table>
    <table style="width: 300px">
        <tr>
            <td style="width: 76px; height: 16px">
                <asp:Label ID="Label2" runat="server" Text="Program"></asp:Label>
                <asp:DropDownList ID="DropDownListProgram" runat="server" Width="130">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 76px; height: 16px">
                <asp:Label ID="Label1" runat="server" Text="Facility Name" Width="101px"></asp:Label><br />
                <asp:TextBox ID="TextBoxFacilityName" runat="server"></asp:TextBox>
            </td>
            <td valign="bottom">
                <asp:Button ID="ButtonSearch" runat="server" Text="Search" OnClick="ButtonSearch_Click" />
            </td>
        </tr>
        <tr>
            <td style="width: 76px; height: 16px">
                <asp:Button ID="ButtonAddAllUnits" runat="server" Text="Add All" OnClick="ButtonAddAllUnits_Click" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridViewFacility" runat="server" AutoGenerateColumns="False" Width="446px"
        CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewFacility_SelectedIndexChanged">
        <Columns>
            <asp:CommandField SelectText="Add" ShowSelectButton="True" />
            <asp:BoundField DataField="facility_name" HeaderText="Facility Name" />
            <asp:BoundField DataField="address_1" HeaderText="Address" />
            <asp:BoundField DataField="unit" HeaderText="Unit" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <EditRowStyle BackColor="#2461BF" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    <asp:Button ID="ButtonDone" runat="server" Text="Done" OnClick="ButtonDone_Click" />
</asp:Content>
