<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="studentview.aspx.cs" Inherits="info_studentview" Title="Student View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Student View...</p>
        <div style="float: left; width: 345px; padding: 0px 25px 0px 10px; background-color: #EAEAEA;
            height: 100%">
            <table class="seperator">
                <tr>
                    <td>
                        <table class="info" width="325">
                            <tr>
                                <th colspan="2" align="center">
                                    Student Info
                                    <asp:Literal ID="LiteralSemester" runat="server"></asp:Literal>*
                                </th>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    CTC ID:
                                </td>
                                <td>
                                    <asp:Label ID="LabelCTCID" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    Name:
                                </td>
                                <td>
                                    <asp:Label ID="Labelname" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    Gender:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGender" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    *Grade:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGrade" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    *School:
                                </td>
                                <td>
                                    <asp:Label ID="LabelSchool" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    *Division:
                                </td>
                                <td>
                                    <asp:Label ID="LabelDivision" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                             <table class="info" width="325">
                            <tr>
                                <th colspan="2" align="center">
                                    Student Forms
                                </th>
                            </tr>
                            <tr>
                                <td align="right" style="width: 150px">
                                    Parent Permission:
                                </td>
                                <td>
                                    <asp:Label ID="LabelParentPermission" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 150px">
                                    Media Release:
                                </td>
                                <td>
                                    <asp:Label ID="LabelMediaRelease" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 150px">
                                    FASFA Submitted:
                                </td>
                                <td>
                                    <asp:Label ID="LabelFASFA" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 150px">
                                    21st Century Certificate:
                                </td>
                                <td>
                                    <asp:Label ID="Label21St" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 150px">
                                    Student Survey:
                                </td>
                                <td>
                                    <asp:Label ID="LabelStudentSurvey" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 150px">
                                    Parent Survey:
                                </td>
                                <td>
                                    <asp:Label ID="LabelParentSurvey" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderTestPerformance" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td valign="top">
                        <asp:PlaceHolder ID="PlaceHolderLastThreeGearup" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderLastTopFacilitators" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderStudentParticipation" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
            </table>
        </div>
        <div style="float: right; width: 345px; padding: 0px 25px 0px 10px; height: 100%">
            <table class="seperator">
                <tr>
                    <td>
                        <table class="info" width="325">
                            <tr>
                                <th colspan="2" align="center">
                                    Residing Entity
                                </th>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    Name:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGuardianName" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGuardianPhone" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    Address:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGuardianAddress" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    City:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGuardianCity" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    Mobile Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGuardianPhoneMobile" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    Work Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGuardianPhoneWork" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td align="right" style="width: 80px">
                                    Fax:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGuardianFax" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td align="right" style="width: 80px">
                                    Other Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGuardianOtherPhone" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 80px">
                                    Email
                                </td>
                                <td>
                                    <asp:Label ID="LabelGuardianEmail" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderResideLanguages" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderParentParticipation" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
