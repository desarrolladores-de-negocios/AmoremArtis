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
using System.Data;

namespace Amorem_Artis
{
    /// <summary>
    /// Lógica de interacción para UserControlUsuarios.xaml
    /// </summary>
    public partial class UserControlUsuarios : UserControl
    {

        SqlConnection connectionString = new SqlConnection(Properties.Settings.Default.AmoremArtisConnectionString);

        public UserControlUsuarios()
        {
            InitializeComponent();

            PopularDataGridUsuarios();
            PopularComboBoxUsuarios();
            PopularComboBoxMaestros();
            PopularComboBoxCargos();
            PopularDataGridNuevoUsuarios();
        }
        public void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);

            txtUsuario.Text = String.Empty;
            txtcontraseña.Text = String.Empty;
            cbCargo.SelectedIndex = -1;
            cbMaestro.SelectedIndex = -1;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {

            GridDetalle.Visibility = Visibility.Collapsed;
            stknueva.Visibility = Visibility.Collapsed;
            stkUsuario.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            btnNuevoUsuario.Visibility = Visibility.Visible;
            btnModificarUsuario.Visibility = Visibility.Visible;
            btnElimarUsuario.Visibility = Visibility.Visible;
            dataUsuarios.Visibility = Visibility.Visible;
            datauser.Visibility = Visibility.Collapsed;
            stkusuario.Visibility = Visibility.Collapsed;
            stkCargo.Visibility = Visibility.Collapsed;
            stkMaestro.Visibility = Visibility.Collapsed;

            txtUsuario.Text = String.Empty;
            txtcontraseña.Text = String.Empty;
            cbCargo.SelectedIndex = -1;
            cbMaestro.SelectedIndex = -1;
            PopularDataGridUsuarios();
        }

        private void BtnNuevoUsuario_Click(object sender, RoutedEventArgs e)
        {
            btnNuevoUsuario.Visibility = Visibility.Collapsed;
            datauser.Visibility = Visibility.Visible;
            GridDetalle.Visibility = Visibility.Visible;
            stkUsuario.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnModificarUsuario.Visibility = Visibility.Collapsed;
            btnElimarUsuario.Visibility = Visibility.Collapsed;
            txtUsuario.Visibility = Visibility.Visible;
            dataUsuarios.Visibility = Visibility.Collapsed;
            stkCargo.Visibility = Visibility.Visible;
            stkMaestro.Visibility = Visibility.Visible;            
        }

        private void BtnModificarUsuario_Click(object sender, RoutedEventArgs e)
        {
            btnModificarUsuario.Visibility = Visibility.Collapsed;
            datauser.Visibility = Visibility.Visible;
            GridDetalle.Visibility = Visibility.Visible;
            stkUsuario.Visibility = Visibility.Visible;
            btnModificar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnElimarUsuario.Visibility = Visibility.Collapsed;
            btnNuevoUsuario.Visibility = Visibility.Collapsed;
            dataUsuarios.Visibility = Visibility.Collapsed;
            stkUsuarioActual.Visibility = Visibility.Visible;
        }

        private void BtnElimarUsuario_Click(object sender, RoutedEventArgs e)
        {
            stkusuario.Visibility = Visibility.Visible;
            stkUsuarioActual.Visibility = Visibility.Collapsed;
            btnElimarUsuario.Visibility = Visibility.Collapsed;
            datauser.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnNuevoUsuario.Visibility = Visibility.Collapsed;
            btnModificarUsuario.Visibility = Visibility.Collapsed;
        }

        private void PopularDataGridUsuarios()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var sqlquery = from usuario in context.Usuario
                           join nombre in context.Nombre
                           on usuario.idMaestro equals nombre.idMaestro
                           join apellido in context.Apellido
                           on usuario.idMaestro equals apellido.idMaestro
                           where usuario.idMaestro == nombre.idMaestro
                           select new
                           {
                               usuario.id,
                               Usuario = usuario.Usuario1,
                               Nombre = nombre.Nombre1,
                               Apellido = apellido.Apellido1
                           };

