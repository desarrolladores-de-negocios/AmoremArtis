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
    /// Lógica de interacción para UserControlEstado.xaml
    /// </summary>
    public partial class UserControlEstado : UserControl
    {
        DataClassesCursosDataContext dt = new DataClassesCursosDataContext(Properties.Settings.Default.AmoremArtisConnectionString);
        public UserControlEstado()
        {
            InitializeComponent();
            if (dt.DatabaseExists()) gridEstado.ItemsSource = dt.Estados;
        }

        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }

        private void Guardar_Click(object sender, RoutedEventArgs e)
        {
            dt.SubmitChanges();
        }


    }
}
