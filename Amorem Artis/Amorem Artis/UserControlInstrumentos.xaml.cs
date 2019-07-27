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
    /// Lógica de interacción para UserControlInstrumentos.xaml
    /// </summary>
    public partial class UserControlInstrumentos : UserControl
    {
        public UserControlInstrumentos()
        {
            InitializeComponent();
            
        }

        public void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);           
        }

        private void BtnNuevoInstrumento_Click(object sender, RoutedEventArgs e)
        {
            stkInstrumento.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnModificarInstrumento.Visibility = Visibility.Collapsed;
            btnElimarInstrumento.Visibility = Visibility.Collapsed;
        }


        private void BtnModificarInstrumento_Click(object sender, RoutedEventArgs e)
        {
            stkInstrumento.Visibility = Visibility.Visible;
            btnModificar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnElimarInstrumento.Visibility = Visibility.Collapsed;
            btnNuevoInstrumento.Visibility = Visibility.Collapsed;
        }

        private void BtnElimarInstrumento_Click(object sender, RoutedEventArgs e)
        {
            
            txtIns.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnNuevoInstrumento.Visibility = Visibility.Collapsed;
            btnModificarInstrumento.Visibility = Visibility.Collapsed;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            stkInstrumento.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            btnNuevoInstrumento.Visibility = Visibility.Visible;
            btnModificarInstrumento.Visibility = Visibility.Visible;
            btnElimarInstrumento.Visibility = Visibility.Visible;
        }
    }
}
