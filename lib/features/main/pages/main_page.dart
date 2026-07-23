import 'package:flutter/material.dart';

import '../../customer/pages/customer_page.dart';
import '../../home/pages/home_page.dart';
import '../../order/pages/order_page.dart';
import '../../report/pages/report_page.dart';
import '../../settings/pages/setting_page.dart';
import '../controllers/main_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainController controller = MainController();

  final List<Widget> pages = const [
    HomePage(),
    OrderPage(),
    CustomerPage(),
    ReportPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Scaffold(
          backgroundColor: Colors.red,
          body: IndexedStack(index: controller.currentIndex, children: pages),

          bottomNavigationBar: NavigationBar(
            selectedIndex: controller.currentIndex,
            onDestinationSelected: controller.changePage,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.local_laundry_service_outlined),
                selectedIcon: Icon(Icons.local_laundry_service),
                label: "Order",
              ),
              NavigationDestination(
                icon: Icon(Icons.people_outline),
                selectedIcon: Icon(Icons.people),
                label: "Customer",
              ),
              NavigationDestination(
                icon: Icon(Icons.bar_chart_outlined),
                selectedIcon: Icon(Icons.bar_chart),
                label: "Report",
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: "Setting",
              ),
            ],
          ),
        );
      },
    );
  }
}
