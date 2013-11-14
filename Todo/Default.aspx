<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.cs" Inherits="Todo.Default" %>

    <asp:Content runat="server" ContentPlaceHolderID="title">
        <h1>Predajcovia</h1>
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
            <hr />
        <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSource2" Height="50px" OnItemDeleted="DetailsView2_ItemDeleted" OnItemInserted="DetailsView2_ItemInserted" OnItemUpdated="DetailsView2_ItemUpdated" Width="125px" DataKeyNames="Id,Title">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="Todo.App_Code.Model.TaskList" DeleteMethod="Delete" InsertMethod="Save" SelectMethod="Get" TypeName="Todo.App_Code.Data.TaskListRepository" UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView2" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </asp:Content>

