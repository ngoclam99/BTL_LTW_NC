using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTL_LTW_NC.Fontend
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getTinNong();
            getTinLeft();
            getTindown();
            getTinMoiNhat();
            getThiTruongTieuDung();
        }

        private void getThiTruongTieuDung()
        {
            DataTable tb = Model.model.getData("get_thitruong_tieudung");
            rptThiTruongTieuDung.DataSource = tb;
            rptThiTruongTieuDung.DataBind();
        }


        private void getTinMoiNhat()
        {
            DataTable tb = Model.model.getData("get_tin_new");
            rptTinMoi.DataSource = tb;
            rptTinMoi.DataBind();
        }

        private void getTindown()
        {
            DataTable tb = Model.model.getData("get_tin_down");
            rpt_content_center.DataSource = tb;
            rpt_content_center.DataBind();
        }

        private void getTinLeft()
        {
            DataTable tb = Model.model.getData("get_tin_right");
            rpt_tin_right.DataSource = tb;
            rpt_tin_right.DataBind();
        }

        private void getTinNong()
        {
            SqlDataReader reader = Model.model.getRow("get_tinnong");
            DataTable dt = new DataTable();
            if (reader.HasRows)
            {
                dt.Load(reader);
                rptTinNong.DataSource = dt;
                rptTinNong.DataBind();
            }
        }

        protected void rptRand_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rptRand_BaiViet = (Repeater)e.Item.FindControl("rptRand_BaiViet");//lay rpt_con
            DataRowView dr = (DataRowView)e.Item.DataItem;
            if (rptRand_BaiViet != null)
            {
                DataTable dt = Model.model.getDataWhere(dr["PK_iMaDM"].ToString(), "get_baiviet_rand");//lay ID theo parentID
                if (dt != null)
                {
                    rptRand_BaiViet.DataSource = dt;
                    rptRand_BaiViet.DataBind();
                }
            }
        }
    }
}