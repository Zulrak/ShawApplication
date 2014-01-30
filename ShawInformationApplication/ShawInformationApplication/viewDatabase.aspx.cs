using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ShawInformationApplication
{
    public partial class viewDatabase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bttnSqlStatement.Visible = false;
            if (IsPostBack == false)
            {
                // populates the years dynamically, 30 years before the current year

                int maxYears = 2099;
                int Year;
                for (Year = 2013; Year <= maxYears; Year++)
                {
                    ddlYear.Items.Add(Year.ToString());
                }
            }
        }

        protected void getAccounts()
        {
            //instantiate an instance of the supplier class
            BusinessRules.CAccount objAccount = new BusinessRules.CAccount();

            //pass the values of month and year into the business rules/CAccount 
            objAccount.Month = ddlMonth.SelectedValue;
            objAccount.Year = Convert.ToInt16(ddlYear.SelectedValue);
            objAccount.Type = ddlType.SelectedIndex;
            objAccount.SelectType = ddlSearchType.SelectedValue;
            objAccount.Name = txtCustomerName.Text;
            //call the get suppliers function and bind the datareader result to the grid
            gvAccounts.DataSource = objAccount.getAccounts();
            gvAccounts.DataBind();
        }

        protected void gvAccounts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //instantiate an instance of the CAccount class
            BusinessRules.CAccount objAccount = new BusinessRules.CAccount();

            objAccount.Customer_id = Convert.ToInt32(gvAccounts.DataKeys[e.RowIndex].Values["customer_Id"]);

            objAccount.deleteAccount();
            // update the grid
            getAccounts();
        }

        protected void gvAccounts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //this event fires as each row is added to the grid
            e.Row.Cells[13].Attributes.Add("onClick", "return confirm('Are you sure?');");
            
            //This will remove the tables when the user is on Shaw view. 
            if (ddlType.SelectedIndex == 2)
            {
                e.Row.Cells[0].Visible = false;//customer_id (used for delete statement, so we can format the account number)
                e.Row.Cells[1].Visible = false;//install date
                e.Row.Cells[3].Visible = false;
                e.Row.Cells[8].Visible = false;//third receiver
                e.Row.Cells[9].Visible = false;//fourth receiver
                e.Row.Cells[10].Visible = false;//installer name
                e.Row.Cells[12].Visible = false;//edit
                e.Row.Cells[13].Visible = false;//delete
            }
            // this will remove the edit delete and customer ID from the dr.logicks selection
            else if (ddlType.SelectedIndex == 1)
            {
                e.Row.Cells[0].Visible = false;//customer_id (used for delete statement, so we can format the account number)
                e.Row.Cells[12].Visible = false;//edit
                e.Row.Cells[13].Visible = false;//delete
            }

        }

        protected void bttnPopDatabase_Click(object sender, EventArgs e)
        {
            getAccounts();// perform the getAccounts function in this class
            bttnSqlStatement.Visible = true;

        }

        protected void bttnSqlStatement_Click(object sender, EventArgs e)
        {
            // Thanks to these gus for their comments and tutorials which provided the information and
            // code for exporting to an excel file.
            //http://csharp-video-tutorials.blogspot.ca/2013/04/export-gridview-to-excel-in-aspnet-part.html
            //http://www.aspsnippets.com/Articles/RegisterForEventValidation-can-only-be-called-during-Render.aspx
            // clear content from the response buffers
            Response.ClearContent();
            // where are we sending the data?
            Response.AppendHeader("Content-Disposition","Attachment; Filename="+ddlType.SelectedValue+"_"+ddlMonth.SelectedValue+"_"+ddlYear.SelectedValue+".xls");
            Response.ContentType = "application/excel";

            StringWriter stringWriter = new StringWriter();
            HtmlTextWriter htmlTextWriter = new HtmlTextWriter(stringWriter);

            gvAccounts.RenderControl(htmlTextWriter);
            Response.Write(stringWriter.ToString());
            Response.End();

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }
    }
}