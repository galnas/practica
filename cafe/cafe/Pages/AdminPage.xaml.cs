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
    /// Логика взаимодействия для AdminPage.xaml
    /// </summary>
    public partial class AdminPage : Page
    {
        public AdminPage()
        {
            InitializeComponent();
            ListAssort.ItemsSource = cafeEntities.GetContext().Menus.ToList();
            var currentMenu = cafeEntities.GetContext().Menu_category.OrderBy(p => p.Name).ToList();
            currentMenu.Insert(0, new Menu_category
            {
                Name = "Все категории"
            }
            );
            cmbKateg.ItemsSource = currentMenu;
            cmbKateg.SelectedIndex = 0;

        }

        private void TxtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }

        private void CmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
                cafeEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p =>
                p.Reload());
            ListAssort.ItemsSource = cafeEntities.GetContext().Menus.OrderBy(p =>
            p.Name).ToList();
        }
        private void UpdateData()
        {
            var currentMenu = cafeEntities.GetContext().Menus.OrderBy(p => p.Name).ToList();
            currentMenu = currentMenu.Where(p => p.Name.ToLower().Contains(TxtSearch.Text.ToLower())).ToList();

            if (cmbKateg.SelectedIndex > 0)
                currentMenu = currentMenu.Where(p => p.id_cated_menu == (cmbKateg.SelectedItem as Menu_category).id_categ_menu).ToList();
            {
                if (CmbSort.SelectedIndex == 1)
                    currentMenu = currentMenu.OrderBy(p => p.Price).ToList();
                if (CmbSort.SelectedIndex == 0)
                    currentMenu = currentMenu.OrderByDescending(p => p.Price).ToList();

            }
            ListAssort.ItemsSource = currentMenu;
        }

        private void BtnUser_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new SotrudPage());

        }

        private void BtnZakaz_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnSmena_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnReg_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new RegistrPage(null));
        }

        private void cmbKateg_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }
    }
}
