<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="reportRedirect1.aspx.cs"
    Inherits="reporting_reportRedirect" Title="Report Execution" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
    function showAjax() {
        element = document.getElementById("ajaxGif");
        element.style.visibility = "visible";
    }
</script>
    <div >
       <p id="page-header">
                    Report Execution: 
        <asp:Label ID="LabelReportDesc" runat="server" Text=""></asp:Label></p>
    
            
                <asp:PlaceHolder ID="PlaceHolderReportDetails" runat="server"></asp:PlaceHolder><br /><br />
                <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" 
                    onclick="ButtonSubmit_Click" OnClientClick="return showAjax();" />
                    <img id="ajaxGif" alt="" src="../App_Themes/ThemeCTC/images/ajax.gif" 
                        style="visibility:hidden; width: 29px; height: 25px;" "width: 28px; height: 28px;" /><br /><br />
        <asp:Button ID="ButtonExcel" runat="server" Text="Download*" 
            onclick="ButtonExcel_Click" />
        <br />
        <%--<p.secure>--%>
        *&quot;...student level data must be stored securely so that only authorized users 
        within the organization have access to it. This means that computer data bases 
        should be password protected; that precautions are taken to ensure that access 
        through modems, networks, and the Internet is carefully monitored and limited to 
        authorized users;&quot;** &quot;and that data tapes, disks, paper files and other storage 
        media are kept in secure locations.&quot;<sub>1</sub>
        <br /><sub>1</sub>Chicago Public Schools Office of Performance Guidelines for Considering Requests to Obtain Data in the Chicago Public 
        Schools<br />
        **current NCES standards for electronic transmission of individually identifiable student level data excludes the use of email and other forms of electronic transmission except where 256 bit 
        AES encryption is utilized.
        <%--</p.secure>--%>
        <br /><br />
            
            <asp:GridView ID="GridViewResult" runat="server" CellPadding="4" 
            ForeColor="#333333" GridLines="None" BorderStyle="Inset" 
            BorderWidth="1px" CellSpacing="2" Width="758px" AllowSorting="True" 
            onsorting="GridViewResult_Sorting" CssClass="gview">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
                
    </div>
</asp:Content>
