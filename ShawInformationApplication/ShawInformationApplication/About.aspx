<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="ShawInformationApplication.About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Dr.Computer Logick's
    </h2>
    <p>Location: <asp:HyperLink runat="server"  Target="_blank" NavigateUrl="https://maps.google.ca/maps?q=169+bayfield+street&ie=UTF-8&hq=&hnear=0x882aa327f09fce65:0xc1bdc543be33c1f1,169+Bayfield+St,+Barrie,+ON+L4M+2B7&gl=ca&ei=pgBgUqblEs_eyQGEnIDoCQ&ved=0CCkQ8gEwAA">169 Bayfeild Street Barrie Ontario</asp:HyperLink></p>
    <h3>About the Owner</h3>
    <p>
        Owner: Rob Smith
        <br/>
        Telephone: (705)726-4063
        <br/>
        Fax: (705)721-5767
        <br/>
        Email: <a href="mailto:drlogick@drlogick.com">drlogick@drlogick.com</a>
    </p>
    <h3>About The Application</h3>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp; This application allows the user to input information about 
        the shaw clients for UltraFast wireless. The user can then view the data and 
        make changes through the SHAW tab and save the data as an Excel file. Currently 
        there is no security on the page due to the fact that it is only hosted locally 
        not on the web.
    </p>
    <h3>About the Developer</h3>
    <p>

        Name: Jordan Cooper
        <br/>
        Email: doesnt matter, I don't check my email.
        <br/>
        Telephone: Yeah same thing.... I don't check my calls or voicemails
        <br/>
        Repair Hours: Monday-Friday until December 20th 

    </p>
</asp:Content>
