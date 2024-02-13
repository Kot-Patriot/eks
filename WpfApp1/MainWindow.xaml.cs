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
using System.Windows.Threading;
using WpfApp1.Model;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

        }

        public static class Globals
        {
            public static int Type;

            public static users userinfo { get; set; }
        }

        private void Next_Btn(object sender, RoutedEventArgs e)
        {
            if(TXB2.Text == TXB1.Text)
            {
                WelcomPage welcomPage = new WelcomPage();
                welcomPage.Show();
                this.Close();
            }
        }

        private void Sign(object sender, RoutedEventArgs e)
        {
            var currentUser = AppData.db.users.FirstOrDefault(u => u.login == txb_login.Text);

            if(currentUser != null)
            {
                Globals.Type = currentUser.type;
                Globals.userinfo = currentUser;
                txb_password.IsEnabled = true;
                Siiig.Visibility = Visibility.Hidden;
                Siiig2.Visibility = Visibility.Visible;
            }
        }

        private async void Sign2(object sender, RoutedEventArgs e)
        {
            var curenUser = AppData.db.users.FirstOrDefault(u => u.login == txb_login.Text && u.password == txb_password.Password);

            if(curenUser != null)
            {
                Globals.Type = curenUser.type;
                Globals.userinfo = curenUser;

                

                if(Kapcha.Visibility == Visibility.Hidden)
                {
                    Kapcha.Visibility = Visibility.Visible;
                    txb_password.IsEnabled = false;
                    while (true)
                    {
                        Random x = new Random();
                        int a = x.Next(1000, 9999);
                        TXB1.Text = a.ToString();
                        await Task.Delay(10000);
                    }
                }
            }

            else
            {
                WelcomPage welcomPage = new WelcomPage();
                welcomPage.Show();
                this.Close();
            }
        }
    }
}
