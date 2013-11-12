<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="editstudent.aspx.cs"
    Inherits="maintenance_editstudent" Title="Dreams - Edit Student" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Edit Student...</p>
        <table style="width: 700px">
            <tr>
                <td>
                    <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <table style="width: 700px" cellspacing="7">
            <tr>
                <td style="width: 100px; height: 17px">
                </td>
                <td style="width: 111px; height: 17px;" align="right">
                    <asp:Label ID="Label1" runat="server" Text="CTC Id:"></asp:Label>
                </td>
                <td style="width: 300px; height: 17px;">
                    <asp:Label ID="LabelCtcId" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 111px" align="right">
                    <asp:Label ID="Label2" runat="server" Text="Alpha Name:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:Label ID="LabelAlphaName" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 24px;">
                </td>
                <td style="width: 111px; height: 24px;" align="right">
                    <asp:Label ID="Label3" runat="server" Text="DOB:"></asp:Label>
                </td>
                <td style="width: 300px; height: 24px;">
                    <asp:Label ID="LabelDOB" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <%-- <tr>
                <td style="width: 100px">
                </td--%>>
                <%--<td style="width: 111px" align="right">
                    <asp:Label ID="Label5" runat="server" Text="CPS/Google Acct:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:Label ID="LabelCPSGmail" runat="server"  Font-Bold="true"
                    ></asp:Label><asp:Label ID="GmailId" runat="server" Text="@cps.org" Font-Bold="true"
                    ></asp:Label>
                    </td>--%>
            <%--</tr>--%>
        </table>
        <table style="width: 700px" cellspacing="7">
            <tr>
                <td style="width: 284px" align="right">
                    <asp:Label ID="Label4" runat="server" AssociatedControlID="TextBoxStatusComment"
                        Text="Comments:"></asp:Label>
                </td>
                <td style="width: 400px">
                    <asp:TextBox ID="TextBoxStatusComment" runat="server" TextMode="MultiLine" Width="321px"></asp:TextBox>
                </td>
            </tr>
            <%--<tr>
                <td style="width: 284px; height: 22px;" align="right">
                    <asp:Label ID="Label5" runat="server" AssociatedControlID="DropDownListSemester"
                        Text="College Application ONE:"></asp:Label>
                </td>
                
                <td style="width: 400px; height: 22px;">
                    <asp:DropDownList ID="DropDownListSemester" runat="server" Width="140px" AppendDataBoundItems="True">
                        <asp:ListItem>None</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
             <tr>
                <td style="width: 284px; height: 22px;" align="right">
                    <asp:Label ID="Label9" runat="server" AssociatedControlID="DropDownListSemester"
                        Text="College Application TWO:"></asp:Label>
                </td>
                
                <td style="width: 400px; height: 22px;">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="140px" AppendDataBoundItems="True">
                        <asp:ListItem>None</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
             <tr>
                <td style="width: 284px; height: 22px;" align="right">
                    <asp:Label ID="Label10" runat="server" AssociatedControlID="DropDownListSemester"
                        Text="College Application THREE:"></asp:Label>
                </td>
                
                <td style="width: 400px; height: 22px;">
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="140px" AppendDataBoundItems="True">
                        <asp:ListItem>None</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>--%>
            <tr>
                <td></td>
                <td>
                    <asp:CheckBox ID="CheckBoxParentalPermission" runat="server" Text="Parental Permission Form" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:CheckBox ID="CheckBoxMediaRelease" runat="server" Text="Media Release Form" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:CheckBox ID="CheckBox21Century" runat="server" Text="21st Century Certificate" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:CheckBox ID="CheckBoxFASFA" runat="server" Text="FAFSA Form Submitted" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:CheckBox ID="CheckBoxStudentSurvey" runat="server" Text="Student Survey" enabled="false" Font-Bold="True" Font-Italic="True" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:CheckBox ID="CheckBoxParentSurvey" runat="server" Text="Parent Survey" enabled="false" Font-Bold="True" Font-Italic="True" />
                </td>
            </tr>
               <%--<tr>
                <td style="width: 284px; height: 22px;" align="right">
                    <asp:Label ID="Label11" runat="server" AssociatedControlID="DropDownListSemester"
                        Text="College Acceptance Letter ONE:"></asp:Label>
                </td>
                
                <td style="width: 400px; height: 22px;">
                    <asp:DropDownList ID="DropDownList3" runat="server" Width="140px" AppendDataBoundItems="True">
                        <asp:ListItem>None</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
               <tr>
                <td style="width: 284px; height: 22px;" align="right">
                    <asp:Label ID="Label12" runat="server" AssociatedControlID="DropDownListSemester"
                        Text="College Accceptance Letter TWO:"></asp:Label>
                </td>
                
                <td style="width: 400px; height: 22px;">
                    <asp:DropDownList ID="DropDownList4" runat="server" Width="140px" AppendDataBoundItems="True">
                        <asp:ListItem>None</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
               <tr>
                <td style="width: 284px; height: 22px;" align="right">
                    <asp:Label ID="Label13" runat="server" AssociatedControlID="DropDownListSemester"
                        Text="College Acceptance Letter THREE:"></asp:Label>
                </td>
                
                <td style="width: 400px; height: 22px;">
                    <asp:DropDownList ID="DropDownList5" runat="server" Width="140px" AppendDataBoundItems="True">
                        <asp:ListItem>None</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>--%>
