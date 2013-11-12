<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="maintenance_student" Title="Dreams - Student Maintenance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="child-content">
<p id="page-header">Student Maintenance...</p>

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
                                <asp:Label ID="Label1" runat="server" Text="Student Last Name:" Width="130px"></asp:Label><br />
                                <asp:TextBox ID="TextBoxLastName" runat="server"></asp:TextBox></td>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="TextBoxLastName" Display="None" ErrorMessage="Please enter the Students Last Name only" />
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender22" runat="server" TargetControlID="RegularExpressionValidator8" />
                                </tr>
                                  <tr>
                        <td align="center" style="width: 118px"><h5>Or</h5></td>
                        </tr>
                        <tr>
                            <td style="width: 118px">
                                <asp:Label ID="Label12" runat="server" Text="CTC ID Search:" Width="130px"></asp:Label><br />
                                <asp:TextBox ID="TextBoxCtcId" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="[0-9]+"
                    runat="server" EnableClientScript="true" ControlToValidate="TextBoxCtcId" Display="None" ErrorMessage="Please enter the Students CTC Id only" />
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RegularExpressionValidator1" />
                            </td>
                            </tr>
                              <tr>
                        <td align="center" style="width: 118px"><h5>Or</h5></td>
                        </tr>
                        <tr>
                            <td style="width: 118px">
                                <asp:Label ID="Label3" runat="server" Text="CPS Id Search:" Width="130px"></asp:Label><br />
                                <asp:TextBox ID="TextBoxCpsId" runat="server"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="CPSIDVAL" ValidationExpression="\d{8}" runat="server"
                    EnableClientScript="true" ControlToValidate="TextBoxCpsId" Display="None" ErrorMessage="Please enter only the 8 Digit CPS Id" />
                <cc1:ValidatorCalloutExtender id="ValidatorCalloutExtender1" runat="server" targetcontrolid="CPSIDVAL" />
                            </td>
                            <td style="width: 89px; height: 16px" valign="bottom">
                                <asp:Button ID="ButtonSearch" runat="server" OnClick="ButtonSearch_Click" Text="Search" /></td>
                            <td style="width: 102px; height: 16px" valign="bottom">
                                <asp:Button ID="ButtonNew" runat="server" Text="Create New"
                                    Visible="False" /></td>
                        </tr>
                    </table>
                    <asp:GridView ID="GridViewStudent" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewStudent_SelectedIndexChanged"
                        Width="446px" DataKeyNames="ctc_id">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" ButtonType="Image" 
                                SelectImageUrl="~/App_Themes/ThemeCTC/images/edit.gif"/>
                            <asp:HyperLinkField HeaderText="CTC Id"
                             DataTextField="ctc_id"
                             DataNavigateUrlFields="ctc_id"
                             DataNavigateUrlFormatString="/CTC/info/studentview.aspx?ID={0}" Target="_blank" 
                             HeaderStyle-HorizontalAlign="Left">
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="last_name" HeaderText="Last Name" 
                                HeaderStyle-HorizontalAlign="Left">
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="first_name" HeaderText="First Name" 
                                HeaderStyle-HorizontalAlign="Left">
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="dob" HeaderText="DOB" DataFormatString="{0:d}" 
                                HtmlEncode="false" HeaderStyle-HorizontalAlign="Left">
<HeaderStyle HorizontalAlign="Left"></HeaderStyle>
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

