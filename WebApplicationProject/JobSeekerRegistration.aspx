<%@ Page Title="" Language="C#" MasterPageFile="~/Defaults.Master" AutoEventWireup="true" CodeBehind="JobSeekerRegistration.aspx.cs" Inherits="WebApplicationProject.JobSeekerRegistration" %>
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
         <td>Date Of Birth: </td>
         <td>
             <asp:TextBox ID="txtdob" runat="server"></asp:TextBox>
         </td>
     </tr>
     <tr>
         <td>Gender: </td>
         <td>
             <asp:RadioButtonList ID="rblgender" runat="server" RepeatColumns="3">
                 <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                 <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                 <asp:ListItem Text="Others" Value="3"></asp:ListItem>
             </asp:RadioButtonList>
         </td>
         <td>Mobile: </td>
         <td>
             <asp:TextBox ID="txtmobile" runat="server"></asp:TextBox>
         </td>
     </tr>
     <tr>
         <td>
             <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
         </td>
     </tr>
     <tr>
         <td>Job Profile: </td>
         <td>
             <asp:DropDownList ID="ddljobprofile" runat="server"></asp:DropDownList>
         </td>
         <td>Qualification: </td>
         <td>
             <asp:DropDownList ID="ddlqualification" runat="server"></asp:DropDownList>
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
         <td>Experience: </td>
         <td>
             <asp:DropDownList ID="ddlexperience" runat="server">
                 <asp:ListItem Text="--Select--" Value="-1"></asp:ListItem>
                 <asp:ListItem Text="Fresher" Value="0"></asp:ListItem>
                 <asp:ListItem Text="1+" Value="1"></asp:ListItem>
                 <asp:ListItem Text="2+" Value="2"></asp:ListItem>
                 <asp:ListItem Text="3+" Value="3"></asp:ListItem>
                 <asp:ListItem Text="4+" Value="4"></asp:ListItem>
                 <asp:ListItem Text="5+" Value="5"></asp:ListItem>
             </asp:DropDownList>
         </td>
     </tr>
     <tr>
         <td>Upload Image: </td>
         <td>
             <asp:FileUpload ID="fuimage" runat="server"></asp:FileUpload>
         </td>
         <td>Upload Resume: </td>
         <td>
             <asp:FileUpload ID="furesume" runat="server"></asp:FileUpload>
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
