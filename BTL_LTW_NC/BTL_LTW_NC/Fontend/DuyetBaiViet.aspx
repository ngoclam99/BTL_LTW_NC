<%@ Page Title="" Language="C#" MasterPageFile="~/Fontend/FontEnd.Master" AutoEventWireup="true" CodeBehind="DuyetBaiViet.aspx.cs" Inherits="BTL_LTW_NC.Fontend.DuyetBaiViet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <asp:repeater id="rpDanhSachTin" runat="server" OnItemDataBound="rpDanhSachTin_ItemDataBound" DataSourceID="SqlDataSource1">
        <ItemTemplate>
                <h3 ID="tenloaitin" runat="server" class="btn-tenloaitin">
                    <%#Eval("sTenLT") %>
                </h3> <br />
                <asp:HiddenField ID="hidden" runat="server" Value='<%# Eval("PK_iMaLT") %>' />
            <asp:GridView ID="gvDanhSachTinCanDuyet" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="PK_sMabaiviet" OnRowCommand="gvDanhSachTinCanDuyet_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Tên bài viết">
                            <ItemTemplate>
                                <asp:Label ID="tenBaiViet" runat="server" Text=""><%#Eval("sTieude") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tóm tắt nội dung">
                            <ItemTemplate>
                                <asp:Label ID="tomTatNoiDung" runat="server" Text=""><%#Eval("sTomtatnoidung") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ngày đăng">
                            <ItemTemplate>
                                <asp:Label ID="ngayDang" runat="server" Text=""><%#Eval("sNgaydang") %></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Trạng thái" ItemStyle-Width="140">
                            <ItemTemplate>
                                <asp:Label ID="lbDuyet" runat="server" Text="">
                                    <asp:LinkButton ID="btnDuyet" runat="server" CssClass="btn-them" CommandName="Duyet" CommandArgument='<%# Bind("PK_sMabaiviet") %>'>Duyệt</asp:LinkButton>
                                </asp:Label>
                                <asp:Label ID="lbXoa" runat="server" Text="" CssClass="btn-huy">
                                    <asp:LinkButton ID="btnXoa" runat="server" CommandName="Xoa" CommandArgument='<%# Bind("PK_sMabaiviet") %>' OnClientClick="if (!confirm('Are you sure you want to delete ? ')) return false;">Xóa bài viết</asp:LinkButton>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        </ItemTemplate>
    </asp:repeater>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Web_Tin_TucConnectionString %>" SelectCommand="SELECT * FROM [tbl_loaitin]"></asp:SqlDataSource>
</asp:Content>
