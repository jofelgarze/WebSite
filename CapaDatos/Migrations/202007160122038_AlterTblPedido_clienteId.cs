namespace CapaDatos.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AlterTblPedido_clienteId : DbMigration
    {
        public override void Up()
        {
            RenameColumn(table: "dbo.Pedido", name: "Cliente_Id", newName: "ClienteId");
            RenameIndex(table: "dbo.Pedido", name: "IX_Cliente_Id", newName: "IX_ClienteId");
        }
        
        public override void Down()
        {
            RenameIndex(table: "dbo.Pedido", name: "IX_ClienteId", newName: "IX_Cliente_Id");
            RenameColumn(table: "dbo.Pedido", name: "ClienteId", newName: "Cliente_Id");
        }
    }
}
