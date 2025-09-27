using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Articulo
    {
        private int idArticulo;
        private string codigoArticulo;
        private string nombreArticulo;
        private string descripcionArticulo;
        private decimal precio;
        private List<Imagen> imagenes;

        [DisplayName ("ID")]
        public int IdArticulo
        {
            get { return idArticulo; }
            set { idArticulo = value; }
        }

        [DisplayName("Código")]
        public string CodigoArticulo
        {
            get { return codigoArticulo; }
            set { codigoArticulo = value; }
        }

        [DisplayName("Nombre")]
        public string NombreArticulo
        {
            get { return nombreArticulo; }
            set { nombreArticulo = value; }
        }

        [DisplayName("Descripción")]
        public string DescripcionArticulo
        {
            get { return descripcionArticulo; }
            set { descripcionArticulo = value; }
        }

        [DisplayName("Marca")]
        public Marca MarcaArticulo { get; set; }

        [DisplayName("Categoría")]
        public Categoria CategoriaArticulo { get; set; }

        public decimal Precio
        {
            get { return precio; }
            set { precio = value; }
        }
        
        public List<Imagen> Imagenes
        {
            get { return imagenes; }
            set { imagenes = value; }
        }
    }
}
