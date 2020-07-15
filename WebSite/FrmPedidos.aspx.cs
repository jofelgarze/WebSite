using CapaDatos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class FrmPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

        }

        // El tipo devuelto puede ser modificado a IEnumerable, sin embargo, para ser compatible con la paginación y ordenación de 
        //, se deben agregar los siguientes parametros:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<CapaDatos.Entidades.DetallePedido> gvDetallePedidos_GetData()
        {
            IQueryable<DetallePedido> query = new DetallePedido[] { new DetallePedido() { 
                Producto = new Producto { Id = 1 }
            } }.AsQueryable();
            return query;
        }

        protected void gvDetallePedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}