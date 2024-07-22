<%@ Page Title="" Language="C#" MasterPageFile="~/JobRecruiter.Master" AutoEventWireup="true" CodeBehind="JobRecruiterJobPost.aspx.cs" Inherits="WebApplicationProject.JobRecruiterModule.JobRecruiterJobPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Job Post</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table>
            <tr>
                <td>Job Profile: </td>
                <td>
                    <asp:DropDownList ID="ddljobprofile" runat="server"></asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Working Mode: </td>
                <td>
                    <asp:RadioButtonList ID="rblworkingmode" runat="server" RepeatColumns="3">
                        <asp:ListItem Text="Work From Office" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Work From Home" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Hybrid" Value="3"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>

            <tr>
                <td>Gender: </td>
                <td>
                    <asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Other" Value="3"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>

            <tr>
                <td>Qualifications:</td>
                <td>
                    <asp:CheckBoxList ID="cblQualifications" runat="server" RepeatColumns="5">
                        <asp:ListItem Text="M.Tech" Value="1"></asp:ListItem>
                        <asp:ListItem Text="B.Tech" Value="2"></asp:ListItem>
                        <asp:ListItem Text="MCA" Value="3"></asp:ListItem>
                        <asp:ListItem Text="BCA" Value="4"></asp:ListItem>
                        <asp:ListItem Text="BA" Value="5"></asp:ListItem>
                        <asp:ListItem Text="B.Sc" Value="6"></asp:ListItem>
                        <asp:ListItem Text="M.Sc" Value="7"></asp:ListItem>
                        <asp:ListItem Text="LLB" Value="8"></asp:ListItem>
                        <asp:ListItem Text="PhD" Value="9"></asp:ListItem>
                        <asp:ListItem Text="M.Com" Value="10"></asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                </td>
            </tr>

            <tr>
                <td>Min Exp: </td>
                <td>
                    <asp:TextBox ID="txtminexp" runat="server"></asp:TextBox>
                </td>
                <td>Max Exp: </td>
                <td>
                    <asp:TextBox ID="txtmaxexp" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Min Salary: </td>
                <td>
                    <asp:TextBox ID="txtminsalary" runat="server"></asp:TextBox>
                </td>
                <td>Max Salary: </td>
                <td>
                    <asp:TextBox ID="txtmaxsalary" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Vacancy: </td>
                <td>
                    <asp:TextBox ID="txtvacancy" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Comments: </td>
                <td style="columns: 3; vertical-align: top;">
                    <asp:TextBox ID="txtcomments" runat="server"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnjobpost" runat="server" Text="Post Job" OnClick="btnjobpost_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
