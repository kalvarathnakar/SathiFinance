using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THFinance
{
    public partial class Payement : System.Web.UI.Page
    {
        THFinanceEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                db = new THFinanceEntities();
                var query = (from s in db.tbl_payee
                             select s).ToList();
                ddl_payeename.DataTextField = "name";
                ddl_payeename.DataValueField = "ID";
                ddl_payeename.DataSource = query;
                ddl_payeename.DataBind();
                ddl_payeename.Items.Insert(0, new ListItem("select", "0"));
                var countryQuery1 = (from a in db.tbl_chitti
                                     select a).ToList();
                ddl_chitti.DataValueField = "CHITTI_ID";
                ddl_chitti.DataTextField = "CHITTI_NAME";

                ddl_chitti.DataSource = countryQuery1;
                ddl_chitti.DataBind();
                ddl_chitti.Items.Insert(0, new ListItem("select", "0"));
            }
        }

        protected void btn_payee_Click(object sender, EventArgs e)
        {
            db = new THFinanceEntities();
            tbl_payment tbl = new tbl_payment();
            tbl_payee tbl2 = new tbl_payee();
          

           
            tbl.managerId = Convert.ToInt32(ddl_manager.SelectedValue);
            tbl.branchId = Convert.ToInt32(ddl_branch.SelectedValue);
            tbl.paymentmethod = Convert.ToInt32(ddl_chitti.SelectedValue);
            tbl.prepayDate = Convert.ToDateTime(txt_startdate.Text);
            tbl.presentDate = Convert.ToDateTime(txt_enddate.Value);
            tbl.paidAmount = Convert.ToInt32(txt_paidAmount.Text);
            tbl.remainingAmount = Convert.ToInt32(txt_remainingAmount.Text);
            tbl.name = Convert.ToInt32(ddl_payeename.SelectedValue);
            tbl.totalPayment = Convert.ToInt32(txt_amount.Value);
            var ts = (from t in db.tbl_payee
                      where t.ID.Equals(tbl.name)
                      select t).ToList();

            // TimeSpan ts = tbl.presentDate - tbl.prepayDate;
            if (tbl.prepayDate.ToShortDateString() == tbl.presentDate.ToShortDateString())
            {
                Response.Write("<script>alert('please select diffrent date')</script>");
                return;
            }
            int count  = (tbl.presentDate - tbl.prepayDate).Days;
            tbl.remainingdays =(100- (tbl.presentDate-ts[0].startdate ).Days )+ "/100 days";
            if(count>=3)
            {
                for(int i=0; i< count/3;i++ )
                {
                    tbl.remainingAmount = tbl.remainingAmount + 100;
                }
                
            }
            db.tbl_payment.Add(tbl);
            db.SaveChanges();
            
        }

        protected void ddl_payeename_SelectedIndexChanged(object sender, EventArgs e)
        {
            db = new THFinanceEntities();
            int id = Convert.ToInt32(ddl_payeename.SelectedValue);
            var countryQuery = (from c in db.tbl_branches
                                select c).ToList();
            var payee = (from p in db.tbl_payment where p.name.Equals(id)
                         select p).ToList();
            ddl_branch.DataValueField = "branchid";
            ddl_branch.DataTextField = "branchName";

            ddl_branch.DataSource = countryQuery;
            ddl_branch.DataBind();
            ddl_branch.Items.Insert(0, new ListItem("select", "0"));
           
          


            var query = (from s  in db.tbl_payee where s.ID.Equals(id)
                         select s).ToList();
            var q = (from s in db.tbl_payment
                     where s.name.Equals(id)
                     select s).ToList();
            if (q.Count>0)
            {

            }
            int id1 = Convert.ToInt32(query[0].branchId);
            ddl_branch.SelectedValue = Convert.ToString(id1);

            //int brnchid= Convert.ToInt32(query[0].branchId);
            var query1 = (from c in db.tbl_managers where c.mgbrnch_id.Equals(id1)
                          select c).ToList();
            ddl_manager.DataValueField = "manage_id";
            ddl_manager.DataTextField = "manager_name";

            ddl_manager.DataSource = query1;
            ddl_manager.DataBind();
            ddl_manager.Items.Insert(0, new ListItem("select", "0"));
            ddl_manager.SelectedValue = Convert.ToString(query[0].managerId);
            ddl_chitti.SelectedIndex = Convert.ToInt32(query[0].paymentmethod);
            txt_amount.Value = Convert.ToString(query[0].amount);
            txt_paidAmount.Text = Convert.ToString(Convert.ToInt32(query[0].amount) / 100);
            

            if (payee.Count == 0)
            {
                txt_remainingAmount.Text = Convert.ToString( Convert.ToInt32(txt_amount.Value) -Convert.ToInt32(txt_paidAmount.Text));
                txt_startdate.Text = Convert.ToString(query[0].startdate);

            }
            else
            {
                txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(payee[payee.Count - 1].remainingAmount) - Convert.ToInt32(txt_paidAmount.Text)); 
                txt_startdate.Text= Convert.ToString(payee[payee.Count - 1].presentDate);
            }


        }

        protected void txt_paidAmount_TextChanged(object sender, EventArgs e)
        {
            int paid = Convert.ToInt32( txt_remainingAmount.Text);
            txt_remainingAmount.Text = Convert.ToString( (paid)- Convert.ToInt32(txt_paidAmount.Text));
        }
    }
}