using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Voucher
    {
        private string codigoVoucher;
        private Cliente cliente;
        private DateTime? fechaCanje;
        private Articulo articulo;

        [DisplayName("Código Voucher")]
        public string CodigoVoucher
        {
            get { return codigoVoucher; }
            set { codigoVoucher = value; }
        }

        [DisplayName("Cliente")]
        public Cliente Cliente
        {
            get { return cliente; }
            set { cliente = value; }
        }

        [DisplayName("Fecha de Canje")]
        public DateTime? FechaCanje
        {
            get { return fechaCanje; }
            set { fechaCanje = value; }
        }

        [DisplayName("Artículo")]
        public Articulo Articulo
        {
            get { return articulo; }
            set { articulo = value; }
        }

        public bool Usado
        {
            get { return FechaCanje.HasValue; }
        }

        public bool PuedeUsar
        {
            get { return !Usado; }
        }

        public override string ToString()
        {
            return CodigoVoucher;
        }
    }
}
