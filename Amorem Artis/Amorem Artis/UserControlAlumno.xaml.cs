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
using System.Data;
using System.Data.SqlClient;

namespace Amorem_Artis
{
    /// <summary>
    /// Lógica de interacción para UserControlAlumno.xaml
    /// </summary>
    public partial class UserControlAlumno : UserControl
    {
        SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.AmoremArtisConnectionString);

        public UserControlAlumno()
        {
            InitializeComponent();

            PopularDataGridAlumnos();
            PopularComboBoxTipoAlumno();
            PopularDataGridAlumnos1();
            PopularDataGridAlumnosPrincipal();
        }
        public void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }

        private void BtnNuevoAlumno_Click(object sender, RoutedEventArgs e)
        {
            btnNuevoAlumno.Visibility = Visibility.Collapsed;
            GridDatosAlumno.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnModificarAlumno.Visibility = Visibility.Collapsed;
            btnElimarAlumno.Visibility = Visibility.Collapsed;
            DataGridAlumnos.Visibility = Visibility.Collapsed;
            stkAlumnos.Visibility = Visibility.Collapsed;
            stkNuevoAlumno.Visibility = Visibility.Visible;
            dgNuevoAlumno.Visibility = Visibility.Visible;
        }


        private void BtnModificarAlumno_Click(object sender, RoutedEventArgs e)
        {
            stkTabControlAlumno.Visibility = Visibility.Visible;
            stkModificarAlumnos.Visibility = Visibility.Visible;
            stkAlumnos.Visibility = Visibility.Collapsed;
            btnModificarAlumno.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
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
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            stkTabControlAlumno.Visibility = Visibility.Collapsed;
            stkModificarAlumnos.Visibility = Visibility.Collapsed;
            txtAlumno.Visibility = Visibility.Collapsed;
            ComboAlumno.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            btnNuevoAlumno.Visibility = Visibility.Visible;
            btnModificarAlumno.Visibility = Visibility.Visible;
            btnElimarAlumno.Visibility = Visibility.Visible;
            stkAlumnos.Visibility = Visibility.Visible;
            DataGridAlumnos.Visibility = Visibility.Visible;
            stkNuevoAlumno.Visibility = Visibility.Collapsed;
            dgNuevoAlumno.Visibility = Visibility.Collapsed;
        }

        private void PopularDataGridAlumnos()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from alumno in context.Alumno
                        join nombre in context.Nombre on alumno.id equals nombre.idAlumno
                        join apellido in context.Apellido on alumno.id equals apellido.idAlumno
                        join telefono in context.Telefono on alumno.id equals telefono.idAlumno
                        where alumno.Estado == 6
                        select new
                        {
                            alumno.Identidad,
                            Nombre = nombre.Nombre1,
                            Apellido = apellido.Apellido1,
                            Telefono =telefono.Telefono1
                        };

            dgAlumnos.ItemsSource = query;
            dgAlumnos.DisplayMemberPath = "Nombre";
            dgAlumnos.SelectedValuePath = "Identidad";
        }

        private void PopularDataGridAlumnos1()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from alumno in context.Alumno
                        join nombre in context.Nombre on alumno.id equals nombre.idAlumno
                        join apellido in context.Apellido on alumno.id equals apellido.idAlumno
                        join telefono in context.Telefono on alumno.id equals telefono.idAlumno
                        where alumno.Estado == 6
                        select new
                        {
                            alumno.Identidad,
                            Nombre = nombre.Nombre1,
                            Apellido = apellido.Apellido1,
                            Telefono = telefono.Telefono1
                        };

            dgNuevoAlumno.ItemsSource = query;
            dgNuevoAlumno.DisplayMemberPath = "Nombre";
            dgNuevoAlumno.SelectedValuePath = "Identidad";
        }

        private void PopularDataGridAlumnosPrincipal()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from alumno in context.Alumno
                        join nombre in context.Nombre on alumno.id equals nombre.idAlumno
                        join apellido in context.Apellido on alumno.id equals apellido.idAlumno
                        join telefono in context.Telefono on alumno.id equals telefono.idAlumno
                        where alumno.Estado == 6
                        select new
                        {
                            alumno.Identidad,
                            Nombre = nombre.Nombre1,
                            Apellido = apellido.Apellido1,
                            Telefono = telefono.Telefono1
                        };

            DataGridAlumnos.ItemsSource = query;
            DataGridAlumnos.DisplayMemberPath = "Nombre";
            DataGridAlumnos.SelectedValuePath = "Identidad";
        }

        private void PopularComboBoxTipoAlumno()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from tipo in context.TipoAlumno
                        select new
                        {
                            tipo.id,
                            tipo.Tipo
                        };

            cbTipoAlumno.ItemsSource = query;
            cbTipoAlumno.DisplayMemberPath = "Tipo";
            cbTipoAlumno.SelectedValuePath = "id";
        }

        private void BtnAgregar_Click(object sender, RoutedEventArgs e)
        {
            if (txtIdentidad.Text == String.Empty || txtNombre.Text == String.Empty || 
                txtApellido.Text == String.Empty || txtEdad.Text == String.Empty || 
                txtTelefono.Text == String.Empty || cbTipoAlumno.SelectedIndex == 0 || 
                txtDescuento.Text == String.Empty)
            {
                MessageBox.Show("Por favor, llene todos los campos.");
            }
            else
            {
                try
                {
                    connectionString.Open();

                    string query = "spInsercionAlumno";

                    SqlCommand sqlCommand = new SqlCommand(query, connectionString);

                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter identidad = new SqlParameter("@identidad", SqlDbType.NVarChar);
                    identidad.Value = txtIdentidad.Text;
                    SqlParameter nombre = new SqlParameter("@nombre", SqlDbType.Text);
                    nombre.Value = txtNombre.Text;
                    SqlParameter apellido = new SqlParameter("@apellido", SqlDbType.Text);
                    apellido.Value = txtApellido.Text;
                    SqlParameter edad = new SqlParameter("@edad", SqlDbType.Int);
                    edad.Value = txtEdad.Text;
                    SqlParameter telefono = new SqlParameter("@telefono", SqlDbType.NVarChar);
                    telefono.Value = txtTelefono.Text;
                    SqlParameter tipoAlumno = new SqlParameter("@tipoAlumno", SqlDbType.Text);
                    tipoAlumno.Value = cbTipoAlumno.Text;
                    SqlParameter descuento = new SqlParameter("@descuento", SqlDbType.Decimal);
                    descuento.Value = txtDescuento.Text;
                    SqlParameter estado = new SqlParameter("@Estado", SqlDbType.NVarChar);
                    estado.Value = "Activo";
                    SqlParameter usuario = new SqlParameter("@Usuario", SqlDbType.NVarChar);
                    usuario.Value = Login.User;

                    sqlCommand.Parameters.Add(identidad);
                    sqlCommand.Parameters.Add(nombre);
                    sqlCommand.Parameters.Add(apellido);
                    sqlCommand.Parameters.Add(edad);
                    sqlCommand.Parameters.Add(telefono);
                    sqlCommand.Parameters.Add(tipoAlumno);
                    sqlCommand.Parameters.Add(descuento);
                    sqlCommand.Parameters.Add(estado);
                    sqlCommand.Parameters.Add(usuario);

                    if (sqlCommand.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Alumno creado exitosamente");
                        txtAlumno.Text = String.Empty;
                        txtApellido.Text = String.Empty;
                        txtDescuento.Text = String.Empty;
                        txtEdad.Text = String.Empty;
                        txtIdentidad.Text = String.Empty;
                        txtTelefono.Text = String.Empty;
                        cbTipoAlumno.SelectedIndex = -1;
                        PopularDataGridAlumnos();
                        PopularDataGridAlumnos1();
                        PopularDataGridAlumnosPrincipal();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
                finally
                {
                    connectionString.Close();
                }
            }

            try
            {
                connectionString.Open();

                Encriptacion encriptar = new Encriptacion();

                string query = "spInsercionMatricula";

                SqlCommand sqlCommand = new SqlCommand(query, connectionString);

                sqlCommand.CommandType = CommandType.StoredProcedure;

                SqlParameter alumno = new SqlParameter("@Alumno", SqlDbType.NVarChar);
                alumno.Value = txtAlumno.Text;
                SqlParameter usuario = new SqlParameter("@Usuario", SqlDbType.NVarChar);
                usuario.Value = Login.User;

                sqlCommand.Parameters.Add(alumno);
                sqlCommand.Parameters.Add(usuario);

                sqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                connectionString.Close();
            }

        }
    }
}
