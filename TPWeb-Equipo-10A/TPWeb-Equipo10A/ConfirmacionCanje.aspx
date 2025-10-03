<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmacionCanje.aspx.cs" Inherits="TPWeb_Equipo10A.ConfirmacionCanje" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Confirmación</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body style="background-color: lavender">
    <form id="frmConfirmacionCanje" runat="server">
        <div class="container">
            <div style="padding-top: 10rem">
                <div class="card text-center">
                    <div class="card-body">
                        <h2>¡Su voucher ha sido canjeado exitosamente!</h2>
                        <p>Gracias por participar.¡Buena Suerte!</p>
                        <asp:Button ID="btnVolverInicio" runat="server" Text="Volver al Inicio" OnClick="btnVolverInicio_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
