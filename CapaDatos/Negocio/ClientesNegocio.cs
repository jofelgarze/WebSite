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

        public List<string> consultarTipoInscripcion() {
            return new List<string>
            {
                "Internet", "Ventanilla","Promocion", "Referido"
            };
        }

        public int totalRegistrosCliente() {
            return contextoDb.Clientes.Count();
        }

        public List<Cliente> consultarClientes(int filaInicial, int filasPagina, string ordenPor) {
            var query = contextoDb.Clientes.OrderBy(c => c.Id);
            switch (ordenPor)
            {
                case "Id DESC":
                    query = query.OrderByDescending(c => c.Id);
                    break;
                case "Nombres":
                    query = query.OrderBy(c => c.Nombres);
                    break;
                case "Nombres DESC":
                    query = query.OrderByDescending(c => c.Nombres);
                    break;
                case "Apellidos":
                    query = query.OrderBy(c => c.Apellidos);
                    break;
                case "Apellidos DESC":
                    query = query.OrderByDescending(c => c.Apellidos);
                    break;
                case "FechaIngreso":
                    query = query.OrderBy(c => c.FechaIngreso);
                    break;
                case "FechaIngreso DESC":
                    query = query.OrderByDescending(c => c.FechaIngreso);
                    break;
                case "TipoInscripcion":
                    query = query.OrderBy(c => c.TipoInscripcion);
                    break;
                case "TipoInscripcion DESC":
                    query = query.OrderByDescending(c => c.TipoInscripcion);
                    break;
                case "Activo":
                    query = query.OrderBy(c => c.Activo);
                    break;
                case "Activo DESC":
                    query = query.OrderByDescending(c => c.Activo);
                    break;
                default:
                    query = query.OrderBy(c => c.Id);
                    break;
            }
            return query.Skip(filaInicial).Take(filasPagina).ToList();
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

        public void eliminarCliente(int id) {
            var original = contextoDb.Clientes.Find(id);
            contextoDb.Clientes.Remove(original);
            contextoDb.SaveChanges();
        }

        public void modificarCliente(int id, string nombres, string apellidos, DateTime fechaIngreso, Boolean activo, string tipoInscripcion)
        {
            var original = contextoDb.Clientes.Find(id);

            original.Nombres = nombres;
            original.Apellidos = apellidos;
            original.Activo = activo;
            original.TipoInscripcion = tipoInscripcion;
            original.FechaIngreso = fechaIngreso;

            contextoDb.SaveChanges();
        }

        public void Dispose()
        {
            contextoDb.Dispose();
        }
    }
}
