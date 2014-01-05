<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Default.aspx.cs" Inherits="Todo.Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="title">
   <strong>TaskeR</strong> | Welcome

</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="main">
    <h2>Quick Navigation</h2>
    
    <div id="QuickNav">
        <a href="Tasks.aspx" title="Tasks"><img src="img/TaskIcon.png" /></a>
        <a href="Projects.aspx" title="Projects"><img src="img/ProjectIcon.png" /></a>
        <a href="Team.aspx" title="Users"><img src="img/TeamIcon.png" /></a>
    </div>
    <br />
    <div class="fete">Tasks</div>
    <div class="fete">Projects</div>
    <div class="fete">Team</div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="aside">

</asp:Content>
