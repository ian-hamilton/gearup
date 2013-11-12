<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="eventattendance.aspx.cs"
    Inherits="events_eventattendance" Title="Event Attendance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>

        <script type="text/javascript">
            function loadinfo(field) {
                if (field == 'as') {

                    vselected = document.getElementById("ctl00_ContentPlaceHolder1_ListBoxAvailableStudents").value;
                    if (vselected != '') {
                        window.open('/CTC/info/studentview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                        //window.open('/CTC/info/studentview.aspx?ID='+ vselected, null,'height=800,width=1000,status=yes,toolbar=no,menubar=no,location=no'); 
                    }
                }

                if (field == 'ss') {

                    vselected = document.getElementById("ctl00_ContentPlaceHolder1_ListBoxSelectedStudent").value;
                    if (vselected != '') {
                        window.open('/CTC/info/studentview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                    }
                }

                if (field == 'af') {

                    vselected = document.getElementById("ctl00_ContentPlaceHolder1_ListBoxAvailableFamily").value;
                    if (vselected != '') {
                        window.open('/CTC/info/entityview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                    }
                }

                if (field == 'sf') {

                    vselected = document.getElementById("ctl00_ContentPlaceHolder1_ListBoxSelectedFamily").value;
                    if (vselected != '') {
                        window.open('/CTC/info/entityview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                    }
                }

                if (field == 'astaff') {

                    vselected = document.getElementById("ctl00_ContentPlaceHolder1_ListBoxAvailableStaff").value;
                    if (vselected != '') {
                        window.open('/CTC/info/entityview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                    }
                }

                if (field == 'sstaff') {

                    vselected = document.getElementById("ctl00_ContentPlaceHolder1_ListBoxSelectedStaff").value;
                    if (vselected != '') {
                        window.open('/CTC/info/entityview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                    }
                }

                if (field == 'sfacil') {

                    vselected = document.getElementById("ctl00_ContentPlaceHolder1_ListBoxSelectedFacilitator").value;
                    if (vselected != '') {
                        window.open('/CTC/info/entityview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                    }
                }

                if (field == 'av') {

                    vselected = document.getElementById("ctl00_ContentPlaceHolder1_ListBoxAvailableVolunteers").value;
                    if (vselected != '') {
                        window.open('/CTC/info/entityview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                    }
                }

                if (field == 'sv') {

                    vselected = document.getElementById("ctl00_ContentPlaceHolder1_ListBoxSelectedVolunteers").value;
                    if (vselected != '') {
                        window.open('/CTC/info/entityview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                    }
                }

            }
        </script>

        
        
        <p id="page-header">
            Event Attendance...</p>
            <asp:Menu ID="Menu1" Orientation="Horizontal" StaticMenuItemStyle-CssClass="tab"
            StaticSelectedStyle-CssClass="selectedTab" CssClass="tabs" OnMenuItemClick="Menu1_MenuItemClick"
            runat="server">
            <Items>
                <asp:MenuItem Text="Students" Value="0" Selected="true" />
                <asp:MenuItem Text="Family" Value="1" />
                <asp:MenuItem Text="Staff" Value="2" />
                <asp:MenuItem Text="Volunteers" Value="3" />
            </Items>
        </asp:Menu>
        <br />
        <br />
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                        <asp:View ID="View1" runat="server">
                        
                    
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <th align="center" valign="bottom">
                                        Available Students
                                        <input id="Submit" type="image" src="../App_Themes/ThemeCTC/images/info.gif" value="submit"
                                            onclick="return loadinfo('as')" />
                                    </th>
                                    <th>
                                    </th>
                                    <th align="center" valign="bottom">
                                        Selected Students
                                        <input id="Image1" type="image" src="../App_Themes/ThemeCTC/images/info.gif" value="submit"
                                            onclick="return loadinfo('ss')" />
                                        <asp:ImageButton ID="ImageButtonProfile" runat="server" ImageUrl="../App_Themes/ThemeCTC/images/profile.gif"
                                            OnClick="ImageButtonProfile_Click" />
                                    </th>
                                </tr>
                                <tr>
                                    <td style="width: 95px">
                                        <asp:ListBox ID="ListBoxAvailableStudents" runat="server" Width="260px" Height="300px"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonAdd" runat="server" Text=">>" OnClick="ButtonAdd_Click" /><br />
                                        <br />
                                        <asp:Button ID="ButtonRemove" runat="server" Text="<<" OnClick="ButtonRemove_Click" />
                                    </td>
                                    <td>
                                        <asp:ListBox ID="ListBoxSelectedStudent" runat="server" Width="260px" Height="300px"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    </asp:View>
                    
                        <asp:View ID="View2" runat="server">
                        
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <th align="center" valign="bottom">
                                        Available Family
                                        <input id="Image2" type="image" src="../App_Themes/ThemeCTC/images/info.gif" value="submit"
                                            onclick="return loadinfo('af')" />
                                    </th>
                                    <th>
                                    </th>
                                    <th align="center" valign="bottom">
                                        Selected Family
                                        <input id="Image3" type="image" src="../App_Themes/ThemeCTC/images/info.gif" value="submit"
                                            onclick="return loadinfo('sf')" />
                                        <asp:ImageButton ID="ImageButtonFamilyProfile" runat="server" ImageUrl="../App_Themes/ThemeCTC/images/profile.gif"
                                            OnClick="ImageButtonFamilyProfile_Click" />
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ListBox ID="ListBoxAvailableFamily" runat="server" Width="260px" Height="299px"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonFamilyAdd" runat="server" Text=">>" OnClick="ButtonAddFamily_Click" /><br />
                                        <br />
                                        <asp:Button ID="ButtonFamilyRemove" runat="server" Text="<<" OnClick="ButtonRemoveFamily_Click" />
                                    </td>
                                    <td>
                                        <asp:ListBox ID="ListBoxSelectedFamily" runat="server" Width="260px" Height="299px"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:View>
         
                        <asp:View ID="View3" runat="server">
                        
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <th align="center" valign="bottom">
                                        Available Staff
                                        <input id="Image4" type="image" src="../App_Themes/ThemeCTC/images/info.gif" value="submit"
                                            onclick="return loadinfo('astaff')" />
                                    </th>
                                    <th>
                                    </th>
                                    <th align="center" valign="bottom">
                                        Selected Staff
                                        <input id="Image5" type="image" src="../App_Themes/ThemeCTC/images/info.gif" value="submit"
                                            onclick="return loadinfo('sstaff')" />
                                        <asp:ImageButton ID="ImageButtonStaffProfile" runat="server" ImageUrl="../App_Themes/ThemeCTC/images/profile.gif"
                                            OnClick="ImageButtonStaffProfile_Click" />
                                    </th>
                                    <th>
                                    </th>
                                    <th align="center" valign="bottom">
                                        Selected Facilitator
                                        <input id="Image6" type="image" src="../App_Themes/ThemeCTC/images/info.gif" value="submit"
                                            onclick="return loadinfo('sfacil')" />
                                        <asp:ImageButton ID="ImageButtonFacilitatorProfile" runat="server" ImageUrl="../App_Themes/ThemeCTC/images/profile.gif"
                                            OnClick="ImageButtonFacilitatorProfile_Click" />
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ListBox ID="ListBoxAvailableStaff" runat="server" Width="200px" Height="299px"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonAddStaff" runat="server" Text=">>" OnClick="ButtonAddStaff_Click" /><br />
                                        <br />
                                        <asp:Button ID="ButtonRemoveStaff" runat="server" Text="<<" OnClick="ButtonRemoveStaff_Click" />
                                    </td>
                                    <td>
                                        <asp:ListBox ID="ListBoxSelectedStaff" runat="server" Width="200px" Height="299px"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonAddFacilitator" runat="server" Text=">>" OnClick="ButtonAddFacilitator_Click" /><br />
                                        <br />
                                        <asp:Button ID="ButtonRemoveFacilitator" runat="server" Text="<<" OnClick="ButtonRemoveFacilitator_Click" />
                                    </td>
                                    <td>
                                        <asp:ListBox ID="ListBoxSelectedFacilitator" runat="server" Width="200px" Height="299px"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    </asp:View>
                    
                        <asp:View ID="View4" runat="server">
                        
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <th align="center" valign="bottom">
                                        Available Volunteers
                                        <input id="Image7" type="image" src="../App_Themes/ThemeCTC/images/info.gif" value="submit"
                                            onclick="return loadinfo('av')" />
                                    </th>
                                    <th>
                                    </th>
                                    <th align="center" valign="bottom">
                                        Selected Volunteers
                                        <input id="Image8" type="image" src="../App_Themes/ThemeCTC/images/info.gif" value="submit"
                                            onclick="return loadinfo('sv')" />
                                        <asp:ImageButton ID="ImageButtonVolunteerProfile" runat="server" ImageUrl="../App_Themes/ThemeCTC/images/profile.gif"
                                            OnClick="ImageButtonVolunteerProfile_Click" />
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ListBox ID="ListBoxAvailableVolunteers" runat="server" Width="260px" Height="299px"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="ButtonAddVolunteer" runat="server" Text=">>" OnClick="ButtonAddVolunteer_Click" /><br />
                                        <br />
                                        <asp:Button ID="ButtonRemoveVolunteer" runat="server" Text="<<" OnClick="ButtonRemoveVolunteer_Click" />
                                    </td>
                                    <td>
                                        <asp:ListBox ID="ListBoxSelectedVolunteers" runat="server" Width="260px" Height="299px"
                                            SelectionMode="Multiple"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    </asp:View>
               </asp:MultiView>
           
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button ID="ButtonDone" runat="server" OnClick="ButtonDone_Click" Text="Done" />
                </td>
                <td>
                </td>
                <td>
                    <asp:LinkButton ID="LinkButtonException" runat="server" OnClick="LinkButtonException_Click">Add Exception</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
