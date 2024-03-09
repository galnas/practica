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
    /// Логика взаимодействия для SotrudPage.xaml
    /// </summary>
    public partial class SotrudPage : Page
    {
        public SotrudPage()
        {
            InitializeComponent();
            TablAssort.ItemsSource = cafeEntities.GetContext().Users.ToList();

        }

        private void btnDel_Click(object sender, RoutedEventArgs e)
        {
            var selectedUsluga = TablAssort.SelectedItems.Cast<User>().ToList();
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedUsluga.Count()} записей ?", "Удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    User x = selectedUsluga[0];
                    cafeEntities.GetContext().Users.Remove(x);
                    cafeEntities.GetContext().SaveChanges();
                    MessageBox.Show("Записи удалены");
                    List<User> goods = cafeEntities.GetContext().Users.OrderBy(p => p.id_user).ToList();
                    TablAssort.ItemsSource = null;
                    TablAssort.ItemsSource = goods;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
