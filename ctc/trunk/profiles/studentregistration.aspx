<%@ Page Language="C#" MasterPageFile="~/ctc_info.master" AutoEventWireup="true"
    CodeFile="studentregistration.aspx.cs" Inherits="profiles_registration" Title="Student Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p id="page-header">
        Register Your Student ...</p>
    <br />
    <asp:Label ID="LabelError" runat="server" Text="All profile questions must be answered."
        Visible="False" ForeColor="Red" Font-Bold="True"></asp:Label>
    <table class="tlabel">
    <tr>
    <td>
    Please Register My Student for the Following Event:
    </td>
    </tr>
    <tr>
     <td>
               <asp:DropDownList ID="DropDownListEvent" runat="server" Width="525px">
               </asp:DropDownList>
                        
            </td>
    </tr>

    </table>
    <table class="tlabel">
        <tr class="label">
        <td>
          <%--  <td colspan="3">--%>
              <%--  <br />--%>
                Please enter your Student's CPS ID:
               <%-- <br />
                (Student ID Number found on your CPS ID card):<br />--%>
            </td>
            <td>
              Date of Birth<br />
              (MM/DD/YYYY)
            </td>
             <td>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="TextBoxCPS" runat="server" MaxLength="50"></asp:TextBox>
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatorCPS" runat="server" ErrorMessage="Your 8 Digit CPS ID is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="TextBoxCPS" />--%>
                <%--<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorCPS" />--%>
                <asp:RegularExpressionValidator ID="CPSIDVAL" ValidationExpression="\d{8}" runat="server"
                    EnableClientScript="true" ControlToValidate="TextBoxCPS" Display="None" ErrorMessage="Your 8 Digit CPS ID is required" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender2" runat="server" TargetControlID="CPSIDVAL" />
            </td>
        <%--    <td>
               <asp:DropDownList ID="DropDownListApr" runat="server" Width="200px">
               </asp:DropDownList>
                        
            </td>--%>
            <td>
                <asp:TextBox ID="DOB" runat="server" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorDOB" runat="server" ErrorMessage="Your Students Date of Birth is required information"
                Display="None" EnableClientScript="true" ControlToValidate="DOB" />
            <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtenderDOB" runat="server" TargetControlID="RequiredFieldValidatorDOB" />
                <cc1:MaskedEditExtender ID="MaskedEditExtender2" TargetControlID="DOB" MaskType="Date"
                    MessageValidatorTip="true" runat="server" Mask="99/99/9999" />
               <asp:CompareValidator id="CompareValidator1" runat="server" 
                    Type="Date" Operator="DataTypeCheck" ControlToValidate="DOB" Display="None"
                    ErrorMessage="Please enter a valid date. MM/DD/YYYY">
                    </asp:CompareValidator>
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender12" runat="server" TargetControlID="CompareValidator1" />
            </td>
        </tr>
        <tr class="label">
            <td style="height: 19px">
                Student First Name
            </td>
            <td style="height: 19px">
                Middle Name
            </td>
            <td style="height: 19px">
                Last Name
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="StuFName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorStuFname" runat="server" ErrorMessage="Your First Name is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="StuFname" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="StuFName" Display="None"
                    ErrorMessage="Please enter your First Name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender3" runat="server" TargetControlID="RequiredFieldValidatorStuFname" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender21" runat="server" TargetControlID="RegularExpressionValidator7" />
            </td>
            <td>
                <asp:TextBox ID="StuMidName" runat="server" MaxLength="30" />
            </td>
            <td>
                <asp:TextBox ID="StuLName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorStuLName" runat="server" ErrorMessage="Your Last Name is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="StuLName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="StuLName" Display="None"
                    ErrorMessage="Please enter your Last Name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender4" runat="server" TargetControlID="RequiredFieldValidatorStuLName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender22" runat="server" TargetControlID="RegularExpressionValidator8" />
            </td>
                <td>
                
            </td>
        </tr>
         <tr class="label">
            <td>
            Classroom Number / Division
            </td>
            <td>
            Grade (XX)
            </td>
            <td>
            School
            </td>
        </tr>
        <tr class= "label">
        <td>
            <asp:TextBox ID="RoomNo" runat="server" MaxLength="5" />
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatorRoomNo" runat="server" ErrorMessage="Your Student's current Division/Room Number is Required Information"
                    Display="None" EnableClientScript="true" ControlToValidate="RoomNo" />--%>
             <%--<cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender1" runat="server" TargetControlID="RequiredFieldValidatorRoomNo" />--%>
               <%-- <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtenderRoomNo" runat="server" TargetControlID="RegularExpressionValidator9" />--%>
        </td>
        <td>
          <asp:TextBox ID="Grade" runat="server" MaxLength="2" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorGrade" runat="server" ErrorMessage="Your Student's current Grade is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="Grade" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorGrade" ValidationExpression="\d{2}"
                    runat="server" EnableClientScript="true" ControlToValidate="Grade" Display="None"
                    ErrorMessage="Please enter your 2 digit grade only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender7" runat="server" TargetControlID="RequiredFieldValidatorGrade" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender23" runat="server" TargetControlID="RegularExpressionValidatorGrade" />
        </td>
        <td>
          
                 <asp:TextBox ID="School" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorSchool" runat="server" ErrorMessage="Your Student's current School is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="School" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator10" ValidationExpression="^[a-zA-Z\s\'\-]{1,100}$"
                    runat="server" EnableClientScript="true" ControlToValidate="School" Display="None"
                    ErrorMessage="Please enter your current School name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender6" runat="server" TargetControlID="RequiredFieldValidatorSchool" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender24" runat="server" TargetControlID="RegularExpressionValidator10" />
            </td>

       </tr>
       <tr class="label">
       <td>
       Home Address
       </td>
       <td>
        City 
       </td>
       <td>
       Zip
       </td>
         
       </tr>
        <tr class="label">
       
        <td>
              <asp:TextBox ID="Addr1" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Your Student's current address is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="Addr1" />
       </td>
       <td>
        <asp:TextBox ID="City" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Your Students current City is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="City" />
       </td>
       <td>
          <asp:TextBox ID="Zip" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Your Student's current Zip Code is required information"
                    Display="None" EnableClientScript="true" ControlToValidate="Zip" />
       
       </td>
     
       </tr>

      
    <tr class="label">
            <td>
               Home Phone
            </td>
            <td>
                e-Mail
            </td>
            <td>
               
            </td>
        </tr>
        <tr class="label">
            <td>
             <asp:TextBox ID="HomePhone" runat="server" MaxLength="30" />
             <asp:RegularExpressionValidator ID="HomePhoneValidator" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                    runat="server" EnableClientScript="true" ControlToValidate="HomePhone" Display="None"
                    ErrorMessage="Please enter a valid phone number ie. (773) 123-1234" />
            </td>
            <td>
                   <asp:TextBox ID="eMail" runat="server" MaxLength="30" />
           <%--     <asp:RequiredFieldValidator ID="RequiredFieldValidatoreMail" runat="server" ErrorMessage="Please Enter your E-Mail Address"
                    Display="None" EnableClientScript="true" ControlToValidate="eMail" />--%>
            <asp:RegularExpressionValidator id="regEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    Runat="server" EnableClientScript="true" ControlToValidate="eMail" Display="None"
                     ErrorMessage="Please enter a valid eMail Address ie. YourName@YourProvider.com"/> 
            </td>
           
          
        </tr>



    </table>
    <br />
        <table class="tlabel">
   <tr class="label"><td></td><td>EMERGENCY</td><td>INFORMATION</td></tr>
           <tr class="label">
            <td>
                Parent/Guardian<br />
                First Name
            </td>
            <td>
                Last Name
            </td>
            <td>
            Emergency Phone
            </td>
            <td>
            Work
            Phone         
            </td>
            <td>
            Cell 
            Phone
            </td>
            <td>
            Other
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="PGuarFName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarFName" runat="server"
                    ErrorMessage="Your Parent/Guardian's First Name is required information" Display="None"
                    EnableClientScript="true" ControlToValidate="PGuarFName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuarFName" Display="None"
                    ErrorMessage="Please enter your Parent/Guardian's First Name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender8" runat="server" TargetControlID="RequiredFieldValidatorPGuarFName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender19" runat="server" TargetControlID="RegularExpressionValidator5" />
            </td>
            <td>
                <asp:TextBox ID="PGuarLName" runat="server" MaxLength="30" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPGuarLName" runat="server"
                    ErrorMessage="Your Parent/Guardian's Last Name is required information" Display="None"
                    EnableClientScript="true" ControlToValidate="PGuarLName" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuarLName" Display="None"
                    ErrorMessage="Please enter your Parent/Guardian's Last Name only!" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender9" runat="server" TargetControlID="RequiredFieldValidatorPGuarLName" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender20" runat="server" TargetControlID="RegularExpressionValidator6" />
            </td>
            <td>
              <asp:TextBox ID="ParGuarPhone" runat="server" MaxLength="30" />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                    runat="server" EnableClientScript="true" ControlToValidate="ParGuarPhone" Display="None"
                    ErrorMessage="Please enter a valid phone number ie. (773) 123-1234" />
            </td>
             <td>
                <asp:CheckBox ID="parPhoneWork" runat="server" />
            </td>
              <td>
                <asp:CheckBox ID="parPhoneCell" runat="server" />
            </td>
              <td>
                <asp:CheckBox ID="parPhoneOther" runat="server" />
            </td>
        </tr>
        <tr class="label">
          
        </tr>
        <tr class="label">
        <td>
            Secondary Contact
         </td>
        
         </tr>
        
        <tr class="label">
            <td>
            First Name
            </td>
            <td>
             Last Name
            </td>
            <td>
            Emergency Phone
            </td>
            </tr>
      
        <tr>
            <td>
                <asp:TextBox ID="PGuar2FName" runat="server" MaxLength="30" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuar2FName" Display="None"
                    ErrorMessage="Please enter your Parent/Guardian's First Name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender11" runat="server" TargetControlID="RegularExpressionValidator1" />
            </td>
            <td>
                <asp:TextBox ID="PGuar2LName" runat="server" MaxLength="30" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="^[a-zA-Z\s\'\-]{1,30}$"
                    runat="server" EnableClientScript="true" ControlToValidate="PGuar2LName" Display="None"
                    ErrorMessage="Please enter your Parent/Guardian's Last Name only" />
                <cc1:ValidatorCalloutExtender ID="ValidatorCalloutExtender13" runat="server" TargetControlID="RegularExpressionValidator2" />
            </td>
                <td>
              <asp:TextBox ID="ParGuar2Phone" runat="server" MaxLength="30" />
             <asp:RegularExpressionValidator ID="RegularExpressionValidator11" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"
                    runat="server" EnableClientScript="true" ControlToValidate="ParGuar2Phone" Display="None"
                    ErrorMessage="Please enter a valid phone number ie. (773) 123-1234" />
            </td>
            <td>
                <asp:CheckBox ID="par2PhoneWork" runat="server"  />
            </td>
              <td>
                <asp:CheckBox ID="par2PhoneCell" runat="server" />
            </td>
              <td>
                <asp:CheckBox ID="par2PhoneOther" runat="server" />
            </td>
        </tr>
         <tr class="label">
         <td>
         </td>
         <td>
         Relationship
         </td>
         </tr>
         <tr class="label">
         <td>
         </td>
         <td>
         <asp:TextBox ID="Relation" runat="server" MaxLength="30"  />
         </td>        
         </tr>
            
   </table>
   <br />
   <table class="tlabel">
       <tr class="label"><td></td><td>MEDICAL HISTORY</td></tr>
    <tr class="label">
            <td>
            Medical Conditions <asp:CheckBox ID="medCondNo" runat="server" Text=" None"/>
           </td>
            <td>
              Medications <asp:CheckBox ID="medicationsNo" runat="server" Text=" None"/>
            </td>
            <td>
           Allergies <asp:CheckBox ID="allergiesNo" runat="server" Text=" None"/>
            </td>
        </tr>
        <tr class="label">
         <td>
            <asp:TextBox ID="MedCond" runat="server" MaxLength="50"  />
         </td>
         <td>
            <asp:TextBox ID="Medication" runat="server" MaxLength="50" />
         </td>
         <td>
            <asp:TextBox ID="Allergies" runat="server" MaxLength="50" />
         </td>
            
        </tr>
        <tr class="label">
        <td>
        Doctor's Name
        </td>
        <td>
        Phone Number
        </td>
        <td>
        Clinic Location
        </td>
        
        </tr>
       <tr class="label">
         <td>
            <asp:TextBox ID="DrName" runat="server" MaxLength="30"  />
         </td>
         <td>
            <asp:TextBox ID="DrPhone" runat="server" MaxLength="30" />
         </td>
         <td>
            <asp:TextBox ID="ClinLoc" runat="server" MaxLength="30" />
         </td>
         </tr>
    </table>
    <br />
    <table class="tlabel">
    <tr>
                <td style="width: 91px">
                </td>
                <td style="width: 120px" align="right">
                    <asp:Label ID="Label5" runat="server" AssociatedControlID="TextBoxRegistrationComment" Text="Registration Comment:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBoxRegistrationComment" runat="server" TextMode="MultiLine" Width="428px"
                        Height="76px"></asp:TextBox>
                </td>
            </tr>
    
    
    
    
    </table>

    <%--<asp:Literal ID="LiteralForm" runat="server"></asp:Literal>
    <asp:PlaceHolder ID="PlaceHolderForm" runat="server"></asp:PlaceHolder>--%>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <br />
    <center>
        <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" />
    </center>
</asp:Content>
