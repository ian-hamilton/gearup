<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sidebar.ascx.cs" Inherits="controls_sidebar" %>
   <div id="sidebar" >    
        <h2>Application Links</h2>               
            <asp:PlaceHolder ID="PlaceHolder1AppLinks" runat="server"></asp:PlaceHolder>               
           
            <h2> Links</h2>            
            <asp:PlaceHolder ID="PlaceHolderRemoteLinks" runat="server"></asp:PlaceHolder>
                
            <h2> Quote of the Week</h2>
            <asp:PlaceHolder ID="PlaceHolderQuoteOfTheWeek" runat="server"></asp:PlaceHolder>
            
             <h2> Cita de la semana</h2>
            <asp:PlaceHolder ID="PlaceHolderCitadelasemana" runat="server"></asp:PlaceHolder>
    </div>

