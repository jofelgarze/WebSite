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
    }
}