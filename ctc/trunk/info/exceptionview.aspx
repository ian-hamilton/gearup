<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="exceptionview.aspx.cs" Inherits="info_entityview" Title="Exception View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Exception View...</p>
        <div style="float:right; width: 500px; padding: 0px 25px 0px 10px; height: 100%">
                    <table class="seperator">
                    <tr>
                    <td>
                        <asp:Label ID="LabelDatabaseError" runat="server" Visible="false" Text="Database does not contain the info for the provided id/name." ForeColor="Red" Font-Bold="true"></asp:Label> </td>
                    </tr>
                <tr>
                    <td>
                        <table class="info" width="350">
                            <tr>
                                <th colspan="2">
                                    Attendance Exception
                                </th>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Exception Id:
                                </td>
                                <td>
                                    <asp:Label ID="LabelExceptionid" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Event Id:
                                </td>
                                <td>
                                    <asp:Label ID="LabeEventID" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    CPS Id:
                                </td>
                                <td>
                                    <asp:Label ID="LabelCPSID" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    CTC Id:
                                </td>
                                <td>
                                    <asp:Label ID="LabelCTCID" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Name:
                                </td>
                                <td>
                                    <asp:Label ID="LabelName" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Comment:
                                </td>
                                <td>
                                    <asp:Label ID="LabelComment" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Retrieved:
                                </td>
                                <td>
                                    <asp:Label ID="LabelRetrieved" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Retrieved By:
                                </td>
                                <td>
                                    <asp:Label ID="LabelRetrievedBy" runat="server" Text=""></asp:Label>
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
                                    <asp:Label ID="LabelCreatedBy" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
