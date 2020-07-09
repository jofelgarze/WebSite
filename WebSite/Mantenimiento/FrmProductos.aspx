<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmProductos.aspx.cs" Inherits="WebSite.Mantenimiento.FrmProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Productos <small>Mantenimiento</small></h1>
    <hr />
    <div class="row" >
        <div class="col-md-offset-3 col-md-6">
            <asp:GridView ID="gvProductos" runat="server" AllowPaging="true" AllowSorting="true" AutoGenerateColumns="false"
                CssClass="table  table-striped table-bordered table-hover table-responsive " 
                DataSourceID="odsProductos" DataKeyNames="Id" >
                <Columns>
                    <asp:BoundField HeaderText="Codigo" DataField="Id" SortExpression="Id" ReadOnly="true"/>
                    <asp:BoundField HeaderText="Nombre" DataField="Nombre"  SortExpression="Nombre"/>
                    <asp:TemplateField HeaderText="T. Producto" SortExpression="TipoProducto" >
                        <ItemTemplate>
                            <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("TipoProducto.Nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Precio" DataField="Precio"  SortExpression="Precio"/>
                    <asp:BoundField HeaderText="Activo" DataField="Activo"  SortExpression="Activo"/>
                </Columns>
            </asp:GridView>
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
        >
        
    </asp:ObjectDataSource>
</asp:Content>
