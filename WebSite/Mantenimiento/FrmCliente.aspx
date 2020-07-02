<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FrmCliente.aspx.cs" Inherits="WebSite.Mantenimiento.FrmCliente" %>

<asp:Content ID="cntFrmCliente" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Clientes <small>Mantenimiento</small></h1>
    <hr />
    <div class="row" >
        <div class="col-md-4">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="nombres" class="col-sm-4 control-label">Nombres</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="nombres" placeholder="Nombres" autocomplete="off">
                    </div>
                </div>
                <div class="form-group">
                    <label for="apellidos" class="col-sm-4 control-label">Apellidos</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="apellidos" placeholder="Apellidos" autocomplete="off">
                    </div>
                </div>
                <div class="form-group">
                    <label for="fingreso" class="col-sm-4 control-label">Fecha Ingreso</label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="fingreso" placeholder="Fecha de Ingreso" autocomplete="off">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox">
                                Activo
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-8">
                        <button type="submit" class="btn btn-default">Guardar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
