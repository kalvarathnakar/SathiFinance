using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace THFinance
{
    public partial class PaymentMethod : System.Web.UI.Page
    {
        THFinanceEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadgrid();
            }

        }
        public void loadgrid()
        {
            db = new THFinanceEntities();
            var query = (from s in db.tbl_chitti
                         select s).ToList();
            grdPayment.DataSource=query;
            grdPayment.DataBind();
        }
        protected void btn_payment_Click(object sender, EventArgs e)
        {
            db = new THFinanceEntities();
            tbl_chitti tbl = new tbl_chitti();
            tbl.CHITTI_NAME = txt_payment.Text;
            db.tbl_chitti.Add(tbl);
            db.SaveChanges();
            loadgrid();
        }
    }
}