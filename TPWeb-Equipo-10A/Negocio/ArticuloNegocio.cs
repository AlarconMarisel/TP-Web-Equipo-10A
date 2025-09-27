using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ArticuloNegocio
    {
        public List<Articulo> listarArticulo()
        {
            List<Articulo> listadoArticulos = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            try
            {
                datos.SetearConsulta("SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion, A.IdMarca, A.IdCategoria, A.Precio, M.Descripcion Marca, C.Descripcion Categoria FROM ARTICULOS A, MARCAS M, CATEGORIAS C WHERE M.Id = A.IdMarca AND C.Id = A.IdCategoria");
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.IdArticulo = (int)datos.Lector["Id"];
                    aux.CodigoArticulo = (string)datos.Lector["Codigo"];
                    aux.NombreArticulo = (string)datos.Lector["Nombre"];
                    aux.DescripcionArticulo = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];

                    aux.MarcaArticulo = new Marca();
                    aux.MarcaArticulo.Id = (int)datos.Lector["IdMarca"];
                    aux.MarcaArticulo.Descripcion = (string)datos.Lector["Marca"];

                    aux.CategoriaArticulo = new Categoria();
                    aux.CategoriaArticulo.Id = (int)datos.Lector["IdCategoria"];
                    aux.CategoriaArticulo.Descripcion = (string)datos.Lector["Categoria"];

                    aux.Imagenes = imagenNegocio.listarImagenesPorArticulo(aux.IdArticulo);

                    listadoArticulos.Add(aux);
                }

                return listadoArticulos;
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

        public int agregarArticulo(Articulo articuloNuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("INSERT INTO ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio) VALUES (@Codigo, @Nombre, @Descripcion, @IdMarca, @IdCategoria, @Precio); SELECT SCOPE_IDENTITY();");
                datos.SetearParametro("@Codigo", articuloNuevo.CodigoArticulo);
                datos.SetearParametro("@Nombre", articuloNuevo.NombreArticulo);
                datos.SetearParametro("@Descripcion", articuloNuevo.DescripcionArticulo);
                datos.SetearParametro("@IdMarca", articuloNuevo.MarcaArticulo.Id);
                datos.SetearParametro("@IdCategoria", articuloNuevo.CategoriaArticulo.Id);
                datos.SetearParametro("@Precio", articuloNuevo.Precio);

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

        public void modificarArticulo(Articulo articuloModificado)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.SetearConsulta("update ARTICULOS set Codigo=@Codigo, Nombre=@Nombre, Descripcion=@Descripcion, IdMarca=@IdMarca, IdCategoria=@IdCategoria, Precio=@Precio where Id=@Id");
                datos.SetearParametro("@Codigo", articuloModificado.CodigoArticulo);
                datos.SetearParametro("@Nombre", articuloModificado.NombreArticulo);
                datos.SetearParametro("@Descripcion", articuloModificado.DescripcionArticulo);
                datos.SetearParametro("@IdMarca", articuloModificado.MarcaArticulo.Id);
                datos.SetearParametro("@IdCategoria", articuloModificado.CategoriaArticulo.Id);
                datos.SetearParametro("@Precio", articuloModificado.Precio);
                datos.SetearParametro("@Id", articuloModificado.IdArticulo);

                datos.EjecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally { 
                datos.cerrarConexion();
            }

        }

        public Articulo obtenerArticuloPorId(int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            try
            {
                datos.SetearConsulta("SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion, A.IdMarca, A.IdCategoria, A.Precio, M.Descripcion Marca, C.Descripcion Categoria FROM ARTICULOS A, MARCAS M, CATEGORIAS C WHERE M.Id = A.IdMarca AND C.Id = A.IdCategoria AND A.Id = @Id");
                datos.SetearParametro("@Id", idArticulo);
                datos.EjecutarLectura();

                if (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.IdArticulo = (int)datos.Lector["Id"];
                    aux.CodigoArticulo = (string)datos.Lector["Codigo"];
                    aux.NombreArticulo = (string)datos.Lector["Nombre"];
                    aux.DescripcionArticulo = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];

                    aux.MarcaArticulo = new Marca();
                    aux.MarcaArticulo.Id = (int)datos.Lector["IdMarca"];
                    aux.MarcaArticulo.Descripcion = (string)datos.Lector["Marca"];

                    aux.CategoriaArticulo = new Categoria();
                    aux.CategoriaArticulo.Id = (int)datos.Lector["IdCategoria"];
                    aux.CategoriaArticulo.Descripcion = (string)datos.Lector["Categoria"];

                    aux.Imagenes = imagenNegocio.listarImagenesPorArticulo(aux.IdArticulo);

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

        public void eliminarArticulo(int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            
            try
            {
                datos.SetearConsulta("DELETE FROM ARTICULOS WHERE Id = @Id");
                datos.SetearParametro("@Id", idArticulo);
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
