using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSiteLogin.Models;

namespace WebSiteLogin.Account
{
    public partial class FrmRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ConsultarUsuarios();
            }
        }

        private void ConsultarUsuarios() {
            ApplicationDbContext context = new ApplicationDbContext();
            var usuarios = context.Users.Select(u => new
            {
                Id = u.Id,
                UserName = u.UserName
            }).ToList();
            gvUsuarios.DataSource = usuarios;
            gvUsuarios.DataBind();
        }

        protected async void gvUsuarios_SelectedIndexChangedAsync(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            string codigo = (gvUsuarios.Rows[gvUsuarios.SelectedIndex].FindControl("lblCodigo") as Label).Text;
            string usuario = (gvUsuarios.Rows[gvUsuarios.SelectedIndex].FindControl("lblUsuario") as Label).Text;

            var rolesAsignados = await manager.GetRolesAsync(codigo);
            //manager.AddToRoleAsync(codigo,"Jefe"); //Asignar roles a un usuario
            foreach (var rol in rolesAsignados)
            {
                validarNodos(rol, tvRoles.Nodes);
            }
            tvRoles.DataBind();            
        }

        private void validarNodos(string rol, TreeNodeCollection nodos) {
            foreach (TreeNode nodo in nodos)
            {
                nodo.Selected = nodo.Value.Equals("Todos") || nodo.Value.ToLower().Contains(rol.ToLower());
                if (nodo.ChildNodes.Count > 0)
                {
                    validarNodos(rol, nodo.ChildNodes);
                }

            }
        }

    }
}