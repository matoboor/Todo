<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Projects.aspx.cs" Inherits="Todo.Projects" %>


<asp:Content runat="server" ContentPlaceHolderID="title">
        <strong>TaskeR</strong> | Projects
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="main">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="TasksDataSource">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" />
                <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                <asp:CheckBoxField DataField="Done" HeaderText="Done" SortExpression="Done" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            </Columns>
            <EmptyDataTemplate>
                <p>No Tasks</p>
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#E44D26" ForeColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="TasksDataSource" runat="server" SelectMethod="GetByTaskList" TypeName="Todo.App_Code.Data.TaskRepository">
            <SelectParameters>
                <asp:QueryStringParameter Name="taskListId" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="aside">

    <asp:Repeater ID="ProjectsMenuRepeater" runat="server" DataSourceID="ProjectsMenuDataSource">
    
        <HeaderTemplate>
           <h3>Projects</h3>
           <ul class="minimenu">
        </HeaderTemplate>

        <ItemTemplate>
            
           <li> <a href="Projects.aspx?id=<%#Eval("Id") %>"><%#Eval("Title") %></a></li>
        </ItemTemplate>

        <FooterTemplate>
            </ul>
        </FooterTemplate>
    
    </asp:Repeater>
    <asp:ObjectDataSource ID="ProjectsMenuDataSource" runat="server" SelectMethod="GetAll" TypeName="Todo.App_Code.Data.TaskListRepository"></asp:ObjectDataSource>

</asp:Content>
