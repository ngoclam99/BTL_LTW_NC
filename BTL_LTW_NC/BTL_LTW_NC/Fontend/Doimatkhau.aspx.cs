using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace BTL_LTW_NC.Fontend
{
    public partial class Doimatkhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDoimatkhau_Click(object sender, EventArgs e)
        {
            int i = Model.model.doiMatkhau(Session["iduser"] + "", txtPasswordOld.Text, txtPasswordNew.Text);
            if (i > 0)
            {
                Session.Abandon();
                //thongbao.Text = "Cập nhật thành công";
                Response.Write("<script languague='javascript'> alert('Đổi mật khẩu thành công !');window.location.href='Dangnhap.aspx';</script>");
            }
            else
            {
                //thongbao.Text = "Cập nhật thất bại";
                lbthongbao.Text = "Mật khẩu cũ không chính xác !";
            }
            //Response.Redirect("QuanLyTaiKhoan.aspx");
            //SqlDataReader reader = Model.model.doiMatkhau(Session["iduser"] + "", txtPasswordOld.Text, txtPasswordNew.Text);
            //if (reader.HasRows)
            //{
            //    Response.Write("<script languague='javascript'> alert('Đổi mật khẩu thành công !');</script>");
            //}
            //else
            //{
            //    lbthongbao.Text = "Mật khẩu cũ không chính xác !";
            //}
        }
    }
}