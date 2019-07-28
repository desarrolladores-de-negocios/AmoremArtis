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

            var menuCursos = new List<SubItem>();
            menuCursos.Add(new SubItem("Instrumentos", new UserControlInstrumentos()));
            menuCursos.Add(new SubItem("Secciones"));
            menuCursos.Add(new SubItem("Solfeo"));
            var item1 = new ItemMenu("Cursos", menuCursos, PackIconKind.Piano);

            var menuAlumnos = new List<SubItem>();
            menuAlumnos.Add(new SubItem("Alumno", new UserControlInstrumentos()));
            menuAlumnos.Add(new SubItem("Secciones"));
            menuAlumnos.Add(new SubItem("Padres"));
            menuAlumnos.Add(new SubItem("Solfeo"));
            menuAlumnos.Add(new SubItem("Pagos"));
            var item2 = new ItemMenu("Alumnos", menuAlumnos, PackIconKind.Person);

            var menuMaestros = new List<SubItem>();
            menuMaestros.Add(new SubItem("Maestros", new UserControlInstrumentos()));
            menuMaestros.Add(new SubItem("Secciones"));
            menuMaestros.Add(new SubItem("Solfeo"));
            menuMaestros.Add(new SubItem("Pagos"));
            var item3 = new ItemMenu("Maestros", menuMaestros, PackIconKind.Teacher);

            var menuUsuarios = new List<SubItem>();
            menuUsuarios.Add(new SubItem("Ver Usuarios", new UserControlInstrumentos()));
            menuUsuarios.Add(new SubItem("Agregar Usuario"));
            menuUsuarios.Add(new SubItem("Quitar Usuario"));
            var item4 = new ItemMenu("Usuarios", menuUsuarios, PackIconKind.User);

            Menu.Children.Add(new UserControlMenuItem(item1, this));
            Menu.Children.Add(new UserControlMenuItem(item2, this));
            Menu.Children.Add(new UserControlMenuItem(item3, this));
            Menu.Children.Add(new UserControlMenuItem(item4, this));
        }

        internal void SwitchScreen(object sender)
        {
            var screen = ((UserControl)sender);

            if (screen != null)
            {
                StackPanelPrincipal.Children.Clear();
                StackPanelPrincipal.Children.Add(screen);
            }
        }
    }
}
