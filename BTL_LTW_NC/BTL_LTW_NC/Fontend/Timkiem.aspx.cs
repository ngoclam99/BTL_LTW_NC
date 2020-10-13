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
    public partial class Timkiem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getTinfind();
                getKQtimkiem();
                RandomImage1();
                RandomImage2();
            }

        }
        private void getTinfind()
        {
            if (rpt_content_center != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["searchkey"].ToString(), "get_timkiem");//lay ID theo parentID
                if (dt != null)
                {
                    rpt_content_center.DataSource = dt;
                    rpt_content_center.DataBind();
                }
            }
        }
        private void getKQtimkiem()
        {
            if (rptKqtimkiem != null)
            {
                DataTable dt = Model.model.getDataWhere(Request.QueryString["searchkey"].ToString(), "get_kqtimkiem");//lay ID theo parentID
                if (dt != null)
                {
                    rptKqtimkiem.DataSource = dt;
                    rptKqtimkiem.DataBind();
                }
            }
        }

        private void RandomImage1()
        {
            Random r = new Random();
            int n = r.Next(111, 113);
            imgbodyRight1.ImageUrl = "~/Fontend/img/" + n + ".png";
        }

        private void RandomImage2()
        {
            Random r = new Random();
            int n = r.Next(113, 115);
            imgbodyRight2.ImageUrl = "~/Fontend/img/" + n + ".png";
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            RandomImage1();
        }

        protected void Timer2_Tick(object sender, EventArgs e)
        {
            RandomImage2();
        }
    }
}