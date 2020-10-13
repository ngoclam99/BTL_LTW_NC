using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW_NC
{
    public partial class Them_SuaBaiViet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                hienthi_danhmuc();
                
                if (Request.QueryString["id"] != "")
                {
                    btnThem.Style["visibility"] = "hidden";
                    string ma = Request.QueryString["id"];
                    //tenbaiviet.Text = ma;
                    DataTable tb = Model.model.getDataWhere(ma, "layBaiviet_theoID");
                    foreach (DataRow row in tb.Rows)
                    {
                        tenbaiviet.Text = row["sTenbaiviet"].ToString();
                        tieude.Text = row["sTieude"].ToString();
                        tomtatnoidung.Text = row["sTomtatnoidung"].ToString();
                        loaitin.SelectedValue = row["FK_MaLT"].ToString();
                        noidungtin.Text = row["sNoidung"].ToString();
                    }
                }
                else
                {
                    btnXacNhan.Style["visibility"] = "hidden";
                }
            }
        }
        private void hienthi_loaitin(string ma_dm)
        {
            DataTable tb = Model.model.getDataWhere(ma_dm, "get_loaitin");
            //DataTable tb = Model.model.getData("get_loaitin");
            loaitin.DataSourceID = null;
            loaitin.DataSource = tb;
            loaitin.DataTextField = "sTenLT";
            loaitin.DataValueField = "PK_iMaLT" ;
            loaitin.DataBind();
           
        }

        private void hienthi_danhmuc()
        {
            if (!Page.IsPostBack)
            {
                DataTable tb = Model.model.getData("get_danhmuc_menu");
                ddlDanhmuc.DataSourceID = null;
                ddlDanhmuc.DataSource = tb;
                ddlDanhmuc.DataTextField = "sTenDM";
                ddlDanhmuc.DataValueField = "PK_iMaDM";
                ddlDanhmuc.DataBind();
            }
        }

        protected void btnXacNhan_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            string tenbv = tenbaiviet.Text;
            string tieudebv = tieude.Text;
            string tombatbv = tomtatnoidung.Text;
            int loaitinbv = int.Parse(loaitin.SelectedValue);
            string noidungbv = noidungtin.Text;
            string anhdaidienbv = "";
            if (anhdaidien.HasFile == true && anhdaidien.FileName != "")
            {
                anhdaidien.SaveAs(Server.MapPath("~/Fontend/img/" + anhdaidien.FileName));
                anhdaidienbv = anhdaidien.FileName;
                SqlDataReader x = Model.model.Sua_baiviet("them_Suabaiviet", id, loaitinbv, tenbv, tieudebv, tombatbv, noidungbv, Session["iduser"].ToString(), DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss"), anhdaidienbv, "sua");
            }
            else
            {
                SqlDataReader x = Model.model.Sua_baiviet("them_Suabaiviet", id, loaitinbv, tenbv, tieudebv, tombatbv, noidungbv, Session["iduser"].ToString(), DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss"), "khongco", "sua");
            }
            Response.Write("<script languague='javascript'> alert('Cập nhập bài viết thành công !');</script>");
            Response.Redirect("QuanLyBaiViet.aspx");
        }


        protected void btnThem_Click(object sender, EventArgs e)
        {
            //Response.Write(id);
            Random r = new Random();
            string id = "BV-" + r.Next();
            string tenbv = tenbaiviet.Text;
            string tieudebv = tieude.Text;
            string tombatbv = tomtatnoidung.Text;
            int loaitinbv = int.Parse(loaitin.SelectedValue);
            string noidungbv = noidungtin.Text;
            string anhdaidienbv = "";
            if (anhdaidien.HasFile)
            {
                anhdaidien.SaveAs(Server.MapPath("~/Fontend/img/" + anhdaidien.FileName));
                anhdaidienbv = anhdaidien.FileName;
            }
            SqlDataReader x = Model.model.Sua_baiviet("them_Suabaiviet", id, loaitinbv, tenbv, tieudebv, tombatbv, noidungbv, Session["iduser"].ToString(), DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss"), anhdaidienbv, "them");
            Response.Write("<script languague='javascript'> alert('Thêm bài viết thành công !');</script>");
            Response.Redirect("QuanLyBaiViet.aspx");
        }

        protected void btnQuayLai_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyBaiViet.aspx");
        }

        protected void ddlDanhmuc_SelectedIndexChanged(object sender, EventArgs e)
        {
            hienthi_loaitin(ddlDanhmuc.SelectedValue);
        }
    }
}