<%--            <tr>
                <td style="width: 284px" align="right">
                </td>
                <td style="width: 400px">
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr>
                <td style="width: 284px" align="right">
                </td>
                <td style="width: 400px">
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
                </td>
            </tr>--%>
        </table>
        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" TargetControlID="PanelOpenReside"
            ExpandControlID="PanelTitleReside" CollapseControlID="PanelTitleReside" Collapsed="false"
            TextLabelID="LabelLabelResideCollaspse">
        </cc1:CollapsiblePanelExtender>
        <asp:Panel ID="PanelTitleReside" runat="server" CssClass="collapsePanelHeader">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/App_Themes/ThemeCTC/images/bullet.gif" />
            &nbsp
            <asp:Label ID="LabelResideCollapse" runat="server" Text="Reside">Residing Entity</asp:Label>
        </asp:Panel>
        <asp:Panel ID="PanelOpenReside" runat="server" CssClass="collapsePanel">
            <table>
                <tr>
                    <td align="right" style="width: 284px">
                        &nbsp;
                    </td>
                    <td style="width: 400px" align="left">
                        <asp:LinkButton ID="LinkButtonResidingEntity" runat="server" OnClick="LinkButtonResidingEntity_Click">Manage Reside</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 284px">
                        <br />
                    </td>
                    <td style="width: 400px">
                        <asp:GridView ID="GridViewResidingEntity" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" Width="296px" GridLines="None">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:HyperLinkField HeaderText="Entity Name" DataTextField="display_reverse_full_name"
                                    DataNavigateUrlFields="entity_id" DataNavigateUrlFormatString="/CTC/info/entityview.aspx?ID={0}"
                                    Target="_blank" HeaderStyle-HorizontalAlign="Left" />
                            </Columns>
                            <RowStyle BackColor="#EFF3FB" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="PanelContentParent"
            ExpandControlID="PanelTitleParent" CollapseControlID="PanelTitleParent" Collapsed="false"
            TextLabelID="LabelLabelParentCollaspse">
        </cc1:CollapsiblePanelExtender>
        <asp:Panel ID="PanelTitleParent" runat="server" CssClass="collapsePanelHeader">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/ThemeCTC/images/bullet.gif" />
            &nbsp
            <asp:Label ID="Label6" runat="server" Text="Family">Family</asp:Label>
        </asp:Panel>
        <asp:Panel ID="PanelContentParent" runat="server" CssClass="collapsePanel">
            <table>
                <tr>
                    <td align="right" style="width: 284px">
                        &nbsp;
                    </td>
                    <td style="width: 400px">
                        <asp:LinkButton ID="LinkButtonParentGuardians" runat="server" OnClick="LinkButtonParentGuardians_Click">Manage Family</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 284px">
                        <br />
                    </td>
                    <td style="width: 400px">
                        <asp:GridView ID="GridViewParentsGuardians" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" Width="296px" GridLines="None">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:HyperLinkField HeaderText="Entity Name" DataTextField="display_reverse_full_name"
                                    DataNavigateUrlFields="entity_id" DataNavigateUrlFormatString="/CTC/info/entityview.aspx?ID={0}"
                                    Target="_blank" HeaderStyle-HorizontalAlign="Left" />
                            </Columns>
                            <RowStyle BackColor="#EFF3FB" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="server" TargetControlID="PanelContentProgram"
            ExpandControlID="PanelTitleProgram" CollapseControlID="PanelTitleProgram" Collapsed="false"
            TextLabelID="LabelProgramCollaspse">
        </cc1:CollapsiblePanelExtender>
        <asp:Panel ID="PanelTitleProgram" runat="server" CssClass="collapsePanelHeader">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/App_Themes/ThemeCTC/images/bullet.gif" />
            &nbsp
            <asp:Label ID="Label7" runat="server" Text="Program">Programs</asp:Label>
        </asp:Panel>
        <asp:Panel ID="PanelContentProgram" runat="server" CssClass="collapsePanel">
            <table>
                <tr>
                    <td align="right" style="width: 284px">
                        &nbsp;
                    </td>
                    <td style="width: 400px" align="left">
                        <asp:LinkButton ID="LinkButtonAdd" runat="server" Height="16px" OnClick="LinkButtonAdd_Click"
                            Width="115px">     Manage Programs</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 284px">
                        <br />
                    </td>
                    <td style="width: 400px">
                        <asp:GridView ID="GridViewProgram" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Width="295px">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="program_id" InsertVisible="False" ReadOnly="True" ShowHeader="False"
                                    Visible="False" />
                                <asp:BoundField DataField="display_program_name" ShowHeader="False" HeaderText="Program Name"
                                    HeaderStyle-HorizontalAlign="Left" />
                            </Columns>
                            <RowStyle BackColor="#EFF3FB" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender4" runat="server" TargetControlID="PanelContentLanguages"
            ExpandControlID="PanelTitleLanguages" CollapseControlID="PanelTitleLanguages"
            Collapsed="false" TextLabelID="LabelLanguagesCollaspse">
        </cc1:CollapsiblePanelExtender>
        <asp:Panel ID="PanelTitleLanguages" runat="server" CssClass="collapsePanelHeader">
            <asp:Image ID="Image4" runat="server" ImageUrl="~/App_Themes/ThemeCTC/images/bullet.gif" />
            &nbsp
            <asp:Label ID="Label8" runat="server" Text="Languages">Languages</asp:Label>
        </asp:Panel>
        <asp:Panel ID="PanelContentLanguages" runat="server" CssClass="collapsePanel">
            <table>
                <tr>
                    <td style="width: 284px" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 400px">
                        <asp:LinkButton ID="LinkButtonEditLanguage" runat="server" OnClick="LinkButtonEditLanguage_Click">Edit Languages</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 284px">
                        <br />
                    </td>
                    <td style="width: 400px">
                        <asp:GridView ID="GridSelectedLanguages" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" Width="297px" GridLines="None">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="DisplayLanguageName" HeaderText="Language Name">
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                                <asp:BoundField DataField="display_home_language" HeaderText="Home Language">
                                    <HeaderStyle HorizontalAlign="Left" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle BackColor="#EFF3FB" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        <%--      <table style="width: 700px" cellspacing="7">
                 <tr>
                <td style="width: 284px" align="right">
                </td>
                <td style="width: 400px">
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
                </td>
            </tr>
            </table>--%>

        </asp:Panel>


         <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender5" runat="server" TargetControlID="PanelOpenFacility"
            ExpandControlID="PanelTitleFacility" CollapseControlID="PanelTitleFacility" Collapsed="false"
            TextLabelID="LabelLabelFacilityCollaspse">
        </cc1:CollapsiblePanelExtender>
        <asp:Panel ID="PanelTitleFacility" runat="server" CssClass="collapsePanelHeader">
            <asp:Image ID="Image5" runat="server" ImageUrl="~/App_Themes/ThemeCTC/images/bullet.gif" />
            &nbsp
            <asp:Label ID="LabelFacilityCollapse" runat="server" Text="College Application">College Applications</asp:Label>
        </asp:Panel>
        <asp:Panel ID="PanelOpenFacility" runat="server" CssClass="collapsePanel">
            <table>
                <tr>
                    <td style="width: 284px" align="right">
                        &nbsp;
                    </td>
                   <%-- <td align="right" style="width: 400px">
                    </td>--%>
                    <td style="width: 400px">
                        <asp:LinkButton ID="LinkButtonManageFacility" runat="server" OnClick="LinkButtonManageFacility_Click">Manage College Applications</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                      <td align="right" style="width: 284px">
                        <br />
                    </td>
                <%--    <td style="width: 200px" align="right">
                    </td>--%>
                    <td style="width: 400px">
                        <asp:GridView ID="GridViewFacilites" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Width="250px" ViewStateMode="Enabled" 
                            DataKeyNames="masterFacilityId">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:HyperLinkField HeaderText="College Name" DataTextField="display_facility_name"
                                    DataNavigateUrlFields="facility_id" DataNavigateUrlFormatString="/CTC/info/facilityview.aspx?ID={0}"
                                    Target="_blank" HeaderStyle-HorizontalAlign="Left" >
                                <HeaderStyle HorizontalAlign="Left" />
                                </asp:HyperLinkField>
                                <asp:TemplateField HeaderText="Acceptance Letter">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" 
                                            Checked='<%# Bind("acceptanceLetterflagBoolValue") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" 
                                            Checked='<%# Bind("acceptanceLetterflagBoolValue") %>' Enabled="true" />
                                    </ItemTemplate>
                                    <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="#EFF3FB" />
                            <EditRowStyle BackColor="#2461BF" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
                  <table style="width: 700px" cellspacing="7">
                 <tr>
                <td style="width: 284px" align="right">
                </td>
                <td style="width: 400px">
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
                </td>
            </tr>
            </table>
        </asp:Panel>

    </div>
</asp:Content>
