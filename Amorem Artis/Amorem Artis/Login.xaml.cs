using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data.SqlClient;

namespace Amorem_Artis
{
    /// <summary>
    /// Lógica de interacción para Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.AmoremArtisConnectionString);

        public static string User;

        public Login()
        {
            InitializeComponent();
        }

        private void BtnIngresar_Click(object sender, RoutedEventArgs e)
        {
            MainWindow win = new MainWindow();
            
            if (AutenticacionUsuario(txtUsuario.Text, txtContrasena.Password))
            {
                User = txtUsuario.Text;
                MessageBox.Show("Usted a ingresado como adminstrador", "Bienvenido!");
                win.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Usuario o contraseña invalida", "Ingreso fallido");
            }
        }

        private void BtnSalir_Click(object sender, RoutedEventArgs e)
        {
            if (MessageBox.Show("Realmente desea salir?", "Consulta", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                App.Current.Shutdown();
            }
        }

        
        private bool AutenticacionUsuario(string userName, string password)
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from usuario in context.Usuario
                        where usuario.Usuario1 == userName &&
                        password == usuario.Pass
                        select usuario;

            if (query.Any())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
