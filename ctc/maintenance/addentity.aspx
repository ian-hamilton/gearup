<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="addentity.aspx.cs"
    Inherits="maintenance_addentity" Title="Dreams - Entity Edit" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <p id="page-header">
            Edit Entity...</p>
        <table style="width: 550px">
            <tr>
                <td colspan="2">
                    <asp:Label ID="LabelStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 118px">
                </td>
                <td>
                    <asp:Literal ID="LiteralEntity" runat="server"></asp:Literal>
                </td>
            </tr>
        </table>
        <table style="width: 650px">
            <tr>
                <td style="width: 100px;">
                </td>
                <td style="width: 100px;">
                    <asp:MultiView ID="MultiViewEntity" runat="server">
                        <asp:View ID="ViewEdit" runat="server">
                            <table style="width: 436px">
                                <tr>
                                    <td style="width: 110px" align="right">
                                        <asp:Label ID="Label1" runat="server" AssociatedControlID="LabelEntityId" Text="Entity Id:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="LabelEntityId" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                    </asp:MultiView>
                </td>
            </tr>
        </table>
        <table style="width: 650px" cellspacing="7">
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label5" runat="server" AssociatedControlID="TextBoxSalutation" Text="Salutation"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxSalutation" runat="server" MaxLength="10" Width="100px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label2" runat="server" AssociatedControlID="TextBoxFirstName" Text="First Name:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxFirstName" runat="server" MaxLength="30" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" ErrorMessage="Missing required information!"
                        Display="None" runat="server" ControlToValidate="TextBoxFirstName" />
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorFirstName" />
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label3" runat="server" AssociatedControlID="TextBoxMiddleInitial"
                        Text="Middle Initial:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxMiddleInitial" runat="server" MaxLength="1" Width="29px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label4" runat="server" AssociatedControlID="TextBoxLastName" Text="Last Name:"></asp:Label>
                </td>
                <td style="width: 300px;">
                    <asp:TextBox ID="TextBoxLastName" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastName" runat="server" ErrorMessage="Missing required information!"
                        Display="None" ControlToValidate="TextBoxLastName" />
                    <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="RequiredFieldValidatorLastName" />
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label6" runat="server" Text="Title:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxTitle" runat="server" MaxLength="500" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label24" runat="server" AssociatedControlID="DropDownListEntityType"
                        Text="Entity Type:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:DropDownList ID="DropDownListEntityType" runat="server" Width="300px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label7" runat="server" AssociatedControlID="TextBoxAddress1" Text="Address 1:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxAddress1" runat="server" MaxLength="30" Width="350px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label8" runat="server" AssociatedControlID="TextBoxAddress2" Text="Address 2:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxAddress2" runat="server" MaxLength="30" Width="350px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label9" runat="server" AssociatedControlID="TextBoxCity" Text="City:"></asp:Label>
                </td>
                <td style="width: 300px;">
                    <asp:TextBox ID="TextBoxCity" runat="server" MaxLength="30" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label10" runat="server" AssociatedControlID="DropDownListStates" Text="State:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:DropDownList ID="DropDownListStates" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label11" runat="server" AssociatedControlID="TextBoxZipCode" Text="Zip:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxZipCode" runat="server" MaxLength="5"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" TargetControlID="TextBoxZipCode"
                        FilterType="Numbers" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label12" runat="server" Text="Home:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <table>
                        <tr>
                            <td style="height: 23px">
                                <asp:Label ID="Label32" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                                <asp:TextBox ID="TextBoxPhoneAreaCode" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" TargetControlID="TextBoxPhoneAreaCode"
                                    FilterType="Numbers" runat="server" />
                                <asp:Label ID="Label37" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label13" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxPhonePrefix" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" TargetControlID="TextBoxPhonePrefix"
                                    FilterType="Numbers" runat="server" />
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label14" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxPhoneNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" TargetControlID="TextBoxPhoneNumber"
                                    FilterType="Numbers" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label15" runat="server" Text="Mobile:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <table>
                        <tr>
                            <td style="height: 23px">
                                <asp:Label ID="Label16" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                                <asp:TextBox ID="TextBoxPhoneMobileAreaCode" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" TargetControlID="TextBoxPhoneMobileAreaCode"
                                    FilterType="Numbers" runat="server" />
                                <asp:Label ID="Label17" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label18" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxPhoneMobilePrefix" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" TargetControlID="TextBoxPhoneMobilePrefix"
                                    FilterType="Numbers" runat="server" />
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label19" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxPhoneMobileNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" TargetControlID="TextBoxPhoneMobileNumber"
                                    FilterType="Numbers" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label29" runat="server" Text="Work:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <table>
                        <tr>
                            <td style="height: 23px">
                                <asp:Label ID="Label30" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                                <asp:TextBox ID="TextBoxWorkAreaCode" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" TargetControlID="TextBoxPhoneAreaCode"
                                    FilterType="Numbers" runat="server" />
                                <asp:Label ID="Label31" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label33" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxWorkPrefix" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" TargetControlID="TextBoxPhonePrefix"
                                    FilterType="Numbers" runat="server" />
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label34" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxWorkNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" TargetControlID="TextBoxPhoneNumber"
                                    FilterType="Numbers" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label35" runat="server" Text="Fax:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <table>
                        <tr>
                            <td style="height: 23px">
                                <asp:Label ID="Label36" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                                <asp:TextBox ID="TextBoxFaxAreaCode" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender14" TargetControlID="TextBoxPhoneAreaCode"
                                    FilterType="Numbers" runat="server" />
                                <asp:Label ID="Label40" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label41" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxFaxPrefix" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" TargetControlID="TextBoxPhonePrefix"
                                    FilterType="Numbers" runat="server" />
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label42" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxFaxNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" TargetControlID="TextBoxPhoneNumber"
                                    FilterType="Numbers" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label43" runat="server" Text="Other:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <table>
                        <tr>
                            <td style="height: 23px">
                                <asp:Label ID="Label44" runat="server" Font-Bold="true" Text="Label">(</asp:Label>
                                <asp:TextBox ID="TextBoxOtherAreaCode" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" TargetControlID="TextBoxPhoneAreaCode"
                                    FilterType="Numbers" runat="server" />
                                <asp:Label ID="Label45" runat="server" Font-Bold="true" Text="Label">)</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label46" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxOtherPrefix" runat="server" Width="25px" MaxLength="3"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" TargetControlID="TextBoxPhonePrefix"
                                    FilterType="Numbers" runat="server" />
                            </td>
                            <td style="height: 23px">
                                <asp:Label ID="Label47" runat="server" Font-Bold="true" Text="Label">-</asp:Label>
                            </td>
                            <td style="height: 23px">
                                <asp:TextBox ID="TextBoxOtherNumber" runat="server" MaxLength="4" Width="30px"></asp:TextBox>
                                <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" TargetControlID="TextBoxPhoneNumber"
                                    FilterType="Numbers" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label20" runat="server" AssociatedControlID="TextBoxEmail" Text="Email:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxEmail" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label21" runat="server" AssociatedControlID="DropDownListGender" Text="Gender:"></asp:Label>
                </td>
                <td style="width: 300px;">
                    <asp:DropDownList ID="DropDownListGender" runat="server">
                        <asp:ListItem Value="F">Female</asp:ListItem>
                        <asp:ListItem Value="M">Male</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label22" runat="server" AssociatedControlID="DropDownListEthnicity"
                        Text="Ethnicity:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:DropDownList Width="200" ID="DropDownListEthnicity" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label23" runat="server" Text="Date of Birth:"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxDOB" runat="server" MaxLength="10"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" TargetControlID="TextBoxDOB"
                        FilterType="Custom, Numbers" ValidChars="/" runat="server" />
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBoxDOB" />
                    <asp:Label ID="Label25" runat="server" Text="00/00/0000" Width="84px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label" runat="server" AssociatedControlID="TextBoxUnit" Text="Unit"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxUnit" runat="server"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender10" TargetControlID="TextBoxUnit"
                        FilterType="Numbers" runat="server" />
                    <asp:LinkButton ID="LinkButtonUnit" runat="server" OnClick="LinkButtonUnit_Click">Search Units</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                    &nbsp;
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label38" runat="server" AssociatedControlID="TextBoxGrade" Text="Grade"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxGrade" runat="server"></asp:TextBox>
                    <cc1:FilteredTextBoxExtender ID="TextBoxGrade_FilteredTextBoxExtender" TargetControlID="TextBoxGrade"
                        FilterType="Numbers" runat="server" />
                    <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" runat="server" TargetControlID="TextBoxGrade"
                        FilterType="Numbers">
                    </cc1:FilteredTextBoxExtender>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                    &nbsp;
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label26" runat="server" AssociatedControlID="TextBoxEntityComment"
                        Text="Comments"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxEntityComment" runat="server" Width="350" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                    &nbsp;
                </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label39" runat="server" AssociatedControlID="TextBoxUnit" Text="Parent Entity"></asp:Label>
                </td>
                <td style="width: 300px">
                    <asp:TextBox ID="TextBoxParentEntity" runat="server" MaxLength="50" Width="250px"></asp:TextBox><br />
                    <asp:LinkButton ID="LinkButtonParentEntity" runat="server" OnClick="LinkButtonParentEntity_Click">Add Parent Entity</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                  </td>
                <td style="width: 200px" align="right">
                    <asp:Label ID="Label27" runat="server" AssociatedControlID="TextBoxUnit" Text="Active"></asp:Label>
                </td>
                <td style="width: 300px">
                    &nbsp;<asp:CheckBox ID="CheckBoxActive" runat="server" Checked="true" />
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td align="right" style="width: 200px">
                </td>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderStudents" runat="server"></asp:PlaceHolder>
                   </td>
                </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                </td>
                <td style="width: 300px;">
                </td>
            </tr>
            <tr>
                <td style="width: 167px">
                </td>
                <td style="width: 200px" align="right">
                </td>
                <td style="width: 300px">
                    <asp:Button ID="ButtonSubmit" runat="server" OnClick="ButtonSubmit_Click" Text="Submit" />
                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" ConfirmText="Are you sure you wish to update this Entity information?"
                        TargetControlID="ButtonSubmit">
                    </cc1:ConfirmButtonExtender>
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
                    <td align="right" style="width: 200px">
                        &nbsp;
                    </td>
                    <td style="width: 300px">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButtonAdd_Click" Width="115px">Manage Programs</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td align="right" style="width: 200px">
                        <br />
                    </td>
                    <td style="width: 300px">
                        <asp:GridView ID="GridViewProgram" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            ForeColor="#333333" GridLines="None" Width="250px">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="program_id" InsertVisible="False" ReadOnly="True" ShowHeader="False"
                                    Visible="False" />
                                <asp:BoundField DataField="display_program_name" HeaderText="Program Name" HeaderStyle-HorizontalAlign="Left" />
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
        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server" TargetControlID="PanelContentLanguages"
            ExpandControlID="PanelTitleLanguages" CollapseControlID="PanelTitleLanguages"
            Collapsed="false" TextLabelID="LabelLabelFacilityCollaspse">
        </cc1:CollapsiblePanelExtender>
        <asp:Panel ID="PanelTitleLanguages" runat="server" CssClass="collapsePanelHeader">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/ThemeCTC/images/bullet.gif" />
            &nbsp
            <asp:Label ID="Label28" runat="server" Text="Lnaguages">Languages</asp:Label>
        </asp:Panel>
        <asp:Panel ID="PanelContentLanguages" runat="server" CssClass="collapsePanel">
            <table>
                <tr>
                    <td style="width: 100px">
                        &nbsp;
                    </td>
                    <td style="width: 200px" align="right">
                        &nbsp;
                    </td>
                    <td style="width: 300px;">
                        <asp:LinkButton ID="LinkButtonEditLanguage" runat="server" OnClick="LinkButtonEditLanguage_Click">Edit Languages</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td align="right" style="width: 200px">
                        <br />
                        <br />
                        <br />
                    </td>
                    <td style="width: 300px;">
                        <asp:GridView ID="GridSelectedLanguages" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Width="289px">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <Columns>
                                <asp:BoundField DataField="DisplayLanguageName" HeaderText="Language Name" HeaderStyle-HorizontalAlign="Left" />
                                <asp:BoundField DataField="display_home_language" HeaderText="Home Language" HeaderStyle-HorizontalAlign="Left" />
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
        <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="server" TargetControlID="PanelOpenFacility"
            ExpandControlID="PanelTitleFacility" CollapseControlID="PanelTitleFacility" Collapsed="false"
            TextLabelID="LabelLabelFacilityCollaspse">
        </cc1:CollapsiblePanelExtender>
        <asp:Panel ID="PanelTitleFacility" runat="server" CssClass="collapsePanelHeader">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/App_Themes/ThemeCTC/images/bullet.gif" />
            &nbsp
            <asp:Label ID="LabelFacilityCollapse" runat="server" Text="Facilities">Facilities</asp:Label>
        </asp:Panel>
        <asp:Panel ID="PanelOpenFacility" runat="server" CssClass="collapsePanel">
            <table>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td align="right" style="width: 200px">
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButtonManageFacility" runat="server" OnClick="LinkButtonManageFacility_Click">Manage Facility</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 200px" align="right">
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
    </div>
</asp:Content>
