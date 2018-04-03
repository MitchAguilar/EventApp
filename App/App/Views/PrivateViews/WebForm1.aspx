<%@ Page Title="" Language="C#" MasterPageFile="~/Views/PrivateViews/menus.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="App.Views.PrivateViews.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>hola</p>
    <input type="text" class="form-control" placeholder="nombre del evento"/>
    <button class="btn btn-default">gola</button>
    <asp:Button Text="registrar" runat="server" ID="registrar" OnClick="registrar_Click" />
</asp:Content>
