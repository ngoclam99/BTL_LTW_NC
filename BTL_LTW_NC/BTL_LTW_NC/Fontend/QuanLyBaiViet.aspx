<%@ Page Title="" Language="C#" MasterPageFile="~/Fontend/FontEnd.Master" AutoEventWireup="true" CodeBehind="QuanLyBaiViet.aspx.cs" Inherits="BTL_LTW_NC.Fontend.QuanLyBaiViet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<h2>Danh sách bài viết</h2>
    <br/> 
    <div>
        <asp:Button ID="btnThemBaiviet" runat="server" Text="Thêm bài viết" OnClick="btnThemBaiviet_Click" />
    </div>
    <div>
        <asp:Label ID="lbthongbao" runat="server" Text=""></asp:Label>
    </div>
    <div style="text-align:center">
         <br />
    <asp:GridView ID="grvDanhsachbaiviet" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="PK_sMabaiviet" DataSourceID="SqlDataSource1" OnRowCommand="grvDanhsachbaiviet_RowCommand" AllowCustomPaging="False" AllowPaging="True" OnPageIndexChanging="grvDanhsachbaiviet_PageIndexChanged" PageSize="5">
        <Columns>
            <asp:BoundField DataField="sTenbaiviet" HeaderText="Tài bài viết" SortExpression="sTenbaiviet"  ItemStyle-Width="300px">
<ItemStyle Width="300px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="sTieude" HeaderText="Tiêu đề" SortExpression="sTieude" ItemStyle-Width="300px" >
<ItemStyle Width="300px"></ItemStyle>
            </asp:BoundField>
            <%--<asp:BoundField DataField="sTomtatnoidung" HeaderText="Tóm tắt nội dung" SortExpression="sTomtatnoidung" />--%>
            <asp:BoundField DataField="sNgaydang" HeaderText="Ngày đăng" SortExpression="sNgaydang" />
            <asp:BoundField DataField="sNgayduyet" HeaderText="Ngày duyệt" SortExpression="sNgayduyet" />
            <asp:BoundField DataField="sTenLT" HeaderText="Tên loại tin" SortExpression="sTenLT" />
            <asp:BoundField DataField="sTenUser" HeaderText="Tên người duyệt" SortExpression="sTenUser" />
            <asp:BoundField DataField="sTenTrangThai" HeaderText="Trạng thái" SortExpression="sTenTrangThai" />
            <asp:TemplateField ShowHeader="False" ItemStyle-Width="50px">
            <ItemTemplate>
                <asp:LinkButton ID="btnSua" runat="server" CausesValidation="false" CommandName="btnSuatin"
                    Text="Sửa tin" CommandArgument='<%# Eval("PK_sMabaiviet") %>' /> <br />
                <asp:LinkButton ID="btnXoa" runat="server" CausesValidation="false" OnClientClick="return confirm('Bạn có chắc muốn xóa bài viết này ?');" CommandName="btnXoatin"
                    Text="Xóa tin" CommandArgument='<%# Eval("PK_sMabaiviet") %>' />
            </ItemTemplate>

<ItemStyle Width="50px"></ItemStyle>
        </asp:TemplateField>
        </Columns>
         
        <PagerSettings PageButtonCount="4" />
         
    </asp:GridView>  
    <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Web_Tin_TucConnectionString %>" SelectCommand="get_dsbaiviet" SelectCommandType="StoredProcedure"></asp:SqlDataSource>--%>
    </div>
</asp:Content>
