<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="ShawInformationApplication.AddAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h3> Add A Client to the Shaw Database </h3>

<!-- The Install date, day and year ddl were created this way so that the selected value would work to create dynamically see C# code comments-->
<div>
    <label for="txtInstallDate">Install Date:</label>
            <asp:DropDownList ID="ddlMonth" runat="server" CssClass="dropdown">
            <asp:ListItem Value="Jan">January</asp:ListItem>
            <asp:ListItem Value="Feb">Febuary</asp:ListItem>
            <asp:ListItem Value="Mar">March</asp:ListItem>
            <asp:ListItem Value="Apr">April</asp:ListItem>
            <asp:ListItem Value="May">May</asp:ListItem>
            <asp:ListItem Value="Jun">June</asp:ListItem>
            <asp:ListItem Value="Jul">July</asp:ListItem>
            <asp:ListItem Value="Aug">August</asp:ListItem>
            <asp:ListItem Value="Sep">September</asp:ListItem>
            <asp:ListItem Value="Oct">October</asp:ListItem>
            <asp:ListItem Value="Nov">November</asp:ListItem>
            <asp:ListItem Value="Dec">December</asp:ListItem>
        </asp:DropDownList>
        
        <asp:DropDownList ID="ddlDay" runat="server" CssClass="dropdown">
            <asp:ListItem Value="01">1</asp:ListItem>
            <asp:ListItem Value="02">2</asp:ListItem>
            <asp:ListItem Value="03">3</asp:ListItem>
            <asp:ListItem Value="04">4</asp:ListItem>
            <asp:ListItem Value="05">5</asp:ListItem>
            <asp:ListItem Value="06">6</asp:ListItem>
            <asp:ListItem Value="07">7</asp:ListItem>
            <asp:ListItem Value="08">8</asp:ListItem>
            <asp:ListItem Value="09">9</asp:ListItem>
            <asp:ListItem Value="10">10</asp:ListItem>
            <asp:ListItem Value="11">11</asp:ListItem>
            <asp:ListItem Value="12">12</asp:ListItem>
            <asp:ListItem Value="13">13</asp:ListItem>
            <asp:ListItem Value="14">14</asp:ListItem>
            <asp:ListItem Value="15">15</asp:ListItem>
            <asp:ListItem Value="16">16</asp:ListItem>
            <asp:ListItem Value="17">17</asp:ListItem>
            <asp:ListItem Value="18">18</asp:ListItem>
            <asp:ListItem Value="19">19</asp:ListItem>
            <asp:ListItem Value="20">20</asp:ListItem>
            <asp:ListItem Value="21">21</asp:ListItem>
            <asp:ListItem Value="21">22</asp:ListItem>
            <asp:ListItem Value="23">23</asp:ListItem>
            <asp:ListItem Value="24">24</asp:ListItem>
            <asp:ListItem Value="25">25</asp:ListItem>
            <asp:ListItem Value="26">26</asp:ListItem>
            <asp:ListItem Value="27">27</asp:ListItem>
            <asp:ListItem Value="28">28</asp:ListItem>
            <asp:ListItem Value="29">29</asp:ListItem>
            <asp:ListItem Value="30">30</asp:ListItem>
            <asp:ListItem Value="31">31</asp:ListItem>
        </asp:DropDownList>
        
        <asp:DropDownList ID="ddlYear" runat="server" CssClass="dropdown">
            <asp:ListItem Value="2013">2013</asp:ListItem>
            <asp:ListItem Value="2014">2014</asp:ListItem>
            <asp:ListItem Value="2015">2015</asp:ListItem>
            <asp:ListItem Value="2016">2016</asp:ListItem>
            <asp:ListItem Value="2017">2017</asp:ListItem>
            <asp:ListItem Value="2018">2018</asp:ListItem>
            <asp:ListItem Value="2019">2019</asp:ListItem>
            <asp:ListItem Value="2020">2020</asp:ListItem>
            <asp:ListItem Value="2021">2021</asp:ListItem>
            <asp:ListItem Value="2022">2022</asp:ListItem>
            <asp:ListItem Value="2023">2023</asp:ListItem>
            <asp:ListItem Value="2024">2024</asp:ListItem>
            <asp:ListItem Value="2025">2025</asp:ListItem>
            <asp:ListItem Value="2026">2026</asp:ListItem>
            <asp:ListItem Value="2027">2027</asp:ListItem>
            <asp:ListItem Value="2028">2028</asp:ListItem>
            <asp:ListItem Value="2029">2029</asp:ListItem>
            <asp:ListItem Value="2030">2030</asp:ListItem>
            <asp:ListItem Value="2031">2031</asp:ListItem>
            <asp:ListItem Value="2032">2032</asp:ListItem>
            <asp:ListItem Value="2033">2033</asp:ListItem>
            <asp:ListItem Value="2034">2034</asp:ListItem>
            <asp:ListItem Value="2035">2035</asp:ListItem>
            <asp:ListItem Value="2036">2036</asp:ListItem>
            <asp:ListItem Value="2037">2037</asp:ListItem>
            <asp:ListItem Value="2038">2038</asp:ListItem>
            <asp:ListItem Value="2039">2039</asp:ListItem>
            <asp:ListItem Value="2040">2040</asp:ListItem>
        </asp:DropDownList>

