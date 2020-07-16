namespace CapaDatos.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AlterTblDetallePedido_productoId : DbMigration
    {
        public override void Up()
        {
            RenameColumn(table: "dbo.DetallePedido", name: "Producto_Id", newName: "ProductoId");
            RenameIndex(table: "dbo.DetallePedido", name: "IX_Producto_Id", newName: "IX_ProductoId");
        }
        
        public override void Down()
        {
            RenameIndex(table: "dbo.DetallePedido", name: "IX_ProductoId", newName: "IX_Producto_Id");
            RenameColumn(table: "dbo.DetallePedido", name: "ProductoId", newName: "Producto_Id");
        }
    }
}
