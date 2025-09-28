using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Cliente
    {
        private int idCliente;
        private string documento;
        private string nombre;
        private string apellido;
        private string email;
        private string direccion;
        private string ciudad;
        private int codigoPostal;

        [DisplayName("ID")]
        public int IdCliente
        {
            get { return idCliente; }
            set { idCliente = value; }
        }

        [DisplayName("Documento")]
        public string Documento
        {
            get { return documento; }
            set { documento = value; }
        }

        [DisplayName("Nombre")]
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        [DisplayName("Apellido")]
        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }

        [DisplayName("Email")]
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        [DisplayName("Dirección")]
        public string Direccion
        {
            get { return direccion; }
            set { direccion = value; }
        }

        [DisplayName("Ciudad")]
        public string Ciudad
        {
            get { return ciudad; }
            set { ciudad = value; }
        }

        [DisplayName("Código Postal")]
        public int CodigoPostal
        {
            get { return codigoPostal; }
            set { codigoPostal = value; }
        }

        public string NombreCompleto
        {
            get { return $"{Nombre} {Apellido}"; }
        }

        public override string ToString()
        {
            return NombreCompleto;
        }
    }
}
