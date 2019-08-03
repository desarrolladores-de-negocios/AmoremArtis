﻿using System;
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
    /// Lógica de interacción para UserControlMaestros.xaml
    /// </summary>
    public partial class UserControlMaestros : UserControl
    {
        public UserControlMaestros()
        {
            InitializeComponent();
        }
        public void Salir_Click(object sender, RoutedEventArgs e)
        {
            (this.Parent as Panel).Children.Remove(this);
        }

        private void BtnNuevoMaestro_Click(object sender, RoutedEventArgs e)
        {
            btnNuevoMaestro.Visibility = Visibility.Collapsed;
            GridDatosMaestro.Visibility = Visibility.Visible;
            btnAgregar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnModificarMaestro.Visibility = Visibility.Collapsed;
            btnElimarMaestro.Visibility = Visibility.Collapsed;
            DataGridMaestros.Visibility = Visibility.Collapsed;
            stkMaestros.Visibility = Visibility.Collapsed;
            stkNuevoMaestro.Visibility = Visibility.Visible;
            dgNuevoMaestro.Visibility = Visibility.Visible;
        }


        private void BtnModificarMaestro_Click(object sender, RoutedEventArgs e)
        {
            stkTabControlMaestro.Visibility = Visibility.Visible;
            stkModificarMaestros.Visibility = Visibility.Visible;
            stkMaestros.Visibility = Visibility.Collapsed;
            btnModificarMaestro.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Visible;
            btnElimarMaestro.Visibility = Visibility.Collapsed;
            btnNuevoMaestro.Visibility = Visibility.Collapsed;
        }

        private void BtnElimarMaestro_Click(object sender, RoutedEventArgs e)
        {
            btnElimarMaestro.Visibility = Visibility.Collapsed;
            txtMaestro.Visibility = Visibility.Visible;
            ComboMaestro.Visibility = Visibility.Visible;
            btnEliminar.Visibility = Visibility.Visible;
            btnVolver.Visibility = Visibility.Visible;
            btnNuevoMaestro.Visibility = Visibility.Collapsed;
            btnModificarMaestro.Visibility = Visibility.Collapsed;
        }

        private void BtnVolver_Click(object sender, RoutedEventArgs e)
        {
            stkTabControlMaestro.Visibility = Visibility.Collapsed;
            stkModificarMaestros.Visibility = Visibility.Collapsed;
            txtMaestro.Visibility = Visibility.Collapsed;
            ComboMaestro.Visibility = Visibility.Collapsed;
            btnAgregar.Visibility = Visibility.Collapsed;
            btnModificar.Visibility = Visibility.Collapsed;
            btnEliminar.Visibility = Visibility.Collapsed;
            btnVolver.Visibility = Visibility.Collapsed;
            btnNuevoMaestro.Visibility = Visibility.Visible;
            btnModificarMaestro.Visibility = Visibility.Visible;
            btnElimarMaestro.Visibility = Visibility.Visible;
            stkMaestros.Visibility = Visibility.Visible;
            DataGridMaestros.Visibility = Visibility.Visible;
            stkNuevoMaestro.Visibility = Visibility.Collapsed;
            dgNuevoMaestro.Visibility = Visibility.Collapsed;
        }
    }
}