<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="entityview.aspx.cs" Inherits="info_entityview" Title="Entity View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Entity View...</p>
        <div style="float: left; width: 345px; padding: 0px 25px 0px 10px; height: 100%">
            <table class="seperator">
                <tr>
                    <td>
                        <table class="info" width="350">
                            <tr>
                                <th colspan="2">
                                    Entity
                                </th>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Entity Id:
                                </td>
                                <td>
                                    <asp:Label ID="LabelEntityId" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Entity Type:
                                </td>
                                <td>
                                    <asp:Label ID="LabelEntityType" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Title:
                                </td>
                                <td>
                                    <asp:Label ID="LabelTitle" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Entity Name:
                                </td>
                                <td>
                                    <asp:Label ID="LabelName" runat="server" Text=""></asp:Label>
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
                                    Address 2:
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
                                    <asp:Label ID="LabelCity" runat="server" Text=""></asp:Label>
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
                                    Mobile Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelPhoneMobile" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td align="right" style="width: 100px">
                                    Work Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelWork" runat="server" Text=""></asp:Label>
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
                                    Other Phone:
                                </td>
                                <td>
                                    <asp:Label ID="LabelOtherPhone" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Email:
                                </td>
                                <td>
                                    <asp:Label ID="LabelEmail" runat="server" Text=""></asp:Label>
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
                                    Gender:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGender" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Ethnicity:
                                </td>
                                <td>
                                    <asp:Label ID="LabelEthnicity" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    DOB:
                                </td>
                                <td>
                                    <asp:Label ID="LabelDOB" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Facility:
                                </td>
                                <td>
                                    <asp:Label ID="LabelFacility" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Grade:
                                </td>
                                <td>
                                    <asp:Label ID="LabelGrade" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 100px">
                                    Created:
                                </td>
                                <td>
                                    <asp:Label ID="LabelCreated" runat="server" Text=""></asp:Label>
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
        <div style="float: right; width: 345px; padding: 0px 25px 0px 10px; height: 100%">
            <table class="seperator">
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderPrograms" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderEntityParticipation" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderStudents" runat="server"></asp:PlaceHolder>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
