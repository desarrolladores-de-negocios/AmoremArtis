using BeautySolutions.View.ViewModel;
using MaterialDesignThemes.Wpf;
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
using DropDownMenu;
using System.Windows.Threading;

namespace Amorem_Artis
{
    /// <summary>
    /// Lógica de interacción para MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            IniciarReloj();

            var menuRegister = new List<SubItem>();
            menuRegister.Add(new SubItem("Instrumentos", new UserControlInstrumentos()));
            menuRegister.Add(new SubItem("Secciones", new UserControlSeccion()));
            menuRegister.Add(new SubItem("Sulfeo"));
            var item1 = new ItemMenu("Cursos", menuRegister, PackIconKind.Class);


            Menu.Children.Add(new UserControlMenuItem(item1, this));
  
        }
        private void IniciarReloj()
        {
            DispatcherTimer timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += Timer_Tick;
            timer.Start();
        }

        private void Timer_Tick(object sender, EventArgs e)
        {
            dateText.Text = DateTime.Now.ToString();
        }

        internal void SwitchScreen(object sender)
        {
            var screen = ((UserControl)sender);

            if (screen != null)
            {
                GridPrincipal.Children.Add(screen);
            }
        }
    }
}
