using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.Mantenimiento
{
    public partial class FrmProductos : System.Web.UI.Page
    {
        private int indexEliminar = -1;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insertar"))
            {
                odsProductos.Insert();
            }
            if (e.CommandName.Equals("Modificar"))
            {
                odsProductos.Update();
            }
            if (e.CommandName.Equals("Eliminar"))
            {
                indexEliminar = ((e.CommandSource as LinkButton).NamingContainer as GridViewRow).RowIndex;
                odsProductos.Delete();
            }
        }

        protected void odsProductos_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["nombre"] = (gvProductos.FooterRow.FindControl("txtNuevoNombre") as TextBox).Text;
            e.InputParameters["tipoProducto"] = Convert.ToInt32((gvProductos.FooterRow.FindControl("ddlNuevoTipoProducto") as DropDownList).SelectedValue);
            e.InputParameters["precio"] = Convert.ToDouble((gvProductos.FooterRow.FindControl("txtNuevoPrecio") as TextBox).Text);
            e.InputParameters["activo"] = (gvProductos.FooterRow.FindControl("chkNuevoActivo") as CheckBox).Checked;

        }

        protected void odsProductos_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["id"] = (gvProductos.Rows[indexEliminar].FindControl("lblCodigo") as Label).Text;
        }



        protected void odsProductos_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["id"] = (gvProductos.Rows[gvProductos.EditIndex].FindControl("lblCodigo") as Label).Text;
            e.InputParameters["nombre"] = (gvProductos.Rows[gvProductos.EditIndex].FindControl("txtNombre") as TextBox).Text;
            e.InputParameters["tipoProducto"] = Convert.ToInt32((gvProductos.Rows[gvProductos.EditIndex].FindControl("ddlTipoProducto") as DropDownList).SelectedValue);
            e.InputParameters["precio"] = Convert.ToDouble((gvProductos.Rows[gvProductos.EditIndex].FindControl("txtPrecio") as TextBox).Text);
            e.InputParameters["activo"] = (gvProductos.Rows[gvProductos.EditIndex].FindControl("chkActivo") as CheckBox).Checked;

        }

        protected void odsProductos_ProcesoCompletado(object sender, ObjectDataSourceStatusEventArgs e)
        {
            indexEliminar = -1;
            gvProductos.EditIndex = -1;
            gvProductos.DataBind();
        }

    }
}