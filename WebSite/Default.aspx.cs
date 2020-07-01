using CapaDatos;
using CapaDatos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class _Default : Page
    {
        private TiendaContextoDb contextoDb = new TiendaContextoDb();
        public Cliente cliente = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            cliente = contextoDb.Clientes.FirstOrDefault();
        }
    }
}