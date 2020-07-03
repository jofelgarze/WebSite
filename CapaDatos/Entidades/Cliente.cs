using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos.Entidades
{
    [Table("clientes")]
    public class Cliente
    {
        [Key]
        public int Id { get; set; }

        [Required]
        [Column(TypeName = "varchar")]
        [StringLength(50)]
        public string Nombres { get; set; }

        [Required]
        [Column(TypeName = "varchar")]
        [StringLength(50)]
        public string Apellidos { get; set; }

        [Required]
        [Column(TypeName = "varchar")]
        [StringLength(10)]
        public string TipoInscripcion { get; set; }

        public DateTime FechaIngreso { get; set; }
        public bool Activo { get; set; }
    }
}
