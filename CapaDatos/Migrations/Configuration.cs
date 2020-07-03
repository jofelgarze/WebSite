namespace CapaDatos.Migrations
{
    using CapaDatos.Entidades;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<CapaDatos.TiendaContextoDb>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(CapaDatos.TiendaContextoDb context)
        {
            if (context.Clientes.Count() == 0) {
                var cliente = new Cliente()
                {
                    Nombres = "Josue",
                    Apellidos = "Garcia",
                    Activo = true,
                    FechaIngreso = DateTime.Now.AddDays(-6)
                };

                context.Clientes.AddOrUpdate(cliente);
                context.SaveChanges();
            }
            
            var tipoProducto = new TipoProducto()
            {
                Nombre = "Electrónicos",
            };

            if (context.TipoProducto.Count() == 0)
            {
                context.TipoProducto.AddOrUpdate(tipoProducto);
                context.TipoProducto.AddOrUpdate(new TipoProducto()
                {
                    Nombre = "Linea Blanca",
                });
                context.TipoProducto.AddOrUpdate(new TipoProducto()
                {
                    Nombre = "Accesorios",
                });
                
                context.SaveChanges();
            }

            if (context.Productos.Count() == 0)
            {
                var producto = new Producto()
                {
                    Nombre = "Monitor 24\"",
                    Activo = true,
                    Precio = 350.55,
                    TipoProducto = tipoProducto
                };

                context.Productos.AddOrUpdate(producto);
                context.SaveChanges();
            }


            
        }
    }
}
