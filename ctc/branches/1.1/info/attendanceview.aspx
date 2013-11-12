<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="attendanceview.aspx.cs" Inherits="info_attendanceview" Title="Attendance View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Event Attendance View...</p>
        <br />
        <div style="float: left; width: 345px; padding: 0px 25px 0px 10px; height: 100%">
            <table class="seperator">
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderStudent" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: right; width: 345px; padding: 0px 25px 0px 10px; height: 100%">
            <table class="seperator">
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderFamily" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderStaff" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderFacilitator" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderVolunteer" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
