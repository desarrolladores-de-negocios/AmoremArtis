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
    /// Lógica de interacción para UserControlClaseMaestro.xaml
    /// </summary>
    public partial class UserControlClaseMaestro : UserControl
    {
        public UserControlClaseMaestro()
        {
            InitializeComponent();
        }
        private void BtnNuevoClase_Click(object sender, RoutedEventArgs e)
        {
            btnElimarClase.Visibility = Visibility.Collapsed;
            btnNuevoClase.Visibility = Visibility.Collapsed;
            stkbusqueda.Visibility = Visibility.Collapsed;
            gridCla.Visibility = Visibility.Visible;
            dataGridClase.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            gridCla.Visibility = Visibility.Collapsed;
            dataGridClase.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
            stkbusqueda.Visibility = Visibility.Visible;
            btnNuevoClase.Visibility = Visibility.Visible;
            btnElimarClase.Visibility = Visibility.Visible;
        }

        public void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }

        private void BtnElimarClase_Click(object sender, RoutedEventArgs e)
        {
            btnNuevoClase.Visibility = Visibility.Collapsed;
            btnElimarClase.Visibility = Visibility.Collapsed;
            stkbusqueda.Visibility = Visibility.Collapsed;
            gridCla.Visibility = Visibility.Visible;
            dataGridClase.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
        }
    }
}
