<%@ Page Title="" Language="C#" MasterPageFile="~/Defaults.Master" AutoEventWireup="true" CodeBehind="JobRecruiterRegistration.aspx.cs" Inherits="WebApplicationProject.JobRecruiterRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>Name: </td>
            <td>
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
            </td>
            <td>Email: </td>
            <td>
                <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Password: </td>
            <td>
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td>URL: </td>
            <td>
                <asp:TextBox ID="txturl" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Mobile: </td>
            <td>
                <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox>
            </td>

            <td>Contact Persion: </td>
            <td>
                <asp:TextBox ID="txthr" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>State: </td>
            <td>
                <asp:DropDownList ID="ddlstate" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged"></asp:DropDownList>
            </td>
            <td>City: </td>
            <td>
                <asp:DropDownList ID="ddlcity" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Address: </td>
            <td>
                <asp:TextBox ID="txtadd" runat="server"></asp:TextBox>
            </td>
            <td>Upload Image: </td>
            <td>
                <asp:FileUpload ID="fuimage" runat="server"></asp:FileUpload>
            </td>

        </tr>
        <tr>
            <td style="vertical-align: text-top">Comments: </td>
            <td colspan="3">
                <asp:TextBox ID="txtcomments" runat="server" TextMode="MultiLine" Rows="5" Columns="80"></asp:TextBox>
            </td>
        </tr>
        <tr style="text-align: center;">
            <td colspan="3" style="color: white">
                <asp:Button ID="btnregister" Text="Register" runat="server" OnClick="btnregister_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
