namespace WebSite.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using WebSite.Modelos.Entidades;

    internal sealed class Configuration : DbMigrationsConfiguration<WebSite.Modelos.TiendaContextDb>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(WebSite.Modelos.TiendaContextDb context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data.
            if (context.Clientes.Count() == 0) {
                var cliente = new Cliente()
                {
                    Nombres = "Josue",
                    Apellidos = "Garcia",
                    Activo = true,
                    FechaNacimiento = DateTime.UtcNow.AddYears(-31)
                };

                context.Clientes.Add(cliente);
                try
                {
                    context.SaveChanges();
                }
                catch (Exception)
                {
                    //No hacer nada por ahora
                }
                
            }
        }
    }
}
