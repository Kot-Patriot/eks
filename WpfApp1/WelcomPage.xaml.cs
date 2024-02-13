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
using WpfApp1.Model;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для WelcomPage.xaml
    /// </summary>
    public partial class WelcomPage : Window
    {
        public WelcomPage()
        {
            InitializeComponent();
            Piska.ItemsSource = bolEntities.GetContext().users.ToList();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)//Связь с таблицей сотрудники
        {
            using (var db = new bolEntities())
            {
                Piska.ItemsSource = db.users.ToList();
            }
        }
    }
}
