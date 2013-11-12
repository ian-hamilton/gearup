<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="addbusinessrulelanguage.aspx.cs" Inherits="maintenance_addbusinessrulelanguage" Title="Dreams - Add Language" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
<p id="page-header">Add Language...</p><br />
    <table style="width: 242px">
        <tr>
            <td rowspan="3" style="width: 36px">
                </td>
            <td rowspan="3">
                &nbsp;</td>
            <td rowspan="3" style="width: 45px">
            </td>
        </tr>
    </table>
    <table style="width: 483px">
        <tr>
            <td valign="bottom">
                <asp:GridView ID="GridSelectedLanguages" runat="server" 
                    AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333"
            Width="362px" OnRowCommand="GridSelectedLanguages_RowCommand" 
                    DataKeyNames="language_id" 
                    OnSelectedIndexChanged="GridSelectedLanguages_SelectedIndexChanged" 
                    GridLines="None">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <Columns>
                        <asp:ButtonField CommandName="RemoveLanguage" Text="Remove" ButtonType="Image" 
                            ImageUrl="~/App_Themes/ThemeCTC/images/delete.gif" />
                        <asp:BoundField DataField="DisplayLanguageName" HeaderText="Language Name" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="display_home_language" HeaderText="Home Language" >
                            <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:ButtonField CommandName="MarkHome" Text="Home" ButtonType="Image" 
                            ImageUrl="~/App_Themes/ThemeCTC/images/home.gif" />
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
        <tr>
            <td valign="bottom">
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
        <tr>
            <td style="width: 102px; height: 16px">
            </td>
        </tr>
    </table>
    <p>
        <asp:GridView ID="GridViewLanguage" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" OnSelectedIndexChanged="GridViewLanguage_SelectedIndexChanged"
            Width="361px" DataKeyNames="language_id" GridLines="None">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:CommandField SelectText="Add" ShowSelectButton="True" ButtonType="Image" 
                    SelectImageUrl="~/App_Themes/ThemeCTC/images/add.gif" />
                <asp:BoundField DataField="language_name" HeaderText="Language Name" >
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

