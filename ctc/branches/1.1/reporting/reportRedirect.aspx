<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="reportRedirect.aspx.cs"
    Inherits="reporting_reportRedirect" Title="Report Execution" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div >
    <p id="page-header">
                    Report Execution: 
        <asp:Label ID="LabelReportDesc" runat="server" Text=""></asp:Label></p>
    
            
                <asp:PlaceHolder ID="PlaceHolderReportDetails" runat="server"></asp:PlaceHolder><br /><br />
                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" 
                    onclick="ButtonSubmit_Click" /><br /><br />
        <asp:Button ID="ButtonExcel" runat="server" Text="Download" 
            onclick="ButtonExcel_Click" /><br /><br />
                    
        <asp:GridView ID="GridViewResult" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None" BorderStyle="Inset" 
            BorderWidth="1px" CellSpacing="2" Width="758px" AllowSorting="True" 
            onsorting="GridViewResult_Sorting">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>      
       
    </div>
</asp:Content>
