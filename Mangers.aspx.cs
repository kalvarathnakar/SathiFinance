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
    public partial class WebForm3 : System.Web.UI.Page
    {
        THFinanceEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                db = new THFinanceEntities();
                var countryQuery = (from c in db.tbl_branches
                                   select c).ToList();
                ddl_branch.DataValueField = "branchid";
                ddl_branch.DataTextField = "branchName";
               
                ddl_branch.DataSource = countryQuery;
                ddl_branch.DataBind();
                ddl_branch.Items.Insert(0, new ListItem("select", "0"));
                loadgrid();
            }
        }

        public void loadgrid()
        {
            var query = (from t1 in db.tbl_managers
                        join t2 in db.tbl_branches on t1.mgbrnch_id equals t2.branchid
                        select new { t1.manager_name, t2.branchName }).ToList();
            grdManager.DataSource = query;
            grdManager.DataBind();
        }
        protected void btn_managers_Click(object sender, EventArgs e)
        {
            db = new THFinanceEntities();
            tbl_managers tbl = new tbl_managers();
            tbl.mgbrnch_id = Convert.ToInt32(ddl_branch.SelectedValue);
            tbl.manager_name = txt_manager.Text;
            db.tbl_managers.Add(tbl);
            db.SaveChanges();
        }
    }
}