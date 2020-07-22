<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmAnularPedido.aspx.cs" Inherits="WebSiteLogin.Mantenimiento.FrmAnularPedido" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Pedidos <small>Anulación</small></h1>
    <hr />
    <div class="row" >
        <div class="col-md-offset-2 col-md-8">
            <asp:GridView ID="GridView1" runat="server" CssClass="table  table-striped table-bordered table-hover table-responsive " AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="sqsPedidos" AllowPaging="True" AllowSorting="True" >
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id">
            <ItemStyle Width="10%" />
            </asp:BoundField>
            <asp:BoundField DataField="NombreCompleto" HeaderText="NombreCompleto" ReadOnly="True" SortExpression="NombreCompleto" />
            <asp:BoundField DataField="FechaIngreso" HeaderText="FechaIngreso" SortExpression="FechaIngreso">
            <ItemStyle Width="20%" />
            </asp:BoundField>
            <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total">
            <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="Entregado" HeaderText="Entregado" SortExpression="Entregado">
            <ItemStyle Width="10%" />
            </asp:CheckBoxField>
        </Columns>

    </asp:GridView>
        </div>
    </div>
    
    <asp:SqlDataSource ID="sqsPedidos" runat="server" ConnectionString="Data Source=.\SQLEXPRESS01;Initial Catalog=Tienda;Integrated Security=True;Pooling=False;MultipleActiveResultSets=True;Application Name=AppTienda" ProviderName="System.Data.SqlClient" SelectCommand="sp_consultarPedidos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>
