using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Dominio
{
    public class Imagen
    {
        private int id;
        private int idArticulo;
        private string imagenUrl;

        [DisplayName("ID")]
        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        [DisplayName("ID Artículo")]
        public int IdArticulo
        {
            get { return idArticulo; }
            set { idArticulo = value; }
        }

        [DisplayName("URL de Imagen")]
        public string ImagenUrl
        {
            get { return imagenUrl; }
            set { imagenUrl = value; }
        }

        public override string ToString()
        {
            return ImagenUrl;
        }

    }
}
