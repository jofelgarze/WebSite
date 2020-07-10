<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmProductos.aspx.cs" Inherits="WebSite.Mantenimiento.FrmProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Productos <small>Mantenimiento</small></h1>
    <hr />
    <div class="row" >
        <div class="col-md-offset-2 col-md-8">
            <asp:GridView ID="gvProductos" runat="server"
                AllowPaging="true" AllowSorting="true" AutoGenerateColumns="false" EnableViewState="false"
                CssClass="table  table-striped table-bordered table-hover table-responsive " 
                DataSourceID="odsProductos" DataKeyNames="Id" ShowFooter="true" OnRowCommand="gvProductos_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Codigo" SortExpression="Id" InsertVisible="false">
                        <ItemTemplate>
                             <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>                      
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                        <ItemTemplate>
                             <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNombre" runat="server" 
                                Text='<%# Bind("Nombre") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                                ErrorMessage="El campo Nombre es obligatorio" Display="Dynamic"
                                ControlToValidate="txtNombre" CssClass="text-danger"
                                >*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNuevoNombre" runat="server" ValidationGroup="Nuevo"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNuevoNombre" runat="server" ValidationGroup="Nuevo"
                                ErrorMessage="El campo Nombre es obligatorio" Display="Dynamic"
                                ControlToValidate="txtNuevoNombre" CssClass="text-danger"
                                >*</asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="T. Producto" SortExpression="TipoProducto" >
                        <ItemTemplate>
                            <asp:Label ID="lblTipoProducto" runat="server" Text='<%# Eval("TipoProducto.Nombre") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlTipoProducto" runat="server" SelectedValue='<%# Bind("TipoProducto.Id") %>'
                                DataTextField="Nombre" DataValueField="Id"
                                DataSourceID="odsTipoProducto"></asp:DropDownList>
                        </EditItemTemplate>
                         <FooterTemplate>
                            <asp:DropDownList ID="ddlNuevoTipoProducto" runat="server"
                                DataTextField="Nombre" DataValueField="Id"
                                DataSourceID="odsTipoProducto"></asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio" SortExpression="Precio">
                        <ItemTemplate>
                             <asp:Label ID="lblPrecio" runat="server" Text='<%# Eval("Precio") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrecio" runat="server" 
                                Text='<%# Bind("Precio") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="rfvPrecio" runat="server"
                                ErrorMessage="El campo Precio es obligatorio" Display="Dynamic"
                                ControlToValidate="txtPrecio" CssClass="text-danger"
                                >*</asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNuevoPrecio" runat="server" ValidationGroup="Nuevo"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNuevoPrecio" runat="server" ValidationGroup="Nuevo"
                                ErrorMessage="El campo Precio es obligatorio" Display="Dynamic"
                                ControlToValidate="txtNuevoPrecio" CssClass="text-danger"
                                >*</asp:RequiredFieldValidator>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                             <asp:CheckBox ID="chkActivo" runat="server" Checked='<%# Bind("Activo") %>' Enabled="false"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:CheckBox ID="chkActivo" runat="server" Checked='<%# Bind("Activo") %>'/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:CheckBox ID="chkNuevoActivo" runat="server"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:ImageButton ID="LinkButton1" Width="16px" ImageUrl="data:image/png;base64,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" 
                                runat="server" CausesValidation="True" CommandName="Modificar" Text="Actualizar"></asp:ImageButton>
                            <%--<asp:LinkButton ID="lnkActualizar" runat="server" CausesValidation="True" CommandName="Modificar" Text="Actualizar"></asp:LinkButton>--%>
                            &nbsp;<asp:LinkButton ID="lnkCancelar" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEditar" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="lnkEliminar" runat="server" CausesValidation="False" CommandName="Eliminar" Text="Eliminar" 
                                CssClass="lnk-eliminar"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="lnkCrear" runat="server" CausesValidation="True" ValidationGroup="Nuevo" CommandName="Insertar" Text="Crear"></asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-md-8">
            <asp:ValidationSummary ID="vsProductos" runat="server" CssClass="alert alert-warning" ValidationGroup="Nuevo"/>
            <asp:ValidationSummary ID="vsProductosEdicion" runat="server" CssClass="alert alert-warning"/>
        </div>
    </div>
    <asp:ObjectDataSource ID="odsProductos" runat="server" 
        TypeName="CapaDatos.Negocio.ProductosNegocio"
        SelectMethod="consultar"
        EnablePaging="true"
        SelectCountMethod="totalRegistros"
        StartRowIndexParameterName="indice"
        MaximumRowsParameterName="registrosPagina"        
        SortParameterName="campoOrden"
        InsertMethod="crear" OnInserting="odsProductos_Inserting"
        DeleteMethod="eliminar" OnDeleting="odsProductos_Deleting" OnDeleted="odsProductos_ProcesoCompletado"
        UpdateMethod="editar" OldValuesParameterFormatString="original_{0}" OnUpdating="odsProductos_Updating" OnUpdated="odsProductos_ProcesoCompletado"
        >
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="tipoProducto" Type="Int32"/>
            <asp:Parameter Name="precio" Type="Double"/>
            <asp:Parameter Name="activo" Type="Boolean"/>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="tipoProducto" Type="Int32"/>
            <asp:Parameter Name="precio" Type="Double"/>
            <asp:Parameter Name="activo" Type="Boolean"/>
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsTipoProducto" runat="server" 
        SelectMethod="catalogoTipoProducto" 
        TypeName="CapaDatos.Negocio.ProductosNegocio">
    </asp:ObjectDataSource>
</asp:Content>
