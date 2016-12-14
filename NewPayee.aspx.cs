using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THFinance
{
    public partial class NewPayee : System.Web.UI.Page
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
                var countryQuery1= (from a in db.tbl_chitti
                                    select a).ToList();
                ddl_chitti.DataValueField = "CHITTI_ID";
                ddl_chitti.DataTextField = "CHITTI_NAME";
             
                ddl_chitti.DataSource = countryQuery1;
                ddl_chitti.DataBind();
                ddl_chitti.Items.Insert(0, new ListItem("select", "0"));

            }
        }

        protected void btn_newpayee_Click(object sender, EventArgs e)
        {
            db = new THFinanceEntities();
            tbl_payee tbl = new tbl_payee();
            tbl.branchId = Convert.ToInt32(ddl_branch.SelectedValue);
            tbl.managerId = Convert.ToInt32(ddl_manager.SelectedValue);
            tbl.paymentmethod = Convert.ToInt32(ddl_chitti.SelectedValue);
            tbl.payeeProof = txt_payeeproof.Value.ToString();
            txt_payeeproof.PostedFile.SaveAs(Server.MapPath("~/Uploads") + tbl.payeeProof);
            tbl.amount = Convert.ToInt32(txt_amount.Text);
            
            tbl.NomineeProof = txt_nomineeproof.Value.ToString();
            txt_nomineeproof.PostedFile.SaveAs(Server.MapPath("~/Uploads") + tbl.NomineeProof);
            tbl.name = txt_name.Text;
            tbl.NomineeName = txt_Nominee.Text;
            tbl.startdate = Convert.ToDateTime(txt_startdate.Value);
            tbl.enddate= Convert.ToDateTime(txt_enddate.Value);
            tbl.givenamount = Convert.ToInt32(txt_givenamount.Value);
            db.tbl_payee.Add(tbl);
            db.SaveChanges();
            Response.Write("<script>alert('Sucessfully Saved')</script>");
            clearfields();
        }

        protected void ddl_branch_SelectedIndexChanged(object sender, EventArgs e)
        {
            db = new THFinanceEntities();
            
            int id = Convert.ToInt32(ddl_branch.SelectedValue);

            if(id==0)
            {
                Response.Write("<script>alert('please select branch')</script>");

            }
          else
            {
                var query = (from c in db.tbl_managers
                             where c.mgbrnch_id == id
                             select c).ToList();
                ddl_manager.DataValueField = "manage_id";
                ddl_manager.DataTextField = "manager_name";

                ddl_manager.DataSource = query;
                ddl_manager.DataBind();
                ddl_manager.Items.Insert(0, new ListItem("select", "0"));
            }
        }

        protected void txt_startdate_TextChanged(object sender, EventArgs e)
        {
            //tbl_payee tbl = new tbl_payee();
            //DateTime dt = Convert.ToDateTime(txt_startdate);
            //dt = dt.AddDays(30);
            //txt_enddate.Value = Convert.ToString(dt);
           
        }

        protected void txt_name_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txt_amount_TextChanged(object sender, EventArgs e)
        {
            txt_givenamount.Value = Convert.ToString(Convert.ToInt32(txt_amount.Text)- ( (Convert.ToInt32( txt_amount.Text)) * 15/100));
            txt_givenamount.Disabled = true;
        }

        public void clearfields()
        {
            ddl_branch.SelectedIndex =0;
            ddl_chitti.SelectedIndex = 0;
            ddl_manager.SelectedIndex = 0;
            txt_amount.Text = string.Empty;
            txt_enddate.Value = string.Empty;
            txt_givenamount.Value = string.Empty;
            txt_name.Text = string.Empty;
            txt_Nominee.Text = string.Empty;
          
            txt_startdate.Value = string.Empty;
        }
    }
}