using cafe.bd;
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

namespace cafe.Pages
{
    /// <summary>
    /// Логика взаимодействия для AvtorizPage.xaml
    /// </summary>
    public partial class AvtorizPage : Page
    {
        private cafeEntities cafe;

        public AvtorizPage()
        {
            InitializeComponent();
            cafe = new cafeEntities();
        }

        private void BtnOk_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginBox.Text;
            string password = PasswordBox.Password;
            using (var context = new cafeEntities())
            {
                var user = context.Users.FirstOrDefault(u => u.Login == LoginBox.Text && u.Password == PasswordBox.Password);

                if (user != null)
                {
                    if (user.id_user == 1)
                    {
                        NavigationService.Navigate(new Pages.AdminPage());
                    }
                    else if (user.id_roly == 2)
                    {
                        //NavigationService.Navigate(new pagesi.PageClientMain());
                    }
                    else if (user.id_roly == 3)
                    {
                        //NavigationService.Navigate(new pagesi.PageClientMain());
                    }
                }
                else
                {
                    MessageBox.Show("Неверный пароль");
                }
            }
        }

        private void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Pages.RegistrPage(null));
        }
    }
}
