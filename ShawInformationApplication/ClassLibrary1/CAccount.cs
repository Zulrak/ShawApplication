using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Security.Cryptography;

//we need system.config for it to read web.config AND ADD IT IN REFERENCES ->
using System.Configuration;

namespace BusinessRules
{
    public class CAccount
    {
        //create some properties based on the database columns
        private string mSelectType;
        private string mName;
        private int mType;
        private int mCustomer_id;
        private string mMonth;
        private int mYear;
        private string mInstallDate;
        private string mFirstName;
        private string mLastName;
        private string mCustomerPhoneNumber;
        private decimal  mAccountNumber;
        private string mFirstReceiver;
        private string mSecondReceiver;
        private string mThirdReceiver;
        private string mFourthReceiver;
        private string mInstallerName;
        private decimal mClaimAmount;

        public string SelectType
        {
            get { return mSelectType; }
            set { mSelectType = value; }
        }

        public string Name
        {
            get { return mName; }
            set { mName = value; }
        }

        public int Type
        {
            get { return mType; }
            set { mType = value; }
        }

        public int Customer_id
        {
            get { return mCustomer_id; }
            set { mCustomer_id = value; }
        }

        public string Month
        {
            get { return mMonth; }
            set { mMonth = value; }
        }

        public int Year
        {
            get { return mYear; }
            set { mYear = value; }
        }

        public string InstallDate
        {
            get { return mInstallDate; }
            set { mInstallDate = value; }
        }

        public string FirstName
        {
            get { return mFirstName; }
            set { mFirstName = value; }
        }

        public string LastName
        {
            get { return mLastName; }
            set { mLastName = value; }
        }

        public string CustomerPhoneNumber
        {
            get { return mCustomerPhoneNumber; }
            set { mCustomerPhoneNumber = value; }
        }

        public decimal AccountNumber
        {
            get { return mAccountNumber; }
            set { mAccountNumber = value; }
        }

        public string FirstReceiver
        {
            get { return mFirstReceiver; }
            set { mFirstReceiver = value; }
        }

        public string SecondReceiver
        {
            get { return mSecondReceiver; }
            set { mSecondReceiver = value; }
        }

        public string ThirdReceiver
        {
            get { return mThirdReceiver; }
            set { mThirdReceiver = value; }
        }

        public string FourthReceiver
        {
            get { return mFourthReceiver; }
            set { mFourthReceiver = value; }
        }

        public string InstallerName
        {
            get { return mInstallerName; }
            set { mInstallerName = value; }
        }

        public decimal ClaimAmount
        {
            get { return mClaimAmount; }
            set { mClaimAmount = value; }
        }


        //create some variables we will need for any data access
        private SqlConnection objConn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["strConn"].ConnectionString);
        private SqlCommand objCmd;


