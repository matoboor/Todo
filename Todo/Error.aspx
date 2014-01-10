<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Todo.Error" %>
<%@ Register Assembly="ErrorDetails" Namespace="ErrorDetails" TagPrefix="CC" %>
    <img src="img/Error.png" height="150px" width="150px" title="Error" />
    <br />
    <br />
    <CC:ErrorDetail ID="ErrorDetailControll" runat="server" ErrorMessage="Ooops error has occured..." ShowDetailsMessage="false"  ></CC:ErrorDetail>

    

