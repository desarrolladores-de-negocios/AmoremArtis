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
    /// Lógica de interacción para UserControlSeccion.xaml
    /// </summary>
    public partial class UserControlSeccion : UserControl
    {
        DataClasses1DataContext dt = new DataClasses1DataContext(Properties.Settings.Default.AmoremArtisConnectionString);
        public UserControlSeccion()
        {
            InitializeComponent();
            if (dt.DatabaseExists()) gridSeccion.ItemsSource = dt.SeccionInstrumento;

        }

        private void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }

     

        private void BtnGuardar_Click(object sender, RoutedEventArgs e)
        {
            dt.SubmitChanges();
        }
    }
}
