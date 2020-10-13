﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Fontend/FontEnd.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BTL_LTW_NC.Fontend.Home" %>

<asp:Content ID="Content" ContentPlaceHolderID="Content" runat="server">

    <div class="content">
        <div class="content-left">
            <h1>Sự kiện nóng </h1>
            <div class="ct-left">
                <asp:Repeater ID="rptTinNong" runat="server">
                    <ItemTemplate>
                         <a href="ChiTietBaiViet.aspx?id=<%#Eval("PK_sMabaiviet") %>">
                            <img src="img/<%#Eval("sAnhdaidien") %>" title="<%#Eval("sTenbaiviet") %>" width="100%">
                            <p class="p-tinnong" title="<%#Eval("sTenbaiviet") %>">
                               <%#Eval("sTenbaiviet") %>
                            </p>
                            <small> <%#Eval("sNgaydang") %></small>
                            <p class="noidung-tinnong">
                               <%#Eval("sTomtatnoidung") %>
                            </p>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
               
            </div>
            <div class="ct-right">
                <p>&nbsp; <span>
                    <img src="img/desktop1.png" alt=""></span></p>
                <ul class="ul-content-right">
                    <asp:Repeater ID="rpt_tin_right" runat="server">
                        <ItemTemplate>
                            <li>
                                <a href="ChiTietBaiViet.aspx?id=<%#Eval("PK_sMabaiviet") %>" title="<%#Eval("sTenbaiviet") %>">
                                    <img src="img/<%#Eval("sAnhdaidien") %>" class="img_danhmuc_righ" title="<%#Eval("sTenbaiviet") %>"> <%#Eval("sTenbaiviet") %></a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p><small>Ngày đăng: <%#Eval("sNgaydang") %></small></p>
                            </li>
                        </ItemTemplate>
                         
                    </asp:Repeater>
                   
                </ul>
            </div>

            <div class="center-content">
                <asp:Repeater ID="rpt_content_center" runat="server">
                    <ItemTemplate>
                        <a href="ChiTietBaiViet.aspx?id=<%#Eval("PK_sMabaiviet") %>" title="<%#Eval("sTenbaiviet") %>">
                            <img src="img/<%#Eval("sAnhdaidien") %>" class="anh-drow-tinnong" title="<%#Eval("sTenbaiviet") %>">
                            <p> <%#Eval("sTenbaiviet") %></p>
                            <small><%#Eval("sNgaydang") %></small>
                            <p class="p-drow"><%#Eval("sTomtatnoidung") %></p>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="content-mid">
            <p class="tinmoinhat">Tin mới nhất</p>
            <div class="content-new">
                <ul class="ul-content-new-right">
                    <asp:Repeater ID="rptTinMoi" runat="server">
                        <ItemTemplate>
                            <li>
                                <a href="ChiTietBaiViet.aspx?id=<%#Eval("PK_sMabaiviet") %>" title="<%#Eval("sTenbaiviet") %>">
                                    <img src="img/<%#Eval("sAnhdaidien") %>" class="anh-drow-tinnong" title="<%#Eval("sTenbaiviet") %>">
                                    <p><%#Eval("sTenbaiviet") %></p>
                                    <small><%#Eval("sNgaydang") %></small>
                                    <p class="p-drow"><%#Eval("sTomtatnoidung") %></p>
                                </a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
          

            <p class="tinmoinhat">Thị trường tiêu dùng</p>
            <div class="content-new">
                <ul class="ul-content-new-right">
                    <asp:Repeater ID="rptThiTruongTieuDung" runat="server">
                        <ItemTemplate>
                             <li>
                                 <a href="ChiTietBaiViet.aspx?id=<%#Eval("PK_sMabaiviet") %>">
                                    <img src="img/<%#Eval("sAnhdaidien") %>" class="anh-drow-tinnong">
                                    <p><%#Eval("sTenbaiviet") %></p>
                                    <small><%#Eval("sNgaydang") %></small>
                                    <p class="p-drow"><%#Eval("sTomtatnoidung") %></p>
                                </a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                        </ItemTemplate>
                    </asp:Repeater>
                   
                </ul>
            </div>
        </div>
    </div>
</asp:Content>

