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
            AccesoDatos datos = new AccesoDatos();

            try
            {
                if (existeClientePorDocumento(clienteNuevo.Documento))
                {
                    throw new Exception("Ya existe un cliente con ese documento.");
                }

                datos.SetearConsulta("INSERT INTO Clientes (Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP) VALUES (@Documento, @Nombre, @Apellido, @Email, @Direccion, @Ciudad, @CP); SELECT SCOPE_IDENTITY();");
                datos.SetearParametro("@Documento", clienteNuevo.Documento);
                datos.SetearParametro("@Nombre", clienteNuevo.Nombre);
                datos.SetearParametro("@Apellido", clienteNuevo.Apellido);
                datos.SetearParametro("@Email", clienteNuevo.Email);
                datos.SetearParametro("@Direccion", clienteNuevo.Direccion);
                datos.SetearParametro("@Ciudad", clienteNuevo.Ciudad);
                datos.SetearParametro("@CP", clienteNuevo.CodigoPostal);

                return datos.EjecutarAccionScalar();

                datos.EjecutarLectura();

                if (datos.Lector.Read())
                {
                    return Convert.ToInt32(datos.Lector[0]);
                }

                return 0;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void modificarCliente(Cliente clienteModificado)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                if (existeClientePorDocumentoExcluyendoId(clienteModificado.Documento, clienteModificado.IdCliente))
                {
                    throw new Exception("Ya existe otro cliente con ese documento.");
                }

                datos.SetearConsulta("UPDATE Clientes SET Documento=@Documento, Nombre=@Nombre, Apellido=@Apellido, Email=@Email, Direccion=@Direccion, Ciudad=@Ciudad, CP=@CP WHERE Id=@Id");
                datos.SetearParametro("@Documento", clienteModificado.Documento);
                datos.SetearParametro("@Nombre", clienteModificado.Nombre);
                datos.SetearParametro("@Apellido", clienteModificado.Apellido);
                datos.SetearParametro("@Email", clienteModificado.Email);
                datos.SetearParametro("@Direccion", clienteModificado.Direccion);
                datos.SetearParametro("@Ciudad", clienteModificado.Ciudad);
                datos.SetearParametro("@CP", clienteModificado.CodigoPostal);
                datos.SetearParametro("@Id", clienteModificado.IdCliente);

                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public Cliente obtenerClientePorDocumento(string documento)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("SELECT Id, Documento, Nombre, Apellido, Email, Direccion, Ciudad, CP FROM Clientes WHERE Documento = @Documento");
                datos.SetearParametro("@Documento", documento);
                datos.EjecutarLectura();

                if (datos.Lector.Read())
                {
                    Cliente aux = new Cliente();
                    aux.IdCliente = (int)datos.Lector["Id"];
                    aux.Documento = (string)datos.Lector["Documento"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Apellido = (string)datos.Lector["Apellido"];
                    aux.Email = (string)datos.Lector["Email"];
                    aux.Direccion = (string)datos.Lector["Direccion"];
                    aux.Ciudad = (string)datos.Lector["Ciudad"];
                    aux.CodigoPostal = (int)datos.Lector["CP"];

                    return aux;
                }

                return null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        private bool existeClientePorDocumento(string documento)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("SELECT COUNT(*) FROM Clientes WHERE Documento = @Documento");
                datos.SetearParametro("@Documento", documento);
                datos.EjecutarLectura();

                if (datos.Lector.Read())
                {
                    return (int)datos.Lector[0] > 0;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        private bool existeClientePorDocumentoExcluyendoId(string documento, int idExcluir)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("SELECT COUNT(*) FROM Clientes WHERE Documento = @Documento AND Id != @Id");
                datos.SetearParametro("@Documento", documento);
                datos.SetearParametro("@Id", idExcluir);
                datos.EjecutarLectura();

                if (datos.Lector.Read())
                {
                    return (int)datos.Lector[0] > 0;
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
        
}