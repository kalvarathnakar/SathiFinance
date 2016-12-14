using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Odbc;
using THFinance;
using SmartHR;
using System.Linq;
using System.IO;

namespace THFinance
{
    public partial class Login : System.Web.UI.Page
    {
        THFinanceEntities entity;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
          
        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            entity = new THFinanceEntities();
            THF_User obj = new THF_User();
            //string filePath = txt_uploadimage.PostedFile.FileName;

            //string filename = Path.GetFileName(filePath);


            //string strname = txt_uploadimage.Value.ToString();

            Stream fs = txt_uploadimage.PostedFile.InputStream;

            BinaryReader br = new BinaryReader(fs);

            Byte[] bytes = br.ReadBytes((Int32)fs.Length);


            //txt_uploadimage.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + strname);
            obj.UserName = txt_UserName.Value;
            obj.UserEmail = txt_UserEmail.Value;
            obj.UserPassword = txt_UserPassword.Value;
            obj.UserProfessional = txt_UserProfessional.Value;
            obj.imagesave =bytes;
            entity.THF_User.Add(obj);
            entity.SaveChanges();
            Response.Write("<script type=\"text/javascript\">alert('Sucessfully Created');</script>");



        }

        protected void btn_forgot_Click(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            THFinanceEntities db = new THFinanceEntities();
            THF_User obj = new THF_User();
           Session["Useremail"] = txt_userloginemail.Value;
           obj.UserPassword = txt_userloginpassword.Value;
            obj.UserEmail = txt_userloginemail.Value;
        
            var q = db.THF_User.Where(a => a.UserEmail == obj.UserEmail && a.UserPassword == obj.UserPassword).ToList();
          
            if (q.Count>0)
            {
                Session["UserID"] = q[0].UserId;
                Response.Redirect("default.aspx");
            }
            else
                Response.Write("<script type=\"text/javascript\">alert('username and password are wrong');</script>");
        }
    }
}