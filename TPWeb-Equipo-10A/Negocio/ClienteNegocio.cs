using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ClienteNegocio
    {
        public int agregarCliente(Cliente clienteNuevo)
        {
            // logica para agregar cliente
            throw new NotImplementedException();
        }

        public void modificarCliente(Cliente clienteModificado)
        {
            // logica para modificar cliente
            throw new NotImplementedException();
        }

        public Cliente obtenerClientePorDocumento(string documento)
        {
            // logica para obtener cliente por documento
            throw new NotImplementedException();
        }

        private bool existeClientePorDocumento(string documento)
        {
            // validacion de existencia por documento
            throw new NotImplementedException();
        }

        private bool existeClientePorDocumentoExcluyendoId(string documento, int idExcluir)
        {
            // validacion de existencia excluyendo ID, para no duplicar documento
            throw new NotImplementedException();
        }
    }
}