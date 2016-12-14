using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using THFinance;

namespace THFinance
{
    public partial class THFinance : System.Web.UI.MasterPage
    {
        THFinanceEntities db;
        protected void Page_Load(object sender, EventArgs e)
         {
           if(!IsPostBack)
            {
                if(Session["Useremail"] !=null)
                {
                    string str = Convert.ToString(Session["Useremail"]);
                    db = new THFinanceEntities();
                    var q = db.THF_User.Where(a => a.UserEmail == str).ToList();
                  
                    string base64String = Convert.ToBase64String(q[0].imagesave, 0, q[0].imagesave.Length);
                    imgupload.ImageUrl = "data:image/png;base64," + base64String;

                   
                    lbl_user.Text = q[0].UserName;
                    lbl_professional.Text = q[0].UserProfessional;
                    //var qry = from s in db.Employees
                    //          select s;
                    //grdCustomer.DataSource = qry.ToList();
                    //grdCustomer.DataBind();
                    //grdCustomer.UseAccessibleHeader = true;
                    //grdCustomer.HeaderRow.TableSection = TableRowSection.TableHeader;

                }
                else
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void grdCustomer_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("detail"))
            {
                //string code = GridView1.DataKeys[index].Value.ToString();
                //IEnumerable<DataRow> query = from i in dt.AsEnumerable()
                //                             where i.Field<String>("Code").Equals(code)
                //                             select i;
                //DataTable detailTable = query.CopyToDataTable<DataRow>();
                //DetailsView1.DataSource = detailTable;
                //DetailsView1.DataBind();
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#detailModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DetailModalScript", sb.ToString(), false);
            }
            else if (e.CommandName.Equals("editRecord"))
            {
                GridViewRow gvrow = grdCustomer.Rows[index];
                //lblCountryCode.Text = HttpUtility.HtmlDecode(gvrow.Cells[3].Text).ToString();
                //txtPopulation.Text = HttpUtility.HtmlDecode(gvrow.Cells[7].Text);
                // txtName.Text = HttpUtility.HtmlDecode(gvrow.Cells[4].Text);
                // txtContinent1.Text = HttpUtility.HtmlDecode(gvrow.Cells[5].Text);
                //lblResult.Visible = false;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#editModal').modal('show');");
                sb.Append(@"</script>");
              
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
                // upCrudGrid.Update();
            }
            else if (e.CommandName.Equals("deleteRecord"))
            {
                //string code = GridView1.DataKeys[index].Value.ToString();
                //hfCode.Value = code;
                //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                //sb.Append(@"<script type='text/javascript'>");
                //sb.Append("$('#deleteModal').modal('show');");
                //sb.Append(@"</script>");
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "DeleteModalScript", sb.ToString(), false);
            }
        }

        protected void btnSaveImage_Click(object sender, EventArgs e)
        {
            Response.Write("Button Clicked");
        }
    }
}