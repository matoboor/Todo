<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Responsive.Master" CodeBehind="Default.aspx.cs" Inherits="Todo.Default" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="title">
   <strong>TaskeR</strong> | Welcome <%# Page.User.Identity.Name %>
</asp:Content>