<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="Todo.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/login.css" />
    <title>Login - Tasker</title>
</head>
<body>
    <form id="form1" runat="server">
    
        <div id="header">
            TaskeR
        </div>

        <div id="main">
            <h2>
                Welcome to TaskeR
            </h2>
            Todo manager
                <section>
                    Username: <asp:TextBox ID="UsernameTextBox" runat="server" Width="200px"></asp:TextBox><br />
                    <br />
                    Password: <asp:TextBox ID="PasswordTextBox" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                </section>   
                <section>
                    <asp:Button ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" />
                </section>  
                    <asp:Label ID="ErrorLabel" runat="server"></asp:Label>     
                    <asp:RequiredFieldValidator ID="UsernameRequiredFieldValidator1" runat="server" ErrorMessage="Username required" ControlToValidate="UsernameTextBox"></asp:RequiredFieldValidator><br />

                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator1" runat="server" ErrorMessage="Password required" ControlToValidate="PasswordTextBox"></asp:RequiredFieldValidator>
                       
        </div>

        <div id="footer">
            <p>Martin Boor</p>
        </div>
    </form>
</body>
</html>
