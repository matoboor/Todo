<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Team.aspx.cs" Inherits="Todo.Team" %>


    <asp:Content ID="Content1" runat="server" ContentPlaceHolderID="title">
        <strong>TaskeR</strong> | Team
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="main">
    
    <asp:GridView ID="UsersGridView" runat="server" AutoGenerateColumns="False" DataSourceID="UsersDataSource" CellPadding="5" CellSpacing="10" ForeColor="White">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:TemplateField HeaderText="Password" SortExpression="Password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Action">
                
                <ItemTemplate>
                    <a href="EditUser.aspx?id=<%# Eval("Id")%>" class="white" >Edit</a>
                </ItemTemplate>
                
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#E44D26" />
    </asp:GridView>
    <asp:ObjectDataSource ID="UsersDataSource" runat="server" SelectMethod="GetAll" TypeName="Todo.App_Code.Data.UserRepository"></asp:ObjectDataSource>
&nbsp;
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="aside">
    
    <section>
    <strong><a href="RegisterUser.aspx" class="white">Register new user</a></strong><br />
    </section>

    <p>
        <asp:Label ID="MessageBox" runat="server"></asp:Label>
    </p>



</asp:Content>