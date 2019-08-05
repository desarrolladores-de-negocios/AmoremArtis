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
using System.Data.SqlClient;

namespace Amorem_Artis
{
    /// <summary>
    /// Lógica de interacción para UserControlPagosAlumno.xaml
    /// </summary>
    public partial class UserControlPagosAlumno : UserControl
    {
        SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.AmoremArtisConnectionString);

        public UserControlPagosAlumno()
        {
            InitializeComponent();

            PopularGridPagos();
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
            GridPagosAlumno.Visibility = Visibility.Visible;
            dgPagosPendientesAlumno.Visibility = Visibility.Visible;
            lblPagosPendientesAlumno.Visibility = Visibility.Visible;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            stkAgregar.Visibility = Visibility.Collapsed;
            stkBusqueda.Visibility = Visibility.Visible;
            stkboton.Visibility = Visibility.Collapsed;
            DataGridPagos.Visibility = Visibility.Visible;
            GridPagosAlumno.Visibility = Visibility.Collapsed;
            dgPagosPendientesAlumno.Visibility = Visibility.Collapsed;
            lblPagosPendientesAlumno.Visibility = Visibility.Collapsed;
        }

        private void PopularGridPagos()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from pagos in context.Mensualidad
                        join alumnos in context.Alumno on pagos.idAlumno equals alumnos.id
                        join nombre in context.Nombre on alumnos.id equals nombre.idAlumno
                        join apellido in context.Apellido on alumnos.id equals apellido.idAlumno
                        where pagos.idEstado == 4
                        select new
                        {
                            pagos.id,
                            Nombre = nombre.Nombre1 + "" + apellido.Apellido1,
                            Mensualidad = pagos.Mensualidad1
                        };

            dgPagosPendientesAlumno.ItemsSource = query;
            dgPagosPendientesAlumno.DisplayMemberPath = "Nombre";
            dgPagosPendientesAlumno.SelectedValuePath = "id";
        }
    }
}
