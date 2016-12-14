using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THFinance
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                using (var db = new THFinanceEntities())
                {
                    DateTime str5 = DateTime.Now.AddDays(-5);
                    DateTime str = DateTime.Now;
                    DateTime str6 = DateTime.Now.AddDays(-6);
                    DateTime m2 = DateTime.Now.AddDays(-60);
                    DateTime m5 = DateTime.Now.AddDays(-90);
                    
                    var q = (from s in db.tbl_borrowerPaymentmethod
                             where s.borrowerLoanid == 1 && s.borrowerStartdate == str.Date
                             group s by s.borrowerName
                  into groups
                             select groups.OrderByDescending(p => p.borrowerPayid).FirstOrDefault()).ToList();
                    var q6 = (from element in db.tbl_borrowerPaymentmethod
                              where element.borrowerLoanid == 1 && (element.borrowerStartdate < str6.Date)
                              group element by element.borrowerName
                  into groups
                              select groups.OrderByDescending(p => p.borrowerPayid).FirstOrDefault()).ToList();

                    var q5 = (from s in db.tbl_borrowerPaymentmethod
                              where s.borrowerLoanid == 1 && (s.borrowerStartdate < str.Date && s.borrowerStartdate >= str.Date)
                              group s by s.borrowerName
                  into groups
                              select groups.OrderByDescending(p => p.borrowerPayid).FirstOrDefault()).ToList();

                    var qm = (from s in db.tbl_borrowerPaymentmethod
                             where s.borrowerLoanid == 2 && s.borrowerStartdate == str.Date
                             group s by s.borrowerName
                 into groups
                             select groups.OrderByDescending(p => p.borrowerPayid).FirstOrDefault()).ToList();
                    var qm2 = (from s in db.tbl_borrowerPaymentmethod
                             where s.borrowerLoanid == 2 && (s.borrowerStartdate < str.Date && s.borrowerStartdate >= m2.Date)
                             group s by s.borrowerName
                into groups
                             select groups.OrderByDescending(p => p.borrowerPayid).FirstOrDefault()).ToList();
                    var qm3 = (from s in db.tbl_borrowerPaymentmethod
                               where s.borrowerLoanid == 2 && ( s.borrowerStartdate < m2.Date)
                               group s by s.borrowerName
               into groups
                               select groups.OrderByDescending(p => p.borrowerPayid).FirstOrDefault()).ToList();
                    //var q6 = (from s in db.tbl_borrowerPaymentmethod
                    //         where s.borrowerLoanid == 1 && ( s.borrowerStartdate > str.Date)
                    //         group s by s.borrowerName).ToList();

                    lbl_daily.Text = Convert.ToString(q.Count);
                    lbl_daily5.Text = Convert.ToString(q5.Count);
                    lbl_dailylimit.Text = Convert.ToString(q6.Count);
                    lbl_monthly.Text= Convert.ToString(qm.Count);
                    lbl_monthly2.Text = Convert.ToString(qm2.Count);
                    lbl_monthly5.Text = Convert.ToString(qm3.Count);






                }

            }
        }
    }
}