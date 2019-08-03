using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Cryptography;

namespace Amorem_Artis
{
    class Encriptacion
    {
        public string laCadena { get; set; }

        public static string procesarSha256Hash(string laCadena)
        {
            // Crear SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // Obtener el hash 
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(laCadena));

                // Convertir arreglo de bytes a string 
                StringBuilder constructor = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    constructor.Append(bytes[i].ToString("x2"));
                }
                return constructor.ToString();
            }
        }
    }
}
