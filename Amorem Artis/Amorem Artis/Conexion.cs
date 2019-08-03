using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Amorem_Artis
{
    class Conexion
    {
        SqlConnection connectionString = new SqlConnection(@"server = (local)\sqlexpress; database = AmoremArtis; integrated security = true");

        public void AbrirConexion()
        {
            try
            {
                // Abrir la conexión
                connectionString.Open();
            }
            catch (SqlException ex)
            {
                // Desplegar la causa del error (excepción)
                Console.WriteLine("Error: " + ex.Message + ex.StackTrace);
            }
        }

        public void CerrarConexion()
        {
            try
            {
                connectionString.Close();
            }
            catch (SqlException ex)
            {
                // Desplegar la causa del error (excepción)
                Console.WriteLine("Error: " + ex.Message + ex.StackTrace);
            }
        }
    }
}
