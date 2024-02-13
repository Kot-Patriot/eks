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
using System.Windows.Threading;
using One.Windows;


namespace One
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
            public static int type;
        }

        bool Password_Vis;
        DispatcherTimer timer = new DispatcherTimer();
        string code;

        private void Show_password_Click(object sender, RoutedEventArgs e)
        {
            var Show_password = sender as CheckBox;
            if (Show_password.IsChecked.Value)
            {
                PasswordTB.Text = Password_Box.Password;
                PasswordTB.Visibility = Visibility.Visible;
                Password_Box.Visibility = Visibility.Hidden;
                Password_Vis = true;
            }
            else
            {
                Password_Box.Password = PasswordTB.Text;
                PasswordTB.Visibility = Visibility.Hidden;
                Password_Box.Visibility = Visibility.Visible;
                Password_Vis = false;
            }
        }

        private void GenCode()
        {
            code = null;
            Random random = new Random();
            string[] mass = new string[]
            {
                "1","2","3","4"
            };
            for (int i = 0; i < 4; i++)
            {
                code += mass[random.Next(0, mass.Length)];
            }
            Capcha_Box.Text = code;
            timer.Tick -= Timer_Tick;
            timer.Interval = TimeSpan.FromSeconds(15);
            timer.Tick += Timer_Tick;
            timer.Start();
        }

        void Timer_Tick(object sender, EventArgs e)
        {
            code = null;
            MessageBox.Show("KY");
            timer.Stop();
            GenCode();
        }

        private void Update_Capcha_Click(object sender, RoutedEventArgs e)
        {
            timer.Stop();
            Capcha_Box.Text = "";
            GenCode();
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            if (Password_Vis == true)
            {
                Password_Box.Password = PasswordTB.Text;
            }
            else
            {
                PasswordTB.Text = Password_Box.Password;
            }
            using (var DataBase = new bolEntities())
            {
                var log = DataBase.users.AsNoTracking().FirstOrDefault(m =>m.login == Login_Box.Text && m.password == Password_Box.Password && m.password == PasswordTB.Text);
                if (log != null)
                {
                    Globals.type =log.type;
                    if (log.type == 1)
                    {
                        MessageBox.Show("Вы вошли под пользователем 1");
                        P1 window1 = new P1();
                        window1.Show();
                        Close();
                    }
                    else if (log.type == 2)
                    {
                        MessageBox.Show("Вы вошли под пользователем 2");
                        P2 window1 = new P2();
                        window1.Show();
                        Close();
                    }
                }
                else
                {
                    MessageBox.Show("ты дебил?!");
                    Login.IsEnabled = false;
                    Capcha_Box_Login.Visibility  = Visibility.Visible;
                    Login_Capcha.Visibility = Visibility.Visible;
                    Update_Capcha.Visibility = Visibility.Visible;
                    Capcha_Box.Visibility = Visibility.Visible;
                    GenCode();
                }
            }
        }
        private void Login_Capcha_Click(object sender, RoutedEventArgs e)
        {
            if (Capcha_Box_Login.Text == code)
            {
                timer.Stop();
                MessageBox.Show("ВХОДИ");
                Login.IsEnabled = true;
                Capcha_Box_Login.Visibility = Visibility.Hidden;
                Login_Capcha.Visibility = Visibility.Hidden;
                Update_Capcha.Visibility = Visibility.Hidden;
                Capcha_Box.Visibility = Visibility.Hidden;
            }
            else
            {
                timer.Stop();
                MessageBox.Show("невходи");
                GenCode();
            }

        }
    }
}
