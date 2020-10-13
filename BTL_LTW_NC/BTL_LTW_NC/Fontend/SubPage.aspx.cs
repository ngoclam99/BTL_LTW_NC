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
    public partial class SubPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getLoaiTinTop1();
                getLoaiTinRight();
                getLoaiTinRithgOfLeft();
                getTinFisrt();
                getTindown();
                getLoaiTinRightBottom();
            }
        }

        private void getTinFisrt()
        {
            if (rpt_tin_right != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["id"].ToString(), "get_tinfisrt_theoloaitindau_trangcon");//lay ID theo parentID
                if (dt != null)
                {
                    rptTinNong.DataSource = dt;
                    rptTinNong.DataBind();
                }
            }
        }

        private void getTindown()
        {
            if (rptLoaiTinTop1 != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["id"].ToString(), "get_tindown_theoloaitin_trangcon");//lay ID theo parentID
                if (dt != null)
                {
                    rpt_content_center.DataSource = dt;
                    rpt_content_center.DataBind();
                }
            }
        }

        private void getLoaiTinTop1()
        {
            if (rptLoaiTinTop1 != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["id"].ToString(), "get_loaitin_trangcon") ;//lay ID theo parentID
                if (dt != null)
                {
                    rptLoaiTinTop1.DataSource = dt;
                    rptLoaiTinTop1.DataBind();
                }
            }
        }

        private void getLoaiTinRight()
        {
            if (rptLoaiTinRight != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["id"].ToString(), "get_loaitin2_right_trangcon");//lay ID theo parentID
                if (dt != null)
                {
                    rptLoaiTinRight.DataSource = dt;
                    rptLoaiTinRight.DataBind();
                }
            }
        }

        private void getLoaiTinRithgOfLeft()
        {
            if (rpt_tin_right != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["id"].ToString(), "get_tin_rightofleft_trangcon");//lay ID theo parentID
                if (dt != null)
                {
                    rpt_tin_right.DataSource = dt;
                    rpt_tin_right.DataBind();
                }
            }
        }

        /*private void getTinOfLoaiTinRight()
        {
            if (rpt_tin_right != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["id"].ToString(), "get_tin_rightofleft_trangcon");//lay ID theo parentID
                if (dt != null)
                {
                    rpt_tin_right.DataSource = dt;
                    rpt_tin_right.DataBind();
                }
            }
        }*/

        private void getLoaiTinRightBottom()
        {
            if (rptLoaiTinRightBottom != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["id"].ToString(), "get_loaitin_rightbottom_trangcon");//lay ID theo parentID
                if (dt != null)
                {
                    rptLoaiTinRightBottom.DataSource = dt;
                    rptLoaiTinRightBottom.DataBind();
                }
            }
        }

        protected void rptLoaiTinRight_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rptTinOfLoaiTinRight = (Repeater)e.Item.FindControl("rptTinOfLoaiTinRight");//lay rpt_con
            DataRowView dr = (DataRowView)e.Item.DataItem;
            if (rptTinOfLoaiTinRight != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["id"].ToString(), "get_baiviet_loaitin2_right_trangcon");//lay ID theo parentID
                if (dt != null)
                {
                    rptTinOfLoaiTinRight.DataSource = dt;
                    rptTinOfLoaiTinRight.DataBind();
                }
            }
        }

        protected void rptLoaiTinRightBottom_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rptTinOfLoaiTinRightBottom = (Repeater)e.Item.FindControl("rptTinOfLoaiTinRightBottom");//lay rpt_con
            DataRowView dr = (DataRowView)e.Item.DataItem;
            if (rptTinOfLoaiTinRightBottom != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["id"].ToString(), "get_tinofloaitin_rightbottom_trangcon");//lay ID theo parentID
                if (dt != null)
                {
                    rptTinOfLoaiTinRightBottom.DataSource = dt;
                    rptTinOfLoaiTinRightBottom.DataBind();
                }
            }
        }
    }
}