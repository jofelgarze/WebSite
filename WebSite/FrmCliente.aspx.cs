using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSite.Modelos;
using WebSite.Modelos.Entidades;

namespace WebSite
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private TiendaContextDb contextDb;
        private Cliente cliente;
        protected void Page_Load(object sender, EventArgs e)
        {
            contextDb = new TiendaContextDb();
            cliente = contextDb.Clientes.FirstOrDefault();
        }

        public IQueryable<Cliente> consultarClientes()
        {
            var query = contextDb.Clientes;
            return query;
        }

        // El nombre de parámetro del id. debe coincidir con el valor DataKeyNames establecido en el control
        public void gvClientes_UpdateItem(int id)
        {
            WebSite.Modelos.Entidades.Cliente item = contextDb.Clientes.Where(c => c.Id == id).SingleOrDefault();
            // Cargar el elemento aquí, por ejemplo item = MyDataLayer.Find(id);
            if (item == null)
            {
                // No se encontró el elemento
                ModelState.AddModelError("", String.Format("No se encontró el elemento con id. {0}", id));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                contextDb.SaveChanges();
                // Guarde los cambios aquí, por ejemplo MyDataLayer.SaveChanges();

            }
        }

        protected void rowsToDisplay_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvClientes.PageSize = int.Parse(rowsToDisplay.SelectedValue);
        }

        protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Crear" && Page.IsValid) {
                insertarRegistro();
            }
        }

        private void insertarRegistro() {
            //var cliente = new Cliente();
            //cliente.Nombres = (gvClientes.FooterRow.FindControl("txtNuevoNombre") as TextBox).Text;
            //cliente.Apellidos = (gvClientes.FooterRow.FindControl("txtNuevoApellido") as TextBox).Text;
            //cliente.FechaNacimiento = DateTime.Parse((gvClientes.FooterRow.FindControl("txtNuevaFechaNacimiento") as TextBox).Text);
            //cliente.Activo = (gvClientes.FooterRow.FindControl("chkNuevoActivo") as CheckBox).Checked;
            //odsClientes.InsertParameters["Nombres"].DefaultValue = cliente.Nombres;
            //odsClientes.InsertParameters["Apellidos"].DefaultValue = cliente.Apellidos;
            //odsClientes.InsertParameters["FechaNacimiento"].DefaultValue = (gvClientes.FooterRow.FindControl("txtNuevaFechaNacimiento") as TextBox).Text;
            //odsClientes.InsertParameters["Activo"].DefaultValue = cliente.Activo.ToString();
            odsClientes.Insert();
        }

        protected void odsClientes_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["Nombres"] = (gvClientes.FooterRow.FindControl("txtNuevoNombre") as TextBox).Text;
            e.InputParameters["Apellidos"] = (gvClientes.FooterRow.FindControl("txtNuevoApellido") as TextBox).Text;
            e.InputParameters["FechaNacimiento"] = DateTime.Parse((gvClientes.FooterRow.FindControl("txtNuevaFechaNacimiento") as TextBox).Text);
            e.InputParameters["Activo"] = (gvClientes.FooterRow.FindControl("chkNuevoActivo") as CheckBox).Checked;
        }

    }
}