using CapaDatos;
using CapaDatos.Entidades;
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
        private TiendaContextoDb contexto = new TiendaContextoDb();
        protected void Page_Load(object sender, EventArgs e)
        {
            limpiarFormulario();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                var cliente = new Cliente()
                {
                    Nombres = txtNombres.Text,
                    Apellidos = txtApellidos.Text,
                    FechaIngreso = calFechaIngreso.SelectedDate,
                    Activo = chkActivo.Checked
                };
                contexto.Clientes.Add(cliente);
                contexto.SaveChanges();

                pnlMensajes.Visible = true;
                pnlMensajes.CssClass = "alert alert-success";
                lblMensaje.Text = "Se ingresó correctamente el cliente...";
                limpiarFormulario();

            }
            catch (Exception ex)
            {
                pnlMensajes.Visible = true;
                pnlMensajes.CssClass = "alert alert-danger";
                lblMensaje.Text = "Error al guardar la informacion: " + ex.Message;
            }
        }

        protected void btnGuardarOpcional_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime fechaIngreso = calFechaIngreso.SelectedDate;

                if (DateTime.TryParseExact(txtFechaIngreso.Text, "yyyy-MM-dd", null, System.Globalization.DateTimeStyles.None, out fechaIngreso))
                {
                    var cliente = new Cliente()
                    {
                        Nombres = txtNombres.Text,
                        Apellidos = txtApellidos.Text,
                        FechaIngreso = fechaIngreso,
                        Activo = chkActivo.Checked
                    };
                    contexto.Clientes.Add(cliente);
                    contexto.SaveChanges();

                    pnlMensajes.Visible = true;
                    pnlMensajes.CssClass = "alert alert-success";
                    lblMensaje.Text = "Se ingresó correctamente el cliente...";
                    limpiarFormulario();
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
            calFechaIngreso.SelectedDate = DateTime.Today;
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