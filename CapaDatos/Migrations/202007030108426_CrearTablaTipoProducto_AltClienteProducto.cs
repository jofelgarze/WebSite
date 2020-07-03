namespace CapaDatos.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class CrearTablaTipoProducto_AltClienteProducto : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.TipoProducto",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Nombre = c.String(nullable: false, maxLength: 50, unicode: false),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.clientes", "TipoInscripcion", c => c.String(nullable: false, maxLength: 10, unicode: false));
            AddColumn("dbo.Producto", "TipoProducto_Id", c => c.Int(nullable: false));
            CreateIndex("dbo.Producto", "TipoProducto_Id");
            AddForeignKey("dbo.Producto", "TipoProducto_Id", "dbo.TipoProducto", "Id", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Producto", "TipoProducto_Id", "dbo.TipoProducto");
            DropIndex("dbo.Producto", new[] { "TipoProducto_Id" });
            DropColumn("dbo.Producto", "TipoProducto_Id");
            DropColumn("dbo.clientes", "TipoInscripcion");
            DropTable("dbo.TipoProducto");
        }
    }
}
