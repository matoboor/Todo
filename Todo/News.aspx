<%@ Page Language="C#" MasterPageFile="~/Responsive.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Todo.News" %>

    <asp:Content ID="Content1" runat="server" ContentPlaceHolderID="title">
        <strong>TaskeR</strong> | <asp:Localize runat="server" Text="<%$ Resources: Title %>"></asp:Localize>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="main">
    <h2><asp:Localize ID="Localize1" runat="server" Text="<%$ Resources: Title %>"></asp:Localize></h2>
    <asp:Repeater ID="NewsRepeater" runat="server" DataSourceID="XmlDataSource1">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <span class="NewsTitle"><%# XPath("Title") %></span><br />
            <asp:Localize ID="Localize2" runat="server" Text="<%$ Resources: Date %>"></asp:Localize>: <span class="NewsDate"> <%# XPath("Date") %></span><br />
            <span class="NewsText"><%# XPath("Text")%></span><br />
            <span class="NewsEditButton"><a href="News.aspx?id=<%# XPath("Id") %>"><asp:Localize ID="Localize3" runat="server" Text="<%$ Resources: EditLink %>"></asp:Localize></a></span><br />
            <hr />
        </ItemTemplate>
        <FooterTemplate>
            </ul>
            
        </FooterTemplate>
    </asp:Repeater>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/News.xml" XPath="News/Notice"></asp:XmlDataSource>
</asp:Content>
    
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="aside">

    <section>
        <h3><asp:Localize ID="Localize4" runat="server" Text="<%$ Resources: AddNews %>"></asp:Localize></h3>
        <asp:Localize ID="Localize5" runat="server" Text="<%$ Resources: TitleLabel %>"></asp:Localize> <br />
        <asp:TextBox ID="TitleTextBox" runat="server" Width="140px" ValidationGroup="1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" ValidationGroup="1" runat="server" ErrorMessage="Required Field" ControlToValidate="TitleTextBox"></asp:RequiredFieldValidator>
        <br />
        <asp:Localize ID="Localize6" runat="server" Text="<%$ Resources: TextLabel %>"></asp:Localize> <br />
        <asp:TextBox ID="TextBox" runat="server" Width="140px" Height="100px" ValidationGroup="1" TextMode="MultiLine" Rows="3"></asp:TextBox>
        <asp:RequiredFieldValidator ID="TextRequiredFieldValidator"  ValidationGroup="1" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="AddButton" runat="server" PostBackUrl="~/News.aspx" Text="<%$ Resources: AddButton %>" ValidationGroup="1" OnClick="AddButton_Click"/>
        <asp:Button ID="DeleteButton" runat="server" Text="<%$ Resources: DeleteButton %>" OnClick="DeleteButton_Click" BackColor="Red" Visible="false"/>
    </section>

</asp:Content>
