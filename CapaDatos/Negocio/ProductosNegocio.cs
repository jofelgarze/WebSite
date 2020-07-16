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

        public List<TipoProducto> catalogoTipoProducto() {
            return contextoDb.TipoProducto.ToList();
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

        public Producto consultar(int id)
        {
            return contextoDb.Productos.Include(l => l.TipoProducto).Where(p => p.Id == id).SingleOrDefault();
        }

        //Insertar
        public void crear(string nombre, int tipoProducto, Double precio, Boolean activo ) {
            contextoDb.Productos.Add(new Producto() { 
                Nombre = nombre,
                Activo = activo,
                Precio = precio,
                TipoProducto = contextoDb.TipoProducto.Find(tipoProducto)
            });
            contextoDb.SaveChanges();
        }

        //Modificar
        public void editar(int id,string nombre, int tipoProducto, Double precio, Boolean activo)
        {
            var original = contextoDb.Productos.Find(id);

            original.Nombre = nombre;
            original.Precio = precio;
            original.Activo = activo;
            original.TipoProducto = contextoDb.TipoProducto.Find(tipoProducto);

            contextoDb.SaveChanges();
        }

        //Eliminar
        public void eliminar(int id)
        {
            var original = contextoDb.Productos.Find(id);
            contextoDb.Productos.Remove(original);
            contextoDb.SaveChanges();
        }
    }
}
