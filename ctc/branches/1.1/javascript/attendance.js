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

                vselected = document.getElementById("ctl00_ContentPlaceHolder1_Attendance_TabPanelParents_ListBoxAvailableFamily").value;
                if (vselected != '') {
                    window.open('/CTC/info/studentview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                }
            }

            if (field == 'sf') {

                vselected = document.getElementById("ctl00_ContentPlaceHolder1_Attendance_TabPanelParents_ListBoxSelectedFamily").value;
                if (vselected != '') {
                    window.open('/CTC/info/studentview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                }
            }

            if (field == 'astaff') {

                vselected = document.getElementById("ctl00_ContentPlaceHolder1_Attendance_TabPanelFacilitators_ListBoxAvailableStaff").value;
                if (vselected != '') {
                    window.open('/CTC/info/studentview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                }
            }

            if (field == 'sstaff') {

                vselected = document.getElementById("ctl00_ContentPlaceHolder1_Attendance_TabPanelFacilitators_ListBoxSelectedStaff").value;
                if (vselected != '') {
                    window.open('/CTC/info/studentview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                }
            }

            if (field == 'sfacil') {

                vselected = document.getElementById("ctl00_ContentPlaceHolder1_Attendance_TabPanelFacilitators_ListBoxSelectedFacilitator").value;
                if (vselected != '') {
                    window.open('/CTC/info/studentview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                }
            }

            if (field == 'av') {

                vselected = document.getElementById("ctl00_ContentPlaceHolder1_Attendance_TabPanelVolunteers_ListBoxAvailableVolunteers").value;
                if (vselected != '') {
                    window.open('/CTC/info/studentview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                }
            }

            if (field == 'sv') {

                vselected = document.getElementById("ctl00_ContentPlaceHolder1_Attendance_TabPanelVolunteers_ListBoxSelectedVolunteers").value;
                if (vselected != '') {
                    window.open('/CTC/info/studentview.aspx?ID=' + vselected, '_blank', 'fullscreen=no,status=yes,toolbar=yes,menubar=yes,location=no, resizable=yes, scrollbars=yes');
                }
            }

        }
        </script>