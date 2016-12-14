using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THFinance
{
   
    public partial class PayeeDetails : System.Web.UI.Page
    {
        THFinanceEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                db = new THFinanceEntities();
                var query = (from s in db.tbl_payee
                             select new { s.name, s.ID }).ToList();
                ddl_payeeName.DataTextField = "name";
                ddl_payeeName.DataValueField = "ID";
                ddl_payeeName.DataSource = query;
                ddl_payeeName.DataBind();
                ddl_payeeName.Items.Insert(0, new ListItem("select", "0"));
            }

        }

        protected void ddl_payeeName_SelectedIndexChanged(object sender, EventArgs e)
        {
            db = new THFinanceEntities();
            int id = Convert.ToInt32(ddl_payeeName.SelectedValue);
            var q = (from s in db.tbl_payment
                     join t1 in db.tbl_chitti on s.paymentmethod equals t1.CHITTI_ID
                     where s.name.Equals(id) 
                     select new {s.totalPayment,s.presentDate,s.paidAmount,s.remainingAmount,s.remainingdays, t1.CHITTI_NAME }).ToList();
            grdpayeeDetails.DataSource = q;
            grdpayeeDetails.DataBind();
        }
    }
}