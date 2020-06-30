namespace WebSite.Modelos
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.ModelConfiguration.Conventions;
    using System.Linq;
    using WebSite.Modelos.Entidades;

    public class TiendaContextDb : DbContext
    {
        // El contexto se ha configurado para usar una cadena de conexión 'TiendaContextDb' del archivo 
        // de configuración de la aplicación (App.config o Web.config). De forma predeterminada, 
        // esta cadena de conexión tiene como destino la base de datos 'WebSite.Modelos.TiendaContextDb' de la instancia LocalDb. 
        // 
        // Si desea tener como destino una base de datos y/o un proveedor de base de datos diferente, 
        // modifique la cadena de conexión 'TiendaContextDb'  en el archivo de configuración de la aplicación.
        public TiendaContextDb()
            : base("name=TiendaContextDb")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //Correccion de creacion de tablas
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            //Formato de digitos decimales
            modelBuilder.Conventions.Remove<DecimalPropertyConvention>();
            modelBuilder.Conventions.Add(new DecimalPropertyConvention(10, 2));
        }

        public virtual DbSet<Cliente> Clientes { get; set; }
    }

}