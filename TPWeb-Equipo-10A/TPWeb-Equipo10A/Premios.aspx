<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Premios.aspx.cs" Inherits="TPWeb_Equipo10A.Premios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/estilos.css" />


    <h2>Premios</h2>
    <p>Estos son los premios que puedes ganar:</p>

    <div class="cards-container">
        <asp:Repeater ID="rptPremios" runat="server">
            <ItemTemplate>
                <div class="card">
                        <img src="..." class="card-img-top" alt="Premio">
                    <div class="card-body">
                        <h5 class="card-title"><%#Eval("nombreArticulo") %></h5>
                        <h6 class="card-text">Marca: <%#Eval("MarcaArticulo") %></h6>
                        <p class="card-text"><%#Eval("descripcionArticulo") %></p>
                        <a href="Registro.aspx" class="btn btn-primary">Quiero este!</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <p>Recuerda que para participar debes canjear tu voucher.</p>
    <asp:HyperLink ID="hlCanjearVoucher" runat="server" NavigateUrl="~/CanjearVoucher.aspx" CssClass="btn btn-primary">Canjear Voucher</asp:HyperLink>

</asp:Content>
