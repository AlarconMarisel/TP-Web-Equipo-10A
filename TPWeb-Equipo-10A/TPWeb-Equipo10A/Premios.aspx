<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Premios.aspx.cs" Inherits="TPWeb_Equipo10A.Premios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<link rel="stylesheet" href="css/estilos.css" />


    <h2>Premios</h2>
    <p>Estos son los premios que puedes ganar:</p>
<div class="cards-container">
  <div class="card">
    <img src="#" class="card-img-top" alt="Premio 1">
    <div class="card-body">
      <h5 class="card-title">Premio 1</h5>
      <p class="card-text">Descripción premio 1.</p>
      <a href="#" class="btn btn-primary">Quiero este!</a>
    </div>
  </div>

  <div class="card">
    <img src="#" class="card-img-top" alt="Premio 2">
    <div class="card-body">
      <h5 class="card-title">Premio 2</h5>
      <p class="card-text">Descripción premio 2.</p>
      <a href="#" class="btn btn-primary">No, este!</a>
    </div>
  </div>

  <div class="card">
    <img src="#" class="card-img-top" alt="Premio 3">
    <div class="card-body">
      <h5 class="card-title">Premio 3</h5>
      <p class="card-text">Descripción premio 3.</p>
      <a href="#" class="btn btn-primary">Mejor este!</a>
    </div>
  </div>
</div>
    <p>Recuerda que para participar debes canjear tu voucher.</p>
    <asp:HyperLink ID="hlCanjearVoucher" runat="server" NavigateUrl="~/CanjearVoucher.aspx" CssClass="btn btn-primary">Canjear Voucher</asp:HyperLink>

</asp:Content>
