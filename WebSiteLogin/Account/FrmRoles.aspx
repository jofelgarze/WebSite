<%@ Page Title="" Async="true" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmRoles.aspx.cs" Inherits="WebSiteLogin.Account.FrmRoles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Roles <small>Asignación</small></h1>
    <hr />
    <div class="row" >
        <div class="col-md-5">
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
            <asp:TreeView ID="tvRoles" runat="server">
                <Nodes>
                    <asp:TreeNode ShowCheckBox="False" Text="Mantenimiento" Value="0">
                        <asp:TreeNode ShowCheckBox="True" Text="Clientes" Value="Operador,Admin"></asp:TreeNode>
                        <asp:TreeNode ShowCheckBox="True" Text="Productos" Value="Admin"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode ShowCheckBox="True" Text="Pedidos" Value="Todos"></asp:TreeNode>
                </Nodes>

            </asp:TreeView>

        </div>
    </div>
</asp:Content>
