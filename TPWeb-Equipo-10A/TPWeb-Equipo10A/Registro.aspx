<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPWeb_Equipo10A.Registro" ResponseEncoding="utf-8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="css/EstiloRegistro.css" />
    <div class="row d-flex">  
        <div class="col-md-6">
    <div style="background-color: #f8f9fa; padding: 15px; margin-bottom: 20px; border-radius: 8px; text-align: center; margin: 10px auto;">
        <h4>Premio Seleccionado:</h4>
        <asp:Panel ID="pnlPremioSeleccionado" runat="server" Visible="false">
            <img src='...' id="imgPremio" runat="server" style="max-width: 300px; height: 300px; object-fit: contain;" />
            <h5 id="lblNombrePremio" runat="server"></h5>
            <p id="lblDescripcionPremio" runat="server"></p>
        </asp:Panel>
    </div>
            </div>

<div class="col-md-6">
    <div class="form-container">
        <h2 class="form-title">Registro</h2>
        <h3 class="form-subtitle">Ingrésa tus datos:</h3>
        
        <div class="alert alert-info" id="divInfoClienteExistente" runat="server" style="display: none; margin-bottom: 15px; padding: 10px; background-color: #d1ecf1; border: 1px solid #bee5eb; border-radius: 4px; color: #0c5460;">
            <strong>¡Cliente encontrado!</strong> Tus datos han sido cargados automáticamente. Puedes modificarlos si es necesario.
        </div>
        
        <div class="form-group">
            <label class="form-label">DNI</label>
            <asp:TextBox ID="txtDNI" runat="server" CssClass="form-control" MaxLength="8" onkeypress="return soloNumeros(event)" onkeyup="buscarDNI()" onblur="validarDNIOnBlur(this)" oninput="validarDNIOnInput(this)"></asp:TextBox>
            <asp:Label ID="lblMensajeDNI" runat="server" CssClass="validacion" style="display: none;"></asp:Label>
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
        </div>
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
            } else if (dni.length < 7 || dni.length > 8) {
                if (timeoutId) {
                    clearTimeout(timeoutId);
                }
            }
        }

        var timeoutValidacionDNI;

        function validarDNIOnBlur(input) {
            var valor = (input.value || '').trim();
            var esValido = valor.length >= 7 && valor.length <= 8;
            var lbl = document.getElementById('<%= lblMensajeDNI.ClientID %>');
            
            if (!esValido) {
                lbl.textContent = 'DNI debe tener entre 7 y 8 dígitos';
                lbl.style.color = 'red';
                lbl.style.display = '';
            } else {
                lbl.textContent = '';
                lbl.style.display = 'none';
            }
        }

        function validarDNIOnInput(input) {
            if (timeoutValidacionDNI) {
                clearTimeout(timeoutValidacionDNI);
            }
            
            timeoutValidacionDNI = setTimeout(function() {
                validarDNIOnBlur(input);
            }, 2000);
        }
    </script>
</asp:Content>

