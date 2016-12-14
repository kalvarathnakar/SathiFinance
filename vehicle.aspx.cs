using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THFinance
{
    public partial class vehicle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                loadgrid();
            }
        }

        public void loadgrid()
        {
            try
            {
                using (var db= new THFinanceEntities())
                {
                    var q = (from s in db.tble_Vehicle
                             select s).ToList();
                    gridVehicle.DataSource = q;
                    gridVehicle.DataBind();
                    griddiv.Visible = true;
                    formguarantee.Visible = false;

                }

            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void lnk_Edit_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            using (var db= new THFinanceEntities())
            {
                var q = (from s in db.tble_Vehicle
                         where s.VehicleId.Equals(id)
                         select s).ToList();
                var q1 = db.tbl_borrower.ToList();
                ddl_vehicelborrwer.DataTextField = "borrowerName";
                ddl_vehicelborrwer.DataValueField = "borrowerId";
                ddl_vehicelborrwer.DataSource = q1;
                ddl_vehicelborrwer.DataBind();
                ddl_vehicelborrwer.Items.Insert(0, new ListItem("select", "0"));
                lbl_id.Text = Convert.ToString(q[0].VehicleId);
                txt_vehiclebhp.Text = q[0].VehicleBHP;
                ddl_vehicelborrwer.SelectedValue = Convert.ToString( q[0].VehicleBorroerId);
                txt_vehiclechasis.Text = q[0].VehicleChasisNo;
                txt_vehiclecolour.Text = q[0].VehicleColor;
                txt_enginenumber.Text = q[0].VehicleEngineNo;
                txt_vehicleinsurance.Value = q[0].VehicleInsurance;
                txt_vehiclekey.Value = q[0].VehicleKeyNo;
                txt_vehiclemodel.Text = q[0].Vehiclemodel;
                txt_VehicleType.Value = q[0].VehicleType;

            }
        }

        protected void btn_Addguarantee_Click(object sender, EventArgs e)
        {
            griddiv.Visible = false;
            formguarantee.Visible = true;
            btn_submit.Visible = true;
            btn_cancel.Visible = true;
            btn_update.Visible = false;
            using (var db = new THFinanceEntities())
            {
                var q = db.tbl_borrower.ToList();
                ddl_vehicelborrwer.DataTextField = "borrowerName";
                ddl_vehicelborrwer.DataValueField = "borrowerId";
                ddl_vehicelborrwer.DataSource = q;
                ddl_vehicelborrwer.DataBind();
                ddl_vehicelborrwer.Items.Insert(0, new ListItem("select", "0"));

            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                using (var db = new THFinanceEntities())
                {
                    tble_Vehicle tbl = new tble_Vehicle();
                    tbl.VehicleBHP = txt_vehiclebhp.Text;
                    tbl.VehicleBorroerId = Convert.ToInt32(ddl_vehicelborrwer.SelectedValue);
                    tbl.VehicleChasisNo = txt_vehiclechasis.Text;
                    tbl.VehicleColor = txt_vehiclecolour.Text;
                    tbl.VehicleEngineNo = txt_enginenumber.Text;
                    tbl.VehicleInsurance = txt_vehicleinsurance.Value;
                    tbl.VehicleKeyNo = txt_vehiclekey.Value;
                    tbl.Vehiclemodel = txt_vehiclemodel.Text;
                    tbl.VehicleType = txt_VehicleType.Value;
                   if(tbl !=null)
                    {
                        db.tble_Vehicle.Add(tbl);
                        db.SaveChanges();
                        clearfields();
                    }
                  

                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void clearfields()
        {
            txt_vehiclebhp.Text = string.Empty;
            ddl_vehicelborrwer.SelectedIndex = 0;
            txt_vehiclechasis.Text = string.Empty;
            txt_vehiclecolour.Text = string.Empty;
            txt_enginenumber.Text = string.Empty;
            txt_vehicleinsurance.Value = "select";
            txt_vehiclekey.Value = string.Empty;
            txt_vehiclemodel.Text = string.Empty;
            txt_VehicleType.Value = string.Empty;

        }
        protected void btn_update_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(lbl_id.Text);
            try
            {
                using (var db= new THFinanceEntities())
                {
                    var q = (from s in db.tble_Vehicle where s.VehicleBorroerId.Equals(id)
                            select s).Single();
                    tble_Vehicle tbl = new tble_Vehicle();
                    tbl.VehicleBHP = txt_vehiclebhp.Text;
                    tbl.VehicleBorroerId = Convert.ToInt32(ddl_vehicelborrwer.SelectedValue);
                    tbl.VehicleChasisNo = txt_vehiclechasis.Text;
                    tbl.VehicleColor = txt_vehiclecolour.Text;
                    tbl.VehicleEngineNo = txt_enginenumber.Text;
                    tbl.VehicleInsurance = txt_vehicleinsurance.Value;
                    tbl.VehicleKeyNo = txt_vehiclekey.Value;
                    tbl.Vehiclemodel = txt_vehiclemodel.Text;
                    tbl.VehicleType = txt_VehicleType.Value;
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
            griddiv.Visible = true;
            formguarantee.Visible = false;
            loadgrid();
           

        }
    }
}