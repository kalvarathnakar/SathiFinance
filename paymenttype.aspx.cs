using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THFinance
{
    public partial class paymenttype : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadgrid();
               
            }
        }

        public void loadgrid()
        {
            try
            {
                using (var context = new THFinanceEntities())
                {
                    var q = (from s in context.tbl_PaymentType
                             join t1 in context.tbl_borrower on s.paymentBorrowerId equals t1.borrowerId
                             select new { s.PaymentDate, s.PaymentAmount, s.PaymentType, t1.borrowerName, s.givenamount, s.paymentId }).ToList();

                    if (q.Count == 0)
                    {
                        gridpayment.DataSource = q;
                        gridpayment.DataBind();
                    }
                    else
                    {
                        gridpayment.DataSource = q;
                        gridpayment.DataBind();
                    }


                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void btn_Addpayment_Click(object sender, EventArgs e)
        {
            paymentmethod.Visible = false;
            formguarantee.Visible = true;
            btn_update.Visible = false;
            btn_submit.Visible = true;
            using (var db = new THFinanceEntities())
            {
                var cd = (from context3 in db.tbl_borrower
                          select context3).ToList();
                ddl_paymentborrwer.DataTextField = "borrowerName";
                ddl_paymentborrwer.DataValueField = "borrowerId";
                ddl_paymentborrwer.DataSource = cd;
                ddl_paymentborrwer.DataBind();
                ddl_paymentborrwer.Items.Insert(0, new ListItem("select", "0"));

                var countryQuery1 = (from a in db.tbl_chitti
                                     select a).ToList();
                ddl_chitti.DataValueField = "CHITTI_ID";
                ddl_chitti.DataTextField = "CHITTI_NAME";

                ddl_chitti.DataSource = countryQuery1;
                ddl_chitti.DataBind();
                ddl_chitti.Items.Insert(0, new ListItem("select", "0"));
            }
        }

        protected void lnk_Edit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            paymentmethod.Visible = false;
            formguarantee.Visible = true;
            btn_submit.Visible = false;
            btn_update.Visible = true;
            using (var db = new THFinanceEntities())
            {
                var cd = (from context3 in db.tbl_borrower
                          select context3).ToList();
                ddl_paymentborrwer.DataTextField = "borrowerName";
                ddl_paymentborrwer.DataValueField = "borrowerId";
                ddl_paymentborrwer.DataSource = cd;
                ddl_paymentborrwer.DataBind();
                ddl_paymentborrwer.Items.Insert(0, new ListItem("select", "0"));
                var q = (from s in db.tbl_PaymentType
                         where s.paymentId.Equals(id)
                         select s).ToList();
                var countryQuery1 = (from a in db.tbl_chitti
                                     select a).ToList();
                ddl_chitti.DataValueField = "CHITTI_ID";
                ddl_chitti.DataTextField = "CHITTI_NAME";

                ddl_chitti.DataSource = countryQuery1;
                ddl_chitti.DataBind();
                ddl_chitti.Items.Insert(0, new ListItem("select", "0"));
                ddl_chitti.SelectedValue = Convert.ToString(q[0].paymentmethod);
                txt_monthlypayment.Text = q[0].monthlyInterest;
                txt_PaymentAmount.Text = Convert.ToString(q[0].PaymentAmount);
                txt_PaymentType.Value = q[0].PaymentType;
                txt_startdate.Value = Convert.ToString(q[0].PaymentDate);
                ddl_paymentborrwer.SelectedValue = Convert.ToString(q[0].paymentBorrowerId);
                lbl_id.Text = Convert.ToString(q[0].paymentId);
                txt_givenAmount.Text = q[0].givenamount;
            }
           
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                using (var db = new THFinanceEntities())
                {
                    tbl_PaymentType tbl = new tbl_PaymentType();

                    var q = (from s in db.tbl_PaymentType
                             select s).ToList();
                    tbl.paymentBorrowerId = Convert.ToInt32(ddl_paymentborrwer.SelectedValue);
                    tbl.PaymentDate = Convert.ToDateTime(txt_startdate.Value);
                    tbl.PaymentType = txt_PaymentType.Value;
                    tbl.PaymentAmount = Convert.ToInt32(txt_PaymentAmount.Text);
                    tbl.givenamount = txt_givenAmount.Text;
                    tbl.paymentmethod = Convert.ToInt32(ddl_chitti.SelectedValue);
                    tbl.monthlyInterest = txt_monthlypayment.Text;
                   
                    if (q.Count==0)
                    {
                       
                        db.tbl_PaymentType.Add(tbl);
                        db.SaveChanges();
                        Response.Write("<script>alert('Sucessfully saved')</script>");
                        loadgrid();
                        clearfields();
                        return;
                    }
                    else
                    {
                        for (int i=0; i<q.Count;i++)
                        {
                            var present = tbl.paymentBorrowerId;
                            var prev = q[i].paymentBorrowerId;
                            if(present==prev)
                            {
                                Response.Write("<script>alert('Borrower already exist')</script>");
                                return;
                            }

                        }

                    }
                   
                    db.tbl_PaymentType.Add(tbl);
                    db.SaveChanges();
                    Response.Write("<script>alert('Sucessfully saved')</script>");
                    clearfields();

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void clearfields()
        {
            ddl_paymentborrwer.SelectedIndex = 0;
            txt_startdate.Value = string.Empty;
            txt_PaymentType.SelectedIndex = 0;
            txt_PaymentAmount.Text = string.Empty;
            txt_givenAmount.Text = string.Empty;
            ddl_chitti.SelectedIndex = 0;
            txt_monthlypayment.Text = string.Empty;
        }
        protected void btn_update_Click(object sender, EventArgs e)
        {
           
            using (var context = new THFinanceEntities())
            {
                int id = Convert.ToInt32(lbl_id.Text);
                tbl_PaymentType tbl = (from s in context.tbl_PaymentType
                         where s.paymentId.Equals(id)
                         select s).Single();

               
                tbl.paymentBorrowerId = Convert.ToInt32(ddl_paymentborrwer.SelectedValue);
                tbl.PaymentDate = Convert.ToDateTime(txt_startdate.Value);
                tbl.PaymentType = txt_PaymentType.Value;
                tbl.givenamount = txt_givenAmount.Text;
                tbl.PaymentAmount = Convert.ToInt32(txt_PaymentAmount.Text);
               
                context.SaveChanges();
                Response.Write("<script>alert('Sucessfully saved')</script>");
                loadgrid();
                clearfields();

            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            formguarantee.Visible = false;
            paymentmethod.Visible = true;
            loadgrid();
        }

        protected void txt_PaymentAmount_TextChanged(object sender, EventArgs e)
        {
            int amount = Convert.ToInt32(txt_PaymentAmount.Text);

            if(ddl_chitti.SelectedValue=="1")
            {

            }
            txt_givenAmount.Text = Convert.ToString(amount- amount * 15 / 100);
            txt_givenAmount.Enabled = false;

            if (ddl_chitti.SelectedValue == "")
            {
                Response.Write("<script>alert('please select paymenttype')</scrpt>");
                ddl_paymentborrwer.Style.Add("border", "1px solid red");
            }
            else if (ddl_chitti.SelectedValue == "1")
            {
                int str = (amount / 100);
                txt_monthlypayment.Text = Convert.ToString(str);
            }
            else
            {
              int str=  (amount / 12) + (amount * 2 / 100);
                txt_monthlypayment.Text = Convert.ToString(str);
            }
        }
    }
}