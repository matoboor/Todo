<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Default.aspx.cs" Inherits="Todo.Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="title">
   <strong>TaskeR</strong> | <asp:Localize runat="server" Text="<%$ Resources: Title %>"></asp:Localize>

</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="main">
    <h2><asp:Localize ID="Localize1" runat="server" Text="<%$ Resources: H2 %>"></asp:Localize></h2>
    
    <div id="QuickNav">
        <a href="Tasks.aspx" title="Tasks"><img src="img/TaskIcon.png" /></a>
        <a href="Projects.aspx" title="Projects"><img src="img/ProjectIcon.png" /></a>
        <a href="Team.aspx" title="Users"><img src="img/TeamIcon.png" /></a>
    </div>
    <br />
    <div class="fete"><asp:Localize ID="Localize2" runat="server" Text="<%$ Resources: Tasks %>"></asp:Localize></div>
    <div class="fete"><asp:Localize ID="Localize3" runat="server" Text="<%$ Resources: Projects %>"></asp:Localize></div>
    <div class="fete"><asp:Localize ID="Localize4" runat="server" Text="<%$ Resources: Team %>"></asp:Localize></div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="aside">

</asp:Content>
