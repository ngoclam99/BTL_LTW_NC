using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BTL_LTW_NC.Fontend
{
    public partial class ChiTietBaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getChiTiet();
        }
        private void getChiTiet()
        {
            if (rpChiTiet != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["id"].ToString(), "get_chiTietBaiViet");//lay ID theo parentID
                if (dt != null)
                {
                    rpChiTiet.DataSource = dt;
                    rpChiTiet.DataBind();
                }
            }
        }

    }
}