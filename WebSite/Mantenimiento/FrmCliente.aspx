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
                            AutoCompleteType="Disabled" placeholder="Nombres"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombres" ControlToValidate="txtNombres" Display="Dynamic"
                            runat="server" ErrorMessage="El campo es obligatorio..." CssClass="text-danger">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revNombres" runat="server" CssClass="text-danger"
                            ValidationExpression="^[\s\S]{3,50}$" ControlToValidate="txtNombres"  Display="Dynamic"
                            ErrorMessage="Debe tener entre 3 y 50 caracteres">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="apellidos" class="col-sm-4 control-label">Apellidos</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" 
                            AutoCompleteType="Disabled" placeholder="Apellidos"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvApellidos" ControlToValidate="txtNombres" Display="Dynamic"
                            runat="server" ErrorMessage="El campo es obligatorio..." CssClass="text-danger">
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revApellidos" runat="server" CssClass="text-danger"
                            ValidationExpression="^[\s\S]{3,50}$" ControlToValidate="txtApellidos"  Display="Dynamic"
                            ErrorMessage="Debe tener entre 3 y 50 caracteres">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="fingreso" class="col-sm-4 control-label">Tipo Inscripción</label>
                    <div class="col-sm-8">
                        <div class="checkbox">
                            <label>
                                <asp:RadioButton runat="server" ID="rbtInternet" GroupName="TipoInscripcion"></asp:RadioButton>
                                Internet 
                            </label>
                        </div>
                        <div class="checkbox">
                            <label>
                                <asp:RadioButton runat="server" ID="rbtVentanilla" GroupName="TipoInscripcion"></asp:RadioButton>
                                Ventallina
                            </label>
                        </div>                        
                    </div>
                </div>
                <div class="form-group">
                    <label for="fingreso" class="col-sm-4 control-label">Fecha Ingreso</label>
                    <div class="col-sm-8">
                       <asp:TextBox ID="txtFechaIngreso" runat="server" CssClass="form-control" 
                            AutoCompleteType="Disabled" placeholder="Fecha Ingreso"></asp:TextBox>
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
            <asp:GridView ID="grvClientes" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True"
                DataSourceID="odsCliente" CssClass="table  table-striped table-bordered table-hover table-responsive " HeaderStyle-CssClass="thead-inverse">
                <Columns>
                    <%--<asp:BoundField HeaderText="Fecha Ing." DataField="FechaIngreso" SortExpression="FechaIngreso" DataFormatString="{0:d}" />--%>
                    <asp:BoundField HeaderText="Codigo" DataField="Id" SortExpression="Id"/>
                    <asp:BoundField HeaderText="Nombres" DataField="Nombres"  SortExpression="Nombres"/>
                    <asp:BoundField HeaderText="Apellidos" DataField="Apellidos" SortExpression="Apellidos" />
                    <asp:BoundField HeaderText="T. Inscrip." DataField="TipoInscripcion" SortExpression="TipoInscripcion" />
                    <asp:TemplateField HeaderText="Fecha Ing." SortExpression="FechaIngreso">
                        <ItemTemplate>
                            <asp:Label ID="lblColFechaIng" runat="server" Text='<%# DateTime.Parse(Eval("FechaIngreso").ToString()).ToShortDateString() %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="Activo" HeaderText="Activo" SortExpression="Activo" />
                </Columns>
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
                InsertMethod="crearCliente">
                <InsertParameters>
                    <asp:Parameter Name="nombres" Type="String" />
                    <asp:Parameter Name="apellidos" Type="String" />
                    <asp:Parameter Name="fechaIngreso" Type="DateTime" />
                    <asp:Parameter Name="activo" Type="Boolean" />
                    <asp:Parameter Name="tipoInscripcion" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <script>
        $("#MainContent_txtFechaIngreso").datepicker({
            "dateFormat":"yy-mm-dd",
        });
    </script>
</asp:Content>