</div>
<!--These feilds are populated from the query string if and edit is selected. else they are blank-->
<div>
    <label for="txtFirstName" CssClass="label">First Name:</label>
    <asp:TextBox ID="txtFirstName" runat="server" CssClass="textBox"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RfvFirstName" runat="server" 
        ControlToValidate="txtFirstName" CssClass="failureNotification" 
        Display="Dynamic" ErrorMessage="Please Enter a First Name."></asp:RequiredFieldValidator>
</div>

<div>
    <label for="txtLastName" CssClass="label">Last Name:</label>
    <asp:TextBox ID="txtLastName" runat="server" CssClass="textBox"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RfvLastName" runat="server" 
        ControlToValidate="txtLastName" CssClass="failureNotification" 
        Display="Dynamic" ErrorMessage="Please Enter a Last Name."></asp:RequiredFieldValidator>
</div>

<div>
    <label for="txtPhoneNumber" CssClass="label">Phone Number:</label>
    <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="textBox"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RfvPhoneNumber" runat="server" 
        ControlToValidate="txtPhoneNumber" CssClass="failureNotification" 
        Display="Dynamic" ErrorMessage="Please Enter a Phone Number."></asp:RequiredFieldValidator>
</div>

<div>
    <label for="txtAccountNumber" CssClass="label">Account Number:</label>
    <asp:TextBox ID="txtAccountNumber" runat="server" CssClass="textBox"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RfvAccountNumber" runat="server" 
        ControlToValidate="txtAccountNumber" CssClass="failureNotification" 
        Display="Dynamic" ErrorMessage="Please Enter The Customer's Client Number."></asp:RequiredFieldValidator>
</div>

<div>
    <label for="txtFirstReceiver" CssClass="label">First Receiver:</label>
    <asp:TextBox ID="txtFirstReceiver" runat="server" CssClass="textBox"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RfvFirstReceiver" runat="server" 
        ControlToValidate="txtFirstReceiver" CssClass="failureNotification" 
        Display="Dynamic" ErrorMessage="Please Enter The Customer's Reciever Number."></asp:RequiredFieldValidator>
</div>

<div>
    <label for="txtSecondReceiver" CssClass="label" >Second Receiver:</label>
    <asp:TextBox ID="txtSecondReceiver" runat="server" CssClass="textBox"></asp:TextBox>
</div>

<div>
    <label for="txtThirdReceiver" CssClass="label">Third Receiver:</label>
    <asp:TextBox ID="txtThirdReceiver" runat="server" CssClass="textBox"></asp:TextBox>
</div>

<div>
    <label for="txtFourthReceiver" CssClass="label">Fourth Receiver:</label>
    <asp:TextBox ID="txtFourthReceiver" runat="server" CssClass="textBox"></asp:TextBox>
</div>

<div>
    <label for="txtInstallerName" CssClass="label">Installer Name:</label>
    <asp:TextBox ID="txtInstallerName" runat="server" CssClass="textBox"></asp:TextBox>
</div>


<div>
    <label for="txtClaimAmount" CssClass="label">Claim Amount:</label>
    <asp:TextBox ID="txtClaimAmount" runat="server" CssClass="textBox"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RfvClaimAmount" runat="server" 
        ControlToValidate="txtClaimAmount" CssClass="failureNotification" 
        Display="Dynamic" ErrorMessage="Please Enter The Claim Amount."></asp:RequiredFieldValidator>
</div>

<asp:Button ID="bttSubmit" runat="server" Text="Submit" onclick="bttSubmit_Click"/>
</asp:Content>
