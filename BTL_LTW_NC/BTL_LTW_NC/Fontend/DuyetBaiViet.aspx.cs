using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BTL_LTW_NC.Fontend
{
    public partial class DuyetBaiViet : System.Web.UI.Page
    {
        string cnnStr = ConfigurationManager.ConnectionStrings["Web_Tin_Tuc"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rpDanhSachTin_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            GridView grv = (GridView)e.Item.FindControl("gvDanhSachTinCanDuyet");
            if (grv != null)
            {
                HiddenField hid = (HiddenField)e.Item.FindControl("hidden");
                int ma = Convert.ToInt32(hid.Value);
                SqlConnection cnn = new SqlConnection(cnnStr);
                SqlCommand cmd = new SqlCommand("sp_DanhSachTinDuyet", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@MaLoaiTin", ma);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                grv.DataSource = dt;
                grv.DataBind();
            }
        }

        protected void gvDanhSachTinCanDuyet_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Duyet")
            {
                DateTime ThoiGianDuyet = DateTime.Now;
                string id = Session["iduser"].ToString();
                var index = e.CommandArgument;
                SqlConnection cnn = new SqlConnection(cnnStr);
                SqlCommand cmd = new SqlCommand("sp_duyet", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@maBaiViet", index);
                cmd.Parameters.AddWithValue("@idNguoiDuyet", id);
                cmd.Parameters.AddWithValue("@ThoiGianDuyet", ThoiGianDuyet);
                cnn.Open();
                int rs = cmd.ExecuteNonQuery();
                if (rs > 0)
                {
                    Response.Redirect("DuyetBaiViet.aspx");
                }
                else
                {
                    Response.Write("0");
                }
                cnn.Close();
                //var index = e.CommandArgument;
                //Response.Write(id);
            }
            if (e.CommandName == "Xoa")
            {
                var index = e.CommandArgument;
                SqlConnection cnn = new SqlConnection(cnnStr);
                SqlCommand cmd = new SqlCommand("sp_xoaBaiViet", cnn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@maBaiViet", index);
                cnn.Open();
                int rs = cmd.ExecuteNonQuery();
                if (rs > 0)
                {
                    Response.Redirect("DuyetBaiViet.aspx");
                }
                else
                {
                    Response.Write("0");
                }
                cnn.Close();
            }
            else
            {
                Response.Redirect("DuyetBaiViet.aspx");
            }
        }
    }
}