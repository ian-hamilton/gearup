<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="addusers.aspx.cs" Inherits="login_addusers" Title="Dream - Add User" %>

<%@ Register Src="../controls/sidebar.ascx" TagName="sidebar" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="child-content">
<p id="page-header">Add User...</p>
    <table id="form-table" style="width: 427px">
        <tr>
            <td colspan="2">
                <asp:MultiView ID="MultiViewUser" runat="server">
                    <asp:View ID="ViewError" runat="server">
                        <asp:Label ID="LabelError" runat="server" ForeColor="Red" Width="320px"></asp:Label></asp:View>
                </asp:MultiView></td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td style="width: 185px">
                <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label1" runat="server">User Name:</asp:Label></td>
            <td style="width: 185px; height: 23px;">
                <asp:TextBox ID="TextBoxUserName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" ControlToValidate="TextBoxUserName"
                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label></td>
            <td style="width: 185px">
                <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="TextBoxPassword"
                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label3" runat="server" Width="112px">Confirm Password:</asp:Label></td>
            <td style="width: 185px">
                <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirm" runat="server" ControlToValidate="TextBoxConfirmPassword"
                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="LabelUserName" runat="server" Width="112px">Email:</asp:Label></td>
            <td style="width: 185px; height: 23px">
                <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxEmail"
                    ErrorMessage="*"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label4" runat="server" Width="112px">Entity Id:</asp:Label></td>
            <td style="width: 185px; height: 23px">
                <asp:TextBox ID="TextBoxEntityId" runat="server"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat=server
            ControlToValidate="TextBoxEntityId"
            ErrorMessage="Numeric Only"
            ValidationExpression="^[0-9]{1,20}$" />
        </tr>
        <tr>
            <td align="right" valign="top">
                <asp:Label ID="Label5" runat="server" Width="51px">Roles:</asp:Label></td>
            <td style="width: 185px">
                <asp:CheckBoxList ID="CheckBoxListRoles" runat="server" BackColor="WhiteSmoke" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" CellSpacing="5" Width="141px">
                </asp:CheckBoxList></td>
        </tr>
        <tr>
            <td align="right">
            </td>
            <td style="width: 185px">
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </td>
        </tr>
        <tr>
            <td style="width: 103px">
            </td>
            <td style="width: 185px" align="right">
                &nbsp;<asp:MultiView ID="MultiViewButton" runat="server" ActiveViewIndex="0">
                    <asp:View ID="ViewSubmit" runat="server">
                <asp:Button ID="ButtonSubmitUser" runat="server" Text="Submit" OnClick="ButtonSubmitUser_Click" /></asp:View>
                    <asp:View ID="ViewContinue" runat="server">
                        <asp:Button ID="ButtonContinue" runat="server" Text="Continue" OnClick="ButtonContinue_Click" /></asp:View>
                </asp:MultiView></td>
        </tr>
    </table>
    </div>
    <uc1:sidebar ID="Sidebar1" runat="server" />
</asp:Content>

