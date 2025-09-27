<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_Equipo10A.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center">    
        <br />
        <h1>Bienvenido!!!</h1>
        <br />
        <h4>No te pierdas la oportunidad de ganar premios increibles.</h4>
        <br />
        <h5>Para participar solo debes canjear tu voucher.</h5>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CanjearVoucher.aspx" CssClass="btn btn-primary">Canjear Voucher</asp:HyperLink>
    </div>
</asp:Content>