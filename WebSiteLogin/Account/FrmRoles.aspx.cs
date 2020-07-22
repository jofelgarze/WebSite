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
            tvRoles.Enabled = gvUsuarios.SelectedIndex != -1;
            btnActualizar.Enabled = gvUsuarios.SelectedIndex != -1;
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
            
            var rolesAsignados = await manager.GetRolesAsync(codigo);
            lblUsuario.Text = (gvUsuarios.Rows[gvUsuarios.SelectedIndex].FindControl("lblUsuario") as Label).Text + 
                (rolesAsignados.Count > 0 ? "(Roles:" + string.Join(",",rolesAsignados) + ")" : "");

            limpiarNodos(tvRoles.Nodes);
            foreach (var rol in rolesAsignados)
            {
                validarNodos(rol, tvRoles.Nodes);
            }
            tvRoles.Enabled = gvUsuarios.SelectedIndex != -1;
            btnActualizar.Enabled = gvUsuarios.SelectedIndex != -1;
            pnlMensaje.Visible = false;
            updPanelRoles.Update();
        }

        private void limpiarNodos(TreeNodeCollection nodos)
        {
            foreach (TreeNode nodo in nodos)
            {
                nodo.Checked = false;
                if (nodo.ChildNodes.Count > 0)
                {
                    limpiarNodos(nodo.ChildNodes);
                }
            }
        }

        private void validarNodos(string rol, TreeNodeCollection nodos) {
            foreach (TreeNode nodo in nodos)
            {
                nodo.Checked = nodo.Value.Equals("Todos") || nodo.Value.ToLower().Contains(rol.ToLower()) || nodo.Checked;
                if (nodo.ChildNodes.Count > 0)
                {
                    validarNodos(rol, nodo.ChildNodes);
                }
            }
        }


        protected async void btnActualizar_ClickAsync(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            string codigo = (gvUsuarios.Rows[gvUsuarios.SelectedIndex].FindControl("lblCodigo") as Label).Text;
            await actulizarRolesAsync(manager, codigo, tvRoles.Nodes);

            var rolesAsignados = await manager.GetRolesAsync(codigo);
            limpiarNodos(tvRoles.Nodes);
            foreach (var rol in rolesAsignados)
            {
                validarNodos(rol, tvRoles.Nodes);
            }
            pnlMensaje.Visible = true;
            lblUsuario.Text = (gvUsuarios.Rows[gvUsuarios.SelectedIndex].FindControl("lblUsuario") as Label).Text +
                (rolesAsignados.Count > 0 ? "(Roles:" + string.Join(",", rolesAsignados) + ")" : "");
            updPanelRoles.Update();
        }

        private async System.Threading.Tasks.Task actulizarRolesAsync(ApplicationUserManager manager, string usuario,TreeNodeCollection nodos)
        {
            foreach (TreeNode nodo in nodos)
            {
                if (!string.IsNullOrEmpty(nodo.Value) && !nodo.Value.Equals("Todos")) {
                    string[] roles = nodo.Value.Split(',');
                    foreach (var rol in roles)
                    {
                        if (nodo.Checked && !await manager.IsInRoleAsync(usuario, rol))
                        {
                            var result = await manager.AddToRoleAsync(usuario, rol); //Asignar roles a un usuario
                        }
                        else if(!nodo.Checked && await manager.IsInRoleAsync(usuario, rol))
                        {
                            await manager.RemoveFromRoleAsync(usuario, rol);//Revocar roles a un usuario
                        }                        
                    }                    
                }
                
                if (nodo.ChildNodes.Count > 0)
                {
                    await actulizarRolesAsync(manager, usuario, nodo.ChildNodes);
                }
            }
        }
    }
}