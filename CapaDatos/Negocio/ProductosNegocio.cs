using CapaDatos.Entidades;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos.Negocio
{
    public class ProductosNegocio
    {
        private TiendaContextoDb contextoDb = new TiendaContextoDb();

        public int totalRegistros()
        {
            return contextoDb.Productos.Count();
        }

        //Consultar
        public List<Producto> consultar(int indice, int registrosPagina, string campoOrden) {
            var query = contextoDb.Productos.Include(l => l.TipoProducto).OrderBy(p => p.Id);
            switch (campoOrden)
            {
                case "Id DESC":
                    query = query.OrderByDescending(p => p.Id);
                    break;
                case "Nombre":
                    query = query.OrderBy(p => p.Nombre);
                    break;
                case "Nombre DESC":
                    query = query.OrderByDescending(p => p.Nombre);
                    break;
                case "Precio":
                    query = query.OrderBy(p => p.Precio);
                    break;
                case "Precio DESC":
                    query = query.OrderByDescending(p => p.Precio);
                    break;
                case "TipoProducto":
                    query = query.OrderBy(p => p.TipoProducto.Nombre);
                    break;
                case "TipoProducto DESC":
                    query = query.OrderByDescending(p => p.TipoProducto.Nombre);
                    break;
                case "Activo":
                    query = query.OrderBy(p => p.Activo);
                    break;
                case "Activo DESC":
                    query = query.OrderByDescending(p => p.Activo);
                    break;
                default:
                    break;
            }
            return query.Skip(indice).Take(registrosPagina).ToList();
        }

        //Insertar

        //Modificar
        //Eliminar
    }
}
