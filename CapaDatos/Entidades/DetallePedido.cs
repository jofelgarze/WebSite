using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos.Entidades
{
    public class DetallePedido
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [Range(1,9999)]
        public int Cantidad { get; set; }
        [Required]
        public Pedido Pedido { get; set; }
        [Required]
        public Producto Producto { get; set; }        

    }

}
