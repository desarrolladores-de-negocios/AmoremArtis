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
    /// Lógica de interacción para UserControlAlumno.xaml
    /// </summary>
    public partial class UserControlAlumno : UserControl
    {
        public UserControlAlumno()
        {
            InitializeComponent();
        }
        public void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }

        private void BtnNuevoAlumno_Click(object sender, RoutedEventArgs e)
        {
            GridDatosAlumno.Visibility = Visibility.Visible;
            btnNuevoAlumno.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnModificarAlumno.Visibility = Visibility.Collapsed;
            btnElimarAlumno.Visibility = Visibility.Collapsed;
            DataGridAlumnos.Visibility = Visibility.Collapsed;
        }


        private void BtnModificarAlumno_Click(object sender, RoutedEventArgs e)
        {
            DataGridAlumnos.Visibility = Visibility.Collapsed;
            GridDatosAlumno.Visibility = Visibility.Visible;
            btnModificarAlumno.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnElimarAlumno.Visibility = Visibility.Collapsed;
            btnNuevoAlumno.Visibility = Visibility.Collapsed;
        }

        private void BtnElimarAlumno_Click(object sender, RoutedEventArgs e)
        {
            txtAlumno.Visibility = Visibility.Visible;
            ComboAlumno.Visibility = Visibility.Visible;
            btnEliminar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnNuevoAlumno.Visibility = Visibility.Collapsed;
            btnModificarAlumno.Visibility = Visibility.Collapsed;
            btnElimarAlumno.Visibility = Visibility.Collapsed;
            GridDatosAlumno.Visibility = Visibility.Visible;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            txtAlumno.Visibility = Visibility.Collapsed;
            ComboAlumno.Visibility = Visibility.Collapsed;
            GridDatosAlumno.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            btnNuevoAlumno.Visibility = Visibility.Visible;
            btnModificarAlumno.Visibility = Visibility.Visible;
            btnElimarAlumno.Visibility = Visibility.Visible;
            DataGridAlumnos.Visibility = Visibility.Visible;
        }
    }
}
