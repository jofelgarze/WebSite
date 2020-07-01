<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmCliente.aspx.cs" Inherits="WebSite.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:GridView ID="gvClientes" runat="server" ItemType="WebSite.Modelos.Entidades.Cliente" 
        DataKeyNames="Id" 
        SelectMethod="consultarClientes" 
        UpdateMethod="gvClientes_UpdateItem"
        AutoGenerateColumns="false">
        <Columns>
            <asp:DynamicField DataField="Id" />
            <asp:DynamicField DataField="Nombres" />
            <asp:DynamicField DataField="Apellidos" />
            <asp:DynamicField DataField="FechaNacimiento" />
            <asp:DynamicField DataField="Activo" />        
        </Columns>    
    </asp:GridView>

</asp:Content>
