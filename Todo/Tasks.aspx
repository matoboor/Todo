<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Tasks.aspx.cs" Inherits="Todo.Tasks" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="title">
        <strong>TaskeR</strong> | Tasks
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="main">
    <h2>My Tasks</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5" CellSpacing="10" DataSourceID="ObjectDataSource1" ForeColor="White">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" SortExpression="Title" />
            <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" />
            <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
            <asp:CheckBoxField DataField="Done" HeaderText="Done" SortExpression="Done" />
            <asp:TemplateField HeaderText="Project" SortExpression="TaskListId">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TaskListId") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Project.Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <HeaderStyle BackColor="#E44D26" />
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetByUser" TypeName="Todo.App_Code.Data.TaskRepository">
        <SelectParameters>
            <asp:ControlParameter ControlID="aside$DropDownList1" Name="userId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="aside">
    <h3>User</h3>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="UserDropDownDataSource" DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="UserDropDownDataSource" runat="server" SelectMethod="GetAll" TypeName="Todo.App_Code.Data.UserRepository"></asp:ObjectDataSource>
    <h4>Overview</h4>
    <section>
        Uncompleted : <asp:Label ID="uncompleted" runat="server" Text="Label"></asp:Label> <br />
        Completed   : <asp:Label ID="comlpeted" runat="server" Text="Label"></asp:Label> <br />
        Total       : <asp:Label ID="total" runat="server" Text="Label"></asp:Label>
    </section>

</asp:Content>