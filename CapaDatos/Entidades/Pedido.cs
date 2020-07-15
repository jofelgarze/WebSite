using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos.Entidades
{
    public class Pedido
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public Cliente Cliente { get; set; }
        [Required]
        public DateTime FechaIngreso { get; set; }
        [Required]
        [Column(TypeName = "varchar")]
        [StringLength(250)]
        public string Direccion { get; set; }
        public bool Entregado { get; set; }
        public List<DetallePedido> Detalles { get; set; }

    }
}
