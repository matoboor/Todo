<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Projects.aspx.cs" Inherits="Todo.Projects" %>


<asp:Content runat="server" ContentPlaceHolderID="title">
        <strong>TaskeR</strong> | <asp:Localize runat="server" Text="<%$ Resources: Title %>"></asp:Localize>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="main">
    <h2><img src="/img/Projects.png" />&nbsp<asp:Label runat="server" ID="projectHeader"></asp:Label></h2>
    <asp:Button ID="DeleteButton" runat="server" BackColor="Red" OnClick="DeleteButton_Click" Text="<%$ Resources: DeleteButton %>" />
    <p> 
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="TasksDataSource" CellPadding="5" CellSpacing="10" DataKeyNames="Id" ForeColor="White" ShowFooter="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle ForeColor="White" />
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" ForeColor="White" Text="Select"></asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="AddTask" runat="server" OnClick="AddTask_Click" Text="<%$ Resources: NewButton %>" />
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Title" HeaderText="<%$ Resources: TitleHeader %>" SortExpression="Title" />
                <asp:BoundField DataField="Created" HeaderText="<%$ Resources: Created %>" SortExpression="Created" />
                <asp:CheckBoxField DataField="Done" HeaderText="<%$ Resources: Done %>" SortExpression="Done" />
                <asp:BoundField DataField="Owner.Name" HeaderText="<%$ Resources: User %>" SortExpression="UserId" />
            </Columns>
            <EmptyDataTemplate>
                <div>
                    <asp:Button ID="FirstTaskButton" runat="server" OnClick="FirstTaskButton_Click" Text="<%$ Resources: AddNewTaskButton %>" />
                </div>
            </EmptyDataTemplate>
            <HeaderStyle BackColor="#E44D26" ForeColor="White" />
        </asp:GridView>        
    </p>   
        
    <asp:ObjectDataSource ID="TasksDataSource" runat="server" SelectMethod="GetByTaskList" TypeName="Todo.App_Code.Data.TaskRepository">
            <SelectParameters>
                <asp:QueryStringParameter Name="taskListId" QueryStringField="id" Type="Int32" />
            </SelectParameters>
    </asp:ObjectDataSource>
        
    <p>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id,Text,Created,Done,UserId,TaskListId" DataSourceID="TaskDetailDataSource" Height="50px" OnItemDeleted="DetailsView1_ItemDeleted" OnItemUpdated="DetailsView1_ItemUpdated" Width="490px" CellPadding="5" CellSpacing="10" OnPageIndexChanging="DetailsView1_PageIndexChanging" OnItemInserted="DetailsView1_ItemInserted" OnItemInserting="DetailsView1_ItemInserting">
                <CommandRowStyle ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:TemplateField HeaderText="Text" SortExpression="Text">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Text") %>' Height="125px" Rows="3" TextMode="MultiLine" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Text") %>' Height="125px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Text") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Created" HeaderText="<%$ Resources: Created %>" InsertVisible="False" ReadOnly="True" SortExpression="Created" />
                    <asp:CheckBoxField DataField="Done" HeaderText="<%$ Resources: Done %>" SortExpression="Done" />
                    <asp:TemplateField HeaderText="<%$ Resources: User %>" SortExpression="UserId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="UsersDropdownDataSource" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("UserId") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="UsersDropdownDataSource" DataTextField="Name" DataValueField="Id" SelectedValue='<%# Bind("UserId") %>'>
                            </asp:DropDownList>
                            <asp:HiddenField ID="HiddenTaskListId" runat="server" Value='<%# Bind("TaskListId") %>' />
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("Id") %>' />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Owner.Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
    </p>
    
    <asp:ObjectDataSource ID="UsersDropdownDataSource" runat="server" SelectMethod="GetAll" TypeName="Todo.App_Code.Data.UserRepository"></asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="TaskDetailDataSource" runat="server" DataObjectTypeName="Todo.App_Code.Model.Task" DeleteMethod="Delete" InsertMethod="Save" SelectMethod="Get" TypeName="Todo.App_Code.Data.TaskRepository" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
        <br />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="aside">

    <asp:Repeater ID="ProjectsMenuRepeater" runat="server" DataSourceID="ProjectsMenuDataSource">
    
        <HeaderTemplate>
           <h3><asp:Localize runat="server" Text="<%$ Resources: Title %>"></asp:Localize></h3>
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
    <asp:TextBox ID="newProject" runat="server" Width="96px" ValidationGroup="0"></asp:TextBox>
    <asp:Button ID="newProjectButton" runat="server" OnClick="newProjectButton_Click" Text="<%$ Resources: AddButton %>" ValidationGroup="0" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="newProject" ErrorMessage="You must add a project name!" ValidationGroup="0"></asp:RequiredFieldValidator>
    </div>
</asp:Content>
