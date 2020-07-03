<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmCliente.aspx.cs" Inherits="WebSite.Mantenimiento.FrmCliente" %>

<asp:Content ID="cntFrmCliente" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Clientes <small>Mantenimiento</small></h1>
    <hr />
    <div class="row" >
        <div class="col-md-4">
            <div class="form-horizontal">
                <div class="form-group">
                    <asp:Panel ID="pnlMensajes" runat="server" Visible="false">
                        <asp:Label ID="lblMensaje" runat="server" Text="[Mensaje]"></asp:Label>
                    </asp:Panel>
                </div>
                <div class="form-group">
                    <label for="nombres" class="col-sm-4 control-label">Nombres</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control" 
                            AutoCompleteType="Disabled" placeholder="Nombres"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="apellidos" class="col-sm-4 control-label">Apellidos</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" 
                            AutoCompleteType="Disabled" placeholder="Apellidos"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fingreso" class="col-sm-4 control-label">Fecha Ingreso</label>
                    <div class="col-sm-8">
                       <asp:TextBox ID="txtFechaIngreso" runat="server" CssClass="form-control" 
                            AutoCompleteType="Disabled" placeholder="Fecha Ingreso" Visible="false"></asp:TextBox>
                        <asp:Calendar ID="calFechaIngreso" runat="server" ></asp:Calendar>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="chkActivo" runat="server" />
                                Activo
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-default" OnClick="btnGuardar_Click"/>
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-default" OnClick="btnCancelar_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
