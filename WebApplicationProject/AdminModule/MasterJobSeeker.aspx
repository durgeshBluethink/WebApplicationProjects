<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="MasterJobSeeker.aspx.cs" Inherits="WebApplicationProject.AdminModule.MasterJobSeeker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="gvjobseeker" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateField HeaderText="JobSeeker Name">
                                <ItemTemplate>
                                    <%#Eval("JobSeekerName") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <%#Eval("JobSeekerEmail") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <%#
                                        Eval("JobSeekerGender").ToString() =="1" ? "Male" :
                                        Eval("JobSeekerGender").ToString() =="2" ? "FeMale":"Others"
                                    %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="JobProfile">
                                <ItemTemplate>
                                    <%#Eval("JobProfileName") %>,
                                    <%#Eval("JobSeekerExp") %> Year
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Qualification">
                                <ItemTemplate>
                                    <%#Eval("QualificationName") %>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>  

                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <%#Eval("JobSeekerAddress") %>,
                                    <%#Eval("CityName") %>,
                                    <%#Eval("StateName") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Date of Birth">
                                <ItemTemplate>
                                    <%#Eval("jsdob") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Mobile No">
                                <ItemTemplate>
                                    <%#Eval("JobSeekerMobile") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
              <asp:Image ID="imgjobseeker" runat="server" width="50px" Height="40px" ImageUrl='<%#Eval("JobSeekerImage", "~/JobSeekerImages/{0}") %>' />

                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Resume">
                                <ItemTemplate>
                                    <%#Eval("JobSeekerResume") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Inserted Date">
                                <ItemTemplate>
                                    <%#Eval("jsinserteddate") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
