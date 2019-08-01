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
    /// Lógica de interacción para UserControlPagosMaestro.xaml
    /// </summary>
    public partial class UserControlPagosMaestro : UserControl
    {
        public UserControlPagosMaestro()
        {
            InitializeComponent();
        }
        public void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }
        private void BtnAgregar_Click(object sender, RoutedEventArgs e)
        {
            stkAgregar.Visibility = Visibility.Visible;
            stkBusqueda.Visibility = Visibility.Collapsed;
            stkboton.Visibility = Visibility.Visible;
            DataGridPagos.Visibility = Visibility.Collapsed;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            stkAgregar.Visibility = Visibility.Collapsed;
            stkBusqueda.Visibility = Visibility.Visible;
            stkboton.Visibility = Visibility.Collapsed;
            DataGridPagos.Visibility = Visibility.Visible;
        }
    }
}
