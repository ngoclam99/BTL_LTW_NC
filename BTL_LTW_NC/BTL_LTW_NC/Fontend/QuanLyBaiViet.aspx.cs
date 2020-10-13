using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW_NC.Fontend
{
    public partial class QuanLyBaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_dsBaiViet();
        }

        private void load_dsBaiViet()
        {
            DataTable tb = Model.model.getData("get_dsbaiviet");
            grvDanhsachbaiviet.DataSourceID = null;
            grvDanhsachbaiviet.DataSource = tb;
            grvDanhsachbaiviet.DataBind();
        }

        protected void grvDanhsachbaiviet_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnXoatin")
            {
                int qt = Model.model.Xoa("xoa_Baiviet", "@maBaiviet", e.CommandArgument.ToString());
                if (qt > 0)
                {
                    Response.Write("<script languague='javascript'> alert('Xóa bài viết thành công !');</script>");
                    Response.Redirect("QuanLyBaiViet.aspx");
                }
                else
                {
                    Response.Write("<script languague='javascript'> alert('Xóa bài viết không thành công !');</script>");
                    Response.Redirect("QuanLyBaiViet.aspx");
                }
            }
            if (e.CommandName == "btnSuatin")
            {
                Response.Redirect("Them_SuaBaiViet.aspx?id=" + e.CommandArgument + "&mode=" + "sua");
            }
        }

        protected void grvDanhsachbaiviet_PageIndexChanged(object sender, GridViewPageEventArgs e)
        {
            grvDanhsachbaiviet.PageIndex = e.NewPageIndex;
            load_dsBaiViet();
        }

        protected void btnThemBaiviet_Click(object sender, EventArgs e)
        {
            Response.Redirect("Them_SuaBaiViet.aspx?id=" + "&mode=" + "them");
        }
    }
}