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
    /// Lógica de interacción para UserControlSeccionAlumno.xaml
    /// </summary>
    public partial class UserControlSeccionAlumno : UserControl
    {
        SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.AmoremArtisConnectionString);

        public UserControlSeccionAlumno()
        {
            InitializeComponent();

            PopularDataGridSeccionAlumno();
            PopularDataGridSeccionAlumno1();
            PopularComboBoxAlumno();
            PopularComboBoxCategoria();
            PopularComboBoxInstrumento();
        }
        private void BtnAgregarDeSeccion_Click(object sender, RoutedEventArgs e)
        {
            dataGridBusqueda.Visibility = Visibility.Collapsed;
            btnEliminarDeSeccion.Visibility = Visibility.Collapsed;
            btnAgregarDeSeccion.Visibility = Visibility.Collapsed;
            GridDetalles.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            stkbusqueda.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Visible;
        }

        private void BtnEliminarDeSeccion_Click(object sender, RoutedEventArgs e)
        {
            dataGridBusqueda.Visibility = Visibility.Collapsed;
            btnAgregarDeSeccion.Visibility = Visibility.Collapsed;
            btnEliminarDeSeccion.Visibility = Visibility.Collapsed;
            GridDetalles.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            stkbusqueda.Visibility = Visibility.Collapsed;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            dataGridBusqueda.Visibility = Visibility.Visible;
            btnEliminarDeSeccion.Visibility = Visibility.Visible;
            btnAgregarDeSeccion.Visibility = Visibility.Visible;
            GridDetalles.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            stkbusqueda.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Visible;
        }
        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }

        private void PopularDataGridSeccionAlumno1()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from alumno in context.Alumno
                        join detalleAlumno in context.DetalleAlumno on alumno.id equals detalleAlumno.idAlumno
                        join nombre in context.Nombre on alumno.id equals nombre.idAlumno
                        join apellido in context.Apellido on alumno.id equals apellido.idAlumno
                        join instrumento in context.Instrumento on detalleAlumno.idInstrumento equals instrumento.id
                        join seccion in context.SeccionInstrumento on instrumento.id equals seccion.idInstrumento
                        where detalleAlumno.idAlumno == alumno.id
                        select new
                        {
                            alumno.id,
                            alumno.Identidad,
                            Alumno = nombre.Nombre1 + " " + apellido.Apellido1,
                            Instrumento = instrumento.Instrumento1,
                            seccion.Seccion
                        };

            dataSeccion.ItemsSource = query;
            dataSeccion.DisplayMemberPath = "Alumno";
            dataSeccion.SelectedValuePath = "id";
        }

        private void PopularDataGridSeccionAlumno()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from alumno in context.Alumno
                        join detalleAlumno in context.DetalleAlumno on alumno.id equals detalleAlumno.idAlumno
                        join nombre in context.Nombre on alumno.id equals nombre.idAlumno
                        join apellido in context.Apellido on alumno.id equals apellido.idAlumno
                        join instrumento in context.Instrumento on detalleAlumno.idInstrumento equals instrumento.id
                        join seccion in context.SeccionInstrumento on instrumento.id equals seccion.idInstrumento
                        where detalleAlumno.idAlumno == alumno.id
                        select new
                        {
                            alumno.id,
                            alumno.Identidad,
                            Alumno = nombre.Nombre1 + " " + apellido.Apellido1,
                            Instrumento = instrumento.Instrumento1,
                            Seccion = seccion.Seccion
                        };

            dataGridBusqueda.ItemsSource = query;
            dataGridBusqueda.DisplayMemberPath = "Alumno";
            dataGridBusqueda.SelectedValuePath = "id";
        }

        private void PopularComboBoxAlumno()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from alumno in context.Alumno
                        join nombre in context.Nombre on alumno.id equals nombre.idAlumno
                        join apellido in context.Apellido on alumno.id equals apellido.idAlumno
                        where alumno.Estado == 6
                        select new
                        {
                            alumno.Identidad,
                            nombreCompleto = nombre.Nombre1 + " " + apellido.Apellido1
                        };

            cmbAlumno.ItemsSource = query;
            cmbAlumno.DisplayMemberPath = "nombreCompleto";
            cmbAlumno.SelectedValuePath = "Identidad";
        }

        private void PopularComboBoxCategoria()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from categoria in context.Categoria
                        where categoria.Estado == 6
                        select new
                        {
                            categoria.id,
                            categoria.Categoria1
                        };

            cmbCategoria.ItemsSource = query;
            cmbCategoria.DisplayMemberPath = "Categoria1";
            cmbCategoria.SelectedValuePath = "Categoria1";
        }

        private void PopularComboBoxInstrumento()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from instrumento in context.Instrumento
                        where instrumento.Estado == 6
                        select new
                        {
                            instrumento.id,
                            instrumento.Instrumento1
                        };

            cmbInstrumento.ItemsSource = query;
            cmbInstrumento.DisplayMemberPath = "Instrumento1";
            cmbInstrumento.SelectedValuePath = "id";
        }

        private void PopularComboBoxSeccion(int idInstrumento)
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var query = from instrumento in context.Instrumento
                        join seccion in context.SeccionInstrumento on instrumento.id equals seccion.idInstrumento
                        where seccion.idInstrumento == idInstrumento && seccion.Estado == 6
                        select new
                        {
                            seccion.id,
                            seccion.Seccion
                        };

            cmbSeccion.ItemsSource = query;
            cmbSeccion.DisplayMemberPath = "Seccion";
            cmbSeccion.SelectedValuePath = "Seccion";
        }

        private void BtnAgregar_Click(object sender, RoutedEventArgs e)
        {
            if (cmbAlumno.SelectedIndex == -1 || cmbCategoria.SelectedIndex == -1 || cmbInstrumento.SelectedIndex == -1 ||
                cmbSeccion.SelectedIndex == -1)
            {
                MessageBox.Show("Es necesario ingresar todos los datos");
            }
            else
            {
                try
                {
                    connectionString.Open();

                    Encriptacion encriptar = new Encriptacion();

                    string estadoIngresa = "Activo";

                    string query = "spInsercionDetalleAlumno";

                    SqlCommand sqlCommand = new SqlCommand(query, connectionString);

                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter alumno = new SqlParameter("@AlumnoIdentidad", SqlDbType.NVarChar);
                    alumno.Value = cmbAlumno.SelectedValue.ToString();
                    SqlParameter categoria = new SqlParameter("@Categoria", SqlDbType.NVarChar);
                    categoria.Value = cmbCategoria.Text;
                    SqlParameter instrumento = new SqlParameter("@Instrumento", SqlDbType.NVarChar);
                    instrumento.Value = cmbInstrumento.Text;
                    SqlParameter seccion = new SqlParameter("@SeccionInstrumento", SqlDbType.NVarChar);
                    seccion.Value = cmbSeccion.SelectedValue.ToString();
                    SqlParameter usuario = new SqlParameter("@Usuario", SqlDbType.NVarChar);
                    usuario.Value = Login.User;
                    SqlParameter estado = new SqlParameter("@Estado", SqlDbType.NVarChar);
                    estado.Value = estadoIngresa;

                    sqlCommand.Parameters.Add(alumno);
                    sqlCommand.Parameters.Add(categoria);
                    sqlCommand.Parameters.Add(instrumento);
                    sqlCommand.Parameters.Add(seccion);
                    sqlCommand.Parameters.Add(usuario);
                    sqlCommand.Parameters.Add(estado);

                    if (sqlCommand.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Usuario creado exitosamente");
                        cmbAlumno.SelectedIndex = -1;
                        cmbCategoria.SelectedIndex = -1;
                        cmbInstrumento.SelectedIndex = -1;
                        cmbSeccion.SelectedIndex = -1;
                        PopularDataGridSeccionAlumno();
                        PopularDataGridSeccionAlumno1();
                    }
                    else
                    {
                        MessageBox.Show("No se ha podido crear el usuario");
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

                try
                {
                    connectionString.Open();

                    Encriptacion encriptar = new Encriptacion();

                    string query = "spInsercionMensualidad";

                    SqlCommand sqlCommand = new SqlCommand(query, connectionString);

                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter alumno = new SqlParameter("@Alumno", SqlDbType.NVarChar);
                    alumno.Value = Convert.ToInt16(cmbAlumno.SelectedValue);
                    SqlParameter categoria = new SqlParameter("@Categoria", SqlDbType.NVarChar);
                    categoria.Value = cmbCategoria.Text;
                    SqlParameter usuario = new SqlParameter("@Usuario", SqlDbType.NVarChar);
                    usuario.Value = Login.User;

                    sqlCommand.Parameters.Add(alumno);
                    sqlCommand.Parameters.Add(categoria);
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

        private void CmbInstrumento_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            PopularComboBoxSeccion(Convert.ToInt16(cmbInstrumento.SelectedValue));
        }

        private void CmbAlumno_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
        }

        private void BtnBuscar_Click(object sender, RoutedEventArgs e)
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            //var query = from 
        }
    }
}
