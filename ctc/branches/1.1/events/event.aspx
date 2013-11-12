<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="event.aspx.cs"
    Inherits="events_event" Title="Events" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Events...</p>
        <p>
            &nbsp;</p>
        <table style="width: 700px">
            <tr>
                <td>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td style="height: 170px">
                    <table style="width: 300px">
                        <tr>
                            <td style="width: 104px; height: 16px">
                                <asp:Label ID="Label1" runat="server" AssociatedControlID="TextBoxEventId" Text="Event Id:"
                                    Width="130px"></asp:Label><br />
                                <asp:TextBox ID="TextBoxEventId" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 89px; height: 16px" valign="bottom">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 104px; height: 16px" align="center">
                                <h5>
                                    Or</h5>
                            </td>
                            <td style="width: 89px; height: 16px" valign="bottom">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 104px; height: 16px">
                                <asp:Label ID="Label2" runat="server" AssociatedControlID="TextBoxEventDesc" Text="Event Desc:"
                                    Width="130px"></asp:Label><asp:TextBox ID="TextBoxEventDesc" runat="server"></asp:TextBox>
                            </td>
                            <td style="width: 89px; height: 16px" valign="bottom">
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 104px; height: 16px" align="center">
                                <h5>
                                    Or</h5>
                            </td>
                            <td style="width: 89px; height: 16px" valign="bottom">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 76px; height: 16px" colspan="2">
                                <asp:Label ID="Label3" runat="server" Text="Date of Service:" Width="100"></asp:Label><br />
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text="From:"></asp:Label><br />
                                            <asp:TextBox ID="TextBoxStartDate" runat="server" Width="70"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBoxStartDate" />
                                        </td>
                                        <td style="width: 10">
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text="To:"></asp:Label><br />
                                            <asp:TextBox ID="TextBoxEndDate" runat="server" Width="70"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="TextBoxEndDate" />
                                        </td>
                                        <td valign="bottom"><asp:Label ID="Label25" runat="server" Text="00/00/0000" Width="84px"></asp:Label></td>
                                    </tr>
                                </table>
                                
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 104px; height: 16px" valign="bottom">
                                <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search" />
                            </td>
                            <td style="width: 102px; height: 16px" valign="bottom">
                                <asp:Button ID="ButtonNew" runat="server" OnClick="ButtonNew_Click" Text="Create New" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:GridView ID="GridViewEvent" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" Width="668px" OnRowCommand="GridViewEvent_RowCommand" GridLines="None"
                        BorderStyle="None" DataKeyNames="event_id">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:ButtonField CommandName="edit" Text="Edit" ButtonType="Image" ImageUrl="~/App_Themes/ThemeCTC/images/edit.gif"
                                HeaderText="Edit">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="50px" />
                            </asp:ButtonField>
                            <asp:ButtonField CommandName="duplicate" Text="Duplicate" ButtonType="Image" ImageUrl="~/App_Themes/ThemeCTC/images/duplicate.gif"
                                HeaderText="Duplicate">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="75px" />
                            </asp:ButtonField>
                            <asp:HyperLinkField HeaderText="Event id" DataTextField="event_id" DataNavigateUrlFields="event_id"
                                DataNavigateUrlFormatString="/CTC/info/eventview.aspx?ID={0}" Target="_blank"
                                HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="display_apr_desc" HeaderText="Event APR">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle Width="100px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="event_title" HeaderText="Event Desc">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
                <td style="height: 170px">
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
</asp:Content>
