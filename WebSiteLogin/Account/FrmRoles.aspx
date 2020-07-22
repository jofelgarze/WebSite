<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmRoles.aspx.cs" Inherits="WebSiteLogin.Account.FrmRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Roles <small>Asignación</small></h1>
    <hr />
    <div class="row" >
        <div class="col-md-5">
            <label>Usuarios registrados</label>
            <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False"
                CssClass="table  table-striped table-bordered table-hover table-responsive "
                OnSelectedIndexChanged="gvUsuarios_SelectedIndexChangedAsync">
                <Columns>
                    <asp:TemplateField HeaderText="Codigo" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Usuario">
                        <ItemTemplate>
                            <asp:Label ID="lblUsuario" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkSeleccionar" runat="server" CausesValidation="False" CommandName="Select" Text="Ver"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-md-5">
            <asp:UpdatePanel runat="server" ID="updPanelRoles" UpdateMode="Conditional">
               <ContentTemplate>
                   <label>Pantallas Permitidas a </label>
                   <asp:Label ID="lblUsuario" runat="server"></asp:Label>
                    <asp:TreeView ID="tvRoles" runat="server">
                        <Nodes>
                            <asp:TreeNode ShowCheckBox="False" Text="Mantenimiento" Value="">
                                <asp:TreeNode ShowCheckBox="True" Text="Clientes" Value="Operador,Admin"></asp:TreeNode>
                                <asp:TreeNode ShowCheckBox="True" Text="Productos" Value="Admin"></asp:TreeNode>
                            </asp:TreeNode>
                            <asp:TreeNode ShowCheckBox="True" Text="Pedidos" Value="Todos"></asp:TreeNode>
                            <asp:TreeNode ShowCheckBox="True" Text="Roles" Value="Admin"></asp:TreeNode>
                        </Nodes>
                    </asp:TreeView>
                   <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-sm btn-success" OnClick="btnActualizar_ClickAsync"/>
                   <asp:Panel ID="pnlMensaje" runat="server" CssClass="alert alert-success alert-dismissible" Visible="false">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Roles asignados exitosamente!!</asp:Label>
                    </asp:Panel>
               </ContentTemplate>
                <Triggers>                    
                    <asp:AsyncPostBackTrigger  ControlID="gvUsuarios" EventName="SelectedIndexChanged" />
                </Triggers>                    
            </asp:UpdatePanel> 
            
        </div>
    </div>
</asp:Content>
