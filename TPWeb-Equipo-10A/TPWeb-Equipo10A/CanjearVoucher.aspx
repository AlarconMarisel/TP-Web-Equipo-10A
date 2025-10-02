<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CanjearVoucher.aspx.cs" Inherits="TPWeb_Equipo10A.CanjearVoucher" MasterPageFile="~/MasterPage.master" %>

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
            <h2>Participa por cualquiera de nuestros premios</h2>
            <p>Ingresa tu Voucher</p>

            <asp:TextBox ID="txtVoucher" runat="server" Placeholder="Ingrese su código"  ></asp:TextBox>
            <asp:Button ID="btnCanjear" runat="server" Text="Canjear" OnClick="btnCanjear_Click" CssClass="btn btn-primary" />
            
            <asp:Label ID="lblMensaje" runat="server" CssClass="text-success"></asp:Label>
        </div>
    </div>
</asp:Content>
