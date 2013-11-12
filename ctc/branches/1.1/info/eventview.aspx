<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="eventview.aspx.cs" Inherits="info_event" Title="Event View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Event View...</p>
        <br />
        <div style="float: left; width: 345px; padding: 0px 25px 0px 10px; height: 100%">
            <table class="seperator">
                <tr>
                    <td>
                        <table class="info" width="350">
                            <tr>
                                <th colspan="2">
                                    Event
                                </th>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Event Id:
                                </td>
                                <td>
                                    <asp:Label ID="LabelEventId" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Event Title:
                                </td>
                                <td>
                                    <asp:Label ID="LabelEventTitle" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    APR:
                                </td>
                                <td>
                                    <asp:Label ID="LabelAPR" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Date of Service:
                                </td>
                                <td>
                                    <asp:Label ID="LabeDateOfService" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Start Time:
                                </td>
                                <td>
                                    <asp:Label ID="LabelStartTime" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    End Time:
                                </td>
                                <td>
                                    <asp:Label ID="LabelEndTime" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Host Facility:
                                </td>
                                <td>
                                    <asp:Label ID="LabelHostFacility" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Event Comment:
                                </td>
                                <td>
                                    <asp:Label ID="LabelComment" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Created Date:
                                </td>
                                <td>
                                    <asp:Label ID="LabelRowCreated" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Created By:
                                </td>
                                <td>
                                    <asp:Label ID="LabelRowCreatedBy" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Responsible Entity:
                                </td>
                                <td>
                                    <asp:Label ID="LabelResponsibleEntity" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                </td>
                                <td>
                                    <asp:HyperLink ID="HyperLinkAttendance" runat="server" Target="_blank">View Event Attendance</asp:HyperLink>
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
                        <asp:PlaceHolder ID="PlaceHolderTarget" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
