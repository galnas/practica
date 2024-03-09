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
using System.IO;


namespace cafe.Pages
{
    /// <summary>
    /// Логика взаимодействия для RegistrPage.xaml
    /// </summary>
    public partial class RegistrPage : Page
    {
        cafeEntities _context;
        private User currentAs = new User();
        public RegistrPage(User selectedRegr)
        {
            InitializeComponent();
            if (selectedRegr != null) 
            { 
                
            currentAs = selectedRegr;
            int x = selectedRegr.id_user;
            }
            
            _context = new cafeEntities();
            DataContext = currentAs;
            cmbGender.ItemsSource = cafeEntities.GetContext().Genders.ToList();
            cmbRoly.ItemsSource = cafeEntities.GetContext().Rolies.ToList();           

        }
        private StringBuilder CheckFileds()
        {
            StringBuilder s = new StringBuilder();
            return s;
        }
        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFileds();
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            if (currentAs.id_user == 0)
            {
                cafeEntities.GetContext().Users.Add(currentAs);
            }
            try
            {
                cafeEntities.GetContext().SaveChanges();
                MessageBox.Show("Запись изменена");
                NavigationService.Navigate(new AvtorizPage());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
        private void DPditeBrt_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            DateTime? selectedDate = DPditeBrt.SelectedDate;
            currentAs.Bith_date = selectedDate;
        }
    }
}
