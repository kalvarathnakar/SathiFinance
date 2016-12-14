using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace THFinance
{
    public partial class borrowerPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
      {
            if (!IsPostBack)
            {
               
                loadgrid();

                gridpaymentdetails.UseAccessibleHeader = true;
                gridpaymentdetails.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }
        public void loadgrid()
        {
            try
            {
                using (var context = new THFinanceEntities())
                {
                    var q = (from s in context.tbl_borrowerPaymentmethod
                             join t1 in context.tbl_branches on s.borrowerBranchid equals t1.branchid
                             join t2 in context.tbl_managers on s.borrowermanager equals t2.manage_id
                             join t3 in context.tbl_chitti on s.borrowerLoanid equals t3.CHITTI_ID
                             join t4 in context.tbl_borrower on s.borrowerName equals t4.borrowerId
                          
                    orderby s.borrowerPayid  descending
                             select new { s.borrowerPayamount, s.borrowerPaymentdate, s.borrowerPayid, s.totalpayment, s.borrowerReaminingamount, s.borrowerStartdate, s.borrowerPenalitydays, t1.branchName, t2.manager_name, t3.CHITTI_NAME, t4.borrowerName });
                    ///
                    var fd = (from t in context.tbl_borrowerPaymentmethod
                              group t by t.borrowerName into  g select g.OrderByDescending(p=>p.borrowerPayid).FirstOrDefault() as tbl_borrowerPaymentmethod
                                                        into td join  bp in context.tbl_branches on td.borrowerBranchid equals bp.branchid
                              join bp1 in context.tbl_managers on td.borrowerBranchid equals bp1.manage_id
                              join bp2 in context.tbl_chitti on td.borrowerBranchid equals bp2.CHITTI_ID
                              join bp3 in context.tbl_borrower on td.borrowerName equals bp3.borrowerId
                              select new
                              {
                                  td.borrowerPayamount,
                                  td.borrowerPaymentdate,
                                  td.borrowerPayid,
                                  td.totalpayment,
                                  td.borrowerReaminingamount,
                                  td.borrowerStartdate,
                                  td.borrowerPenalitydays,
                                  bp.branchName,
                                  bp1.manager_name,
                                  bp2.CHITTI_NAME,
                                  bp3.borrowerName


                              }

                             ).ToList();
                   



                    if (fd != null)
                    {
                        gridpaymentdetails.DataSource = fd;
                        gridpaymentdetails.DataBind();
                    }
                    else
                    {
                        gridpaymentdetails.DataSource = fd;
                        gridpaymentdetails.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void ddl_Borroerpayeename_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(ddl_Borroerpayeename.SelectedValue);
            using (var db = new THFinanceEntities())
            {
                var q = (from s in db.tbl_PaymentType
                         where s.paymentBorrowerId.Equals(id)
                         select s).ToList();
                var q1 = (from p in db.tbl_borrowerPaymentmethod
                          where p.borrowerName.Equals(id)
                          select p).ToList();
                if (q1.Count == 0)
                {

                    int payment = Convert.ToInt32(q[0].paymentmethod);
                    if (payment == 1)
                    {



                        txt_amount.Value = Convert.ToString(q[0].PaymentAmount);
                        txt_startdate.Text = Convert.ToString(q[0].PaymentDate);

                        txt_paidAmount.Text = Convert.ToString(Convert.ToInt32(txt_amount.Value) / 100);
                        txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(txt_amount.Value) - Convert.ToInt32(txt_paidAmount.Text));
                    }
                    else
                    {
                        txt_amount.Value = Convert.ToString(q[0].PaymentAmount);
                        // txt_startdate.Text = Convert.ToString(q[0].PaymentDate);
                        DateTime installmentDate = Convert.ToDateTime(q[0].PaymentDate.ToString("dd/MM/yyyy")).AddMonths(1);
                        txt_startdate.Text = Convert.ToString(installmentDate);
                        txt_paidAmount.Text = Convert.ToString(Convert.ToInt32(txt_amount.Value) / 12 + Convert.ToInt32(txt_amount.Value) * 2 / 100);
                        txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(txt_amount.Value) - Convert.ToInt32(txt_paidAmount.Text));
                    }
                }
                else
                {
                    txt_amount.Value = Convert.ToString(q1[q1.Count - 1].totalpayment);
                    txt_startdate.Text = Convert.ToString(q1[q1.Count - 1].borrowerStartdate);
                    txt_paidAmount.Text = Convert.ToString(q[0].monthlyInterest);
                    txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(q1[q1.Count - 1].borrowerReaminingamount) - Convert.ToInt32(txt_paidAmount.Text));

                    //txt_paidAmount.Text = Convert.ToString(Convert.ToInt32(txt_amount.Value) / 100);
                    // txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(txt_amount.Value) - Convert.ToInt32(txt_paidAmount.Text));
                }


                var countryQuery1 = (from a in db.tbl_chitti
                                     select a).ToList();
                ddl_chitti.DataValueField = "CHITTI_ID";
                ddl_chitti.DataTextField = "CHITTI_NAME";

                ddl_chitti.DataSource = countryQuery1;
                ddl_chitti.DataBind();
                ddl_chitti.Items.Insert(0, new ListItem("select", "0"));

                ddl_chitti.SelectedValue = Convert.ToString(q[0].paymentmethod);

            }

        }

        protected void btn_Addpayment_Click(object sender, EventArgs e)
        {
            paymentpage.Visible = false;
            payregistration.Visible = true;

            using (var db = new THFinanceEntities())
            {
                var countryQuery = (from c in db.tbl_branches
                                    select c).ToList();
                ddl_branch.DataValueField = "branchid";
                ddl_branch.DataTextField = "branchName";

                ddl_branch.DataSource = countryQuery;
                ddl_branch.DataBind();
                ddl_branch.Items.Insert(0, new ListItem("select", "0"));

                var cd = (from context3 in db.tbl_borrower
                          select context3).ToList();
                ddl_Borroerpayeename.DataTextField = "borrowerName";
                ddl_Borroerpayeename.DataValueField = "borrowerId";
                
                ddl_Borroerpayeename.DataSource = cd;
                ddl_Borroerpayeename.DataBind();
                //ddl_Borroerpayeename.Items.Insert(0, new ListItem("select", "0"));




            }
        }

        protected void lnk_Edit_Command(object sender, CommandEventArgs e)
        {
            paymentpage.Visible = false;
            payregistration.Visible = true;
            btn_submit.Visible = false;
            btn_update.Visible = true;
            int id = Convert.ToInt32(e.CommandArgument);
            using (var db = new THFinanceEntities())
            {
                var q = (from s in db.tbl_borrowerPaymentmethod
                         where s.borrowerPayid.Equals(id)
                         select s).ToList();
                int manager = q[0].borrowerBranchid;
                var countryQuery = (from c in db.tbl_branches
                                    select c).ToList();
                ddl_branch.DataValueField = "branchid";
                ddl_branch.DataTextField = "branchName";

                ddl_branch.DataSource = countryQuery;
                ddl_branch.DataBind();
                ddl_branch.Items.Insert(0, new ListItem("select", "0"));

                var cd = (from context3 in db.tbl_borrower
                          select context3).ToList();
                ddl_Borroerpayeename.DataTextField = "borrowerName";
                ddl_Borroerpayeename.DataValueField = "borrowerId";
                ddl_Borroerpayeename.DataSource = cd;
                ddl_Borroerpayeename.DataBind();
                ddl_Borroerpayeename.Items.Insert(0, new ListItem("select", "0"));
                var countryQuery1 = (from a in db.tbl_managers
                                     where a.manage_id.Equals(manager)
                                     select a).ToList();
                ddl_manager.DataValueField = "manage_id";
                ddl_manager.DataTextField = "manager_name";
                ddl_manager.DataSource = countryQuery1;
                ddl_manager.DataBind();
                ddl_manager.Items.Insert(0, new ListItem("select", "0"));
                var countryQuery2 = (from a in db.tbl_chitti
                                     select a).ToList();
                ddl_chitti.DataValueField = "CHITTI_ID";
                ddl_chitti.DataTextField = "CHITTI_NAME";

                ddl_chitti.DataSource = countryQuery2;
                ddl_chitti.DataBind();
                ddl_chitti.Items.Insert(0, new ListItem("select", "0"));
                lbl_id.Text = Convert.ToString(q[0].borrowerPayid);
                ddl_Borroerpayeename.SelectedValue = Convert.ToString(q[0].borrowerName);
                ddl_branch.SelectedValue = Convert.ToString(q[0].borrowerBranchid);
                ddl_manager.SelectedValue = Convert.ToString(q[0].borrowermanager);
                ddl_chitti.SelectedValue = Convert.ToString(q[0].borrowerLoanid);
                txt_amount.Value = q[0].totalpayment;
                txt_startdate.Text = Convert.ToString(q[0].borrowerStartdate);
                txt_enddate.Value = Convert.ToString(q[0].borrowerPaymentdate);
                txt_paidAmount.Text = q[0].borrowerPayamount;
                txt_penalitydays.Value = Convert.ToString(q[0].borrowerPenalitydays);
                txt_remainingAmount.Text = q[0].borrowerReaminingamount;




            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                using (var db = new THFinanceEntities())
                {
                    tbl_borrowerPaymentmethod tbl = new tbl_borrowerPaymentmethod();
                    int id = Convert.ToInt32(ddl_Borroerpayeename.SelectedValue);
                    int days = Convert.ToInt32(txt_penalitydays.Value);
                    var q = (from s in db.tbl_PaymentType
                             where s.paymentBorrowerId.Equals(id)
                             select s).ToList();
                    // txt_penalitydays.Value = "0";
                    if (ddl_chitti.SelectedValue == "1")
                    {



                        //txt_penalitydays.Value = Convert.ToString(dayscount);


                    }
                    else
                    {




                    }

                    DateTime fromdate = DateTime.Parse(Convert.ToDateTime(txt_startdate.Text).ToShortDateString());
                    DateTime todate = DateTime.Parse(Convert.ToDateTime(txt_enddate.Value).ToShortDateString());
                    if (fromdate > todate)
                    {
                        Response.Write("<script>alert('please select today date')</script>");
                        return;
                    }
                    else
                    {

                        tbl.borrowerBranchid = Convert.ToInt32(ddl_branch.SelectedValue);
                        tbl.borrowerLoanid = Convert.ToInt32(ddl_chitti.SelectedValue);
                        tbl.borrowerName = Convert.ToInt32(ddl_Borroerpayeename.SelectedValue);
                        tbl.borrowermanager = Convert.ToInt32(ddl_manager.SelectedValue);
                        tbl.borrowerPayamount = txt_paidAmount.Text;
                        tbl.borrowerReaminingamount = txt_remainingAmount.Text;
                        tbl.borrowerPaymentdate = todate;
                        tbl.borrowerPenalitydays = Convert.ToInt32(txt_penalitydays.Value);
                        tbl.borrowerStartdate = Convert.ToDateTime(txt_startdate.Text);
                        tbl.totalpayment = txt_amount.Value;
                        tbl.createdby = Convert.ToInt32(Session["UserID"]);
                        tbl.createddate = DateTime.Now;

                        if (ddl_chitti.SelectedValue == "1")
                        {
                            if (Convert.ToDateTime(q[0].PaymentDate) >= tbl.borrowerStartdate.AddDays(100))
                            {
                                if (tbl.borrowerReaminingamount == "0")
                                {
                                    tbl.status = 1;
                                    db.tbl_borrowerPaymentmethod.Add(tbl);
                                    db.SaveChanges();
                                    Response.Write("<script>alert('Payment sucessfully completed ')</script>");
                                    clearfields();
                                    return;

                                }
                                else
                                {
                                    tbl.status = 2;
                                    db.tbl_borrowerPaymentmethod.Add(tbl);
                                    db.SaveChanges();
                                    Response.Write("<script>alert('Payment pending')</script>");
                                    clearfields();
                                    return;
                                }
                            }
                            else
                            {
                                if (ddl_chitti.SelectedValue == "1")
                                {
                                    tbl.borrowerReaminingamount= Convert.ToString(Convert.ToInt32(txt_remainingAmount.Text) + days * 100);
                                    tbl.borrowerStartdate = todate.AddDays(1);
                                }
                                else
                                {
                                    txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(txt_remainingAmount.Text) + days * 10);
                                    tbl.borrowerStartdate = todate.AddMonths(1);
                                }
                                tbl.status = 0;
                                db.tbl_borrowerPaymentmethod.Add(tbl);
                                db.SaveChanges();
                                Response.Write("<script>alert('Sucessfully Saved')</script>");
                                clearfields();
                                return;
                            }
                        }

                        else
                        {
                            if (tbl.borrowerPaymentdate >= tbl.borrowerStartdate.AddMonths(12))
                            {
                                if (tbl.borrowerReaminingamount == "0")
                                {
                                    tbl.status = 1;
                                    db.tbl_borrowerPaymentmethod.Add(tbl);
                                    db.SaveChanges();
                                    Response.Write("<script>alert('Payment sucessfully completed ')</script>");
                                    clearfields();
                                    return;

                                }
                                else
                                {
                                    tbl.status = 2;
                                    db.tbl_borrowerPaymentmethod.Add(tbl);
                                    db.SaveChanges();
                                    Response.Write("<script>alert('Payment pending')</script>");
                                    clearfields();
                                    return;
                                }

                            }
                            else
                            {
                                if (ddl_chitti.SelectedValue == "1")
                                {
                                    txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(txt_remainingAmount.Text) + days * 100);
                                    tbl.borrowerStartdate = todate.AddDays(1);
                                }
                                else
                                {
                                    txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(txt_remainingAmount.Text) + days * 10);
                                    tbl.borrowerStartdate = todate.AddMonths(1);
                                }
                                tbl.status = 0;
                                db.tbl_borrowerPaymentmethod.Add(tbl);
                                db.SaveChanges();
                                Response.Write("<script>alert('Sucessfully Saved')</script>");
                                clearfields();
                                return;
                            }
                        }
                        //if(tbl.borrowerStartdate == tbl.borrowerStartdate.AddMonths(12))
                        //{
                        //    if (tbl.borrowerReaminingamount == "0")
                        //    {

                        //        status = 1;
                        //        Response.Write("<script>alert('Payment sucessfully completed ')</script>");
                        //        return;

                        //    }
                        //    else
                        //    {
                        //        status = 2;

                        //    }

                        //}
                        //    if (tbl.borrowerReaminingamount=="0")
                        //{

                        //    status = 1;
                        //    Response.Write("<script>alert('Payment sucessfully completed ')</script>");
                        //    return;

                        //}
                       
                    }



                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void clearfields()
        {
            ddl_Borroerpayeename.SelectedIndex = 0;
            ddl_branch.SelectedIndex = 0;
            ddl_chitti.SelectedIndex = 0;
            ddl_manager.SelectedIndex = 0;
            txt_amount.Value = string.Empty;
            txt_enddate.Value = string.Empty;
            txt_startdate.Text = string.Empty;
            txt_paidAmount.Text = string.Empty;
            txt_penalitydays.Value = string.Empty;
            txt_remainingAmount.Text = string.Empty;

        }
        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                using (var db = new THFinanceEntities())
                {
                    int id = Convert.ToInt32(lbl_id.Text);
                    var q = (from s in db.tbl_borrowerPaymentmethod
                             where s.borrowerPayid.Equals(id)
                             select s).SingleOrDefault();
                    tbl_borrowerPaymentmethod tbl = new tbl_borrowerPaymentmethod();
                    tbl.borrowerBranchid = Convert.ToInt32(ddl_branch.SelectedValue);
                    tbl.borrowerLoanid = Convert.ToInt32(ddl_chitti.SelectedValue);
                    tbl.borrowermanager = Convert.ToInt32(ddl_manager.SelectedValue);
                    tbl.borrowerName = Convert.ToInt32(ddl_Borroerpayeename.SelectedValue);
                    tbl.borrowerPayamount = txt_paidAmount.Text;
                    tbl.borrowerPaymentdate = Convert.ToDateTime(txt_startdate.Text);
                    tbl.totalpayment = txt_amount.Value;
                    tbl.borrowerReaminingamount = txt_remainingAmount.Text;
                    tbl.borrowerPenalitydays = Convert.ToInt32(txt_penalitydays.Value);
                    tbl.modified = Convert.ToInt32(Session["UserID"]);
                    tbl.modifieddate = DateTime.Now;
                    if (tbl != null)
                    {
                        //  db.tbl_borrower.Add(q);
                        db.SaveChanges();
                        clearfields();
                        loadgrid();
                    }


                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            paymentpage.Visible = true;
            payregistration.Visible = false;
            loadgrid();

        }

        protected void txt_paidAmount_TextChanged(object sender, EventArgs e)
        {
            using (var db = new THFinanceEntities())
            {
                int id = Convert.ToInt32(ddl_Borroerpayeename.SelectedValue);
                var q = (from s in db.tbl_PaymentType
                         where s.paymentBorrowerId.Equals(id)
                         select s).ToList();
                var q1 = (from p in db.tbl_borrowerPaymentmethod
                          where p.borrowerName.Equals(id)
                          select p).ToList();
                if (q1.Count == 0)
                {
                    txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(q[0].PaymentAmount) - Convert.ToInt32((txt_paidAmount.Text)));


                }
                else
                {
                    txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(q1[q1.Count - 1].borrowerReaminingamount) - Convert.ToInt32((txt_paidAmount.Text)));


                    //txt_paidAmount.Text = Convert.ToString(Convert.ToInt32(txt_amount.Value) / 100);
                    // txt_remainingAmount.Text = Convert.ToString(Convert.ToInt32(txt_amount.Value) - Convert.ToInt32(txt_paidAmount.Text));
                }


            }

        }

        protected void ddl_branch_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var db = new THFinanceEntities())
            {
                int id = Convert.ToInt32(ddl_branch.SelectedValue);
                var countryQuery1 = (from a in db.tbl_managers
                                     where a.manage_id.Equals(id)
                                     select a).ToList();
                ddl_manager.DataValueField = "manage_id";
                ddl_manager.DataTextField = "manager_name";
                ddl_manager.DataSource = countryQuery1;
                ddl_manager.DataBind();
                ddl_manager.Items.Insert(0, new ListItem("select", "0"));
            }

        }

        protected void txt_enddate_TextChanged(object sender, EventArgs e)
        {

        }

        protected void gridpaymentdetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridpaymentdetails.PageIndex = e.NewPageIndex;
            loadgrid();
        }
    }
    }