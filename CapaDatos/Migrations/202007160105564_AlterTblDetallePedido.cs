namespace CapaDatos.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AlterTblDetallePedido : DbMigration
    {
        public override void Up()
        {
            RenameColumn(table: "dbo.DetallePedido", name: "Pedido_Id", newName: "PedidoId");
            RenameIndex(table: "dbo.DetallePedido", name: "IX_Pedido_Id", newName: "IX_PedidoId");
        }
        
        public override void Down()
        {
            RenameIndex(table: "dbo.DetallePedido", name: "IX_PedidoId", newName: "IX_Pedido_Id");
            RenameColumn(table: "dbo.DetallePedido", name: "PedidoId", newName: "Pedido_Id");
        }
    }
}
