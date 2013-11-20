<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Default.aspx.cs" Inherits="Todo.Default" %>

    <asp:Content runat="server" ContentPlaceHolderID="title">
        Tasker
    </asp:Content>
    
    <asp:Content runat="server" ContentPlaceHolderID="main">
        <div>
        </div>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ObjectDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            </Columns>
        </asp:GridView>
        
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="Todo.App_Code.Model.TaskList" DeleteMethod="Delete" InsertMethod="Save" SelectMethod="GetAll" TypeName="Todo.App_Code.Data.TaskListRepository" UpdateMethod="Update"></asp:ObjectDataSource>
        
        
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSource2" Height="50px" OnItemDeleted="DetailsView2_ItemDeleted" OnItemInserted="DetailsView2_ItemInserted" OnItemUpdated="DetailsView2_ItemUpdated" Width="125px" DataKeyNames="Id,Title">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="Todo.App_Code.Model.TaskList" DeleteMethod="Delete" InsertMethod="Save" SelectMethod="Get" TypeName="Todo.App_Code.Data.TaskListRepository" UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="ObjectDataSource3">
            <Columns>
              <asp:CommandField ShowSelectButton="True" />
              <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
              <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
              <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
              <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            </Columns>
        </asp:GridView>
    
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetAll" TypeName="Todo.App_Code.Data.UserRepository"></asp:ObjectDataSource>

    <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSource4" Height="50px" Width="125px" DataKeyNames="Id,Name,Username,Password" OnItemCreated="DetailsView3_ItemCreated" OnItemDeleted="DetailsView3_ItemDeleted" OnItemInserted="DetailsView3_ItemInserted" OnItemUpdated="DetailsView3_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>

    <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" DataObjectTypeName="Todo.App_Code.Model.User" DeleteMethod="Delete" InsertMethod="Save" SelectMethod="Get" TypeName="Todo.App_Code.Data.UserRepository" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView3" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
        
        <asp:Label ID="Label3" runat="server" Text="Tasks"></asp:Label>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource5" DataKeyNames="Id">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" />
                <asp:BoundField DataField="Created" HeaderText="Created" SortExpression="Created" />
                <asp:CheckBoxField DataField="Done" HeaderText="Done" SortExpression="Done" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                <asp:BoundField DataField="TaskListId" HeaderText="TaskListId" SortExpression="TaskListId" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" SelectMethod="GetAll" TypeName="Todo.App_Code.Data.TaskRepository"></asp:ObjectDataSource>
        <asp:DetailsView ID="DetailsView4" runat="server" AutoGenerateRows="False" DataKeyNames="Id,Text,Created,Done,UserId,TaskListId" DataSourceID="ObjectDataSource6" Height="50px" OnItemCreated="DetailsView4_ItemCreated" OnItemDeleted="DetailsView4_ItemDeleted" OnItemInserted="DetailsView4_ItemInserted" OnItemUpdated="DetailsView4_ItemUpdated" Width="125px">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Text" HeaderText="Text" SortExpression="Text" />
                <asp:BoundField DataField="Created" DataFormatString="{0:f}" HeaderText="Created" InsertVisible="False" ReadOnly="True" SortExpression="Created" />
                <asp:CheckBoxField DataField="Done" HeaderText="Done" SortExpression="Done" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                <asp:BoundField DataField="TaskListId" HeaderText="TaskListId" SortExpression="TaskListId" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" DataObjectTypeName="Todo.App_Code.Model.Task" DeleteMethod="Delete" InsertMethod="Save" SelectMethod="Get" TypeName="Todo.App_Code.Data.TaskRepository" UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView4" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </asp:Content>

