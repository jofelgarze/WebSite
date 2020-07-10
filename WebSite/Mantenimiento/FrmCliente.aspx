<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmCliente.aspx.cs" Inherits="WebSite.Mantenimiento.FrmCliente" %>

<asp:Content ID="cntFrmCliente" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Clientes <small>Mantenimiento</small></h1>
    <hr />
    <div class="row" >
        <div class="col-md-5">
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
                            AutoCompleteType="Disabled" placeholder="Nombres" ValidationGroup="FrmIngreso"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombres" ControlToValidate="txtNombres" Display="Dynamic"
                            runat="server" ErrorMessage="El campo es obligatorio..." CssClass="text-danger" ValidationGroup="FrmIngreso">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revNombres" runat="server" CssClass="text-danger"
                            ValidationExpression="^[\s\S]{3,50}$" ControlToValidate="txtNombres"  Display="Dynamic"
                            ErrorMessage="Debe tener entre 3 y 50 caracteres" ValidationGroup="FrmIngreso">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="apellidos" class="col-sm-4 control-label">Apellidos</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" 
                            AutoCompleteType="Disabled" placeholder="Apellidos" ValidationGroup="FrmIngreso"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvApellidos" ControlToValidate="txtNombres" Display="Dynamic"
                            runat="server" ErrorMessage="El campo es obligatorio..." CssClass="text-danger" ValidationGroup="FrmIngreso">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revApellidos" runat="server" CssClass="text-danger"
                            ValidationExpression="^[\s\S]{3,50}$" ControlToValidate="txtApellidos"  Display="Dynamic"
                            ErrorMessage="Debe tener entre 3 y 50 caracteres" ValidationGroup="FrmIngreso">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fingreso" class="col-sm-4 control-label">Tipo Inscripción</label>
                    <div class="col-sm-8">
                        <div class="checkbox">
                            <label>
                                <asp:RadioButton runat="server" ID="rbtInternet" GroupName="TipoInscripcion" ValidationGroup="FrmIngreso"></asp:RadioButton>
                                Internet 
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <asp:RadioButton runat="server" ID="rbtVentanilla" GroupName="TipoInscripcion" ValidationGroup="FrmIngreso"></asp:RadioButton>
                                Ventanilla
                            </label>
                        </div>                        
                    </div>
                </div>
                <div class="form-group">
                    <label for="fingreso" class="col-sm-4 control-label">Fecha Ingreso</label>
                    <div class="col-sm-8">
                       <asp:TextBox ID="txtFechaIngreso" runat="server" CssClass="form-control" 
                            AutoCompleteType="Disabled" placeholder="Fecha Ingreso" ValidationGroup="FrmIngreso"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <div class="checkbox">
                            <label>
                                <asp:CheckBox ID="chkActivo" runat="server" ValidationGroup="FrmIngreso" />
                                Activo
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" class="btn btn-default" OnClick="btnGuardar_Click" ValidationGroup="FrmIngreso" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" class="btn btn-default" 
                            OnClick="btnCancelar_Click" CausesValidation="false"/>
                    </div>
                </div>
            </div>
        </div>
    
        <div class="col-md-7">
            <%--<asp:Label ID="mensaje" runat="server" Text="Label"></asp:Label>
            <asp:DropDownList 
                  AutoPostBack="true" 
                  ID="ddlFilasPorPagina" 
                  runat="server" 
                  onselectedindexchanged="ddlFilasPorPagina_SelectedIndexChanged">
                <asp:ListItem Value="5"></asp:ListItem>
                <asp:ListItem Value="10" Selected="True"></asp:ListItem>
                <asp:ListItem Value="20"></asp:ListItem>
            </asp:DropDownList> 
                PageSize
                --%>
            <asp:GridView ID="grvClientes" runat="server" AutoGenerateColumns="False" 
                AllowPaging="True" AllowSorting="True"
                DataSourceID="odsCliente" CssClass="table  table-striped table-bordered table-hover table-responsive " HeaderStyle-CssClass="thead-inverse"
                DataKeyNames="Id">
                <Columns>
                    <%--<asp:BoundField HeaderText="Fecha Ing." DataField="FechaIngreso" SortExpression="FechaIngreso" DataFormatString="{0:d}" />--%>
                    <asp:BoundField HeaderText="Codigo" DataField="Id" SortExpression="Id" ReadOnly="true"/>
                    <asp:BoundField HeaderText="Nombres" DataField="Nombres"  SortExpression="Nombres"/>
                    <asp:BoundField HeaderText="Apellidos" DataField="Apellidos" SortExpression="Apellidos" />
                    <asp:TemplateField HeaderText="T. Inscrip." SortExpression="TipoInscripcion">
                        <ItemTemplate>
                            <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("TipoInscripcion") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlTipoInscripcion" runat="server" SelectedValue='<%# Bind("TipoInscripcion") %>'
                                DataSourceID="odsClienteTipoInscripcion">
                            </asp:DropDownList> 
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha Ing." SortExpression="FechaIngreso">
                        <ItemTemplate>
                            <asp:Label ID="lblColFechaIng" runat="server" Text='<%# DateTime.Parse(Eval("FechaIngreso").ToString()).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                             <asp:TextBox ID="txtFechaIngresoFila" runat="server" 
                                Text='<%# Bind("FechaIngreso") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" 
                                CssClass="lnk-eliminar"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="thead-inverse"></HeaderStyle>
                <PagerStyle HorizontalAlign="Center" />
            </asp:GridView>
            <asp:ObjectDataSource ID="odsCliente" runat="server" 
                TypeName="CapaDatos.Negocio.ClientesNegocio"
                EnablePaging="true"
                SelectMethod="consultarClientes"
                StartRowIndexParameterName="filaInicial"
                SortParameterName="ordenPor"
                MaximumRowsParameterName="filasPagina"
                SelectCountMethod="totalRegistrosCliente"
                InsertMethod="crearCliente"                
                DeleteMethod="eliminarCliente"
                UpdateMethod="modificarCliente">
                <InsertParameters>
                    <asp:Parameter Name="nombres" Type="String" />
                    <asp:Parameter Name="apellidos" Type="String" />
                    <asp:Parameter Name="fechaIngreso" Type="DateTime" />
                    <asp:Parameter Name="activo" Type="Boolean" />
                    <asp:Parameter Name="tipoInscripcion" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombres" Type="String" />
                    <asp:Parameter Name="apellidos" Type="String" />
                    <asp:Parameter Name="fechaIngreso" Type="DateTime" />
                    <asp:Parameter Name="activo" Type="Boolean" />
                    <asp:Parameter Name="tipoInscripcion" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsClienteTipoInscripcion" runat="server" 
                SelectMethod="consultarTipoInscripcion" 
                TypeName="CapaDatos.Negocio.ClientesNegocio"
                >
            </asp:ObjectDataSource>
        </div>
    </div>
    <script>
        $("#MainContent_txtFechaIngreso").datepicker({
            "dateFormat":"yy-mm-dd",
        });
        $(document).on('click', '.lnk-eliminar', function (e) {
            let fila = $(this).closest('tr');//busco a la fila a la que pertenece el link de eliminar
            let nombre = $(fila.find("td")[1]).text() + " " + $(fila.find("td")[2]).text(); //Tomo los valores de las celdas necesarias
            return confirm('¿Esta seguro de eliminar a ' + nombre + ' el registro?'); //Construye el mensaje a mostrar
        });
    </script>
</asp:Content>
