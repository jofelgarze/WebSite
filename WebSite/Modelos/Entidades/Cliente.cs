using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebSite.Modelos.Entidades
{
    public class Cliente
    {
        [Key]
        public int Id { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(150)]
        [Required]
        public String Nombres { get; set; }
        [Column(TypeName = "varchar")]
        [MaxLength(150)]
        [Required]
        public String Apellidos { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public bool Activo { get; set; }
    }
}