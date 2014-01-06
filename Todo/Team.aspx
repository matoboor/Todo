<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Team.aspx.cs" Inherits="Todo.Team" %>


    <asp:Content ID="Content1" runat="server" ContentPlaceHolderID="title">
        <strong>TaskeR</strong> | <asp:Localize runat="server" Text="<%$ Resources: Title %>"></asp:Localize>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="main">
    <h2>Team</h2>
    <asp:GridView ID="UsersGridView" runat="server" AutoGenerateColumns="False" DataSourceID="UsersDataSource" CellPadding="5" CellSpacing="10" ForeColor="White">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="<%$ Resources: Id %>" SortExpression="Id" />
            <asp:BoundField DataField="Name" HeaderText="<%$ Resources: Name %>" SortExpression="Name" />
            <asp:BoundField DataField="Username" HeaderText="<%$ Resources: Username %>" SortExpression="Username" />
            <asp:TemplateField HeaderText="<%$ Resources: Password %>" SortExpression="Password">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Password") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$ Resources: Action %>">
                
                <ItemTemplate>
                    <a href="EditUser.aspx?id=<%# Eval("Id")%>" class="white" ><asp:Localize ID="Localize1" runat="server" Text="<%$ Resources: EditLink %>"></asp:Localize></a>
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
    <strong><a href="RegisterUser.aspx" class="white"><asp:Localize ID="Localize2" runat="server" Text="<%$ Resources: Register %>"></asp:Localize></a></strong><br />
    </section>

    <p>
        <asp:Label ID="MessageBox" runat="server"></asp:Label>
    </p>



</asp:Content>