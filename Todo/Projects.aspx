<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Projects.aspx.cs" Inherits="Todo.Projects" %>


<asp:Content runat="server" ContentPlaceHolderID="title">
        <strong>TaskeR</strong> | Projects
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="main">
    <h2><asp:Label runat="server" ID="projectHeader"></asp:Label></h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="TasksDataSource">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" />
                <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                <asp:CheckBoxField DataField="Done" HeaderText="Done" SortExpression="Done" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
            </Columns>
            <EmptyDataTemplate><div><asp:HyperLink>Add new task</asp:HyperLink></div></EmptyDataTemplate>
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
            <section>   
           <ul class="minimenu">
        </HeaderTemplate>

        <ItemTemplate>
            
           <li> <a href="Projects.aspx?id=<%#Eval("Id") %>"><%#Eval("Title") %></a></li>
        </ItemTemplate>

        <FooterTemplate>
            </ul>
            </section>
        </FooterTemplate>
    
    </asp:Repeater>
    <asp:ObjectDataSource ID="ProjectsMenuDataSource" runat="server" SelectMethod="GetAll" TypeName="Todo.App_Code.Data.TaskListRepository" DataObjectTypeName="Todo.App_Code.Model.TaskList" InsertMethod="Save"></asp:ObjectDataSource>
    <div>
    <asp:TextBox ID="newProject" runat="server" Width="100px"></asp:TextBox>
    <asp:Button ID="newProjectButton" runat="server" OnClick="newProjectButton_Click" Text="Add" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="newProject" ErrorMessage="You must add a project name!"></asp:RequiredFieldValidator>
    </div>
</asp:Content>
