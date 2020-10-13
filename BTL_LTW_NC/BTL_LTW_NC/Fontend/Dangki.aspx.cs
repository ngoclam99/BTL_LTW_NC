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
    public partial class Dangki : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getQuyen();

        }
        private void getQuyen()
        {
            DataTable tb = Model.model.getData("get_quyen");
            ddlQuyen.DataSource = tb;
            ddlQuyen.DataTextField = "sTenQuyen";
            ddlQuyen.DataValueField = "PK_iMaQuyen";
            ddlQuyen.DataBind();
        }

        protected void btnDangki_Click(object sender, EventArgs e)
        {
            string id_tk = Model.model.Create_Key("'TK'", "PK_sMaTK", "tbl_taikhoan");
            SqlDataReader tb = Model.model.getDangki(id_tk,txtTendangnhap.Text,txtMatkhau.Text,txtHoten.Text,txtEmail.Text,txtSdt.Text,
                ddlQuyen.SelectedValue,"get_dangki");
            if (tb.HasRows)
            {
                Response.Write("<script languague='javascript'> alert('Fail !');</script>");
            }
            else
                Response.Write("<script languague='javascript'> alert('Đăng kí tài khoản thành công !');window.location.href='Dangnhap.aspx';</script>");
           
        }
    }
}