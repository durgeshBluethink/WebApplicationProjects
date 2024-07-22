﻿<%@ Page Title="" Language="C#" MasterPageFile="~/JobSeeker.Master" AutoEventWireup="true" CodeBehind="JobSeekerShowJobPost.aspx.cs" Inherits="WebApplicationProject.JobSeekerModule.JobSeekerShowJobPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <asp:GridView ID="gvjobpost" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" ForeColor="#333333" GridLines="None">

                    <AlternatingRowStyle BackColor="White" />

                    <Columns>

                        <asp:TemplateField HeaderText="Company Name">
                            <ItemTemplate>
                                <%#Eval("JobRecruiterName") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="JobProfile">
                            <ItemTemplate>
                                <%#Eval("JobProfileName") %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="WorkingMode">
                            <ItemTemplate>
                                <%#Eval("JobPostMode").ToString() == "1" ? "Work From Office" : Eval("JobPostMode").ToString() == "2" ? "Work From Home" : "Hybrid Mode"%>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>

                                <%#Eval("JobPostGender").ToString() == "1" ? "Male" : Eval("JobPostGender").ToString() == "2" ? "Female":"Both"%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Required Qualification">
                            <ItemTemplate>
                                <%#Eval("JobPostQualifications")%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Required Exp">
                            <ItemTemplate>
                                <%#Eval("JobPostMinExp")%> year-<%#Eval("JobPostMaxExp")%> year
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Offered Salary">
                            <ItemTemplate>
                                Rs.<%#Eval("JobPostMinSalary")%>-Rs.<%#Eval("JobPostMaxSalary")%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Vacancy">
                            <ItemTemplate>
                                <%#Eval("JobPostVacancy")%>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Inserted Date">
                            <ItemTemplate>
                                <%#Eval("jpinserteddate")%>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <%#Eval("JobPostStatus")%>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />

                </asp:GridView>
            </td>
        </tr>
    </table>

</asp:Content>
