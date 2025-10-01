using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace TPWeb_Equipo10A
{
    public partial class SeleccionarPremio : System.Web.UI.Page
    {
        public List<Articulo> ListaArticulos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            ListaArticulos = negocio.listarArticuloConSP();

            rptSeleccionPremio.DataSource = ListaArticulos;
            rptSeleccionPremio.DataBind();

        }
        protected void btnSeleccionar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string premioId = btn.CommandArgument;
            Session["PremioSeleccionado"] = premioId;
            Response.Redirect("Registro.aspx");
        }
    }
}
