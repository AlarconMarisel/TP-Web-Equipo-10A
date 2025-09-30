using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TPWeb_Equipo10A
{
    public partial class CanjearVoucher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCanjear_Click(object sender, EventArgs e)
        {
            VoucherNegocio negocio = new VoucherNegocio();
            string codigoVoucher = txtVoucher.Text;
            
            Session.Add("voucher", codigoVoucher);

            if (string.IsNullOrEmpty(codigoVoucher))
            {
                lblMensaje.Text = "Por favor, ingrese un código de voucher.";
                return;
            }
            else if (negocio.obtenerVoucherPorCodigo(codigoVoucher) == null)
            {
                Session.Add("voucher", "");
                Response.Redirect("RechazoVoucher.aspx", false);
            }
            else if (negocio.obtenerVoucherPorCodigo(codigoVoucher).FechaCanje != null)
            {
                Response.Redirect("RechazoVoucher.aspx", false);
            }
            else
            { 
                Response.Redirect("SeleccionarPremio.aspx", false);
            }
        }
    }
}