            dataUsuarios.ItemsSource = sqlquery;
            dataUsuarios.DisplayMemberPath = "nombreCompleto";
            dataUsuarios.SelectedValuePath = "Usuario";

        }

        private void PopularDataGridNuevoUsuarios()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var sqlquery = from usuario in context.Usuario
                           join nombre in context.Nombre
                           on usuario.idMaestro equals nombre.idMaestro
                           join apellido in context.Apellido
                           on usuario.idMaestro equals apellido.idMaestro
                           where usuario.idMaestro == nombre.idMaestro
                           select new
                           {
                               usuario.id,
                               Usuario = usuario.Usuario1,
                               Maestro = nombre.Nombre1 + " " + apellido.Apellido1
                           };

            datauser.ItemsSource = sqlquery;
            datauser.DisplayMemberPath = "Maestro";
            datauser.SelectedValuePath = "id";
        }

        private void PopularComboBoxCargos()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var sqlQuery = from cargo in context.Cargo
                           select new
                           {
                               cargo.id,
                               cargo.Cargo1
                           };

            cbCargo.ItemsSource = sqlQuery;
            cbCargo.DisplayMemberPath = "Cargo1";
            cbCargo.SelectedValuePath = "id";

        }

        private void PopularComboBoxMaestros()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var sqlQuery = from nombre in context.Nombre
                           join apellido in context.Apellido
                           on nombre.idMaestro equals apellido.idMaestro
                           join maestro in context.Maestro
                           on nombre.idMaestro equals maestro.id
                           where maestro.Estado == 6
                           select new
                           {
                               maestro.Identidad,
                               nombre.idMaestro,
                               nombreCompleto = nombre.Nombre1 + " " + apellido.Apellido1
                           };

            cbMaestro.ItemsSource = sqlQuery;
            cbMaestro.DisplayMemberPath = "nombreCompleto";
            cbMaestro.SelectedValuePath = "Identidad";

        }

        private void PopularComboBoxUsuarios()
        {
            DataClasses1DataContext context = new DataClasses1DataContext(connectionString);

            var sqlQuery = from usuario in context.Usuario
                           where usuario.Estado == 6
                           select new
                           {
                               usuario.id,
                               usuario.Usuario1
                           };

            cbUsuarioActual.ItemsSource = sqlQuery;
            cbUsuarioActual.DisplayMemberPath = "Usuario1";
            cbUsuarioActual.SelectedValuePath = "id";
        }

        private void BtnAgregar_Click(object sender, RoutedEventArgs e)
        {
            if (txtUsuario.Text == String.Empty || txtcontraseña.Text == String.Empty || 
                cbCargo.Text == String.Empty || cbMaestro.Text == String.Empty)
            {
                MessageBox.Show("Porfavor ingresar todos los datos necesarios!");
            }
            else
            {
                try
                {
                    connectionString.Open();

                    Encriptacion encriptar = new Encriptacion();

                    string cargoValue = Convert.ToString(cbCargo.Text);
                    string identidadMaestro = Convert.ToString(cbMaestro.SelectedValue);
                    string encriptacion = encriptar.procesarSha256Hash(txtcontraseña.Text);
                    string estadoIngresa = "Activo";

                    string query = "spInsercionUsuario";

                    SqlCommand sqlCommand = new SqlCommand(query, connectionString);

                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter maestro = new SqlParameter("@Maestro", SqlDbType.NVarChar);
                    maestro.Value = identidadMaestro;
                    SqlParameter usuario = new SqlParameter("@Usuario", SqlDbType.NVarChar);
                    usuario.Value = txtUsuario.Text;
                    SqlParameter password = new SqlParameter("@Contrasena", SqlDbType.NVarChar);
                    password.Value = encriptacion;
                    SqlParameter cargo = new SqlParameter("@Cargo", SqlDbType.NVarChar);
                    cargo.Value = cargoValue;
                    SqlParameter estado = new SqlParameter("@Estado", SqlDbType.NVarChar);
                    estado.Value = estadoIngresa;

                    sqlCommand.Parameters.Add(maestro);
                    sqlCommand.Parameters.Add(usuario);
                    sqlCommand.Parameters.Add(password);
                    sqlCommand.Parameters.Add(cargo);
                    sqlCommand.Parameters.Add(estado);

                    if (sqlCommand.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Usuario creado exitosamente");
                        txtUsuario.Text = String.Empty;
                        txtcontraseña.Text = String.Empty;
                        cbMaestro.SelectedIndex = -1;
                        cbCargo.SelectedIndex = -1;
                        PopularDataGridUsuarios();
                        PopularDataGridNuevoUsuarios();
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
            }
        }

        private void BtnModificar_Click(object sender, RoutedEventArgs e)
        {
            //if (txtUsuario.Text == String.Empty || txtcontraseña.Text == String.Empty ||
            //    txtcontraseñaNueva.Text == String.Empty)
            //{
            //    MessageBox.Show("Porfavor ingresar todos los datos necesarios!");
            //}
            //else
            {
                try
                {
                    connectionString.Open();

                    Encriptacion encriptar = new Encriptacion();

                    string encriptacion = encriptar.procesarSha256Hash(txtcontraseña.Text);

                    string query = "spModificarUsuario";

                    SqlCommand sqlCommand = new SqlCommand(query, connectionString);

                    sqlCommand.CommandType = CommandType.StoredProcedure;

                    SqlParameter usuarioActual = new SqlParameter("@UsuarioAnterior", SqlDbType.NVarChar);
                    usuarioActual.Value = cbUsuarioActual.Text;
                    SqlParameter nuevoUsuario = new SqlParameter("@UsuarioNuevo", SqlDbType.NVarChar);
                    nuevoUsuario.Value = txtUsuario.Text;
                    SqlParameter nuevaPass = new SqlParameter("@Contrasena", SqlDbType.NVarChar);
                    nuevaPass.Value = encriptacion;
                    SqlParameter estado = new SqlParameter("@Estado", SqlDbType.NVarChar);
                    estado.Value = null;

                    sqlCommand.Parameters.Add(usuarioActual);
                    sqlCommand.Parameters.Add(nuevoUsuario);
                    sqlCommand.Parameters.Add(nuevaPass);
                    sqlCommand.Parameters.Add(estado);

                    if (sqlCommand.ExecuteNonQuery() > 0)
                    {
                        MessageBox.Show("Usuario modificado exitosamente");
                        txtUsuario.Text = String.Empty;
                        txtcontraseña.Text = String.Empty;
                        cbMaestro.SelectedIndex = -1;
                        cbCargo.SelectedIndex = -1;
                        datauser.Items.Refresh();
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
            }
        }

        private void BtnEliminar_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                connectionString.Open();

                Encriptacion encriptar = new Encriptacion();

                string encriptacion = encriptar.procesarSha256Hash(txtcontraseña.Text);
                string EstadoIngresa = "Inactivo";
                string query = "spModificarUsuario";

                SqlCommand sqlCommand = new SqlCommand(query, connectionString);

                sqlCommand.CommandType = CommandType.StoredProcedure;

                SqlParameter usuarioActual = new SqlParameter("@UsuarioAnterior", SqlDbType.NVarChar);
                usuarioActual.Value = cbUsuarioActual.Text;
                SqlParameter nuevoUsuario = new SqlParameter("@UsuarioNuevo", SqlDbType.NVarChar);
                nuevoUsuario.Value = null;
                SqlParameter nuevaPass = new SqlParameter("@Contrasena", SqlDbType.NVarChar);
                nuevaPass.Value = null;
                SqlParameter estado = new SqlParameter("@Estado", SqlDbType.NVarChar);
                estado.Value = EstadoIngresa;

                sqlCommand.Parameters.Add(usuarioActual);
                sqlCommand.Parameters.Add(nuevoUsuario);
                sqlCommand.Parameters.Add(nuevaPass);
                sqlCommand.Parameters.Add(estado);

                if (sqlCommand.ExecuteNonQuery() > 0)
                {
                    MessageBox.Show("Usuario modificado exitosamente");
                    txtUsuario.Text = String.Empty;
                    txtcontraseña.Text = String.Empty;
                    cbMaestro.SelectedIndex = -1;
                    cbCargo.SelectedIndex = -1;
                    datauser.Items.Refresh();
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
        }
    }
}
