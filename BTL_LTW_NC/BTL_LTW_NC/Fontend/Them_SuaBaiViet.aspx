<%@ Page Title="" Language="C#" MasterPageFile="~/Fontend/FontEnd.Master" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Them_SuaBaiViet.aspx.cs" Inherits="BTL_LTW_NC.Them_SuaBaiViet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <script src="../ckeditor/ckeditor.js"></script> 
    <h2>Đăng bài viết</h2> <br /> <br />
        <%--Tên bài viết--%> 
        <asp:Label ID="Label3" runat="server" Text="Tên bài viết"></asp:Label>
        <asp:TextBox ID="tenbaiviet" CssClass ="textb" runat="server"></asp:TextBox>    
        <%--Tiêu đề--%>
        <asp:Label ID="Label1" runat="server" Text="Tiêu đề"></asp:Label>
        <asp:TextBox ID="tieude" CssClass ="textb" runat="server"></asp:TextBox>
        <%--Tóm tắt nội dung--%>
        <asp:Label ID="Label2" runat="server" Text="Tóm tắt"></asp:Label>
        <asp:TextBox ID="tomtatnoidung" CssClass ="textb" runat="server"></asp:TextBox>
        <%--Loại tin--%>
        <label for="country">Loại tin</label>
        <asp:DropDownList ID="loaitin" CssClass="textb" runat="server">
        </asp:DropDownList>
        <%--Hình ảnh đại diện--%>
        <asp:FileUpload ID="anhdaidien" runat="server" /> <br />
        <asp:Label ID="lbNoiDungTin" runat="server" Text=""></asp:Label> <br />
        <%--Nội dung--%>
        <asp:TextBox ID="noidungtin" TextMode="multiline" Columns="50" Rows="5" runat="server" ></asp:TextBox>
        <div style="text-align:center">
        <br /> <br />
            <asp:Button ID="btnQuayLai" CssClass="button" runat="server" Text="Quay lại" OnClick="btnQuayLai_Click" />
            <asp:Button ID="btnThem" CssClass="button" runat="server" Text="Thêm bài viết" OnClick="btnThem_Click" />
            <asp:Button ID="btnXacNhan" CssClass="button" runat="server" Text="Lưu bài viết" OnClick="btnXacNhan_Click" />
        <br /> <br />
        </div>
    <script type="text/javascript" lang="javascript">
        CKEDITOR.replace('<%=noidungtin.ClientID%>');
    </script>
</asp:Content>
