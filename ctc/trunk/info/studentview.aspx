<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="studentview.aspx.cs" Inherits="info_studentview" Title="Student View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<%--    <script type="text/javascript"
src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js">
</script>--%>

<%--<script type="text/javascript">
    if (typeof jQuery == 'undefined')
        document.write(unescape("%3Cscript src='Scripts/jquery-1.6.2.min.js'" + "type='text/javascript'%3E%3C/script%3E")); 
</script>

<script type="text/javascript" src="../Scripts/jquery.flot.min.js"></script>
<[if lte IE 8]>
<script language="javascript" type="text/javascript" src="../Scripts/excanvas.js"></script><![endif]>--%>

<%--<script type="text/javascript">
    $(document).ready(function () {
//        var Math = [[2002, 53], [2003, 62], [2004, 63], [2005, 65]];
//        var Reading = [[2002, 41], [2003, 48], [2004, 50], [2005, 53]];
//        var Science = [[2002, 62], [2003, 65], [2004, 67], [2005, 71]];
        //        var Writing = [[2002, 11], [2003, 14], [2004, 15], [2005, 18]];

        var data = [{label:"Math", data:[[2002, 53], [2003, 62], [2004, 63], [2005, 65]]},
        {label:"Reading", data:[[2002, 41], [2003, 48], [2004, 50], [2005, 53]]},
        {label:"Science", data:[[2002, 62], [2003, 65], [2004, 67], [2005, 71]]},
        { label: "Writing", data: [[2002, 11], [2003, 14], [2004, 15], [2005, 18]]}];

//        var data1 = <asp:PlaceHolder ID="PHolder1"></asp:placeholder>

        var options = {
            legend: {
            show: true,
            margin: 10,
            backgroundOpacity: 0.5,
            container:"#FlotLegend"
            },
            lines: { show: true },
            points: { show: true },
            clickable: true,
            hoverable: true,
            xaxis: {tickDecimals: 0}

        };

        //        alert("The Ready Function has Loaded");
        //        $.plot($("#FlotGraph"), [Math, Reading, Science, Writing], options);
        $.plot($("#FlotGraph"), data, options);

    }); 
</script> --%>
    <div>
        <p id="page-header">
            Student View...</p>
        <div style="float: left; width: 345px; padding: 0px 25px 0px 10px; height: 100%">
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
                            <tr>
                                <td align="right" style="width: 80px">
                                    *Comment:
                                </td>
                                <td>
                                    <asp:Label ID="LabelStatusComment" runat="server"></asp:Label>
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
                                    FAFSA Submitted:
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
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderFacilities" runat="server"></asp:PlaceHolder>
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
         <%--   <table id="Flot1" class="info" width="325">
                            <tr>
                                <th colspan="2" align="center" style="height: 27px">
                                    Student Indicators
                                                                   </th>
                            </tr>
                            <tr style="height: 40px">
                                <td align="right" style="width: 25px">
                                   M
                                </td>
                                <td id="FlotGraph" style="width: 200px; height: 100px" >
                                    
                                </td>
                                 <td id="FlotLegend" style="width: 50px; height: 100px" >
                                   
                                </td>
                            </tr>
                            </table>--%>
        </div>
     
        <div id="Flot1"  style="float: left; width: 345px; padding: 0px 25px 0px 10px; height: 100%">
           
        </div>
        <div style="float: right; width: 345px; padding: 0px 25px 0px 10px; height: 404px">
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
                                 <tr>
                                <td align="right" style="width: 80px">
                                    Residing Entity Comment
                                </td>
                                <td>
                                    <asp:Label ID="LabelEntityComment" runat="server" Text=""></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:PlaceHolder ID="PlaceHolderFamily" runat="server"></asp:PlaceHolder>
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
