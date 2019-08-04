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
    /// Lógica de interacción para UserControlSolfeoMaestro.xaml
    /// </summary>
    public partial class UserControlSolfeoMaestro : UserControl
    {
        public UserControlSolfeoMaestro()
        {
            InitializeComponent();
        }

        private void BtnAgregarDeSolfeo_Click(object sender, RoutedEventArgs e)
        {
            dataGridBusqueda.Visibility = Visibility.Collapsed;
            btnEliminarDeSolfeo.Visibility = Visibility.Collapsed;
            btnAgregarDeSolfeo.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Visible;
            btnEliminar.Visibility = Visibility.Collapsed;
            GridDetalles.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            stkbusqueda.Visibility = Visibility.Collapsed;
        }

        private void BtnEliminarDeSolfeo_Click(object sender, RoutedEventArgs e)
        {
            dataGridBusqueda.Visibility = Visibility.Collapsed;
            btnAgregarDeSolfeo.Visibility = Visibility.Collapsed;
            btnEliminarDeSolfeo.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Collapsed;
            GridDetalles.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            stkbusqueda.Visibility = Visibility.Collapsed;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            dataGridBusqueda.Visibility = Visibility.Visible;
            btnEliminarDeSolfeo.Visibility = Visibility.Visible;
            btnAgregarDeSolfeo.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Collapsed;
            GridDetalles.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            stkbusqueda.Visibility = Visibility.Visible;
        }
        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }
    }
}
