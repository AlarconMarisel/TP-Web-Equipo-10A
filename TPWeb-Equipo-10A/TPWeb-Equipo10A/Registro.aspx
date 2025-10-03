<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPWeb_Equipo10A.Registro" ResponseEncoding="utf-8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: lavender !important;
            background-image: none !important;
        }
        body::before {
            display: none !important;
        }
        .form-container {
            max-width: 400px;
            margin: 10px auto;
            padding: 15px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .form-title {
            text-align: center;
            margin-bottom: 10px;
            font-size: 22px;
            color: #333;
        }
        .form-subtitle {
            text-align: left;
            margin-bottom: 15px;
            font-size: 18px;
            color: #666;
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 10px;
        }
        
        .form-group .form-control {
            margin-bottom: 0;
        }
        .form-label {
            display: block;
            margin-bottom: 3px;
            font-weight: normal;
            color: #333;
            font-size: 13px;
        }
        .form-control {
            width: 100%;
            padding: 6px;
            border: 2px solid #ddd;
            border-radius: 4px;
            font-size: 13px;
            height: 32px;
        }
        .email-container {
            display: flex;
            align-items: center;
        }
        .email-at {
            background-color: #f8f9fa;
            border: 2px solid #ddd;
            border-right: none;
            padding: 6px;
            border-radius: 4px 0 0 4px;
            font-weight: bold;
            font-size: 13px;
            height: 32px;
            display: flex;
            align-items: center;
        }
        .email-input {
            border-radius: 0 4px 4px 0;
            border-left: none;
        }
        .checkbox-container {
            margin: 10px 0;
        }
        .checkbox-label {
            display: flex;
            align-items: center;
            font-size: 12px;
        }
        .checkbox-input {
            margin-right: 8px;
        }
        .btn-participar {
            width: 100%;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-participar:hover {
            background-color: #0056b3;
        }
        .validacion{
            color: red;
            font-size: 14px;
            margin: 0;
            padding: 0;
            display: block;
            min-height: 0;
        }
        
        .form-group .validacion {
            margin-top: 2px;
        }
        
        .validacion[style*="display: none"] {
            display: none !important;
        }
        
        .validacion[style*="visibility: hidden"] {
            visibility: hidden !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div style="background-color: #f8f9fa; padding: 15px; margin-bottom: 20px; border-radius: 8px; text-align: center;">
        <h4>Premio Seleccionado:</h4>
        <asp:Panel ID="pnlPremioSeleccionado" runat="server" Visible="false">
            <img src='...' id="imgPremio" runat="server" style="max-width: 200px; height: 150px; object-fit: contain;" />
            <h5 id="lblNombrePremio" runat="server"></h5>
            <p id="lblDescripcionPremio" runat="server"></p>
        </asp:Panel>
    </div>

    <div class="form-container">
        <h2 class="form-title">Registro</h2>
        <h3 class="form-subtitle">Ingrésa tus datos:</h3>
        
        <div class="alert alert-info" id="divInfoClienteExistente" runat="server" style="display: none; margin-bottom: 15px; padding: 10px; background-color: #d1ecf1; border: 1px solid #bee5eb; border-radius: 4px; color: #0c5460;">
            <strong>¡Cliente encontrado!</strong> Tus datos han sido cargados automáticamente. Puedes modificarlos si es necesario.
        </div>
        
        <div class="form-group">
            <label class="form-label">DNI</label>
            <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" MaxLength="8" onkeypress="return soloNumeros(event)" onkeyup="buscarDNI()"></asp:TextBox>
            <asp:Label ID="lblMensajeDNI" runat="server" CssClass="validacion" Visible="false"></asp:Label>
        </div>
        
        <div class="form-group">
            <label class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="" onkeypress="return soloLetrasYEspacios(event)"></asp:TextBox>
             <asp:RequiredFieldValidator CssClass="validacion"  ErrorMessage="Este Campo es requerido!" ControlToValidate="txtNombre" runat="server" />
             <asp:RegularExpressionValidator CssClass="validacion" ErrorMessage="Solo se permiten letras y espacios" ControlToValidate="txtNombre" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" runat="server" />
        </div>
        
        <div class="form-group">
            <label class="form-label">Apellido</label>
            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="" onkeypress="return soloLetrasYEspacios(event)"></asp:TextBox>
             <asp:RequiredFieldValidator CssClass="validacion"  ErrorMessage="Este Campo es requerido!" ControlToValidate="txtApellido" runat="server" />
             <asp:RegularExpressionValidator CssClass="validacion" ErrorMessage="Solo se permiten letras y espacios" ControlToValidate="txtApellido" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" runat="server" />
        </div>
        
        <div class="form-group">
            <label class="form-label">Email</label>
            <div class="email-container">
                <div class="email-at">@</div>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control email-input" placeholder=""></asp:TextBox>
                 <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="Este Campo es requerido!" ControlToValidate="txtEmail" runat="server" />
                 <asp:RegularExpressionValidator CssClass="validacion" ErrorMessage="Formato de email inválido" ControlToValidate="txtEmail" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" runat="server" />
            </div>
        </div>
        
        <div class="form-group">
            <label class="form-label">Dirección</label>
            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
             <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="Este Campo es requerido!" ControlToValidate="txtDireccion" runat="server" />
        </div>
        
        <div class="form-group">
            <label class="form-label">Ciudad</label>
            <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control" placeholder="" onkeypress="return soloLetrasYEspacios(event)"></asp:TextBox>
             <asp:RequiredFieldValidator CssClass="validacion"  ErrorMessage="Este Campo es requerido!" ControlToValidate="txtCiudad" runat="server" />
             <asp:RegularExpressionValidator CssClass="validacion" ErrorMessage="Solo se permiten letras y espacios" ControlToValidate="txtCiudad" ValidationExpression="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$" runat="server" />
        </div>
        
        <div class="form-group">
            <label class="form-label">CP</label>
            <asp:TextBox ID="txtCP" runat="server" CssClass="form-control" placeholder=""></asp:TextBox>
             <asp:RequiredFieldValidator CssClass="validacion"  ErrorMessage="Este Campo es requerido!" ControlToValidate="txtCP" runat="server" />
             <asp:RegularExpressionValidator CssClass="validacion" ErrorMessage="Código Postal debe ser numérico" ControlToValidate="txtCP" ValidationExpression="^\d+$" runat="server" />
        </div>
        
        <div class="checkbox-container">
            <label class="checkbox-label">
                <asp:CheckBox ID="chkTerminos" runat="server" CssClass="checkbox-input" />
                Acepto los términos y condiciones.
            </label>
        </div>
        
        <asp:Button ID="btnParticipar" runat="server" Text="Participar!" CssClass="btn-participar" OnClick="btnParticipar_Click" />
        
        <asp:HiddenField ID="hdnBuscarDNI" runat="server" Value="false" />
        <asp:HiddenField ID="hdnClienteExistente" runat="server" Value="false" />
        <asp:HiddenField ID="hdnIdClienteExistente" runat="server" Value="0" />
    </div>

    <script type="text/javascript">
        var timeoutId;
        
        function soloNumeros(event) {
            var charCode = (event.which) ? event.which : event.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }

        function soloLetrasYEspacios(event) {
            var charCode = (event.which) ? event.which : event.keyCode;
            if (charCode > 31 && (charCode < 65 || charCode > 90) && (charCode < 97 || charCode > 122) && charCode !== 32 && charCode !== 241 && charCode !== 209) {
                return false;
            }
            return true;
        }

        function buscarDNI() {
            if (timeoutId) {
                clearTimeout(timeoutId);
            }
            
            var dni = document.getElementById('<%= txtDNI.ClientID %>').value;
            
            if (dni.length >= 7 && dni.length <= 8) {
                timeoutId = setTimeout(function() {
                    document.getElementById('<%= hdnBuscarDNI.ClientID %>').value = 'true';
                    __doPostBack('<%= Page.ClientID %>', 'BuscarDNI');
                }, 1000);
            } else if (dni.length < 7) {
                if (timeoutId) {
                    clearTimeout(timeoutId);
                }
            }
        }
    </script>
</asp:Content>

