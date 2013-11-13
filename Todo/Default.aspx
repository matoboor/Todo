<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Todo.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Heno smrdi</h1>
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Meno" HeaderText="Meno" SortExpression="Meno" />
                <asp:BoundField DataField="Priezvisko" HeaderText="Priezvisko" SortExpression="Priezvisko" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Server=32f95191-f0b7-4f58-b323-a275000b989d.sqlserver.sequelizer.com;Database=db32f95191f0b74f58b323a275000b989d;User ID=okjunwouayacrcfj;Password=3qn5G76cA28AffupZPzx2qvPMnt4TYPwvX2hCYLJAsvL3hR4LSoaNWCK3FquLbrK;" DeleteCommand="DELETE FROM [Predajca] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Predajca] ([Meno], [Priezvisko]) VALUES (@Meno, @Priezvisko)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Predajca]" UpdateCommand="UPDATE [Predajca] SET [Meno] = @Meno, [Priezvisko] = @Priezvisko WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Meno" Type="String" />
                <asp:Parameter Name="Priezvisko" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Meno" Type="String" />
                <asp:Parameter Name="Priezvisko" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" Height="50px" OnItemCreated="DetailsView1_ItemCreated" OnItemDeleted="DetailsView1_ItemDeleted" OnItemInserted="DetailsView1_ItemInserted" OnItemUpdated="DetailsView1_ItemUpdated" Width="125px">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Meno" HeaderText="Meno" SortExpression="Meno" />
                <asp:BoundField DataField="Priezvisko" HeaderText="Priezvisko" SortExpression="Priezvisko" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:appharbor %>" DeleteCommand="DELETE FROM [Predajca] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Predajca] ([Meno], [Priezvisko]) VALUES (@Meno, @Priezvisko)" SelectCommand="SELECT * FROM [Predajca] WHERE ([Id] = @Id)" UpdateCommand="UPDATE [Predajca] SET [Meno] = @Meno, [Priezvisko] = @Priezvisko WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Meno" Type="String" />
                <asp:Parameter Name="Priezvisko" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Meno" Type="String" />
                <asp:Parameter Name="Priezvisko" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
