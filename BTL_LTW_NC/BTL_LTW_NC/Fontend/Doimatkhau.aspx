<%@ Page Title="" Language="C#" MasterPageFile="~/Fontend/FontEnd.Master" AutoEventWireup="true" CodeBehind="Doimatkhau.aspx.cs" Inherits="BTL_LTW_NC.Fontend.Doimatkhau" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
        <center style="padding-bottom:250px; padding-top:30px;">
    
                    <table style="margin-right: 45px;">
                        <tr>
                            <td></td>
                            <td><h2>Đổi mật khẩu</h2></td>
                        </tr>
                        <tr>
                            <td>
                                Mật khẩu cũ:
                            </td>
                            <td>
                                <asp:TextBox ID="txtPasswordOld" runat="server"></asp:TextBox>
                                <%--<asp:RequiredFieldValidator ID="rptTaiKhoan" CssClass="ColorRed" ControlToValidate="txtTaiKhoan" runat="server" ErrorMessage="Tài khoản không được để trống!" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Mật khẩu mới:
                            </td>
                            <td>
                               <asp:TextBox ID="txtPasswordNew" runat="server"></asp:TextBox>
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
                                <asp:Button ID="btnDoimatkhau" runat="server" Text="Đổi mật khẩu" CssClass="btn2 btn-huy" OnClick="btnDoimatkhau_Click"/>
                            </td>
                        </tr>
                    </table>
        
        </center>
</asp:Content>
