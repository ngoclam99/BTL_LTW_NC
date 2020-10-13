using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BTL_LTW_NC.Model
{
    public class SqlConnectionData
    {

        // kết nối cơ sở dữ liệu
        public static SqlConnection Connect()
        {
            string strcon = @"Data Source=DESKTOP-6MKG600\NGUYENLAM;Initial Catalog=Web_Tin_Tuc;Integrated Security=True";
            SqlConnection conn = new SqlConnection(strcon); // khởi tạo connect;
            return conn;
        }
    }

    public class model
    {
        // checklogin
        public static SqlDataReader checklogin(string username, string password)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand("proc_login", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@user", username);
            command.Parameters.AddWithValue("@pass", password);
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();

            return reader;
        }
        public static int doiMatkhau(string username, string passold, string passnew)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand("get_doimatkhau", conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue("@user", username);
            command.Parameters.AddWithValue("@passOld", passold);
            command.Parameters.AddWithValue("@passNew", passnew);
            command.Connection = conn;
            int ret = command.ExecuteNonQuery();
            return ret;
        }
        

        public static SqlDataReader getRow(string proc)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(proc, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Connection = conn;
            SqlDataReader reader = command.ExecuteReader();
            return reader;
        }

        // hàm get dữ liệu
        public static DataTable getData(string proceduce)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter); // cho phép  insert, update, delete gán cho adapter
            DataSet ds = new DataSet();
            adapter.Fill(ds); // đẩy câu lệnh vừa truy vấn được vào dataset
            Conn.Close();
            return ds.Tables[0];
        }

        // hàm get dữ liệu
        public static DataTable getDataWhere(string id, string proceduce)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter); // cho phép  insert, update, delete gán cho adapter
            DataSet ds = new DataSet();
            adapter.Fill(ds); // đẩy câu lệnh vừa truy vấn được vào dataset
            return ds.Tables[0];
        }
        //hàm đăng kí
        public static SqlDataReader getDangki(string ma, string taikhoan, string matkhau, string hoten, string email, string sdt, string quyen, string proceduce)
        {
            DataTable dtb = new DataTable();
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@MaTK", ma);
            cmd.Parameters.AddWithValue("@TaiKhoan", taikhoan);
            cmd.Parameters.AddWithValue("@MatKhau", matkhau);
            cmd.Parameters.AddWithValue("@Hoten", hoten);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Sdt", sdt);
            cmd.Parameters.AddWithValue("@quyen", quyen);
            SqlDataReader reader = cmd.ExecuteReader();
            return reader;
        }
        // Hàm xóa bài viết
        public static int Xoa(string proc, string parameter, string value)
        {
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand(proc, conn);
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.AddWithValue(parameter, value);
            command.Connection = conn;
            int banghitacdong = command.ExecuteNonQuery();
            return banghitacdong;
        }
        public static SqlDataReader Sua_baiviet(string proceduce, string id, int FK_MaLT, string sTenbaiviet, string sTieude, string sTomtatnoidung, string sNoidung, string FK_User_dang, string sNgaydang, string sAnhdaidien, string hanhdong)
        {
            SqlConnection Conn = SqlConnectionData.Connect();
            Conn.Open();
            SqlCommand cmd = new SqlCommand(proceduce, Conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = Conn;
            cmd.Parameters.AddWithValue("@PK_sMabaiviet", id);
            cmd.Parameters.AddWithValue("@FK_MaLT", FK_MaLT);
            cmd.Parameters.AddWithValue("@sTenbaiviet", sTenbaiviet);
            cmd.Parameters.AddWithValue("@sTieude", sTieude);
            cmd.Parameters.AddWithValue("@sTomtatnoidung", sTomtatnoidung);
            cmd.Parameters.AddWithValue("@sNoidung", sNoidung);
            cmd.Parameters.AddWithValue("@FK_User_dang", FK_User_dang);
            cmd.Parameters.AddWithValue("@sNgaydang", sNgaydang);
            cmd.Parameters.AddWithValue("@sAnhdaidien", sAnhdaidien);
            cmd.Parameters.AddWithValue("@hanhdong", hanhdong);
            SqlDataReader reader = cmd.ExecuteReader();
            return reader;
        }

        // gọi hàm tạo mã tự động ở đây

        public static string Create_Key(string key_noi, string key_where, string table)
        {
            //key_noi    = "'KH'";
            //key_where  = "sMaKH";
            //table      = "tbl_khachang";
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.Text;
            string truyvan = "Select CONCAT(" + key_noi + ", RIGHT(CONCAT('0000',ISNULL(right(max(" + key_where + "),4),0) + 1),4)) as " + key_where + " from " + table + " where " + key_where + " like " + key_noi + "+'%' ";
            command.CommandText = truyvan;
            command.Connection = conn;
            object data = command.ExecuteScalar();
            string ma = data.ToString();
            return ma;
        }
    }
}