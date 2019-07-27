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
            stkCategoria.Visibility = Visibility.Visible;
            stkInstrumento.Visibility = Visibility.Visible;
            txtSeccion.Visibility = Visibility.Visible;
        }

        private void BtnModificarSeccion_Click(object sender, RoutedEventArgs e)
        {

            stkSeccion.Visibility = Visibility.Visible;
            btnModificar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnElimarSeccion.Visibility = Visibility.Collapsed;
            btnNuevaSeccion.Visibility = Visibility.Collapsed;
            stkCategoria.Visibility = Visibility.Visible;
            stkInstrumento.Visibility = Visibility.Visible;
            cbSeccion.Visibility = Visibility.Visible;
        }

        private void BtnElimarSeccion_Click(object sender, RoutedEventArgs e)
        {
            stkSeccion.Visibility = Visibility.Visible;
            btnEliminar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnNuevaSeccion.Visibility = Visibility.Collapsed;
            btnModificarSeccion.Visibility = Visibility.Collapsed;
            blNombreSeccion.Visibility = Visibility.Collapsed;
            txtSeccion.Visibility = Visibility.Collapsed;
            cbSeccion.Visibility = Visibility.Visible;
            txtNombreSeccion.Visibility = Visibility.Collapsed;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            stkSeccion.Visibility = Visibility.Collapsed;
            stkCategoria.Visibility = Visibility.Collapsed;
            stkInstrumento.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            btnNuevaSeccion.Visibility = Visibility.Visible;
            btnModificarSeccion.Visibility = Visibility.Visible;
            btnElimarSeccion.Visibility = Visibility.Visible;
            txtSeccion.Visibility = Visibility.Collapsed;
            cbSeccion.Visibility = Visibility.Collapsed;

        }
    }
}
