<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="entity.aspx.cs" Inherits="maintenance_entity" Title="Entity" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="child-content">
<p id="page-header">Entity Maintenance...</p>
    <p>
        &nbsp;</p>
    
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
                            <td style="width: 76px; height: 16px">
                                <asp:Label ID="Label1" runat="server" Text="Entity Last Name:" Width="130px"></asp:Label><br />
                                <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox></td>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="TextBoxLastName" Display="None" ErrorMessage="Please enter the Entity Last Name ONLY" />
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RegularExpressionValidator2" />
                        </tr>
                               <tr>
                        <td align="center" style="width: 118px"><h5>Or</h5></td>
                        </tr>
                        <tr>
                            <td style="width: 118px">
                                <asp:Label ID="Label2" runat="server" Text="Entity Id Search:" Width="130px"></asp:Label><br />
                                <asp:TextBox ID="TextBoxEntityId" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="[0-9]+"
                    runat="server" EnableClientScript="true" ControlToValidate="TextBoxEntityId" Display="None" ErrorMessage="Please enter the Entity Id ONLY" />
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RegularExpressionValidator1" />
                            </td>
                            <td style="width: 89px; height: 16px" valign="bottom">
                                <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search" /></td>
                            <td style="width: 102px; height: 16px" valign="bottom">
                                <asp:Button ID="ButtonNew" runat="server" OnClick="ButtonNew_Click" Text="Create New" /></td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridViewEntity" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" OnSelectedIndexChanged="GridViewEntity_SelectedIndexChanged"
                        Width="446px" GridLines="None" DataKeyNames="entity_id">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" ButtonType="Image" 
                                SelectImageUrl="~/App_Themes/ThemeCTC/images/edit.gif" />
                            <asp:HyperLinkField HeaderText="Entity Id"
                             DataTextField="entity_id"
                             DataNavigateUrlFields="entity_id"
                             DataNavigateUrlFormatString="/CTC/info/entityview.aspx?ID={0}" Target="_blank" 
                             HeaderStyle-HorizontalAlign="Left">
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="last_name" HeaderText="Last Name" >
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="middle_initial" HeaderText="Middle" >
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="first_name" HeaderText="First Name" >
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
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                   <asp:Label ID="LabelNoResult" runat="server" 
                        Text="* No results were returned per search criteria." Font-Bold="True" 
                        Font-Italic="True" ForeColor="#CC3300" Visible="False"></asp:Label>
                </td>
                <td>
                </td>
            </tr>
        </table>
    

</div>
    <uc1:sidebar ID="Sidebar1" runat="server" />

</asp:Content>

