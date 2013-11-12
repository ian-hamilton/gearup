<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="edituser.aspx.cs" Inherits="useradmin_edituser" Title="Dreams - Edit User" %>

<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="child-content">
<p id="page-header">Edit User...</p>
     <asp:Label   ID="LabelSaveStatus" runat="server" Font-Bold="True" ForeColor="Red" Width="306px"></asp:Label>
    
        <table id="form-table" cellspacing="10" style="width: 485px">
            <tr>
                <td align="right" >
                    <asp:Label ID="Label1" runat="server" Text="User Id:"></asp:Label></td>
                <td style="width: 135px">
                    <asp:Label ID="LabelUserId" runat="server" Font-Bold="True" Text="Label" Width="188px"></asp:Label></td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label9" runat="server" Text="Entity Id"></asp:Label></td>
                <td style="width: 135px">
                    <asp:TextBox ID="TextBoxEntity" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxEntity"
                        ErrorMessage="Numeric Only" ValidationExpression="^[0-9]{1,20}$"></asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td align="right" >
                    <asp:Label ID="Label2" runat="server" Text="E-Mail:"></asp:Label></td>
                <td style="width: 135px">
                    <asp:Label ID="LabelEmail" runat="server" Font-Bold="True" Text="Label" Width="193px"></asp:Label></td>
            </tr>
            <tr>
                <td align="right" >
                    <asp:Label ID="Label3" runat="server" Text="Created:"></asp:Label></td>
                <td style="width: 135px">
                    <asp:Label ID="LabelCreated" runat="server" Font-Bold="True" Text="Label" Width="195px"></asp:Label></td>
            </tr>
            <tr>
                <td align="right" >
                    <asp:Label ID="Label4" runat="server" Text="Last Login:"></asp:Label></td>
                <td style="width: 135px">
                    <asp:Label ID="LabelLastLogin" runat="server" Font-Bold="True" Text="Label" Width="195px"></asp:Label></td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Label ID="Label10" runat="server" Text="Approved:"></asp:Label></td>
                <td style="width: 135px">
                    <asp:CheckBox ID="CheckBoxApproved" runat="server" /></td>
            </tr>
            <tr>
                <td align="right" >
                    <asp:Label ID="Label5" runat="server" Text="Online Now:"></asp:Label></td>
                <td style="width: 135px">
                    <asp:CheckBox ID="CheckBoxonline" runat="server" /></td>
            </tr>
            <tr>
                <td align="right" >
                    <asp:Label ID="Label6" runat="server" Text="Locked Out:"></asp:Label></td>
                <td style="width: 135px">
                    <asp:CheckBox ID="CheckBoxLockedOut" runat="server" Width="154px" /></td>
            </tr>
            <tr>
                <td align="right">
                </td>
                <td style="width: 135px">
                    <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top" >
                    <asp:Label ID="Label7" runat="server" Width="51px">Roles:</asp:Label></td>
                <td style="width: 135px">
                    <asp:CheckBoxList ID="CheckBoxListRoles" runat="server" BackColor="WhiteSmoke" BorderColor="Black"
                        BorderStyle="Solid" BorderWidth="1px" CellPadding="5" CellSpacing="5" Width="141px">
                    </asp:CheckBoxList></td>
            </tr>
            <tr>
                <td align="right" valign="top">
                </td>
                <td style="width: 135px">
                    <asp:Button ID="ButtonResetPassword" runat="server" OnClick="ButtonResetPassword_Click"
                        Text="Reset Password" /></td>
            </tr>
            <tr>
                <td style="width: 149px">
                </td>
                <td style="width: 135px">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr>
                <td align="right" valign="top">
                    <asp:Label ID="Label8" runat="server" Width="51px">Units:</asp:Label></td>
                <td style="width: 135px">
                    <table style="width: 192px">
                        <tr>
                            <td valign="top" style="width: 60px">
                                <asp:GridView ID="GridViewUnits" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" Width="115px">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Unit" />
                                    </Columns>
                                    <RowStyle BackColor="#EFF3FB" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <AlternatingRowStyle BackColor="White" />
                                </asp:GridView>
                            </td>
                            <td valign="top" style="width: 28px">
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Width="62px">Add Unit</asp:LinkButton></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 149px">
                </td>
                <td style="width: 135px">
                    <asp:PlaceHolder ID="PlaceHolder3" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr>
                <td style="width: 149px">
                </td>
                <td align="center">
                    <asp:Button ID="ButtonSubmitUser" runat="server" OnClick="ButtonSubmitUser_Click"
                        Text="Submit" /></td>
            </tr>
            <tr>
                <td style="width: 149px">
                </td>
                <td style="width: 135px">
                </td>
            </tr>
        </table>
    
</div>
    <uc1:sidebar ID="Sidebar1" runat="server" />
</asp:Content>

