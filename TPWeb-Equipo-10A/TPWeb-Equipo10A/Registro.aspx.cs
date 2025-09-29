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

        }

        protected void btnParticipar_Click(object sender, EventArgs e)
        {

            if (!Page.IsValid)
            {

                return;
            }

            if (!chkTerminos.Checked)
            {
                Response.Write("<script>alert('Debe aceptar los términos y condiciones para participar.');</script>");
                return;
            }

            Cliente nuevoCliente = new Cliente();
            ClienteNegocio negocioCliente = new ClienteNegocio();

            try
            {
                nuevoCliente.Documento = txtDNI.Text.Trim();
                nuevoCliente.Nombre = txtNombre.Text.Trim();
                nuevoCliente.Apellido = txtApellido.Text.Trim();
                nuevoCliente.Email = txtEmail.Text.Trim();
                nuevoCliente.Direccion = txtDireccion.Text.Trim();
                nuevoCliente.Ciudad = txtCiudad.Text.Trim();

                int codigoPostal;
                if (int.TryParse(txtCP.Text.Trim(), out codigoPostal))
                {
                    nuevoCliente.CodigoPostal = codigoPostal;
                }
                else
                {

                    Response.Write("<script>alert('Error: El Código Postal debe ser un número válido.');</script>");
                    return;
                }

                int idNuevoCliente = negocioCliente.agregarCliente(nuevoCliente);

                if (idNuevoCliente > 0)
                {

                    Session["IdUsuario"] = idNuevoCliente;
                    Session["NombreUsuario"] = nuevoCliente.Nombre + " " + nuevoCliente.Apellido;

                    Response.Write("<script>alert('¡Registro exitoso! Ya puedes participar en nuestras promociones.');</script>");


                    Response.Redirect("Premios.aspx");
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

    }
}