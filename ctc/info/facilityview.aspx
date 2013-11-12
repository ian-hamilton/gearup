<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="facilityview.aspx.cs" Inherits="info_facilityview" Title="Facility View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Facility View...</p>
        <div style="float: left; width: 345px; padding: 0px 25px 0px 10px;
            height: 100%">
            <table class="seperator">
                <tr>
                    <td>
                        <table class="info" width="350" align="center">
                            <tr>
                                <th colspan="2">
                                    Facility
                                </th>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Facility Id:
                                </td>
                                <td>
                                    <asp:Label ID="LabelFacilityId" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Unit:
                                </td>
                                <td>
                                    <asp:Label ID="LabelUnit" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Facility Name:
                                </td>
                                <td>
                                    <asp:Label ID="LabelFacilityName" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Facility Desc:
                                </td>
                                <td>
                                    <asp:Label ID="LabelFacilityDesc" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Address:
                                </td>
                                <td>
                                    <asp:Label ID="LabelAddress1" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Adrress 2:
                                </td>
                                <td>
                                    <asp:Label ID="LabelAddress2" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    City:
                                </td>
                                <td>
                                    <asp:Label ID="LabelCity" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelPhone" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Alternate Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelPhoneAlt" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Fax:
                                </td>
                                <td>
                                    <asp:Label ID="LabelFax" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Lunchroom Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelLunchroom" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Engineering Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelEngineering" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Website URL:
                                </td>
                                <td>
                                    <asp:Hyperlink ID="URL" runat="server" Text= "URL" NavigateUrl="" Target="_new1"></asp:Hyperlink>
                                </td>
                            </tr>
                               <tr>
                                <td align="right" style="width: 100px">
                                    Bell Schedule URL:
                                </td>
                                <td>
                               <asp:Hyperlink ID="BellURL" runat="server" Text= "BellURL" NavigateUrl="" Target="_new"></asp:Hyperlink>
                                </td>
                             </tr>
                             <tr>
                                <td align="right" style="width: 100px">
                                    Grades Served:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGrades" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Comment:
                                </td>
                                <td>
                                    <asp:Label ID="LabelFacCommnent" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: right; width: 345px; padding: 0px 25px 0px 10px; height: 100%">
            <table class="seperator">
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderPrograms" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderFacilityParticipation" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
