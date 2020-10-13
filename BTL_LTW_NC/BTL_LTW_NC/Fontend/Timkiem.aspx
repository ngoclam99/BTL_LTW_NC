<%@ Page Title="" Language="C#" MasterPageFile="~/Fontend/FontEnd.Master" AutoEventWireup="true" CodeBehind="Timkiem.aspx.cs" Inherits="BTL_LTW_NC.Fontend.Timkiem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
     <div class="content">
        <div class="content-left">
            <h1>Kết quả tìm kiếm: <asp:Repeater ID="rptKqtimkiem" runat="server">
                <ItemTemplate>
                     <%#Eval("KQ") %>
                </ItemTemplate>
                </asp:Repeater></h1>
           
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
                    <center>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick"></asp:Timer>
                            <asp:Image ID="imgbodyRight1" runat="server" ImageUrl="~/Fontend/img/111.png" Width="250px" Height="500px"/>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </center>
                </ul>
            </div>

            <p class="tinmoinhat">Thị trường tiêu dùng</p>
            <div class="content-new">
                <ul class="ul-content-new-right">
                    <center>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <%--<asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>--%>
                            <asp:Timer ID="Timer2" runat="server" Interval="3000" OnTick="Timer2_Tick"></asp:Timer>
                            <asp:Image ID="imgbodyRight2" runat="server" ImageUrl="~/Fontend/img/115.png" Width="250px" Height="500px"/>
                        </ContentTemplate>
                        </asp:UpdatePanel>
                    </center>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
