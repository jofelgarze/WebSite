using CapaDatos.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos.Negocio
{
    public class ClientesNegocio: IDisposable
    {
        private TiendaContextoDb contextoDb = new TiendaContextoDb();

        public int totalRegistrosCliente() {
            return contextoDb.Clientes.Count();
        }

        public List<Cliente> consultarClientes(int filaInicial, int filasPagina = 10) {
            return contextoDb.Clientes.OrderBy(c => c.Id).Skip(filaInicial).Take(100).ToList();
        }

        public void crearCliente(string nombres, string apellidos, DateTime fechaIngreso, Boolean activo, string tipoInscripcion) {
            crearCliente(new Cliente()
            {
                Nombres = nombres,
                Activo = activo,
                Apellidos = apellidos,
                FechaIngreso = fechaIngreso,
                TipoInscripcion = tipoInscripcion
            });
        }

        public void crearCliente(Cliente cliente) {
            contextoDb.Clientes.Add(cliente);
            contextoDb.SaveChanges();
        }


        public void Dispose()
        {
            contextoDb.Dispose();
        }
    }
}
