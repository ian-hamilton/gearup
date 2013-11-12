<%@ Page Language="C#" MasterPageFile="~/ctc.master" AutoEventWireup="true" CodeFile="eventcalendar.aspx.cs"
    Inherits="events_eventcalendar" Title="Event Calendar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<script type="text/javascript">
    function showAjax() {
        element = document.getElementById("ajaxGif");
        element.style.visibility = "visible";
    }
</script>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div>
                <p id="page-header">
                    Event Calendar...
                    <br />
                    <br />
                    <br />
                    <table border="0" cellpadding="1" cellspacing="2" width="160" style="font-family: tahoma;
                        font-size: 10px; color: #000000; height: 100px;" align="right">
                        <tr>
                            <td nowrap="nowrap" style="font-family: tahoma; font-size: 10px; font-weight: bold;
                                color: #000000; line-height: 21px;">
                                Student Events
                            </td>
                            <td nowrap="nowrap" style="font-family: Tahoma; font-size: 10px; font-weight: bold;
                                color: #000000; background-color: #32CD32; line-height: 21px;">
                                Scheduled
                            </td>
                            <td nowrap="nowrap" style="font-family: Tahoma; font-size: 10px; font-weight: bold;
                                color: #FFFFFF; background-color: #008000; line-height: 21px;">
                                Completed
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="font-family: tahoma; font-size: 10px; font-weight: bold;
                                color: #000000">
                                Parent Events
                            </td>
                            <td nowrap="nowrap" style="font-family: Tahoma; font-size: 10px; font-weight: bold;
                                color: #000000; background-color: #87CEEB">
                                Scheduled
                            </td>
                            <td nowrap="nowrap" style="font-family: Tahoma; font-size: 10px; font-weight: bold;
                                color: #FFFFFF; background-color: #0000FF">
                                Completed
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="font-family: tahoma; font-size: 10px; font-weight: bold;
                                color: #000000; line-height: 21px;">
                                Prof.Dev. Events
                            </td>
                            <td nowrap="nowrap" style="font-family: Tahoma; font-size: 10px; font-weight: bold;
                                color: #000000; background-color: #FFB6C1">
                                Scheduled
                            </td>
                            <td nowrap="nowrap" style="font-family: Tahoma; font-size: 10px; font-weight: bold;
                                color: #FFFFFF; background-color: #FF1493">
                                Completed
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="font-family: tahoma; font-size: 10px; font-weight: bold;
                                color: #000000">
                                Staff Events
                            </td>
                            <td nowrap="nowrap" style="font-family: Tahoma; font-size: 10px; font-weight: bold;
                                color: #000000; background-color: #B0C4DE">
                                Scheduled
                            </td>
                            <td nowrap="nowrap" style="font-family: Tahoma; font-size: 10px; font-weight: bold;
                                color: #FFFFFF; background-color: #808080">
                                Completed
                            </td>
                        </tr>
                        <tr>
                            <td nowrap="nowrap" style="font-family: tahoma; font-size: 10px; font-weight: bold;
                                color: #000000">
                                Contact Support
                            </td>
                            <td nowrap="nowrap" style="font-family: Tahoma; font-size: 10px; font-weight: bold;
                                color: #FFFF00; background-color: #FFFF00">
                                Scheduled
                            </td>
                        </tr>
                    </table>
                    <p>
                    </p>
                    <br />
                    <div style="width: 300; float: left;">
                        <asp:DropDownList ID="DropDownListPrograms" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListPrograms_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <br />
                    <br />
                    <div style="width: 300; float: left;">
                        <asp:DropDownList ID="DropDownListFacilites" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownListFacilites_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <br />
                    <br />
                    <b>Today's Date</b>
                    <br />
                    <div style="float: left; height: 20px;">
                        &nbsp;<asp:TextBox ID="TextBoxSelect" runat="server"
                            Height="18px" Width="80px" ></asp:TextBox>
                        <cc1:CalendarExtender ID="CalendarExtenderSelect" runat="server" Enabled="True" 
                            TargetControlID="TextBoxSelect" PopupPosition="TopRight" >
                        </cc1:CalendarExtender>
                        <br />
                       <b>Click to Change</b>   
                        </div>
                    <asp:ImageButton ID="ImageButtonSelectDate" runat="server" Height="22px"
                        ImageUrl="~/App_Themes/ThemeCTC/images/go_button.png" 
                        OnClick="ImageButtonSelectDate_Click" OnClientClick="return showAjax();" />
                    <img id="ajaxGif" alt="" src="../App_Themes/ThemeCTC/images/ajax.gif" 
                        style="visibility:hidden; width: 29px; height: 25px;" "width: 28px; height: 28px;" /><p>
                                                            
                        &nbsp;<cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1">
                        <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="Day">
                            <ContentTemplate>
                                <DayPilot:DayPilotCalendar ID="DayPilotCalendarEvents" runat="server" AllDayEventBackColor="White"
                                    BackColor="#FFFFD5" BorderColor="Black" CellSelectColor="#316AC5" DataEndField="End"
                                    DataStartField="Start" DataTextField="name" DataValueField="id" Days="7" Direction="Auto"
                                    DurationBarColor="Blue" DurationBarWidth="5" EventBackColor="White" EventBorderColor="Black"
                                    EventClickHandling="JavaScript" EventFontColor="Black" EventSelectColor="Blue"
                                    HeaderFontColor="Black" HourBorderColor="#EAD098" HourFontColor="Black" HourHalfBorderColor="#F3E4B1"
                                    HourNameBackColor="#ECE9D8" HourNameBorderColor="#ACA899" NonBusinessBackColor="#FFF4BC"
                                    ScrollPositionHour="9" ShowEventStartEnd="True" StartDate="2008-12-31" Width="748px" />
                            </ContentTemplate>
                        </cc1:TabPanel>
                        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="Month">
                            <HeaderTemplate>
                                Month
                            </HeaderTemplate>
                            <ContentTemplate>
                                <div>
                                    <a href="javascript:dpm.refreshCallBack(-1);" style="text-decoration: none; background-color: White;
                                        border: 1px solid navy; padding: 3px;">Previous month <span style="color: red">«</span>
                                    </a>&nbsp; <a href="javascript:dpm.refreshCallBack(DayPilot.Date.today());" style="text-decoration: none;
                                        background-color: White; border: 1px solid navy; padding: 3px;">This month</a>
                                    &nbsp; <a href="javascript:dpm.refreshCallBack(1);" style="text-decoration: none;
                                        background-color: White; border: 1px solid navy; padding: 3px;"><span style="color: red">
                                            »</span> Next month</a><br />
                                    <DayPilot:DayPilotMonth ID="DayPilotMonthEvent" runat="server" BackColor="#FFFFD5"
                                        BorderColor="Black" CellHeaderBackColor="" CellHeaderFontColor="Black" ClientObjectName="dpm"
                                        DataEndField="end" DataStartField="start" DataTagFields="name, id" DataTextField="name"
                                        DataValueField="id" EventBackColor="SeaGreen" EventBorderColor="Black" EventClickHandling="JavaScript"
                                        EventClickJavaScript="alert(e.text());" EventFontColor="White" Font-Bold="False"
                                        HeaderBackColor="236, 233, 216" HeaderFontColor="Black" InnerBorderColor="204, 204, 204"
                                        NonBusinessBackColor="#FFF4BC" OnBeforeCellRender="DayPilotMonthEvent_BeforeCellRender"
                                        OnBeforeEventRender="DayPilotMonthEvent_BeforeEventRender" OnRefresh="DayPilotMonthEvent_Refresh"
                                        OnTimeRangeSelected="DayPilotMonthEvent_TimeRangeSelected" ShowEventStartEnd="False"
                                        StartDate="" TimeRangeSelectedHandling="PostBack" WeekStarts="Sunday" 
                                        Width="100%" Height="200px" />
                                </div>
                            </ContentTemplate>
                        </cc1:TabPanel>
                    </cc1:TabContainer>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                    <p>
                    </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                </p>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
