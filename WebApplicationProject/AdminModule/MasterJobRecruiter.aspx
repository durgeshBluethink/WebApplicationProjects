<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MasterJobRecruiter.aspx.cs" Inherits="WebApplicationProject.AdminModule.MasterJobRecruiter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:GridView ID="gvjobRecruiter" runat="server" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="JobRecruiter Name">
                            <ItemTemplate>
                                <%#Eval("JobRecruiterName") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <%#Eval("JobRecruiterEmail") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="URL">
                            <ItemTemplate>
                                <%#Eval("JobRecruiterURL") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <%#Eval("JobRecruiterAddress") %>,
                                    <%#Eval("CityName") %>,
                                    <%#Eval("StateName") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Mobile No">
                            <ItemTemplate>
                                <%#Eval("JobRecruiterMobile") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Persion Contact">
                            <ItemTemplate>
                                <%#Eval("JobRecruiterHR") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                               <asp:Image ID="imgjobrecruiter" runat="server" width="50px" Height="40px" ImageUrl='<%#Eval("JobRecruiterImage", "~/JobRecruiterImages/{0}") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Inserted Date">
                            <ItemTemplate>
                                <%#Eval("jrinserteddate") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
