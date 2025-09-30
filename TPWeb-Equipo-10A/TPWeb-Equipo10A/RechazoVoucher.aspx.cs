using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPWeb_Equipo10A
{
    public partial class RechazoVoucher : System.Web.UI.Page
    {   
        public string user { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            user = Session["voucher"].ToString();
        }

        protected void btnRegresarInicio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }


}