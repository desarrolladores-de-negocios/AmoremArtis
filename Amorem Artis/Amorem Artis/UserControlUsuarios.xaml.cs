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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Amorem_Artis
{
    /// <summary>
    /// Lógica de interacción para UserControlUsuarios.xaml
    /// </summary>
    public partial class UserControlUsuarios : UserControl
    {
        public UserControlUsuarios()
        {
            InitializeComponent();
        }
        public void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {

            GridDetalle.Visibility = Visibility.Collapsed;
            stknueva.Visibility = Visibility.Collapsed;

            stkUsuario.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            btnNuevoUsuario.Visibility = Visibility.Visible;
            btnModificarUsuario.Visibility = Visibility.Visible;
            btnElimarUsuario.Visibility = Visibility.Visible;
            dataUsuarios.Visibility = Visibility.Visible;
            datauser.Visibility = Visibility.Collapsed;
        }

        private void BtnNuevoUsuario_Click(object sender, RoutedEventArgs e)
        {
            datauser.Visibility = Visibility.Visible;
            GridDetalle.Visibility = Visibility.Visible;
            stkUsuario.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnModificarUsuario.Visibility = Visibility.Collapsed;
            btnElimarUsuario.Visibility = Visibility.Collapsed;
            txtUsuario.Visibility = Visibility.Visible;
            dataUsuarios.Visibility = Visibility.Collapsed;
        }

        private void BtnModificarUsuario_Click(object sender, RoutedEventArgs e)
        {
            datauser.Visibility = Visibility.Visible;
            GridDetalle.Visibility = Visibility.Visible;
            stknueva.Visibility = Visibility.Visible;
            stkUsuario.Visibility = Visibility.Visible;
            btnModificar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnElimarUsuario.Visibility = Visibility.Collapsed;
            btnNuevoUsuario.Visibility = Visibility.Collapsed;
            dataUsuarios.Visibility = Visibility.Collapsed;
        }

        private void BtnElimarUsuario_Click(object sender, RoutedEventArgs e)
        {
            datauser.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnNuevoUsuario.Visibility = Visibility.Collapsed;
            btnModificarUsuario.Visibility = Visibility.Collapsed;
            
        }
    }
}
