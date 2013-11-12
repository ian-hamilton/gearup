<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="attendanceexception.aspx.cs" Inherits="events_attendanceexception" Title="Attendance Exception" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div><p id="page-header">Attendance Exception...</p><br /><br />
    <table width="700">
        <tr>
            <td  style="width:350; height: 23px;" align="right">
             <asp:Label ID="Label3" runat="server" Text="CPS Id"></asp:Label></td>
            <td style="height: 23px">        
             <asp:TextBox ID="TextBoxCps" runat="server"></asp:TextBox>
                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBoxCps" FilterType="Numbers" />
           </td>         
        </tr>
        <tr>
            <td  style="width:350" align="right">
             <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label></td>
            <td>        
             <asp:TextBox ID="TextBoxFirstName" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ControlToValidate="TextBoxFirstName"
                    ErrorMessage="Missing required information" Display="None" ValidationGroup="addgroup"></asp:RequiredFieldValidator>
            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorFirstName">
            </cc1:ValidatorCalloutExtender>
            </td>
        </tr>
        <tr>
            <td style="width:350" align="right">
                <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label></td>
            <td>
                <asp:TextBox ID="TextBoxLastName" runat="server" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ControlToValidate="TextBoxLastName"
                    ErrorMessage="Missing required information!" Display="None" ValidationGroup="addgroup"></asp:RequiredFieldValidator>
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidatorLastName" />
                    </td>
        </tr>
        <tr>
            <td style="width:350" align="right">
                <asp:Label ID="Label4" runat="server" Text="Comments"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBoxComment" TextMode="MultiLine" Width="300" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width:350" align="right">
            <asp:Label ID="Label5" runat="server" Text="Is a Student"></asp:Label>
            </td>
                
                <td>
                    &nbsp;<asp:CheckBox ID="CheckBoxIsStudent" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <table>
                    <tr><td>
                    <asp:Button ID="ButtonAddException" runat="server" Text="Add" ValidationGroup="addgroup" OnClick="ButtonAddException_Click" />
                    </td>
                    <td style="width:30"></td>
                    <td>
                        <asp:Button ID="ButtonDone" runat="server" OnClick="ButtonDone_Click" Text="Done" /></td>
                </table>    
            </td>
        </tr>
        

    </table>
    
    <table width="700">
        <tr>
            <td style="width:350">
            </td>
            <td>
            </td>
        </tr>
         <tr>
            <td style="width:350">
            </td>
            <td>
                <asp:GridView ID="GridViewExceptions" runat="server" CellPadding="4" 
                    ForeColor="#333333" AutoGenerateColumns="False" GridLines="None" DataKeyNames="attendance_excpetion_id">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" />
                    <EditRowStyle BackColor="#2461BF" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:HyperLinkField HeaderText="Last Name"
                         DataTextField="last_name"
                         DataNavigateUrlFields="attendance_excpetion_id"
                         DataNavigateUrlFormatString="/CTC/info/exceptionview.aspx?ID={0}" Target="_blank" 
                         HeaderStyle-HorizontalAlign="Left"
                           ItemStyle-Width="150px"/>
                        <asp:BoundField DataField="first_name" HeaderText="First Name" >
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    
</div>
</asp:Content>

