<%@ Page Title="" Language="C#" MasterPageFile="~/Fontend/FontEnd.Master" AutoEventWireup="true" CodeBehind="ChiTietBaiViet.aspx.cs" Inherits="BTL_LTW_NC.Fontend.ChiTietBaiViet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <asp:repeater id="rpChiTiet" runat="server">
            <ItemTemplate>
                <table width="100%">
                    <tr>
                        <td>
                            <%--<h2 id="DanhMuc">Danh mục:<%#Eval("sTenDM") %></h2>--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <h2 id="BaiViet"><%#Eval("sTenbaiviet") %></h2>
                        </td>
                    </tr>
                    <tr>
                        <td>
                           Ngày duyệt: <%#Eval("sNgayduyet") %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p id="TieuDe"><%#Eval("sTieude") %></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <center><img width="500" src="img/<%#Eval("sAnhdaidien") %>"></center>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="NoiDungBaiViet"><%#Eval("sTomtatnoidung") %></p>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p class="NoiDungBaiViet"><%#Eval("sNoidung") %></p>
                        </td>
                    </tr>
                </table>
                
            </ItemTemplate>
        </asp:repeater>
    <style>
        center img{
            border: 7px solid #eaeaeae0;
            padding: 10px;
        }
        #TieuDe{    font-style: italic;}
    </style>
</asp:Content>
