using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPWeb_Equipo10A
{
    public partial class CanjearVoucher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCanjear_Click(object sender, EventArgs e)
        {

            Response.Redirect("SeleccionarPremio.aspx");
        }
    }
}
