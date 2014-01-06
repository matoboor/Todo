<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Tasks.aspx.cs" Inherits="Todo.Tasks" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="title">
        <strong>TaskeR</strong> | <asp:Localize runat="server" Text="<%$ Resources: Title %>"></asp:Localize>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="main">
    <h2><asp:Localize ID="Localize1" runat="server" Text="<%$ Resources: H2 %>"></asp:Localize></h2>
    <p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5" CellSpacing="10" DataSourceID="ObjectDataSource1" ForeColor="White" DataKeyNames="Id,Text,Created,Done,TaskListId,UserId">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" />
            <asp:BoundField DataField="Title" HeaderText="<%$ Resources: TitleHeader %>" ReadOnly="True" SortExpression="Title" />
            <asp:BoundField DataField="Created" HeaderText="<%$ Resources: Created %>" SortExpression="Created" />
            <asp:CheckBoxField DataField="Done" HeaderText="<%$ Resources: Done %>" SortExpression="Done" />
            <asp:TemplateField HeaderText="<%$ Resources: Project %>" SortExpression="TaskListId">
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
    </p>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetByUser" TypeName="Todo.App_Code.Data.TaskRepository">
        <SelectParameters>
            <asp:ControlParameter ControlID="aside$DropDownList1" Name="userId" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <p>
    <asp:DetailsView ID="TaskDetailView" runat="server" AutoGenerateRows="False" CellPadding="5" CellSpacing="10" DataKeyNames="Id,Text,Created,Done,UserId,TaskListId" DataSourceID="TaskDetailDataSource" ForeColor="White" Height="50px" OnItemUpdated="TaskDetailView_ItemUpdated" Width="590px">
        <Fields>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:TemplateField HeaderText="<%$ Resources: Text %>" SortExpression="Text">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Height="125px" Rows="3" Text='<%# Bind("Text") %>' TextMode="MultiLine" Width="400px"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Text") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Text") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Created" HeaderText="<%$ Resources: Created %>" ReadOnly="True" SortExpression="Created" />
            <asp:TemplateField HeaderText="<%$ Resources: Done %>" SortExpression="Done">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Done") %>' />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Done") %>' />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Done") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$ Resources: Project %>" SortExpression="TaskListId">
                <EditItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Project.Title") %>'></asp:Label>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TaskListId") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Project.Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    </p>
    <asp:ObjectDataSource ID="TaskDetailDataSource" runat="server" DataObjectTypeName="Todo.App_Code.Model.Task" SelectMethod="Get" TypeName="Todo.App_Code.Data.TaskRepository" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="aside">
    <h3><asp:Localize runat="server" Text="<%$ Resources: UserLabel %>"></asp:Localize></h3>
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="UserDropDownDataSource" DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
    <asp:ObjectDataSource ID="UserDropDownDataSource" runat="server" SelectMethod="GetAll" TypeName="Todo.App_Code.Data.UserRepository"></asp:ObjectDataSource>
    <h4><asp:Localize ID="Localize2" runat="server" Text="<%$ Resources: Overview %>"></asp:Localize></h4>
    <section>
        <asp:Localize ID="Localize3" runat="server" Text="<%$ Resources: Uncompleted %>"></asp:Localize> <asp:Label ID="uncompleted" runat="server" Text="Label"></asp:Label> <br />
        <asp:Localize ID="Localize4" runat="server" Text="<%$ Resources: Completed %>"></asp:Localize> <asp:Label ID="comlpeted" runat="server" Text="Label"></asp:Label> <br />
        <asp:Localize ID="Localize5" runat="server" Text="<%$ Resources: Total %>"></asp:Localize> <asp:Label ID="total" runat="server" Text="Label"></asp:Label>
    </section>

</asp:Content>