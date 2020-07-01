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
        }
    }
}
