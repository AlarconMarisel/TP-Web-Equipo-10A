<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RechazoVoucher.aspx.cs" Inherits="TPWeb_Equipo10A.RechazoVoucher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Voucher</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="background-color: lavender">
    <form id="frmRechazoVoucher" runat="server">
        <div class="container">
            <div style="padding-top: 10rem">
                <div class="card text-center">
                    <div class="card-body">
                        <%if (user == "")
                            {%>
                        <h2>Voucher Rechazado</h2>
                        <p>El código de voucher ingresado no es válido. Por favor, intente nuevamente.</p>
                        <% }
                            else
                            {%>
                        <h2>Voucher Rechazado</h2>
                        <p>El voucher ya ha sido canjeado previamente. Por favor, ingrese otro voucher.</p>
                        <%} %>
                        <asp:Button ID="btnRegresarInicio" runat="server" Text="Volver al Inicio" CssClass="btn btn-primary" OnClick="btnRegresarInicio_Click" />
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
