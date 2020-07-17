<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmPedidos.aspx.cs" Inherits="WebSiteLogin.FrmPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Pedidos <small>Creación</small></h1>
    <hr />
    <asp:Panel ID="pnlMensaje" runat="server" CssClass="alert alert-success alert-dismissible" Visible="false">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>¡Pedido realizado!</strong> espere una llamada de nuestro asesor. Codigo de su pedido: <asp:Label runat="server" ID="txtPedidoId"></asp:Label>
    </asp:Panel>
    <div class="form-horizontal">
        <div class="form-group">
            <asp:Panel ID="pnlMensajes" runat="server" Visible="false">
                <asp:Label ID="lblMensaje" runat="server" Text="[Mensaje]"></asp:Label>
            </asp:Panel>
        </div>
        <div class="row">        
            <div class="col-md-5">
                <div class="form-group">
                    <label for="nombres" class="col-sm-4 control-label">Cliente</label>
                    <div class="col-sm-8">
                        <asp:DropDownList ID="ddlCliente" runat="server"
                                DataTextField="NombreCompleto" DataValueField="Id" CssClass="form-control"
                                DataSourceID="odsClientes" ValidationGroup="FrmIngreso"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvNombres" ControlToValidate="ddlCliente" Display="Dynamic"
                            runat="server" ErrorMessage="El campo es obligatorio..." CssClass="text-danger" ValidationGroup="FrmIngreso">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <label for="fingreso" class="col-sm-4 control-label">Fecha Ingreso</label>
                    <div class="col-sm-8">
                       <asp:TextBox ID="txtFechaIngreso" runat="server" CssClass="form-control" 
                            AutoCompleteType="Disabled" placeholder="Fecha Ingreso" ValidationGroup="FrmIngreso"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFechaIngreso" ControlToValidate="txtFechaIngreso" Display="Dynamic"
                            runat="server" ErrorMessage="El campo es obligatorio..." CssClass="text-danger" ValidationGroup="FrmIngreso">
                        </asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>        
        </div>
        <div class="row">        
            <div class="col-md-5">
                <div class="form-group">
                    <label for="nombres" class="col-sm-4 control-label">Direccion</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"
                            AutoCompleteType="Disabled" placeholder="Direccion a donde se receptara el pedido..." ValidationGroup="FrmIngreso"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtDireccion" Display="Dynamic"
                            runat="server" ErrorMessage="El campo es obligatorio..." CssClass="text-danger" ValidationGroup="FrmIngreso">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger"
                            ValidationExpression="^[\s\S]{3,250}$" ControlToValidate="txtDireccion" Display="Dynamic"
                            ErrorMessage="Debe tener entre 3 y 250 caracteres" ValidationGroup="FrmIngreso">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-success" 
                            OnClick="btnGuardar_Click" ValidationGroup="FrmIngreso" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-default" 
                            OnClick="btnCancelar_Click" CausesValidation="false"/>
                    </div>
                </div>
            </div>
        
        </div>
        <div class="row">
            <div class="col-md-10">
                <asp:GridView ID="gvDetallePedidos" runat="server"
                    AutoGenerateColumns="false" EnableViewState="false"
                    CssClass="table  table-striped table-bordered table-hover table-responsive " 
                    DataKeyNames="Id" ShowFooter="true" OnRowCommand="gvDetallePedidos_RowCommand"
                    SelectMethod="gvDetallePedidos_GetData" ItemType="CapaDatos.Entidades.DetallePedido" >
                    <Columns>
                        <asp:TemplateField HeaderText="Codigo" SortExpression="Id" InsertVisible="false">
                            <ItemTemplate>
                                 <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>                      
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Articulo">
                            <ItemTemplate>
                                 <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Producto.Nombre") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlProducto" runat="server" SelectedValue='<%# Bind("Producto.Id") %>'
                                    DataTextField="Nombre" DataValueField="Id"
                                    DataSourceID="odsProductos"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvProducto" runat="server"
                                    ErrorMessage="El campo Producto es obligatorio" Display="Dynamic"
                                    ControlToValidate="ddlProducto" CssClass="text-danger"
                                    >*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlNuevoProducto" runat="server" SelectedValue='<%# Bind("Producto.Id") %>'
                                    DataTextField="Nombre" DataValueField="Id" ValidationGroup="Nuevo" OnSelectedIndexChanged="ddlNuevoProducto_SelectedIndexChanged"
                                    DataSourceID="odsProductos"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvNuevoProducto" runat="server" ValidationGroup="Nuevo"
                                    ErrorMessage="El campo Producto es obligatorio" Display="Dynamic"
                                    ControlToValidate="ddlNuevoProducto" CssClass="text-danger"
                                    >*</asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Precio">
                            <ItemTemplate>
                                 <asp:Label ID="lblPrecio" runat="server" Text='<%# Eval("PrecioProducto") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cantidad">
                            <ItemTemplate>
                                 <asp:Label ID="lblCantidad" runat="server" Text='<%# Eval("Cantidad") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCantidad" runat="server" 
                                    Text='<%# Bind("Cantidad") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                                    ErrorMessage="El campo Cantidad es obligatorio" Display="Dynamic"
                                    ControlToValidate="txtCantidad" CssClass="text-danger"
                                    >*</asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtNuevaCantidad" runat="server"  ValidationGroup="Nuevo"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvNuevaCantidad" runat="server"
                                    ErrorMessage="El campo Cantidad es obligatorio" Display="Dynamic"
                                    ControlToValidate="txtNuevaCantidad" CssClass="text-danger" ValidationGroup="Nuevo"
                                    >*</asp:RequiredFieldValidator>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="lnkActualizar" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lnkCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEditar" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lnkEliminar" runat="server" CausesValidation="False" CommandName="Eliminar" Text="Eliminar" 
                                    CssClass="lnk-eliminar"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="lnkCrear" runat="server" CausesValidation="True" ValidationGroup="Nuevo" OnClick="lnkCrear_Click" Text="Crear"></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10">
                <asp:ValidationSummary ID="vsProductos" runat="server" CssClass="alert alert-warning" ValidationGroup="Nuevo"/>
                <asp:ValidationSummary ID="vsProductosEdicion" runat="server" CssClass="alert alert-warning"/>
            </div>
        </div>
        <asp:ObjectDataSource ID="odsClientes" runat="server" SelectMethod="consultarClientes" TypeName="CapaDatos.Negocio.ClientesNegocio">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="filaInicial" Type="Int32" />
                <asp:Parameter DefaultValue="9999" Name="filasPagina" Type="Int32" />
                <asp:Parameter DefaultValue="" Name="ordenPor" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsProductos" runat="server" SelectMethod="Consultar" TypeName="CapaDatos.Negocio.ProductosNegocio">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="indice" Type="Int32" />
                <asp:Parameter DefaultValue="9999" Name="registrosPagina" Type="Int32" />
                <asp:Parameter DefaultValue="" Name="campoOrden" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
       
    </div>
        
    <script>
        $("#MainContent_txtFechaIngreso").datepicker({
            "dateFormat":"yy-mm-dd",
        });
    </script>
</asp:Content>
