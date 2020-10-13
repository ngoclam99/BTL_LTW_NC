using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW_NC.Fontend
{
    public partial class FontEnd : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tenuser"] != "")
            {
                spuser.InnerText = Session["tenuser"].ToString();
            }
            getMenu();
        }
        private void getMenu()
        {
            DataTable tb = Model.model.getData("get_danhmuc_menu");
            rptMenu.DataSource = tb;
            rptMenu.DataBind();
        }

        protected void btnTimkiem_Click(object sender, EventArgs e)
        {
            string search = txtSearch.Text;
            if(txtSearch.Text == "")
            {
                Response.Write("<script languague='javascript'> alert('Vui lòng nhập dữ liệu tìm kiếm !');</script>");
            }
            else
            {
                Response.Redirect("Timkiem.aspx?searchkey=" + search + "");
            }
                
        }
    }
}