        //write a function to retrieve the Client list
        public SqlDataReader getAccounts()
        {
            //instantiate our connection
            objConn.Open();
            if (SelectType == null)
            {
                SelectType ="firstName";
            }
            //This select statement runs when the user hits the get info button the table is then altered in the C# code to display all or some of the columns
            // the year and month are selected on the ddls in view database and then passed in here to finish the where clause in the select statement.
            if (Type == 0) // if the type is zero (meaning that you have selected the edit dropdown) select the raw data
            {
                objCmd = new SqlCommand("SELECT  customer_ID, installDate AS 'InstallDate', firstName AS 'FirstName', lastName AS 'LastName'," +
                "customerPhoneNumber AS 'customerPhoneNumber'," +
                "accountnumber AS 'AccountNumber'," +
                "firstReceiver AS 'FirstReceiver'," +
                "secondReceiver AS 'SecondReceiver'," +
                "thirdReceiver AS 'ThirdReceiver'," +
                "fourthReceiver AS 'FourthReceiver'," +
                "installerName AS 'InstallerName', claimAmount AS 'ClaimAmount'" +
                "FROM shawInformation " +
                "WHERE " + SelectType + " LIKE '%" + Name + "%' AND installDate LIKE '%" + Month + "%" + Year + "%'", objConn);
            }
            else // select the formatted select statement for viewing and exporting to excel.
            {
                objCmd = new SqlCommand("SELECT  customer_ID, installDate AS 'InstallDate', firstName AS 'FirstName', (firstName +' '+ lastName) AS 'LastName'," +
                "SUBSTRING(accountnumber,0,4) +' '+ SUBSTRING(accountnumber,4,4) +' '+ SUBSTRING(accountnumber,8,4) +' '+ SUBSTRING(accountnumber,12,4) AS 'AccountNumber'," +
                "SUBSTRING(customerPhoneNumber,1,3) +'-'+ SUBSTRING(customerPhoneNumber,4,3) +'-'+ SUBSTRING(customerPhoneNumber,7,4) AS 'customerPhoneNumber',"+
                "SUBSTRING(firstReceiver,0,5) +' '+ SUBSTRING(firstReceiver,5,4) +' '+ SUBSTRING(firstReceiver,9,4) +' '+ SUBSTRING(firstReceiver,13,4) AS 'FirstReceiver'," +
                "SUBSTRING(secondReceiver,0,5) +' '+ SUBSTRING(secondReceiver,5,4) +' '+ SUBSTRING(secondReceiver,9,4) +' '+ SUBSTRING(secondReceiver,13,4) AS 'SecondReceiver'," +
                "SUBSTRING(thirdReceiver,0,5) +' '+ SUBSTRING(thirdReceiver,5,4) +' '+ SUBSTRING(thirdReceiver,9,4) +' '+ SUBSTRING(thirdReceiver,13,4) AS 'ThirdReceiver'," +
                "SUBSTRING(fourthReceiver,0,5) +' '+ SUBSTRING(fourthReceiver,5,4) +' '+ SUBSTRING(fourthReceiver,9,4) +' '+ SUBSTRING(fourthReceiver,13,4) AS 'FourthReceiver'," +
                "installerName AS 'InstallerName', claimAmount AS 'ClaimAmount'"+
                "FROM shawInformation "+
                "WHERE " + SelectType + " LIKE '%" + Name + "%' AND installDate LIKE '%" + Month + "%" + Year + "%'", objConn);
            }



            //execute the command and store the results in an SqlDataReader
            SqlDataReader objRdr;
            objRdr = objCmd.ExecuteReader();

            //send the datareader to the code that called this function
            return objRdr;
        }

        public void saveAccount()
        {
            //loop up a Account based on their ID
            objConn.Open();

            string strSQL = " ";
            // if the customer id is 0, meaning that its a new account then do an insert statement
            if (Customer_id == 0)
            {
                strSQL = "INSERT INTO shawInformation(installDate,firstName,lastName,customerPhoneNumber," +
                                                     "accountNumber,firstReceiver,secondReceiver,thirdReceiver,fourthReceiver" +
                                                     ",installerName,claimAmount)" +
                         "VALUES('" + InstallDate + "','" + FirstName + "','" + LastName + "','" + CustomerPhoneNumber + "'," +
                                "'" + AccountNumber + "','" + FirstReceiver + "','" + SecondReceiver + "','" + ThirdReceiver + "','" + FourthReceiver + "'" +
                                ",'" + InstallerName + "'," + ClaimAmount + ")";
            }
            else // if the customer id is not zero, meaning that this is an edit, do an update statement instead
            {
                strSQL = "UPDATE shawInformation SET installDate = '"+ InstallDate +"',firstName = '"+ FirstName +"',lastName = '"+ LastName +"'," +
                "customerPhoneNumber = '"+ CustomerPhoneNumber +"',accountNumber = '"+ AccountNumber +"',firstReceiver = '"+ FirstReceiver +"',"+
                "secondReceiver = '"+ SecondReceiver +"',thirdReceiver = '"+ ThirdReceiver +"',fourthReceiver = '"+ FourthReceiver +"',installerName = '"+ InstallerName +"',claimAmount = '"+ ClaimAmount +"' "+
                "WHERE customer_ID='"+ Customer_id +"'";
            }


            // create a new command object to run the sql statement
            objCmd = new SqlCommand(strSQL, objConn);
            objCmd.ExecuteNonQuery();

            objCmd.Dispose();
            objConn.Close();

        }

        public void deleteAccount()
        {
            //loop up a Account based on their ID
            objConn.Open();

            string strSQL;
            // this statement will delete a row in the database that has the account number chosen by the delete button you clicked

            strSQL = "DELETE FROM shawinformation WHERE customer_Id = " + Customer_id.ToString();

            // create a new command object to run the sql statement
            objCmd = new SqlCommand(strSQL, objConn);
            objCmd.ExecuteNonQuery();

            objCmd.Dispose();
            objConn.Close();
        }
    }
}