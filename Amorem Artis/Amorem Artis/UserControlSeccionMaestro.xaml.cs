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
    /// Lógica de interacción para UserControlSeccionMaestro.xaml
    /// </summary>
    public partial class UserControlSeccionMaestro : UserControl
    {
        public UserControlSeccionMaestro()
        {
            InitializeComponent();
        }
        private void BtnAgregarDeSeccion_Click(object sender, RoutedEventArgs e)
        {
            dataGridBusqueda.Visibility = Visibility.Collapsed;
            btnEliminarDeSeccion.Visibility = Visibility.Collapsed;
            btnAgregarDeSeccion.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Visible;
            btnEliminar.Visibility = Visibility.Collapsed;
            GridDetalles.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            stkbusqueda.Visibility = Visibility.Collapsed;
        }

        private void BtnEliminarDeSeccion_Click(object sender, RoutedEventArgs e)
        {
            dataGridBusqueda.Visibility = Visibility.Collapsed;
            btnAgregarDeSeccion.Visibility = Visibility.Collapsed;
            btnEliminarDeSeccion.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Visible;
            GridDetalles.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            stkbusqueda.Visibility = Visibility.Collapsed;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            dataGridBusqueda.Visibility = Visibility.Visible;
            btnEliminarDeSeccion.Visibility = Visibility.Visible;
            btnAgregarDeSeccion.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
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
