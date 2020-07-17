using CapaDatos.Entidades;
using CapaDatos.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSiteLogin
{
    public partial class FrmPedidos : System.Web.UI.Page
    {

        public List<DetallePedido> Detalles { 
            get {
                if (Session["detalle_crear"] == null)
                {
                    Session["detalle_crear"] = new List<DetallePedido> { new DetallePedido() };
                }
                return (List<DetallePedido>)Session["detalle_crear"];
            } 
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            var pedido = new Pedido();

            pedido.ClienteId = Convert.ToInt32(ddlCliente.SelectedValue);
            pedido.FechaIngreso = DateTime.Parse(txtFechaIngreso.Text);
            pedido.Direccion = txtDireccion.Text.TrimEnd();

            if (this.Detalles.Where(d => d.Producto != null).Count() > 0)
            {
                pedido.Detalles = this.Detalles.Select(d => new DetallePedido
                {
                    ProductoId = d.ProductoId,
                    Cantidad = d.Cantidad
                }).ToList();

                PedidosNegocio pedidosNegocio = new PedidosNegocio();
                pedido = pedidosNegocio.Crear(pedido);

                btnCancelar_Click(null, null);
                txtPedidoId.Text = pedido.Id.ToString();
                pnlMensaje.Visible = true;
                return;
            }

            ModelState.AddModelError("Nuevo","Debe ingresarse un detalle para el pedido...");
            
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            ddlCliente.ClearSelection();
            txtFechaIngreso.Text = "";
            txtDireccion.Text = "";
            this.Detalles.Clear();
            this.Detalles.Add(new DetallePedido());
            gvDetallePedidos.DataBind();
        }

        

        // El tipo devuelto puede ser modificado a IEnumerable, sin embargo, para ser compatible con la paginación y ordenación de 
        //, se deben agregar los siguientes parametros:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<CapaDatos.Entidades.DetallePedido> gvDetallePedidos_GetData()
        {           
            return this.Detalles.ToArray().AsQueryable();
        }

        protected void gvDetallePedidos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
        }

        protected void lnkCrear_Click(object sender, EventArgs e)
        {
            var detallePedido = new DetallePedido();

            ProductosNegocio productoNegocio = new ProductosNegocio();
            var producto = productoNegocio.consultar(Convert.ToInt32((gvDetallePedidos.FooterRow.FindControl("ddlNuevoProducto") as DropDownList).SelectedValue));

            detallePedido.Producto = producto;
            detallePedido.ProductoId = producto.Id;
            detallePedido.Cantidad = Convert.ToInt32((gvDetallePedidos.FooterRow.FindControl("txtNuevaCantidad") as TextBox).Text);
            this.Detalles.Add(detallePedido);
            var delete = this.Detalles.Where(d => d.Producto == null).SingleOrDefault();
            if (delete != null)
            {
                this.Detalles.Remove(delete);
            }
            gvDetallePedidos.DataBind();
            lblMensaje.Text = "";
            pnlMensaje.Visible = false;
        }

        protected void ddlNuevoProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddl.NamingContainer;
            ProductosNegocio productoNegocio = new ProductosNegocio();
            var producto = productoNegocio.consultar(Convert.ToInt32(ddl.SelectedValue));

        }
    }
}