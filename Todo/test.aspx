<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Todo.test" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.Globalization" %>
<script runat="server">
protected override void InitializeCulture()
{
    if (Request.Form["ListBox1"] != null)
    {
        String selectedLanguage = Request.Form["ListBox1"];
        UICulture = selectedLanguage ;
        Culture = selectedLanguage ;

        Thread.CurrentThread.CurrentCulture = 
            CultureInfo.CreateSpecificCulture(selectedLanguage);
        Thread.CurrentThread.CurrentUICulture = new 
            CultureInfo(selectedLanguage);
    }
    base.InitializeCulture();
}
</script>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hallo</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="DropDownList1" runat="server" meta:resourcekey="DropDownList1Resource1"></asp:DropDownList>
        <asp:Localize ID="h1" runat="server" Text="<%$ Resources: h1 %>"></asp:Localize>
        <asp:Label ID="Label1" runat="server" Text="wonderland" meta:resourcekey="Label1Resource1"></asp:Label>
        <asp:ListBox ID="ListBox1" runat="server" meta:resourcekey="ListBox1Resource1">
            <asp:ListItem Value="en-US" 
                Selected="True" meta:resourcekey="ListItemResource1">English</asp:ListItem>
            <asp:ListItem Value="sk-Sk" meta:resourcekey="ListItemResource2">Slovak</asp:ListItem>
        </asp:ListBox><br />
        <asp:Button ID="Button1" runat="server" 
            Text="Set Language" meta:resourcekey="Button1"  />
    </div>
    </form>
</body>
</html>
