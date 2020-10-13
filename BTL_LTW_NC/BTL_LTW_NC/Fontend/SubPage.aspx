<%@ Page Title="" Language="C#" MasterPageFile="~/Fontend/FontEnd.Master" AutoEventWireup="true" CodeBehind="SubPage.aspx.cs" Inherits="BTL_LTW_NC.Fontend.SubPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <div class="content">
        <div class="content-left">
            <h1> 
                <asp:Repeater ID="rptLoaiTinTop1" runat="server">
                    <ItemTemplate>
                        <%#Eval("sTenLT") %>
                    </ItemTemplate>
                </asp:Repeater>
            </h1>
            <div class="ct-left">
                <asp:Repeater ID="rptTinNong" runat="server">
                    <ItemTemplate>
                         <a href="ChiTietBaiViet.aspx?id=<%#Eval("PK_sMabaiviet") %>">
                            <img src="img/<%#Eval("sAnhdaidien") %>" title="<%#Eval("sTenbaiviet") %>" width="100%" >
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
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p><small>Ngày đăng: <%#Eval("sNgaydang") %></small></p>
                            </li>
                        </ItemTemplate>
                         
                    </asp:Repeater>
                   
                </ul>
            </div>

            <div class="center-content">
                <asp:Repeater ID="rpt_content_center" runat="server">
                    <ItemTemplate>
                        <a href="ChiTietBaiViet.aspx?id=<%#Eval("PK_sMabaiviet") %>">
                            <img src="img/<%#Eval("sAnhdaidien") %>" class="anh-drow-tinnong" title="<%#Eval("sTenbaiviet") %>">
                            <p title="<%#Eval("sTenbaiviet") %>"> <%#Eval("sTenbaiviet") %></p>
                            <small><%#Eval("sNgaydang") %></small>
                            <p class="p-drow"><%#Eval("sTomtatnoidung") %></p>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="content-mid">
                <asp:Repeater ID="rptLoaiTinRight" runat="server" OnItemDataBound="rptLoaiTinRight_ItemDataBound">
                    <ItemTemplate>
                        <p class="tinmoinhat"><%#Eval("sTenLT") %></p>
                    <asp:Repeater ID="rptTinOfLoaiTinRight" runat="server">
                        <ItemTemplate>
                            <div class="content-new">
                            <ul class="ul-content-new-right">
                            <li>
                                <a href="">
                                    <img src="img/<%#Eval("sAnhdaidien") %>" class="anh-drow-tinnong" title="<%#Eval("sTenbaiviet") %>">
                                    <p title="<%#Eval("sTenbaiviet") %>"><%#Eval("sTenbaiviet") %></p>
                                    <small><%#Eval("sNgaydang") %></small>
                                    <p class="p-drow"><%#Eval("sTomtatnoidung") %></p>
                                </a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
                            </ul>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </ItemTemplate>
                </asp:Repeater>
            <asp:Repeater ID="rptRand" runat="server">
                <ItemTemplate>
                    <p class="tinmoinhat"><%#Eval("sTenDM") %></p>
                    <asp:Repeater ID="rptRand_BaiViet" runat="server">
                        
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
            <asp:Repeater ID="rptLoaiTinRightBottom" runat="server" OnItemDataBound="rptLoaiTinRightBottom_ItemDataBound">
                <ItemTemplate>
                    <p class="tinmoinhat"><%#Eval("sTenLT") %></p>
                    <asp:Repeater ID="rptTinOfLoaiTinRightBottom" runat="server">
                        <ItemTemplate>
                            <div class="content-new">
                            <ul class="ul-content-new-right">
                                <li>
                                    <a href="ChiTietBaiViet.aspx?id=<%#Eval("PK_sMabaiviet") %>">
                                    <img src="img/<%#Eval("sAnhdaidien") %>" class="anh-drow-tinnong">
                                    <p title="<%#Eval("sTenbaiviet") %>"><%#Eval("sTenbaiviet") %></p>
                                    <small><%#Eval("sNgaydang") %></small>
                                    <p class="p-drow"><%#Eval("sTomtatnoidung") %></p>
                                    </a>
                        &nbsp;&nbsp;</li>
                            </ul>
                            </div>
                        </ItemTemplate>
            </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
