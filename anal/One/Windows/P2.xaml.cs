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
using System.Windows.Shapes;

namespace One.Windows
{
    /// <summary>
    /// Логика взаимодействия для P2.xaml
    /// </summary>
    public partial class P2 : Window
    {
        public P2()
        {
            InitializeComponent();
        }

        private void Button_Click_Exit_P2(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            Close();
        }
    }
}
