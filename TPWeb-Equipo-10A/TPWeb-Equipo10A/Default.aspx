<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPWeb_Equipo10A.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Estilos.css" rel="stylesheet" />
    <style>
        body {
            position: relative;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('ImganenFondo.png') no-repeat center center;
            background-size: cover;
            opacity: 0.50;
            z-index: -1;
        }
        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        footer {
            margin-top: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
        <div class="text-center">    
            <br />
            <h1>Bienvenido!!!</h1>
            <br />
            <h4>No te pierdas la oportunidad de ganar premios increibles.</h4>
            <br />
            <h5>Para participar solo debes canjear tu voucher.</h5>
            <br />
            <asp:HyperLink ID="hlCanjearVoucher" runat="server" NavigateUrl="~/CanjearVoucher.aspx" CssClass="btn btn-primary">Canjear Voucher</asp:HyperLink>
        </div>
    </div>
</asp:Content>