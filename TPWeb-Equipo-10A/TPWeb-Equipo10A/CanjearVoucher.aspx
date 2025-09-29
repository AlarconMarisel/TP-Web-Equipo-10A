<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CanjearVoucher.aspx.cs" Inherits="TPWeb_Equipo10A.CanjearVoucher" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Participa por cualquiera de nuestros premios</h2>
    <p>Ingresa tu Voucher</p>

    <asp:TextBox REQUIRED ID="txtVoucher" runat="server" Placeholder="Ingrese su código"  ></asp:TextBox>
    <asp:Button ID="btnCanjear" runat="server" Text="Canjear" OnClick="btnCanjear_Click" CssClass="btn btn-primary" />
    
    <asp:Label ID="lblMensaje" runat="server" CssClass="text-success"></asp:Label>
</asp:Content>
