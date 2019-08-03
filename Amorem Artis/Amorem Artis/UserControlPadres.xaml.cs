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
    /// Lógica de interacción para UserControlPadres.xaml
    /// </summary>
    public partial class UserControlPadres : UserControl
    {
        public UserControlPadres()
        {
            InitializeComponent();
        }
        public void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }

        private void BtnNuevoPadre_Click(object sender, RoutedEventArgs e)
        {
            btnNuevoPadre.Visibility = Visibility.Collapsed;
            GridDatosPadre.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnModificarPadre.Visibility = Visibility.Collapsed;
            btnElimarPadre.Visibility = Visibility.Collapsed;
            DataGridPadres.Visibility = Visibility.Collapsed;
            stkPadres.Visibility = Visibility.Collapsed;
            stkNuevoPadre.Visibility = Visibility.Visible;
            dgNuevoPadre.Visibility = Visibility.Visible;
        }


        private void BtnModificarPadre_Click(object sender, RoutedEventArgs e)
        {
            stkTabControlPadres.Visibility = Visibility.Visible;
            stkModificarPadres.Visibility = Visibility.Visible;
            stkPadres.Visibility = Visibility.Collapsed;
            btnModificarPadre.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Visible;
            btnElimarPadre.Visibility = Visibility.Collapsed;
            btnNuevoPadre.Visibility = Visibility.Collapsed;
        }

        private void BtnElimarPadre_Click(object sender, RoutedEventArgs e)
        {
            btnElimarPadre.Visibility = Visibility.Collapsed;
            txtPadre.Visibility = Visibility.Visible;
            ComboPadre.Visibility = Visibility.Visible;
            btnEliminar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnNuevoPadre.Visibility = Visibility.Collapsed;
            btnModificarPadre.Visibility = Visibility.Collapsed;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            stkTabControlPadres.Visibility = Visibility.Collapsed;
            stkModificarPadres.Visibility = Visibility.Collapsed;
            txtPadre.Visibility = Visibility.Collapsed;
            ComboPadre.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            btnNuevoPadre.Visibility = Visibility.Visible;
            btnModificarPadre.Visibility = Visibility.Visible;
            btnElimarPadre.Visibility = Visibility.Visible;
            stkPadres.Visibility = Visibility.Visible;
            DataGridPadres.Visibility = Visibility.Visible;
            stkNuevoPadre.Visibility = Visibility.Collapsed;
            dgNuevoPadre.Visibility = Visibility.Collapsed;
        }
    }
}
