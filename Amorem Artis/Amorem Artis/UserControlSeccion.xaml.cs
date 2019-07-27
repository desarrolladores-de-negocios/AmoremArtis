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
    /// Lógica de interacción para UserControlSeccion.xaml
    /// </summary>
    public partial class UserControlSeccion : UserControl
    {
        public UserControlSeccion()
        {
            InitializeComponent();
        }

        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }

        private void BtnNuevaSeccion_Click(object sender, RoutedEventArgs e)
        {
            stkSeccion.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnModificarSeccion.Visibility = Visibility.Collapsed;
            btnElimarSeccion.Visibility = Visibility.Collapsed;
        }

        private void BtnModificarSeccion_Click(object sender, RoutedEventArgs e)
        {
            stkSeccion.Visibility = Visibility.Visible;
            btnModificar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnElimarSeccion.Visibility = Visibility.Collapsed;
            btnNuevaSeccion.Visibility = Visibility.Collapsed;
        }

        private void BtnElimarSeccion_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
