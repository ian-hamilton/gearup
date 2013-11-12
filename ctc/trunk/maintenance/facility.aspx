<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="facility.aspx.cs"
    Inherits="maintenance_facility" Title="Dreams - Facility Maintenance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="child-content">
        <p id="page-header">
            Facility Maintenance...</p>
        <table style="width: 440px">
            <tr>
                <td>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 415px">
                        <tr>
                            <td style="width: 118px">
                                <asp:Label ID="Label1" runat="server" Text="Facility Name Search:" Width="130px"></asp:Label><br />
                                <asp:TextBox ID="TextBoxFacilityName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                        <td align="center" style="width: 118px"><h5>Or</h5></td>
                        </tr>
                        <tr>
                            <td style="width: 118px">
                                <asp:Label ID="Label2" runat="server" Text="Unit Search:" Width="130px"></asp:Label><br />
                                <asp:TextBox ID="TextBoxUnit" runat="server"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBoxUnit" FilterType="Numbers"/>
                            </td>
                            <td style="width: 89px; height: 16px" valign="bottom">
                                <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search" />
                            </td>
                            <td style="width: 102px; height: 16px" valign="bottom">
                                <asp:Button ID="ButtonNew" runat="server" Text="Create New" OnClick="ButtonNew_Click" />
                            </td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridViewFacility" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewFacility_SelectedIndexChanged"
                        Width="446px" DataKeyNames="facility_id">
                        <Columns>
                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" ButtonType="Image" SelectImageUrl="~/App_Themes/ThemeCTC/images/edit.gif" />
                            <asp:HyperLinkField HeaderText="Facility Id" DataTextField="facility_id" DataNavigateUrlFields="facility_id"
                                DataNavigateUrlFormatString="/CTC/info/facilityview.aspx?ID={0}" Target="_blank"
                                HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="facility_name" HeaderText="Facility Name">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="address_1" HeaderText="Address">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="unit" HeaderText="Unit">
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <EditRowStyle BackColor="#2461BF" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 17px">
                   <asp:Label ID="LabelNoResult" runat="server" 
                        Text="* No results were returned per search criteria." Font-Bold="True" 
                        Font-Italic="True" ForeColor="#CC3300" Visible="False"></asp:Label>
                </td>
                <td style="height: 17px">
                </td>
            </tr>
        </table>
    </div>
    <uc1:sidebar ID="Sidebar1" runat="server" />
</asp:Content>
