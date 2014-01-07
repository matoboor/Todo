<%@ Page Language="C#" MasterPageFile="~/Responsive.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="Todo.News" %>

    <asp:Content ID="Content1" runat="server" ContentPlaceHolderID="title">
        <strong>TaskeR</strong> | News
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="main">
    <h2>News</h2>
    <asp:Repeater ID="NewsRepeater" runat="server" DataSourceID="XmlDataSource1">
        <HeaderTemplate>
            <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <span class="NewsTitle"><%# XPath("Title") %></span><br />
            Date: <span class="NewsDate"> <%# XPath("Date") %></span><br />
            <span class="NewsText"><%# XPath("Text")%></span><br />
            <span class="NewsEditButton"><a href="News.aspx?id=<%# XPath("Id") %>">Edit</a></span><br />
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
        <h3>Add new</h3>
        Title: <br />
        <asp:TextBox ID="TitleTextBox" runat="server" Width="140px" ValidationGroup="1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="TitleRequiredFieldValidator" ValidationGroup="1" runat="server" ErrorMessage="Required Field" ControlToValidate="TitleTextBox"></asp:RequiredFieldValidator>
        <br />
        Text: <br />
        <asp:TextBox ID="TextBox" runat="server" Width="140px" Height="100px" ValidationGroup="1" TextMode="MultiLine" Rows="3"></asp:TextBox>
        <asp:RequiredFieldValidator ID="TextRequiredFieldValidator"  ValidationGroup="1" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="AddButton" runat="server" PostBackUrl="~/News.aspx" Text="Add" ValidationGroup="1" OnClick="AddButton_Click"/>
        <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" BackColor="Red" Visible="false"/>
    </section>

</asp:Content>
