<%@ Page Title="" Language="C#" MasterPageFile="~/Fontend/FontEnd.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="BTL_LTW_NC.Fontend.DangNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <center style="padding-bottom:250px; padding-top:30px;">
    
                    <table style="margin-right: 45px;">
                        <tr>
                            <td></td>
                            <td><h2>Đăng nhập</h2></td>
                        </tr>
                        <tr>
                            <td>
                                Tài khoản:
                            </td>
                            <td>
                                <asp:TextBox ID="txtTaiKhoan" runat="server"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rptTaiKhoan" CssClass="ColorRed" ControlToValidate="txtTaiKhoan" runat="server" ErrorMessage="Tài khoản không được để trống!" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mật khẩu:
                            </td>
                            <td>
                               <asp:TextBox ID="txtMatKhau" TextMode="Password" runat="server"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rptMatKhau" CssClass="ColorRed" ControlToValidate="txtMatKhau" runat="server" ErrorMessage="Mật khẩu không được để trống!"></asp:RequiredFieldValidator>--%>
                                
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><asp:Label ID="lbthongbao" runat="server" Text="" CssClass="ColorRed"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>
                                
                            </td>
                            <td>
                                <asp:Button ID="btnDangNhap" runat="server" Text="Đăng nhập" CssClass="btn2 btn-huy" OnClick="btnDangNhap_Click"/>
                            </td>
                        </tr>
                    </table>
        
        </center>
</asp:Content>
