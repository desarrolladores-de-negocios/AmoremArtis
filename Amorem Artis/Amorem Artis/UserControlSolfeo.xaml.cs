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
    /// Lógica de interacción para UserControlSolfeo.xaml
    /// </summary>
    public partial class UserControlSolfeo : UserControl
    {
        DataClasses1DataContext dt = new DataClasses1DataContext(Properties.Settings.Default.AmoremArtisConnectionString);
        public UserControlSolfeo()
        {
            InitializeComponent();
            if (dt.DatabaseExists()) gridSolfeo.ItemsSource = dt.Solfeo;

           
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
