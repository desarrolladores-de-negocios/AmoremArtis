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
    /// Lógica de interacción para UserControlSolfeo.xaml
    /// </summary>
    public partial class UserControlSolfeo : UserControl
    {
        public UserControlSolfeo()
        {
            InitializeComponent();
        }

        private void BtnModificarSolfeo_Click(object sender, RoutedEventArgs e)
        {
            btnModificarSolfeo.Visibility = Visibility.Collapsed;
            stkSolfeo.Visibility = Visibility.Visible;
            btnModificar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnElimarSolfeo.Visibility = Visibility.Collapsed;
            btnNuevoSolfeo.Visibility = Visibility.Collapsed;
        }

        private void BtnElimarSolfeo_Click(object sender, RoutedEventArgs e)
        {
            btnElimarSolfeo.Visibility = Visibility.Collapsed;
            stkSolfeo.Visibility = Visibility.Visible;
            btnEliminar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnNuevoSolfeo.Visibility = Visibility.Collapsed;
            btnModificarSolfeo.Visibility = Visibility.Collapsed;
        }

        private void BtnNuevoSolfeo_Click(object sender, RoutedEventArgs e)
        {
            btnNuevoSolfeo.Visibility = Visibility.Collapsed;
            stkSolfeo.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnModificarSolfeo.Visibility = Visibility.Collapsed;
            btnElimarSolfeo.Visibility = Visibility.Collapsed;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            stkSolfeo.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            btnNuevoSolfeo.Visibility = Visibility.Visible;
            btnModificarSolfeo.Visibility = Visibility.Visible;
            btnElimarSolfeo.Visibility = Visibility.Visible;
        }

        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }
    }
}
