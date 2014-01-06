<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" MasterPageFile="~/Responsive.Master" Inherits="Todo.EditUser" %>

    <asp:Content ID="Content1" runat="server" ContentPlaceHolderID="title">
        <strong>TaskeR</strong> | Edit User
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="main">
    <p>
    <asp:Button ID="BackButton" runat="server" Text="<%$ Resources: BackButton %>" OnClick="BackButton_Click"  />
    </p>

    <h2><asp:Localize runat="server" Text="<%$ Resources: UserId %>"></asp:Localize> <asp:Label ID="UserIdLabel" runat="server"></asp:Label></h2>
    
    <p>
        <asp:Table ID="Table1" runat="server" >
            <asp:TableHeaderRow>
                <asp:TableHeaderCell BackColor="#E44D26" ColumnSpan="3" Height="15px"></asp:TableHeaderCell>
            </asp:TableHeaderRow>
            <asp:TableRow runat="server" >
                <asp:TableCell>
                    <asp:Label ID="nameLabel" runat="server" Text="<%$ Resources: NameLabel %>"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="NameTextBox" runat="server" TabIndex="1"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RequiredFieldValidator ID="NameRequiredFieldValidator1" ValidationGroup="0" runat="server" ControlToValidate="NameTextBox" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell>
                    <asp:Label ID="userNameLabel" runat="server" Text="<%$ Resources: UsernameLabel %>"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="UsernameTextBox" runat="server" TabIndex="2" ValidationGroup="0"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                     <asp:RequiredFieldValidator ID="UsernameRequiredFieldValidator1" runat="server" ValidationGroup="0" ControlToValidate="UsernameTextBox" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                </asp:TableCell>
            </asp:TableRow>
               
            <asp:TableRow runat="server">
                <asp:TableCell>
                     <asp:Label ID="passwordLabel" runat="server" Text="<%$ Resources: PasswordLabel %> "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="PasswordTextBox" runat="server" AutoComplete="off" TextMode="Password" ValidationGroup="0" ReadOnly="true" TabIndex="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="PasswordTextBox" ValidationGroup="0"></asp:RequiredFieldValidator>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="EditButton" runat="server" Text="<%$ Resources: EditButton %>" OnClick="EditButton_Click" />
                </asp:TableCell>
            </asp:TableRow>

            <asp:TableRow ID="changePasswordRow" runat="server">
                <asp:TableCell>
                     <asp:Label ID="retypePasswordLabel" runat="server" Text="<%$ Resources: RetypePasswordLabel %>"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="retypePasswordTextBox" runat="server" AutoComplete="off" TextMode="Password" ValidationGroup="0" ReadOnly="false" TabIndex="4"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="0" ControlToCompare="PasswordTextBox" ControlToValidate="retypePasswordTextBox" ErrorMessage="Retype password"></asp:CompareValidator>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableFooterRow>
                <asp:TableHeaderCell ColumnSpan="3" BackColor="#E44D26" Height="15px"></asp:TableHeaderCell>
            </asp:TableFooterRow>
        </asp:Table>                            
    </p>
    <asp:Button ID="Save" runat="server" Text="<%$ Resources: SaveButton %>" OnClick="Save_Click" TabIndex="4" ValidationGroup="0" />
    <asp:Button ID="Delete" runat="server" Text="<%$ Resources: DeleteButton %>" OnClick="Delete_Click" />
    <asp:Label ID="errorLabel" runat="server"></asp:Label>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="aside">
    info about user
</asp:Content>