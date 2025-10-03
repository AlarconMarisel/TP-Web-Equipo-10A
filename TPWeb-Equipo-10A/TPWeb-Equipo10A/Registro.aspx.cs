using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPWeb_Equipo10A
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                MostrarPremioSeleccionado();
            }

            if (IsPostBack && hdnBuscarDNI.Value == "true")
            {
                BuscarClientePorDNI();
                hdnBuscarDNI.Value = "false";
            }
        }

        private void MostrarPremioSeleccionado()
        {
            string premioIdStr = Session["PremioSeleccionado"]?.ToString();

            if (!string.IsNullOrEmpty(premioIdStr))
            {
                int premioId = Convert.ToInt32(premioIdStr);
                ArticuloNegocio negocio = new ArticuloNegocio();

                List<Articulo> articulos = negocio.listarArticuloConSP();
                Articulo premioSeleccionado = articulos.FirstOrDefault(a => a.IdArticulo == premioId);

                if (premioSeleccionado != null)
                {
                    pnlPremioSeleccionado.Visible = true;
                    lblNombrePremio.InnerText = premioSeleccionado.NombreArticulo;
                    lblDescripcionPremio.InnerText = premioSeleccionado.DescripcionArticulo;

                    if (premioSeleccionado.Imagenes != null && premioSeleccionado.Imagenes.Count > 0)
                    {
                        imgPremio.Src = premioSeleccionado.Imagenes[0].ImagenUrl;
                    }
                }
            }
        }

        protected void btnParticipar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtDNI.Text))
            {
                lblMensajeDNI.Text = "Este campo es requerido";
                lblMensajeDNI.CssClass = "validacion";
                lblMensajeDNI.Style["color"] = "red";
                lblMensajeDNI.Visible = true;
                return;
            }
            if (txtDNI.Text.Length < 7 || txtDNI.Text.Length > 8)
            {
                lblMensajeDNI.Text = "DNI debe tener entre 7 y 8 dígitos";
                lblMensajeDNI.CssClass = "validacion";
                lblMensajeDNI.Style["color"] = "red";
                lblMensajeDNI.Visible = true;
                return;
            }
            if (string.IsNullOrWhiteSpace(txtNombre.Text) ||
                string.IsNullOrWhiteSpace(txtApellido.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtDireccion.Text) ||
                string.IsNullOrWhiteSpace(txtCiudad.Text) ||
                string.IsNullOrWhiteSpace(txtCP.Text))
            {
                Response.Write("<script>alert('Todos los campos son requeridos.');</script>");
                return;
            }
            if (!chkTerminos.Checked)
            {
                Response.Write("<script>alert('Debe aceptar los términos y condiciones para participar.');</script>");
                return;
            }

            Cliente cliente = new Cliente();
            ClienteNegocio negocioCliente = new ClienteNegocio();

            try
            {
                cliente.Documento = txtDNI.Text.Trim();
                cliente.Nombre = txtNombre.Text.Trim();
                cliente.Apellido = txtApellido.Text.Trim();
                cliente.Email = txtEmail.Text.Trim();
                cliente.Direccion = txtDireccion.Text.Trim();
                cliente.Ciudad = txtCiudad.Text.Trim();

                int codigoPostal;
                if (!int.TryParse(txtCP.Text.Trim(), out codigoPostal))
                {
                    Response.Write("<script>alert('Error: El Código Postal debe ser un número válido.');</script>");
                    return;
                }
                cliente.CodigoPostal = codigoPostal;

                int idCliente;
                
                if (hdnClienteExistente.Value == "true" && !string.IsNullOrEmpty(hdnIdClienteExistente.Value))
                {
                    cliente.IdCliente = Convert.ToInt32(hdnIdClienteExistente.Value);
                    negocioCliente.modificarCliente(cliente);
                    idCliente = cliente.IdCliente;
                }
                else
                {
                    idCliente = negocioCliente.agregarCliente(cliente);
                }

                if (idCliente > 0)
                {
                    Session["IdUsuario"] = idCliente;
                    Session["NombreUsuario"] = cliente.Nombre + " " + cliente.Apellido;

                   
                    string codigoVoucher = Session["CodigoVoucher"]?.ToString();
                    string premioIdStr = Session["PremioSeleccionado"]?.ToString();

                    if (!string.IsNullOrEmpty(codigoVoucher) && !string.IsNullOrEmpty(premioIdStr))
                    {
                        int premioId = Convert.ToInt32(premioIdStr);
                        VoucherNegocio negocioVoucher = new VoucherNegocio();
                        negocioVoucher.canjearVoucher(codigoVoucher, idCliente, premioId);

                        Session.Remove("CodigoVoucher");
                        Session.Remove("PremioSeleccionado");

                        Response.Redirect("ConfirmacionCanje.aspx", false);

                    }

                    //string mensaje = hdnClienteExistente.Value == "true" 
                    //    ? "¡Datos actualizados exitosamente! Ya puedes participar en nuestras promociones."
                    //    : "¡Registro exitoso! Ya puedes participar en nuestras promociones.";

                    //Response.Write($"<script>alert('{mensaje}');</script>");
                    //Response.Redirect("Premios.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Error en el registro: No se pudo completar el registro.');</script>");
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error en el registro: {ex.Message}');</script>");
            }
        }


        private void BuscarClientePorDNI()
        {
            try
            {
                string dni = txtDNI.Text.Trim();
                
                if (string.IsNullOrEmpty(dni) || dni.Length < 7 || dni.Length > 8)
                {
                    lblMensajeDNI.Text = "";
                    lblMensajeDNI.Visible = false;
                    return;
                }

                ClienteNegocio negocioCliente = new ClienteNegocio();
                Cliente clienteExistente = negocioCliente.obtenerClientePorDocumento(dni);

                if (clienteExistente != null)
                {
                    txtNombre.Text = clienteExistente.Nombre;
                    txtApellido.Text = clienteExistente.Apellido;
                    txtEmail.Text = clienteExistente.Email;
                    txtDireccion.Text = clienteExistente.Direccion;
                    txtCiudad.Text = clienteExistente.Ciudad;
                    txtCP.Text = clienteExistente.CodigoPostal.ToString();

                    hdnClienteExistente.Value = "true";
                    hdnIdClienteExistente.Value = clienteExistente.IdCliente.ToString();

                    divInfoClienteExistente.Style["display"] = "block";
                    lblMensajeDNI.Text = "Cliente encontrado. Puedes modificar tus datos si es necesario.";
                    lblMensajeDNI.CssClass = "validacion";
                    lblMensajeDNI.Style["color"] = "green";
                    lblMensajeDNI.Visible = true;
                }
                else
                {
                    txtNombre.Text = "";
                    txtApellido.Text = "";
                    txtEmail.Text = "";
                    txtDireccion.Text = "";
                    txtCiudad.Text = "";
                    txtCP.Text = "";

                    hdnClienteExistente.Value = "false";
                    hdnIdClienteExistente.Value = "0";

                    divInfoClienteExistente.Style["display"] = "none";
                    lblMensajeDNI.Text = "DNI no encontrado, complete todos los campos";
                    lblMensajeDNI.CssClass = "validacion";
                    lblMensajeDNI.Style["color"] = "blue";
                    lblMensajeDNI.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblMensajeDNI.Text = "Error al buscar cliente: " + ex.Message;
                lblMensajeDNI.CssClass = "validacion";
                lblMensajeDNI.Style["color"] = "red";
                lblMensajeDNI.Visible = true;
            }
        }

    }
}