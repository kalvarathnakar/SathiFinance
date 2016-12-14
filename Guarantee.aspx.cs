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
    public partial class Guarantee : System.Web.UI.Page
    {
        THFinanceEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Loadgrid();
                formguarantee.Visible = false;
            }
        }
        public void Loadgrid()
        {
            try
            {
                using (var context = new THFinanceEntities())
                {

                    var q = (from s in context.tbl_Guarantor
                             join t1 in context.tbl_borrower on s.GuarantorborrowerId equals t1.borrowerId
                             select new {s.GuarantorAddress,s.GuarantorFatherName,s.GuarantorName,s.GuarantorPhone,s.Guarantorphoto,s.GuarantorProof,s.GuarantorProoftype,t1.borrowerName,s.GuarantorId }).ToList();
                    if(q!=null)
                    {
                        gridguaranteeregistration.DataSource = q;
                        gridguaranteeregistration.DataBind();
                    }

                        

                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            try
            {
                using (THFinanceEntities context = new THFinanceEntities())
                {
                    tbl_Guarantor tbl = new tbl_Guarantor();
                   
                    tbl.GuarantorName = txt_guaranteename.Text;
                    tbl.GuarantorFatherName = txt_guaranteefathername.Text;
                    tbl.GuarantorborrowerId = Convert.ToInt32(ddl_borrwer.SelectedValue);
                    Stream fs = txt_guaranteeprooffile.PostedFile.InputStream;
                    Stream fs2 = txt_guaranteephoto.PostedFile.InputStream;

                    BinaryReader br = new BinaryReader(fs);
                    BinaryReader br2 = new BinaryReader(fs2);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    Byte[] bytes2 = br2.ReadBytes((Int32)fs.Length);
                    tbl.GuarantorAddress = txt_guaranteeaddresseee.Text;
                    tbl.GuarantorPhone = txt_guaranteephone.Text;
                    tbl.GuarantorProof = bytes;
                    //txt_guaranteeprooffile.PostedFile.SaveAs(Server.MapPath("~/Uploads") + tbl.GuarantorProof);
                   tbl.GuarantorProoftype = txt_guaranteeproof.Value;
                    tbl.G_createdBy = Convert.ToInt32(Session["UserID"]);
                    tbl.G_createdDate = DateTime.Now;
                    tbl.Guarantorphoto = bytes2;
                    txt_guaranteephoto.PostedFile.SaveAs(Server.MapPath("~/Uploads") + tbl.Guarantorphoto);
                   // tbl.G_modifiedBy = 1;
                   // tbl.G_modifiedDate = null;
                    context.tbl_Guarantor.Add(tbl);
                    context.SaveChanges();
                    Response.Write("<script>alert('Sucessfully Saved')</script>");
                    clearfields();




                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btn_update_Click(object sender, EventArgs e)
        {
            try
            {
                using (var db = new THFinanceEntities())
                {
                    int id = Convert.ToInt32(lbl_id.Text);
                    tbl_Guarantor tbl= (from s in db.tbl_Guarantor
                             where s.GuarantorId.Equals(id)
                             select s).SingleOrDefault();
                    tbl.GuarantorAddress = txt_guaranteeaddresseee.Text;
                    tbl.GuarantorborrowerId = Convert.ToInt32(ddl_borrwer.SelectedValue);
                    tbl.GuarantorDesignation = txt_guaranteedesignation.Text;
                    tbl.GuarantorFatherName = txt_guaranteefathername.Text;
                    tbl.GuarantorName = txt_guaranteename.Text;
                    tbl.GuarantorPhone = txt_guaranteephone.Text;
                    Stream fs = txt_guaranteeprooffile.PostedFile.InputStream;
                    Stream fs2 = txt_guaranteephoto.PostedFile.InputStream;

                    BinaryReader br = new BinaryReader(fs);
                    BinaryReader br2 = new BinaryReader(fs2);
                    Byte[] bytes = br.ReadBytes((Int32)fs.Length);
                    Byte[] bytes2 = br2.ReadBytes((Int32)fs.Length);
                    tbl.Guarantorphoto = bytes2;
                    tbl.GuarantorProof = bytes;
                    tbl.GuarantorProoftype = txt_guaranteeproof.Value;
                    db.SaveChanges();
                    clearfields();


                }

            }
            catch (Exception)
            {

                throw;
            }

        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            gridguaranteeregistration.Visible = true;
            formguarantee.Visible = false;
            btn_login.Visible = false;
            btn_Addguarantee.Visible = true;
            btn_cancel.Visible = false;
            Loadgrid();


        }

        protected void lnk_Edit_Command(object sender, CommandEventArgs e)
        {

            int id = Convert.ToInt32(e.CommandArgument);
            gridguaranteeregistration.Visible = false;
            formguarantee.Visible = true;
            btn_login.Visible = false;
            btn_update.Visible = true;
            btn_Addguarantee.Visible = false;
            btn_cancel.Visible = true;
            try
            {
                using (var db = new THFinanceEntities())
                {
                    var q = (from s in db.tbl_Guarantor
                             where s.GuarantorId.Equals(id)
                             select s).ToList();

                    var q1 = db.tbl_borrower.ToList();
                    ddl_borrwer.DataTextField = "borrowerName";
                    ddl_borrwer.DataValueField = "borrowerId";
                    ddl_borrwer.DataSource = q1;
                    ddl_borrwer.DataBind();
                    ddl_borrwer.Items.Insert(0, new ListItem("select", "0"));
                    lbl_id.Text =Convert.ToString(q[0].GuarantorId);
                    txt_guaranteeaddresseee.Text = q[0].GuarantorAddress;
                    txt_guaranteedesignation.Text = q[0].GuarantorAddress;
                    txt_guaranteefathername.Text = q[0].GuarantorFatherName;
                    txt_guaranteename.Text = q[0].GuarantorName;
                    txt_guaranteeproof.Value = q[0].GuarantorProoftype;
                    txt_guaranteephone.Text = q[0].GuarantorPhone;
                    ddl_borrwer.SelectedValue = Convert.ToString( q[0].GuarantorborrowerId);
                    txt_guaranteeproof.Value = Convert.ToString(q[0].GuarantorProof);
                    
                  
                 


                }

            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btn_Addguarantee_Click(object sender, EventArgs e)
        {
            gridguaranteeregistration.Visible = false;
            formguarantee.Visible = true;
            btn_login.Visible = true;
            btn_Addguarantee.Visible = false;
            btn_cancel.Visible = true;

            using (var context = new THFinanceEntities())
            {
                var q = context.tbl_borrower.ToList();
                ddl_borrwer.DataTextField = "borrowerName";
                ddl_borrwer.DataValueField = "borrowerId";
                ddl_borrwer.DataSource = q;
                ddl_borrwer.DataBind();
                ddl_borrwer.Items.Insert(0, new ListItem("select", "0"));
            }
        }
        public void clearfields()
        {
            txt_guaranteename.Text = string.Empty;
            txt_guaranteefathername.Text = string.Empty;
            ddl_borrwer.SelectedIndex = 0;
            txt_guaranteeaddresseee.Text = string.Empty;
            txt_guaranteephone.Text = string.Empty;
            txt_guaranteeproof.SelectedIndex = 0;
        }
    }
}