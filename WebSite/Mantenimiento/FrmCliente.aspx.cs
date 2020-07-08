using CapaDatos;
using CapaDatos.Entidades;
using CapaDatos.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite.Mantenimiento
{
    public partial class FrmCliente : System.Web.UI.Page
    {
        private ClientesNegocio negocio = new ClientesNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime fechaIngreso;

                if (DateTime.TryParseExact(txtFechaIngreso.Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out fechaIngreso))
                {
                    var cliente = new Cliente()
                    {
                        Nombres = txtNombres.Text,
                        Apellidos = txtApellidos.Text,
                        FechaIngreso = fechaIngreso,
                        Activo = chkActivo.Checked,
                        TipoInscripcion = rbtInternet.Checked ? "Internet" : "Ventanilla"
                    };
                    negocio.crearCliente(cliente);

                    pnlMensajes.Visible = true;
                    pnlMensajes.CssClass = "alert alert-success";
                    lblMensaje.Text = "Se ingresó correctamente el cliente...";
                    limpiarFormulario();
                    grvClientes.DataBind();
                }
                else {
                    pnlMensajes.Visible = true;
                    pnlMensajes.CssClass = "alert alert-danger";
                    lblMensaje.Text = "El formato de fecha es incorrecto (yyyy-MM-dd)...";
                }
                                
            }
            catch (Exception ex)
            {
                pnlMensajes.Visible = true;
                pnlMensajes.CssClass = "alert alert-danger";
                lblMensaje.Text = "Error al guardar la informacion: " + ex.Message;
            }
        }

        private void limpiarFormulario() {
            txtNombres.Text = "";
            txtApellidos.Text = "";
            txtFechaIngreso.Text = "";
            rbtInternet.Checked = false;
            rbtVentanilla.Checked = false;
            chkActivo.Checked = false;

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiarFormulario();
            pnlMensajes.Visible = false;
            lblMensaje.Text = "";
        }
    }
}