<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmCliente.aspx.cs" Inherits="WebSite.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:Label ID="mensaje" runat="server" Text="Label"></asp:Label>
    <asp:DropDownList 
          AutoPostBack="true" 
          ID="rowsToDisplay" 
          runat="server" 
          onselectedindexchanged="rowsToDisplay_SelectedIndexChanged">
        <asp:ListItem Value="5"></asp:ListItem>
        <asp:ListItem Value="10" Selected="True"></asp:ListItem>
        <asp:ListItem Value="20"></asp:ListItem>
    </asp:DropDownList> 
    <br />
    <asp:GridView ID="gvClientes" runat="server"
        EnableViewState="False"
        AutoGenerateColumns="False" 
        DataKeyNames="Id"
        DataSourceID="odsClientes"
        AllowPaging="True"
        ShowFooter="True" OnRowCommand="gvClientes_RowCommand"
        >
        <Columns>
            <asp:TemplateField HeaderText="Id" InsertVisible="False" 
                SortExpression="Id">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Bind("Id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombres" SortExpression="Nombre">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" 
                        Text='<%# Bind("Nombres") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        Text='<%# Bind("Nombres") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtNuevoNombre" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNuevoNombre" 
                        runat="server" ControlToValidate="txtNuevoNombre"
                        Display="Dynamic"  ForeColor=""
                        ErrorMessage="Debes ingresar un nombre">
                        * </asp:RequiredFieldValidator>
                </FooterTemplate>
                <FooterStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Apellidos" SortExpression="Apellidos">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" 
                        Text='<%# Bind("Apellidos") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# Bind("Apellidos") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtNuevoApellido" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNuevoApellido" 
                        runat="server" ControlToValidate="txtNuevoApellido"
                        Display="Dynamic"  ForeColor=""
                        ErrorMessage="Debes ingresar un apellido">
                        * </asp:RequiredFieldValidator>
                </FooterTemplate>
                <FooterStyle Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="FechaNacimiento" SortExpression="FechaNacimiento">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" 
                        Text='<%# Bind("FechaNacimiento") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" 
                        Text='<%# Bind("FechaNacimiento") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtNuevaFechaNacimiento" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNuevaFechaNacimiento" 
                        runat="server" ControlToValidate="txtNuevaFechaNacimiento"
                        Display="Dynamic"  ForeColor=""
                        ErrorMessage="Debes ingresar una fecha">
                        * </asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activo" 
                SortExpression="Activo">
                <ItemTemplate>
                    <asp:CheckBox ID="Activo" runat="server" 
                        Checked='<%# Bind("Activo") %>' Enabled="false" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:CheckBox ID="chkNuevoActivo" runat="server"/>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Acciones">
                <EditItemTemplate>
                    <asp:Button ID="btnActualizarCliente" runat="server" CommandName="Actualizar" Text="Actualizar" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnEliminarCliente" runat="server" CommandName="Eliminar" Text="Eliminar" />
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Button ID="btnCrearCliente" runat="server" CommandName="Crear" Text="Crear" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="odsClientes" runat="server" 
        SelectCountMethod="totalConsultaClientes" 
        TypeName="WebSite.Modelos.RepositorioCliente"
        EnablePaging="true"
        SelectMethod="consultarClientes"
        StartRowIndexParameterName="filaInicio"
        MaximumRowsParameterName="filasPagina"
        DeleteMethod="deleteClientes"                 
        UpdateMethod="actualizarClientes"
        InsertMethod="insertarClientes"
        OldValuesParameterFormatString="original_{0}" OnInserting="odsClientes_Inserting">
        <InsertParameters>
            <asp:Parameter Name="Nombres" Type="String"/>
            <asp:Parameter Name="Apellidos" Type="String"/>
            <asp:Parameter Name="FechaNacimiento" Type="DateTime"/>
            <asp:Parameter Name="Activo" Type="Boolean"/>
        </InsertParameters>
        <updateparameters>
            <asp:parameter name="Id" Type="Int32"/>
            <asp:Parameter Name="Nombres" Type="String"/>
            <asp:Parameter Name="Apellidos" Type="String"/>
            <asp:Parameter Name="FechaNacimiento" Type="DateTime"/>
            <asp:Parameter Name="Activo" Type="Boolean"/>
        </updateparameters>
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
