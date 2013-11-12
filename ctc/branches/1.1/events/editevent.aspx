<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="editevent.aspx.cs"
    Inherits="events_editevent" Title="Edit Event" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Edit Event...</p>
        <table style="width: 700px">
            <tr>
                <td style="width: 100px">
                    <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red" Width="500"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 120px">
                </td>
                <td>
                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr>
                <td style="width: 200px">
                </td>
                <td>
                </td>
            </tr>
        </table>
        <asp:MultiView ID="MultiViewEvent" runat="server">
            <asp:View ID="ViewNew" runat="server">
                <table width="700" cellspacing="10" cellpadding="0">
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td align="right" style="width: 114px">
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="DropDownListApr" Text="Event Type:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListApr" runat="server" Width="400px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td align="right" style="width: 114px">
                            <asp:Label ID="Label2" runat="server" AssociatedControlID="TextBoxEventTitle" Text="Event Title:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxEventTitle" runat="server" MaxLength="100" Width="300px"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorDesc" runat="server" ControlToValidate="TextBoxEventTitle"
                                Display="None" ErrorMessage="Missing Required Information" ValidationGroup="group1"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorDesc">
                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td align="right" style="width: 114px">
                            <asp:Label ID="Label15" runat="server" AssociatedControlID="TextBoxHost" Text="Host Facility:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxHost" runat="server" ReadOnly="True" Width="300px"></asp:TextBox>
                            <asp:LinkButton ID="LinkButtonManageHost" runat="server" OnClick="LinkButtonManageHost_Click">Manage Host</asp:LinkButton>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorHost" runat="server" ControlToValidate="TextBoxHost"
                                ErrorMessage="Missing Required Information" Display="None" ValidationGroup="group1"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidatorHost" />
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="ViewEdit" runat="server">
                <table width="700" cellspacing="10" cellpadding="0">
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td align="right" style="width: 122px">
                            <asp:Label ID="Label17" runat="server" AssociatedControlID="LabelEventApr" Text="Event Id:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelEventId" runat="server" Text="Label" Width="450px" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; height: 17px;">
                        </td>
                        <td style="width: 122px; height: 17px;" align="right">
                            <asp:Label ID="Label6" runat="server" AssociatedControlID="LabelEventApr" 
                                Text="Event Type:"></asp:Label>
                        </td>
                        <td style="height: 17px">
                            <asp:Label ID="LabelEventApr" runat="server" Text="Label" Width="450px" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 122px" align="right">
                            <asp:Label ID="Label8" runat="server" AssociatedControlID="LabelEventTitle" 
                                Text="Event Title:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelEventTitle" runat="server" Text="Label" Width="450px" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 122px" align="right">
                            <asp:Label ID="Label14" runat="server" AssociatedControlID="LabelFacilityEditNon"
                                Text="Host Facility:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelFacilityEditNon" runat="server" Text="Label" Width="304px" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView>
        <table width="700" cellspacing="10" cellpadding="0">
            <tr>
                <td style="width: 91px">
                </td>
                <td align="right" style="width: 114px">
                    <asp:Label ID="Label3" runat="server" AssociatedControlID="TextBoxEventDate" Text="Event Date:"></asp:Label>
                </td>
                <td>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBoxEventDate"
                        FilterType="Custom ,Numbers" ValidChars="/">
                    </cc1:FilteredTextBoxExtender>
                    <asp:TextBox ID="TextBoxEventDate" runat="server" MaxLength="10"></asp:TextBox>
                    <asp:Label ID="Label25" runat="server" Text="00/00/0000" Width="84px"></asp:Label>
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBoxEventDate">
                    </cc1:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDate" runat="server" ControlToValidate="TextBoxEventDate"
                        ErrorMessage="Missing Required Information" Display="None" ValidationGroup="group1"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidatorDate" />
                </td>
            </tr>
            <tr>
                <td style="width: 91px">
                </td>
                <td align="right" style="width: 120px">
                    <asp:Label ID="Label10" runat="server" AssociatedControlID="TextBoxStartTime" Text="Start Time:"></asp:Label>
                </td>
                <td>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="TextBoxStartTime"
                        FilterType="Custom, Numbers" ValidChars=":" />
                    <asp:TextBox ID="TextBoxStartTime" runat="server" MaxLength="5" Width="75px"></asp:TextBox>
                    <asp:Label ID="Label12" runat="server" Text="ie: 13:15"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorStart" runat="server"
                        ControlToValidate="TextBoxStartTime" ErrorMessage="Invalid Time Format" Display="None"
                        ValidationExpression="^(20|21|22|23|[01]\d|\d)(([:][0-5]\d){1,2})$" ValidationGroup="group1"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RegularExpressionValidatorStart" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorRequiredStart" runat="server"
                        ErrorMessage="Missing required information!" Display="None" ControlToValidate="TextBoxStartTime"
                        ValidationGroup="group1"></asp:RequiredFieldValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RequiredFieldValidatorRequiredStart" />
                </td>
            </tr>
            <tr>
                <td style="width: 91px">
                </td>
                <td align="right" style="width: 120px">
                    <asp:Label ID="Label11" runat="server" AssociatedControlID="TextBoxEndTime" Text="End Time:"></asp:Label>
                </td>
                <td>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="TextBoxEndTime"
                        FilterType="Custom, Numbers" ValidChars=":" />
                    <asp:TextBox ID="TextBoxEndTime" runat="server" MaxLength="5" Width="75px"></asp:TextBox>
                    <asp:Label ID="Label13" runat="server" Text="ie: 13:15"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEnd" runat="server"
                        ControlToValidate="TextBoxEndTime" ErrorMessage="Invalid Time Format" Display="None"
                        ValidationExpression="^(20|21|22|23|[01]\d|\d)(([:][0-5]\d){1,2})$" ValidationGroup="group1"></asp:RegularExpressionValidator>
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender5" runat="server" TargetControlID="RegularExpressionValidatorEnd" />
                     <asp:CompareValidator id="CompareFieldValidator1" runat="server" 
                        ForeColor="Red"
                        ControlToValidate="TextBoxEndTime"
                        ControlToCompare="TextBoxStartTime"
                        Type="String"
                        Operator="GreaterThanEqual"
                        ErrorMessage="End Time Must Be Later Than Start Time.">
                      </asp:CompareValidator >
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="CompareFieldValidator1" />
                </td>
            </tr>
            <tr>
                <td style="width: 91px">
                </td>
                <td style="width: 120px" align="right">
                    <asp:Label ID="Label5" runat="server" AssociatedControlID="TextBoxEventComment" Text="Event Comment:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxEventComment" runat="server" TextMode="MultiLine" Width="428px"
                        Height="76px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 91px">
                </td>
                <td style="width: 120px" align="right">
                    <asp:Label ID="Label7" runat="server" AssociatedControlID="CheckBoxActive" Text="Active:"></asp:Label>
                </td>
                <td>
                    <asp:CheckBox ID="CheckBoxActive" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 91px">
                </td>
                <td align="right" style="width: 120px">
                    <asp:Label ID="Label18" runat="server" Text="Responsible Entity"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxResponsibleEntity" runat="server" Width="250px" ReadOnly="True"></asp:TextBox>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Responsible Entity</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="width: 91px">
                </td>
                <td style="width: 120px" align="right">
                </td>
                <td>
                    <asp:LinkButton ID="LinkButtonManageAttendance" runat="server" OnClick="LinkButtonManageAttendance_Click">Manage Attendance</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="width: 91px">
                </td>
                <td style="width: 120px" align="right">
                    &nbsp;
                </td>
                <td>
                    <asp:LinkButton ID="LinkButtonProfile" runat="server" OnClick="LinkButtonProfile_Click">Update Event Profile</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="width: 91px">
                    &nbsp;
                </td>
                <td style="width: 120px" align="right">
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td style="width: 91px">
                    &nbsp;
                </td>
                <td style="width: 120px" align="right">
                    &nbsp;
                </td>
                <td>
                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Are you sure you wish to update this event information?"
                        TargetControlID="ButtonSubmit">
                    </cc1:ConfirmButtonExtender>
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" ValidationGroup="group1"
                        OnClick="ButtonSubmit_Click" />
                </td>
            </tr>
        </table>
        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="PanelOpenFacility"
            ExpandControlID="PanelTitleFacility" CollapseControlID="PanelTitleFacility" Collapsed="false"
            TextLabelID="LabelLabelFacilityCollaspse">
        </cc1:CollapsiblePanelExtender>
        <asp:Panel ID="PanelTitleFacility" runat="server" CssClass="collapsePanelHeader">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/ThemeCTC/images/bullet.gif" />
            &nbsp
            <asp:Label ID="LabelFacilityCollapse" runat="server" Text="Facilities">Target Facilities</asp:Label>
        </asp:Panel>
        <asp:Panel ID="PanelOpenFacility" runat="server" CssClass="collapsePanel">
            <table>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td align="right" style="width: 120px">
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButtonManageFacility" runat="server" OnClick="LinkButtonManageFacility_Click">Manage Facility</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 120px" align="right">
                    </td>
                    <td>
                        <asp:GridView ID="GridViewFacilites" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Width="250px">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:HyperLinkField HeaderText="Facility Name" DataTextField="display_facility_name"
                                    DataNavigateUrlFields="facility_id" DataNavigateUrlFormatString="/CTC/info/facilityview.aspx?ID={0}"
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
        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="server" TargetControlID="PanelOpenPrograms"
            ExpandControlID="PanelTitlePrograms" CollapseControlID="PanelTitlePrograms" Collapsed="false"
            TextLabelID="LabelLabelFacilityCollaspse">
        </cc1:CollapsiblePanelExtender>
        <asp:Panel ID="PanelTitlePrograms" runat="server" CssClass="collapsePanelHeader">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/App_Themes/ThemeCTC/images/bullet.gif" />
            &nbsp
            <asp:Label ID="LabelProgramCollapse" runat="server" Text="Programs">Programs</asp:Label>
        </asp:Panel>
        <asp:Panel ID="PanelOpenPrograms" runat="server" CssClass="collapsePanel">
            <table>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td align="right" style="width: 100px">
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButtonManagePrograms" runat="server" OnClick="LinkButtonManagePrograms_Click"
                            Width="115px">Manage Programs</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 120px" align="right">
                    </td>
                    <td>
                        <asp:GridView ID="GridViewProgram" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Width="250px">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
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
    </div>
</asp:Content>
