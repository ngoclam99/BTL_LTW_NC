using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BTL_LTW_NC.Fontend
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tenuser"] != "")
            {
                if (Request.QueryString["mode"] != null && Request.QueryString["mode"] == "logout")
                {
                    Session.Abandon();
                    Response.Write("<script languague='javascript'> alert('Đăng xuất tài khoản thành công !')</script>");
                    Response.Redirect("Home.aspx");
                }
            }
        }


        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            string taikhoan, matkhau;
            taikhoan = txtTaiKhoan.Text;
            matkhau  = txtMatKhau.Text;
            SqlDataReader reader = Model.model.checklogin(taikhoan, matkhau);
            if (reader.HasRows)
            {
                Response.Write("<script languague='javascript'> alert('Đăng nhập tài khoản thành công !')</script>");
                while (reader.Read())
                {
                    Session["tendangnhap"]  = reader["sTenTK"];
                    Session["iduser"]       = reader["PK_sUser"];
                    Session["tenuser"]     = reader["sTenUser"];
                    Session["maquyen"]     = reader["FK_iMaQuyen"];
                }
                
                reader.Close();
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbthongbao.Text = "Tài khoản hoặc mật khẩu không chính xác !";
            }
        }
    }
}