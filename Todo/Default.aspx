<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Todo.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <Columns>
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
    </form>
</body>
</html>
