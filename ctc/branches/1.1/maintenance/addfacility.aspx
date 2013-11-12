<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="addfacility.aspx.cs"
    Inherits="maintenance_addfacility" Title="Dreams - Facility Edit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Edit Facility...</p>
        <table style="width: 524px">
            <tr>
                <td colspan="2">
                    <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                </td>
                <td style="width: 529px">
                    &nbsp;<asp:Literal ID="LiteralHTML" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td style="width: 135px">
                </td>
                <td style="width: 529px">
                    <asp:PlaceHolder ID="PlaceHolderFacilities" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
        </table>
        <asp:MultiView ID="MultiViewFacility" runat="server">
            <asp:View ID="ViewAdd" runat="server">
                <table style="width: 730px; height: 1px" cellspacing="7">
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 145px" align="right">
                            <asp:Label ID="Label3" runat="server" AssociatedControlID="TextBoxFacilityName" Text="Facility Name:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxFacilityName" runat="server" MaxLength="100" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorFacilityName" runat="server"
                                ControlToValidate="TextBoxFacilityName" ErrorMessage="Missing required information!"
                                Display="None"></asp:RequiredFieldValidator>
                            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorFacilityName">
                            </cc1:ValidatorCalloutExtender>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 145px" align="right">
                            <asp:Label ID="Label4" runat="server" AssociatedControlID="DropDownListFacilityType"
                                Text="Facility Type"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownListFacilityType" runat="server" Width="200px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 145px" align="right">
                            <asp:Label ID="Label46" runat="server" Text="Unit:" AssociatedControlID="TextBoxUnit"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBoxUnit" runat="server"></asp:TextBox>
                            <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderUnit" TargetControlID="TextBoxUnit"
                                FilterType="Numbers" runat="server">
                            </cc1:FilteredTextBoxExtender>
                        </td>
                    </tr>
                </table>
            </asp:View>
            <asp:View ID="ViewEdit" runat="server">
                <table style="width: 730px; height: 1px" cellspacing="7">
                    <tr style="height: 5px">
                        <td style="width: 100px; height: 5px;">
                        </td>
                        <td style="width: 145px; height: 5px;" align="right">
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="LabelFacilityId" Text="Facility Id:"></asp:Label>
                        </td>
                        <td style="height: 5px">
                            <asp:Label ID="LabelFacilityId" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 5px">
                        <td style="width: 100px">
                        </td>
                        <td style="width: 145px;" align="right">
                            <asp:Label ID="Label31" runat="server" AssociatedControlID="TextBoxFacilityName"
                                Text="Facility Name:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="LabelFacilityName" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 145px;" align="right">
                            <asp:Label ID="Label43" runat="server" AssociatedControlID="DropDownListFacilityType"
                                Text="Facility Type"></asp:Label>
                        </td>
                        <td style="height: 22px">
                            <asp:Label ID="LabelFacilityType" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px; height: 17px;">
                        </td>
                        <td style="width: 145px; height: 17px;" align="right">
                            &nbsp;<asp:Label ID="Label45" runat="server" AssociatedControlID="TextBoxUnit" Text="Unit:"></asp:Label>
                        </td>
                        <td style="height: 17px">
                            <asp:Label ID="LabelUnit" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                        </td>
                        <td style="width: 145px">
                        </td>
                        <td>
                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                        </td>
                    </tr>
                </table>
            </asp:View>
        </asp:MultiView><table style="width: 730px; height: 1px">
            <tr>
                <td style="width: 353px">
                    &nbsp;
                </td>
                <td style="width: 56px">
                </td>
            </tr>
        </table>
        <table style="width: 730px; height: 1px" cellspacing="7">
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label5" runat="server" AssociatedControlID="TextBoxFacilityDesc" Text="Facility Description:"></asp:Label>
                </td>
                <td style="width: 392px">
                    <br />
                    <asp:TextBox ID="TextBoxFacilityDesc" runat="server" TextMode="MultiLine" Width="350px"></asp:TextBox>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label6" runat="server" AssociatedControlID="TextBoxAddress1" Text="Address 1:"></asp:Label>
                </td>
                <td style="width: 392px">
                    <asp:TextBox ID="TextBoxAddress1" runat="server" MaxLength="30" Width="350px"></asp:TextBox>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label7" runat="server" AssociatedControlID="TextBoxAddress2" Text="Address 2:"></asp:Label>
                </td>
                <td style="width: 392px">
                    <asp:TextBox ID="TextBoxAddress2" runat="server" MaxLength="30" Width="350px"></asp:TextBox>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 40px">
                </td>
                <td style="width: 135px; height: 40px" align="right">
                    <asp:Label ID="Label8" runat="server" AssociatedControlID="TextBoxCity" Text="City:"></asp:Label>
                </td>
                <td style="width: 392px; height: 40px;">
                    <asp:TextBox ID="TextBoxCity" runat="server" MaxLength="30" Width="200px"></asp:TextBox>
                </td>
                <td style="height: 40px; width: 56px;">
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 23px;">
                </td>
                <td style="width: 135px; height: 23px;" align="right">
                    <asp:Label ID="Label9" runat="server" AssociatedControlID="DropDownListStates" Text="State:"></asp:Label>
                </td>
                <td style="width: 392px; height: 23px;">
                    <asp:DropDownList ID="DropDownListStates" runat="server">
                    </asp:DropDownList>
                </td>
                <td style="width: 56px; height: 23px;">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label10" runat="server" AssociatedControlID="TextBoxZipCode" Text="Zip:"></asp:Label>
                </td>
                <td style="width: 392px">
                    <asp:TextBox ID="TextBoxZipCode" runat="server" MaxLength="5"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtenderZipCode" TargetControlID="TextBoxZipCode"
                        FilterType="Numbers" runat="server">
                    </cc1:FilteredTextBoxExtender>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label11" runat="server" AssociatedControlID="TextBoxMiscContactName"
                        Text="Misc Contact Name:"></asp:Label>
                </td>
                <td style="width: 392px">
                    <asp:TextBox ID="TextBoxMiscContactName" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label12" runat="server" Text="Phone:"></asp:Label>
                </td>
                <td>
                    <table>
                        <tr>
                            <td style="height: 23px">
                                <asp:Label ID="Label32" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                                <asp:TextBox ID="TextBoxPhoneAreaCode" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <asp:Label ID="Label37" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxPhoneAreaCode" />
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label13" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxPhonePrefix" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxPhonePrefix" />
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label14" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxPhoneNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxPhoneNumber" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label15" runat="server" Text="Alternate Phone:"></asp:Label>
                </td>
                <td style="width: 392px">
                    <table>
                        <tr>
                            <td style="height: 23px">
                                <asp:Label ID="Label38" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                                <asp:TextBox ID="TextBoxAltPhoneAreaCode" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxAltPhoneAreaCode" />
                                <asp:Label ID="Label39" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label16" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxAltPhonePrefix" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxAltPhonePrefix" />
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label17" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxAltPhoneNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxAltPhoneNumber" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px;">
                </td>
                <td style="width: 135px;" align="right">
                    <asp:Label ID="Label18" runat="server" Text="Fax:"></asp:Label>
                </td>
                <td style="width: 392px;">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label34" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                                <asp:TextBox ID="TextBoxFaxAreaCode" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxFaxAreaCode" />
                                <asp:Label ID="Label40" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label19" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxFaxPrefix" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxFaxPrefix" />
                            </td>
                            <td>
                                <asp:Label ID="Label20" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxFaxNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxFaxNumber" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 56px;">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label21" runat="server" Text="Lunchroom Phone:"></asp:Label>
                </td>
                <td style="width: 392px">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label35" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                                <asp:TextBox ID="TextBoxLunchRoomAreaCode" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxLunchRoomAreaCode" />
                                <asp:Label ID="Label41" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                            </td>
                            <td>
                                <asp:Label ID="Label22" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxLunchRoomPrefix" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxLunchRoomPrefix" />
                            </td>
                            <td>
                                <asp:Label ID="Label23" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="TextBoxLunchRoomNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxLunchRoomNumber" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 56px;">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label24" runat="server" Text="Engineering Phone:"></asp:Label>
                </td>
                <td style="width: 392px">
                    <table>
                        <tr>
                            <td style="height: 23px">
                                <asp:Label ID="Label36" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                                <asp:TextBox ID="TextBoxEngineeringAreaCode" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxEngineeringAreaCode" />
                                <asp:Label ID="Label42" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label25" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxEngineeringPrefix" runat="server" MaxLength="3" Width="25px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxEngineeringPrefix" />
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label26" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxEngineeringNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" runat="server" FilterType="Numbers"
                                    TargetControlID="TextBoxEngineeringNumber" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 23px;">
                </td>
                <td style="width: 135px; height: 23px;" align="right">
                    <asp:Label ID="Label27" runat="server" AssociatedControlID="TextBoxURL" Text="Webpage URL:"></asp:Label>
                </td>
                <td style="width: 392px; height: 23px;">
                    <asp:TextBox ID="TextBoxURL" runat="server" Width="350px"></asp:TextBox>
                </td>
                <td style="width: 56px; height: 23px;">
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 23px;">
                </td>
                <td style="width: 135px; height: 23px;" align="right">
                    <asp:Label ID="Label28" runat="server" Text="Grades Served:"></asp:Label>
                </td>
                <td style="width: 392px; height: 23px;">
                    <asp:TextBox ID="TextBoxGrades" runat="server" MaxLength="100" Width="200px"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" runat="server" TargetControlID="TextBoxGrades"
                        FilterType="Custom, Numbers" ValidChars=",">
                    </cc1:FilteredTextBoxExtender>
                </td>
                <td style="width: 56px; height: 23px;">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label29" runat="server" Text="School Focus:"></asp:Label>
                </td>
                <td style="width: 392px">
                    <asp:TextBox ID="TextBoxSchoolFocus" runat="server" MaxLength="500" Width="350px"></asp:TextBox>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label30" runat="server" Text="Warning List:"></asp:Label>
                </td>
                <td style="width: 392px">
                    &nbsp;<asp:CheckBox ID="CheckBoxWarningList" runat="server" />
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label33" runat="server" Text="Active:"></asp:Label>
                </td>
                <td style="width: 392px">
                    &nbsp;<asp:CheckBox ID="CheckBoxActive" runat="server" Checked="true" />
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px" align="right">
                    <asp:Label ID="Label47" runat="server" AssociatedControlID="TextBoxFacilityComment"
                        Text="Facility Comment:"></asp:Label>
                </td>
                <td style="width: 392px">
                    <asp:TextBox ID="TextBoxFacilityComment" runat="server" TextMode="MultiLine" Width="350px"></asp:TextBox>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px">
                </td>
                <td style="width: 392px">
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px">
                </td>
                <td style="width: 392px">
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Are you sure you wish to update this facility information?"
                        TargetControlID="ButtonSubmit">
                    </cc1:ConfirmButtonExtender>
                </td>
                <td style="width: 56px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                </td>
                <td style="width: 135px">
                </td>
                <td style="width: 392px">
                </td>
                <td style="width: 56px">
                </td>
            </tr>
        </table>
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
                        &nbsp;
                    </td>
                    <td style="width: 135px" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 392px">
                        <asp:LinkButton ID="LinkButtonAdd" OnClick="LinkButtonAdd_Click" runat="server" Width="115px">Manage Programs</asp:LinkButton>
                    </td>
                    <td style="width: 56px">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 135px" align="right">
                        <br />
                        <br />
                    </td>
                    <td style="width: 392px">
                        <asp:GridView ID="GridViewProgram" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Width="250px">
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
                    <td style="width: 56px">
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
