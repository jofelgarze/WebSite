using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebSite.Modelos.Entidades;

namespace WebSite.Modelos
{
    public class RepositorioCliente
    {
        private TiendaContextDb contextDb = new TiendaContextDb();

        public int totalConsultaClientes() 
        {
            return contextDb.Clientes.Count();
        }

        public List<Cliente> consultarClientes(int filaInicio, int filasPagina) 
        {
            return contextDb.Clientes.OrderBy(c => c.Id).Skip(filaInicio).Take(filasPagina).ToList();
        }
        public Cliente seleccionarCliente(int id)
        {
            return contextDb.Clientes.Find(id);
        }

        public void insertarClientes(string Nombres, string Apellidos, DateTime FechaNacimiento, Boolean Activo)
        {

            insertarClientes(new Cliente() { 
                Nombres = Nombres,
                Apellidos = Apellidos,
                FechaNacimiento = FechaNacimiento,
                Activo = Activo
            });
        }

        public void insertarClientes(Cliente cliente)
        {
            contextDb.Clientes.Add(cliente);
            contextDb.SaveChanges();
        }

        public void actualizarClientes(Cliente cliente)
        {
            var original = contextDb.Clientes.Find(cliente.Id);
            original.Nombres = cliente.Nombres;
            original.Apellidos = cliente.Apellidos;
            original.Activo = cliente.Activo;
            contextDb.SaveChanges();
        }

        public void deleteClientes(int id)
        {
            var original = contextDb.Clientes.Find(id);
            contextDb.Clientes.Remove(original);
            contextDb.SaveChanges();
        }
    }
}