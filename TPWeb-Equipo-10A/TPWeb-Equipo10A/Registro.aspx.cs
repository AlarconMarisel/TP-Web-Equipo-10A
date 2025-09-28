using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPWeb_Equipo10A
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnParticipar_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('¡Registro exitoso! Ya puedes participar en nuestras promociones.');</script>");
        }
    }
}

