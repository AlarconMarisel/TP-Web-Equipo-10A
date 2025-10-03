<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Premios.aspx.cs" Inherits="TPWeb_Equipo10A.Premios" %>
<%@ Import Namespace="Dominio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: lavender !important;
            background-image: none !important;
        }
        body::before {
            display: none !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/estilos.css" />


    <h2>Premios</h2>
    <p>Estos son los premios que puedes ganar:</p>

    <div class="cards-container">
        <asp:Repeater ID="rptPremios" runat="server">
            <ItemTemplate>
                <div class="card">
                    <div id='carousel<%#Eval("IdArticulo") %>' class="carousel slide">
                        <div class="carousel-inner">
                            <asp:Repeater ID="rptImagenes" runat="server" DataSource='<%#Eval("Imagenes") %>'>
                                <ItemTemplate>
                                    <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                                        <img src='<%#Eval("ImagenUrl") %>' class="d-block w-100 card-img-top" alt="Imagen del premio" style="height: 200px; object-fit: contain;">
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        
                        <asp:Panel ID="pnlControles" runat="server" Visible='<%# ((List<Imagen>)Eval("Imagenes")).Count > 1 %>'>
                            <button class="carousel-control-prev" type="button" data-bs-target='#carousel<%#Eval("IdArticulo") %>' data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Anterior</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target='#carousel<%#Eval("IdArticulo") %>' data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Siguiente</span>
                            </button>
                        </asp:Panel>
                        
                        <asp:Panel ID="pnlIndicadores" runat="server" Visible='<%# ((List<Imagen>)Eval("Imagenes")).Count > 1 %>'>
                            <div class="carousel-indicators">
                                <asp:Repeater ID="rptIndicadores" runat="server" DataSource='<%#Eval("Imagenes") %>'>
                                    <ItemTemplate>
                                        <button type="button" data-bs-target='#carousel<%#Eval("IdArticulo") %>' data-bs-slide-to='<%# Container.ItemIndex %>' 
                                                class='<%# Container.ItemIndex == 0 ? "active" : "" %>' aria-current="true" aria-label="Slide <%# Container.ItemIndex + 1 %>"></button>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </asp:Panel>
                    </div>
                    
                    <div class="card-body">
                        <h5 class="card-title"><%#Eval("nombreArticulo") %></h5>
                        <h6 class="card-text">Marca: <%#Eval("MarcaArticulo") %></h6>
                        <p class="card-text"><%#Eval("descripcionArticulo") %></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <p>Recuerda que para participar debes canjear tu voucher.</p>
    <asp:HyperLink ID="hlCanjearVoucher" runat="server" NavigateUrl="~/CanjearVoucher.aspx" CssClass="btn btn-primary">Canjear Voucher</asp:HyperLink>

</asp:Content>
