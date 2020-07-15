using CapaDatos.Entidades;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos.Negocio
{
    class PedidosNegocio : IDisposable
    {
        private TiendaContextoDb contextoDb = new TiendaContextoDb();

        public int totalRegistrosCliente()
        {
            return contextoDb.Pedidos.Count();
        }

        public List<Pedido> Consultar(int filaInicial, int filasPagina, string ordenPor)
        {
            var query = contextoDb.Pedidos
                .Include(p => p.Detalles)
                .Include(p => p.Cliente).OrderBy(c => c.Id);
            switch (ordenPor)
            {
                case "Id DESC":
                    query = query.OrderByDescending(c => c.Id);
                    break;
                case "Nombres":
                    query = query.OrderBy(c => c.Cliente.Nombres);
                    break;
                case "Nombres DESC":
                    query = query.OrderByDescending(c => c.Cliente.Nombres);
                    break;
                case "Apellidos":
                    query = query.OrderBy(c => c.Cliente.Apellidos);
                    break;
                case "Apellidos DESC":
                    query = query.OrderByDescending(c => c.Cliente.Apellidos);
                    break;
                case "FechaIngreso":
                    query = query.OrderBy(c => c.FechaIngreso);
                    break;
                case "FechaIngreso DESC":
                    query = query.OrderByDescending(c => c.FechaIngreso);
                    break;
                case "Direccion":
                    query = query.OrderBy(c => c.Direccion);
                    break;
                case "Direccion DESC":
                    query = query.OrderByDescending(c => c.Direccion);
                    break;
                case "Entregado":
                    query = query.OrderBy(c => c.Entregado);
                    break;
                case "Entregado DESC":
                    query = query.OrderByDescending(c => c.Entregado);
                    break;
                default:
                    query = query.OrderBy(c => c.Id);
                    break;
            }
            return query.Skip(filaInicial).Take(filasPagina).ToList();
        }



        public void Dispose()
        {
            contextoDb.Dispose();
        }
    }
}
