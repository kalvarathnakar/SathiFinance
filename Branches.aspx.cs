using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using THFinance;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;


namespace THFinance
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        THFinanceEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadgrid();
                grdBranch.UseAccessibleHeader = true;
                grdBranch.HeaderRow.TableSection = TableRowSection.TableHeader;

            }

        }

        public void loadgrid()
        {
            db = new THFinanceEntities();
            var qry = from s in db.tbl_branches
                      select s;
            grdBranch.DataSource = qry.ToList();
            grdBranch.DataBind();
        }
        protected void btn_brnach_Click(object sender, EventArgs e)
        {
            db = new THFinanceEntities();
            tbl_branches tbl = new tbl_branches();
            tbl.branchName = txt_branch.Text;
            var qry = (from s in db.tbl_branches
                       select s);
          
            if (qry.Count() > 0)
            {
               
                for (int i = 0;  i<qry.Count();i++)
                {
                    var query = qry.ToList();
                    string prev = query[i].branchName;
                    var present = txt_branch.Text;

                    if(prev == present)
                    {
                        Response.Write("<script>alert('Branch Name already Exist');</script>");
                        return;
                    }
                    else
                    {
                        db.tbl_branches.Add(tbl);
                        db.SaveChanges();
                        loadgrid();
                        return;
                    }
                       
                }

            }

            db.tbl_branches.Add(tbl);
            db.SaveChanges();
            loadgrid();

        }
    }
}