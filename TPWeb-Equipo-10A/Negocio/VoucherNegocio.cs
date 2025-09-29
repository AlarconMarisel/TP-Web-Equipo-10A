using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class VoucherNegocio
    {
        public Voucher obtenerVoucherPorCodigo(string codigoVoucher)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("SELECT V.CodigoVoucher, V.IdCliente, V.FechaCanje, V.IdArticulo, C.Nombre, C.Apellido, C.Email, A.Nombre as NombreArticulo FROM Vouchers V LEFT JOIN Clientes C ON V.IdCliente = C.Id LEFT JOIN ARTICULOS A ON V.IdArticulo = A.Id WHERE V.CodigoVoucher = @CodigoVoucher");
                datos.SetearParametro("@CodigoVoucher", codigoVoucher);
                datos.EjecutarLectura();

                if (datos.Lector.Read())
                {
                    Voucher aux = new Voucher();
                    aux.CodigoVoucher = (string)datos.Lector["CodigoVoucher"];

                    if (datos.Lector["FechaCanje"] != DBNull.Value)
                    {
                        aux.FechaCanje = (DateTime)datos.Lector["FechaCanje"];
                    }

                    if (datos.Lector["IdCliente"] != DBNull.Value)
                    {
                        aux.Cliente = new Cliente();
                        aux.Cliente.IdCliente = (int)datos.Lector["IdCliente"];
                        aux.Cliente.Nombre = (string)datos.Lector["Nombre"];
                        aux.Cliente.Apellido = (string)datos.Lector["Apellido"];
                        aux.Cliente.Email = (string)datos.Lector["Email"];
                    }

                    if (datos.Lector["IdArticulo"] != DBNull.Value)
                    {
                        aux.Articulo = new Articulo();
                        aux.Articulo.IdArticulo = (int)datos.Lector["IdArticulo"];
                        aux.Articulo.NombreArticulo = (string)datos.Lector["NombreArticulo"];
                    }

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

        public void canjearVoucher(string codigoVoucher, int idCliente, int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                Voucher voucher = obtenerVoucherPorCodigo(codigoVoucher);
                if (voucher == null)
                {
                    throw new Exception("El voucher no existe.");
                }

                if (voucher.Usado)
                {
                    throw new Exception("El voucher ya fue utilizado.");
                }

                datos.SetearConsulta("UPDATE Vouchers SET IdCliente = @IdCliente, FechaCanje = @FechaCanje, IdArticulo = @IdArticulo WHERE CodigoVoucher = @CodigoVoucher");
                datos.SetearParametro("@IdCliente", idCliente);
                datos.SetearParametro("@FechaCanje", DateTime.Now);
                datos.SetearParametro("@IdArticulo", idArticulo);
                datos.SetearParametro("@CodigoVoucher", codigoVoucher);
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
    }
}