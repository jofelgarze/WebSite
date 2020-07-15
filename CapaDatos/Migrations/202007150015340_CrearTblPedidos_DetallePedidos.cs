namespace CapaDatos.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CrearTblPedidos_DetallePedidos : DbMigration
    {
        public override void Up()
        {
            CreateTable(
               "dbo.Pedido",
               c => new
               {
                   Id = c.Int(nullable: false, identity: true),
                   FechaIngreso = c.DateTime(nullable: false),
                   Direccion = c.String(nullable: false, maxLength: 250, unicode: false),
                   Entregado = c.Boolean(nullable: false),
                   Cliente_Id = c.Int(nullable: false),
               })
               .PrimaryKey(t => t.Id)
               .ForeignKey("dbo.clientes", t => t.Cliente_Id, cascadeDelete: true)
               .Index(t => t.Cliente_Id);

            CreateTable(
                "dbo.DetallePedido",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Cantidad = c.Int(nullable: false),
                        Pedido_Id = c.Int(nullable: false),
                        Producto_Id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Pedido", t => t.Pedido_Id, cascadeDelete: true)
                .ForeignKey("dbo.Producto", t => t.Producto_Id, cascadeDelete: true)
                .Index(t => t.Pedido_Id)
                .Index(t => t.Producto_Id);
            
           
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.DetallePedido", "Producto_Id", "dbo.Producto");
            DropForeignKey("dbo.DetallePedido", "Pedido_Id", "dbo.Pedido");
            DropForeignKey("dbo.Pedido", "Cliente_Id", "dbo.clientes");
            DropIndex("dbo.Pedido", new[] { "Cliente_Id" });
            DropIndex("dbo.DetallePedido", new[] { "Producto_Id" });
            DropIndex("dbo.DetallePedido", new[] { "Pedido_Id" });
            DropTable("dbo.Pedido");
            DropTable("dbo.DetallePedido");
        }
    }
}
