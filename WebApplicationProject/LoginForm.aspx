<%@ Page Title="" Language="C#" MasterPageFile="~/Defaults.Master" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="WebApplicationProject.LoginForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>

        <tr>
            <td>Email: </td>
            <td>
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Password: </td>
            <td>
                <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnlogin" Text="Login" runat="server" OnClick="btnlogin_Click" />
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:Label ID="lblmsg" runat="server" ForeColor="White" Font-Bold="true"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
