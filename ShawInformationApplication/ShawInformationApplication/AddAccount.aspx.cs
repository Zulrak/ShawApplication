using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShawInformationApplication
{
    public partial class AddAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getAccount();
            if (Convert.ToInt32(Request.QueryString["customer_id"]) != 0 && !IsPostBack)
            { 
            txtFirstName.Text = Convert.ToString(Request.QueryString["firstName"]);
            txtLastName.Text = Convert.ToString(Request.QueryString["lastName"]);
            txtPhoneNumber.Text = Convert.ToString(Request.QueryString["customerPhoneNumber"]);
            txtAccountNumber.Text = Convert.ToString(Request.QueryString["accountNumber"]);
            txtFirstReceiver.Text = Convert.ToString(Request.QueryString["FirstReceiver"]);
            txtSecondReceiver.Text = Convert.ToString(Request.QueryString["secondReceiver"]);
            txtThirdReceiver.Text = Convert.ToString(Request.QueryString["thirdReceiver"]);
            txtFourthReceiver.Text = Convert.ToString(Request.QueryString["fourthReceiver"]);
            txtInstallerName.Text = Convert.ToString(Request.QueryString["installerName"]);
            txtClaimAmount.Text = Convert.ToString(Request.QueryString["claimAmount"]);
            
            string date = Convert.ToString(Request.QueryString["installDate"]);
            string editMonth = date.Remove(3);
            string editDay = date.Remove(0, 4);
            string editYear = date.Remove(0, 7);
            ddlDay.SelectedValue = editDay.Remove(2, 5);
            ddlMonth.SelectedValue = editMonth;
            ddlYear.SelectedValue = editYear;
            }

            // I took out the dynamically populated DDL because selected value didnt work and i got lazy
            //// populates the years dynamically, 30 years before the current year
            //int maxYears = 2099;
            //int Year;
            //for (Year = 2013; Year <= maxYears; Year++)
            //{
            //    ddlYear.Items.Add(Year.ToString());
            //}

            //int maxDays=31;
            //int day;
            //for (day = 1; day <= maxDays; day++)
            //{ 
            //    ddlDay.Items.Add(day.ToString());
            //}
        }
        protected void getAccount()
        {
            //create an instance of our Account class
            BusinessRules.CAccount objAccount = new BusinessRules.CAccount();

            //pass the id from the url to the Account class
            objAccount.Customer_id = Convert.ToInt32(Request.QueryString["customer_id"]);

            //call the getAccount method of our class
            objAccount.getAccounts();
        }


        protected void bttSubmit_Click(object sender, EventArgs e)
        {
            //create an instance of our Account class
            BusinessRules.CAccount objAccount = new BusinessRules.CAccount();

            //pass the information entered into the page into the CAccount.CS page
            objAccount.AccountNumber = Convert.ToDecimal(txtAccountNumber.Text);
            objAccount.InstallDate = (ddlMonth.SelectedValue.ToString() +"/"+ ddlDay.SelectedValue.ToString() + "/" + ddlYear.SelectedValue.ToString());
            objAccount.FirstName = txtFirstName.Text;
            objAccount.LastName = txtLastName.Text;
            objAccount.CustomerPhoneNumber = txtPhoneNumber.Text;
            objAccount.FirstReceiver = txtFirstReceiver.Text;
            objAccount.SecondReceiver = txtSecondReceiver.Text;
            objAccount.ThirdReceiver = txtThirdReceiver.Text;
            objAccount.FourthReceiver = txtFourthReceiver.Text;
            objAccount.InstallerName = txtInstallerName.Text;
            objAccount.ClaimAmount = Convert.ToDecimal(txtClaimAmount.Text);
            objAccount.Customer_id = Convert.ToInt32(Request.QueryString["customer_id"]);
            // process the saved operation
            objAccount.saveAccount();

            //redirect to the update page
            Response.Redirect("viewDatabase.aspx", false);
        
        }
    }
}