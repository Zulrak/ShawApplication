<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewDatabase.aspx.cs" Inherits="ShawInformationApplication.viewDatabase" enableEventValidation ="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:HyperLink ID="HLAddAccount" runat="server" NavigateUrl="AddAccount.Aspx">Add An Account</asp:HyperLink>
    </div>

    <h3>Search For Customers</h3>

        <asp:Panel ID="Panel1" runat="server" Height=100%  Width="100%">   
        <div>
            <label runat="server" CssClass="label" for="ddlType">View State:</label>
            <asp:DropDownList ID="ddlType" runat="server" CssClass="dropdown">
                <asp:ListItem Value="Edit">Edit</asp:ListItem>
                <asp:ListItem Value="DrLogicks">Dr.Logicks</asp:ListItem>
                <asp:ListItem Value="Shaw">Shaw</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div> 
             <label id="Label1" runat="server" CssClass="label2" for="ddlMonth">Date(M/Y):</label>
             <asp:DropDownList ID="ddlMonth" runat="server" CssClass="dropdown" >
                <asp:ListItem Value="">All</asp:ListItem>
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
            <asp:DropDownList ID="ddlYear" runat="server" CssClass="dropdown">
                <asp:ListItem Value="2">All</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div>
            <label id="Label2" runat="server" CssClass="label" for="ddlSearchType">Targeted Search:</label>
            <asp:DropDownList ID="ddlSearchType" runat="server" CssClass="dropdown">
                <asp:ListItem Value="firstName">First Name</asp:ListItem>
                <asp:ListItem Value="lastName">Last Name</asp:ListItem>
                <asp:ListItem Value="customerPhoneNumber">Phone Number</asp:ListItem>
                <asp:ListItem Value="accountNumber">Account Number</asp:ListItem>
            </asp:DropDownList>
            :
            <asp:TextBox ID="txtCustomerName" runat="server" CssClass="textBox" ></asp:TextBox>
         </div>
        

        <asp:Button ID="bttnPopDatabase" runat="server" text="Search" 
        onclick="bttnPopDatabase_Click" />

        </asp:Panel>
   
    <div>
        <h1>Shaw Accounts</h1>
        <asp:gridview id="gvAccounts" runat="server" autogeneratecolumns="false"
            DataKeyNames="customer_Id" 
            OnRowDeleting="gvAccounts_RowDeleting" 
            onrowdatabound="gvAccounts_RowDataBound" BorderStyle="Solid" 
            CellPadding="5" CellSpacing="5" CssClass="customGridview">
            <RowStyle CssClass="gvRowColor" Wrap="false" />

            <AlternatingRowStyle CssClass="gvAltRowColor" />
            <columns>
                <asp:boundfield headertext="Customer ID" datafield="customer_Id"/>
                <asp:boundfield headertext="Install Date" datafield="installDate"/>
                <asp:boundfield headertext="Account Number" datafield="accountNumber" />
                <asp:boundfield headertext="First Name" datafield="firstName"/>
                <asp:boundfield headertext="Last Name" datafield="lastName" />
                <asp:boundfield headertext="Phone Number" datafield="customerPhoneNumber" />
                <asp:boundfield headertext="First Receiver" datafield="FirstReceiver" />
                <asp:boundfield headertext="Second Receiver" datafield="secondReceiver" />
                <asp:boundfield headertext="Third Receiver" datafield="thirdReceiver" />
                <asp:boundfield headertext="Fourth Receiver" datafield="fourthReceiver" />
                <asp:boundfield headertext="Installer" datafield="installerName" />
                <asp:boundfield headertext="Claim Amount" datafield="claimAmount" />
                <asp:hyperlinkfield headertext="Edit" text="Edit" navigateurl="AddAccount.aspx"
                    datanavigateurlfields="customer_Id,installDate,firstName,lastName,customerPhoneNumber,accountNumber,FirstReceiver,secondReceiver,thirdReceiver,fourthReceiver,installerName,claimAmount"
                    datanavigateurlformatstring="AddAccount.aspx?customer_Id={0}&installDate={1}&firstName={2}&lastName={3}&customerPhoneNumber={4}&accountNumber={5}&FirstReceiver={6}&secondReceiver={7}&thirdReceiver={8}&fourthReceiver={9}&installerName={10}&claimAmount={11}"/>
                <asp:CommandField DeleteText="Delete" ShowDeleteButton="true" HeaderText="Delete" />
            </columns>
        </asp:gridview>
    </div>
        <asp:Button ID="bttnSqlStatement" runat="server" Text="Save"
         onclick="bttnSqlStatement_Click"/>
    <div>
        <asp:Label ID="LblSql" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>
