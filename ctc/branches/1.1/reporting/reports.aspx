<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="reports.aspx.cs"
    Inherits="reporting_reports" Title="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="child-content">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <p id="page-header">
                    Reports</p>
                <table width="700">
                    <tr>
                        <td style="width: 20px">
                        </td>
                        <td style="width: 400px">
                            <asp:DropDownList ID="DropDownListReports" runat="server" Width="200"
                                OnSelectedIndexChanged="DropDownListReports_SelectedIndexChanged" 
                                AppendDataBoundItems="True" AutoPostBack="True">
                                <asp:ListItem Value="-1">Please Select a Report</asp:ListItem>
                            </asp:DropDownList><br /><br />
                        </td>
                    </tr>
                    <tr>
                    <td style="width: 20px">
                        </td>
                        <td style="width: 400px">
                            <asp:Label ID="LabelDesc" runat="server"></asp:Label><br />
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <table width="700">
                    <tr>
                        <td style="width: 20px">
                        </td>
                        <td style="width: 400px">
                            <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
