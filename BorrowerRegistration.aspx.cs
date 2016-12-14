using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace THFinance
{
    public partial class BorrowerRegistration : System.Web.UI.Page
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
            var q = (from s in db.tbl_borrower
                     select s).ToList();
            gridregistration.DataSource = q;
            gridregistration.DataBind();
            griddiv.Visible = true;
            form1.Visible = false;


        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            griddiv.Visible = false;
            form1.Visible = true;
          
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            try
            {
                if(Page.IsValid)
                { 
                using (THFinanceEntities db = new THFinanceEntities())
                {
                        var q = (from s in db.tbl_borrower
                                 select s).ToList();
                    tbl_borrower tbl = new tbl_borrower();
                    tbl.borrowerName = txt_barrowername.Text;
                    tbl.borrowerFatherName = txt_barrowerfathername.Text;
                    tbl.BorrowerDesignation = txt_barrowerdesignation.Text;
                    tbl.borrowerAddress = txt_barroweraddresseee.Text;
                    tbl.borrowerPhone = txt_barrowerphone.Text;
                      Stream fs = txt_prooffile.PostedFile.InputStream;
                        Stream fs2 = txt_photo.PostedFile.InputStream;
                        //int fileSize = (txt_prooffile.PostedFile.ContentLength / 1024);
                        //Stream ipStream = txt_prooffile.PostedFile.InputStream;
                        //using (var image = System.Drawing.Image.FromStream(ipStream))
                        //{
                        //    float w = image.PhysicalDimension.Width;
                        //    float h = image.PhysicalDimension.Height;
                        //}
                        //if (fileSize<(2 * 1024))
                        //{
                        //   // PanelError.Visible = true;
                        //    lblError.Text = "Filesize of image is too large. Maximum file size permitted is " + 5 + "MB";
                        //    lblError.Visible = true;
                        //    return;
                        //}

                        BinaryReader br = new BinaryReader(fs);
                        BinaryReader br2 = new BinaryReader(fs2);
                        Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        Byte[] bytes2 = br2.ReadBytes((Int32)fs.Length);
                        tbl.borrowerproof = bytes;
                   // txt_prooffile.PostedFile.SaveAs(Server.MapPath("~/Uploads") + tbl.borrowerproof);
                    tbl.borrowerproofType = txt_proof.Value;
                    tbl.createdby = Convert.ToInt32(Session["UserID"]);
                    tbl.createdDate = DateTime.Now;
                    tbl.borrowerPhoto = bytes2;
                  if(q.Count==0)
                        {
                            db.tbl_borrower.Add(tbl);
                            db.SaveChanges();
                            Response.Write("<script>alert('Sucessfully Saved')</script>");
                            clearfields();
                            return;
                        }
                        else
                        {
                            for(int i=0; i<=q.Count;i++)
                            {
                                string prev = q[i].borrowerName;
                                string present = txt_barrowername.Text;
                                string mobileprev = q[i].borrowerPhone;
                                string mobilepresent = txt_barrowerphone.Text;
                                if (present==prev|| mobileprev== mobilepresent)
                                {
                                    Response.Write("<script>alert('please check mobile or  valid borrower Name')</script>");
                                    return;
                                }
                                
                                //else
                                //{
                                //    db.tbl_borrower.Add(tbl);
                                //    db.SaveChanges();
                                //    Response.Write("<script>alert('Sucessfully Saved')</script>");
                                //    clearfields();
                                //    return;
                                //}
                            }
                        }

                        //txt_photo.PostedFile.SaveAs(Server.MapPath("~/Uploads") + tbl.borrowerPhoto);
                        db.tbl_borrower.Add(tbl);
                        db.SaveChanges();
                        Response.Write("<script>alert('Sucessfully Saved')</script>");
                        clearfields();

                    }
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('Sucessfully not Saved')</script>");
                throw ex;
              
            }
        }
        public void clearfields()
        {
            txt_barrowername.Text = string.Empty;
            txt_barrowerfathername.Text  =string.Empty;
            txt_barrowerdesignation.Text =string.Empty;
            txt_barroweraddresseee.Text  =string.Empty;
            txt_barrowerphone.Text       =string.Empty;
            
        }

        protected void lnk_Edit_Command(object sender, CommandEventArgs e)
        {
            db = new THFinanceEntities();
           
            int id = Convert.ToInt32(e.CommandArgument);
            var q = (from s in db.tbl_borrower
                     where s.borrowerId.Equals(id)
                     select s).ToList();
            lbl_id.Text = Convert.ToString( q[0].borrowerId);
            txt_barroweraddresseee.Text = q[0].borrowerAddress;
            txt_barrowerdesignation.Text = q[0].BorrowerDesignation;
            txt_barrowerfathername.Text = q[0].borrowerFatherName;
            txt_barrowername.Text = q[0].borrowerName;
            txt_barrowerphone.Text = q[0].borrowerPhone;
            //txt_photo.Value = Convert.ToString( q[0].borrowerPhoto);
            txt_proof.SelectedIndex = Convert.ToInt32( q[0].borrowerproofType);
            // txt_prooffile.Value = q[0].borrowerproof;
            griddiv.Visible = false;
            form1.Visible = true;
            btn_login.Visible = false;
            btn_cancel.Visible = true;
            btn_update.Visible = true;

        }

        protected void btn_Add_Click(object sender, EventArgs e)
        {
            griddiv.Visible = false;
            form1.Visible = true;
            btn_login.Visible = true;
            btn_cancel.Visible = true;
            btn_update.Visible = false;
            // txt_barrowername.Text = "Rathnakar";
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            griddiv.Visible = true;
            form1.Visible = false;
            loadgrid();
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            db = new THFinanceEntities();
            int id = Convert.ToInt32(lbl_id.Text);


            tbl_borrower tbl = (from c in db.tbl_borrower
                                where c.borrowerId.Equals(id)
                                select c).Single(); 
                                tbl.borrowerId = Convert.ToInt32(lbl_id.Text);
            tbl.borrowerName = txt_barrowername.Text;
            tbl.borrowerFatherName = txt_barrowerfathername.Text;
            tbl.BorrowerDesignation = txt_barrowerdesignation.Text;
            tbl.borrowerAddress = txt_barroweraddresseee.Text;
            tbl.borrowerPhone = txt_barrowerphone.Text;
            Stream fs = txt_prooffile.PostedFile.InputStream;
            Stream fs2 = txt_photo.PostedFile.InputStream;

            BinaryReader br = new BinaryReader(fs);
            BinaryReader br2 = new BinaryReader(fs2);
            Byte[] bytes = br.ReadBytes((Int32)fs.Length);
            Byte[] bytes2 = br2.ReadBytes((Int32)fs.Length);
            tbl.borrowerproof = bytes;
          
           // txt_prooffile.PostedFile.SaveAs(Server.MapPath("~/Uploads") + tbl.borrowerproof);
            tbl.borrowerproofType = txt_proof.Value;
            tbl.createdby = Convert.ToInt32(Session["UserID"]);
            tbl.createdDate = DateTime.Now;
            tbl.borrowerPhoto = bytes2;
           // txt_photo.PostedFile.SaveAs(Server.MapPath("~/Uploads") + tbl.borrowerPhoto);
            if (tbl!=null)
            {
              //  db.tbl_borrower.Add(q);
                db.SaveChanges();
                loadgrid();
            }

            

          




        }

        protected void btn_Add_Click1(object sender, EventArgs e)
        {

        }

        protected void lnk_add_Click(object sender, EventArgs e)
        {
            griddiv.Visible = false;
            form1.Visible = true;
        }
    }
}