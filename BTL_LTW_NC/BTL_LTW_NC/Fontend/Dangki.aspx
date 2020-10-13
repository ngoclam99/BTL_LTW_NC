<%@ Page Title="" Language="C#" MasterPageFile="~/Fontend/FontEnd.Master" AutoEventWireup="true" CodeBehind="Dangki.aspx.cs" Inherits="BTL_LTW_NC.Fontend.Dangki" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <center style="padding-bottom:250px; padding-top:30px;">
                    <table>
                        <tr>
                            <td></td>
                            <td><h2>Đăng kí tài khoản</h2></td>
                        </tr>
                        <tr>
                            <td>
                                Họ tên:
                            </td>
                            <td>
                               <asp:TextBox ID="txtHoten"  runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvHoten" CssClass="ColorRed" ControlToValidate="txtHoten" runat="server" ErrorMessage="Mã tài khoản không được để trống!"></asp:RequiredFieldValidator>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tên đăng nhập:
                            </td>
                            <td>
                                <asp:TextBox ID="txtTendangnhap" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTendangnhap" CssClass="ColorRed" ControlToValidate="txtTendangnhap" runat="server" ErrorMessage="Tên đăng nhập không được để trống!" Font-Bold="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mật khẩu:
                            </td>
                            <td>
                               <asp:TextBox ID="txtMatkhau" TextMode="Password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvMatkhau" CssClass="ColorRed" ControlToValidate="txtMatKhau" runat="server" ErrorMessage="Mật khẩu không được để trống!"></asp:RequiredFieldValidator>
                                
                            </td>
                        </tr>
                         <tr>
                            <td>
                                Email:
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEmail" CssClass="ColorRed" ControlToValidate="txtEmail" runat="server" ErrorMessage=" Địa chỉ email không được để trống!" Font-Bold="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Số điện thoại:
                            </td>
                            <td>
                               <asp:TextBox ID="txtSdt" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvSdt" CssClass="ColorRed" ControlToValidate="txtSdt" runat="server" ErrorMessage="Số điện thoại không được để trống!"></asp:RequiredFieldValidator>
                                
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Quyền:
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlQuyen" runat="server"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvQuyen" CssClass="ColorRed" ControlToValidate="ddlQuyen" runat="server" ErrorMessage="Quyền truy cập không được để trống!"></asp:RequiredFieldValidator>
                                
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
                                <asp:Button ID="btnDangki" runat="server" Text="Đăng kí" CssClass="btn2 btn-them mt-2" OnClick="btnDangki_Click"/>
                                <asp:Button ID="btnHuy" runat="server" Text="Hủy" CssClass="btn2 btn-huy" />
                            </td>
                        </tr>
                    </table>
                 </center>
</asp:Content>
