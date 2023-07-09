import 'package:flutter/material.dart';
import '../../utils/enums/enum_sidebar.dart';
import '../panels_ui/dashboard_and_add_items/dashboard.dart';
import '../panels_ui/profile/profile.dart';
import 'package:untitled/screens/panels_ui/services_management/services_panel.dart';

class MyController with ChangeNotifier {
  List<Widget> pages = const [
    DashboardScreen(),
    ServicesPanelScreen(),
    ProfileScreen()
  ];

  SideBarItemColor localSelectedValue = SideBarItemColor.dashboard;
  Widget _mainPageWidget = const DashboardScreen();

  SideBarItemColor get selectedValue => localSelectedValue;
  Widget get mainPageWidget => _mainPageWidget;

  void setDashboardMenuItem() {
    localSelectedValue = SideBarItemColor.dashboard;
    _mainPageWidget = pages[0];
    notifyListeners();
  }

  void setServicesMenuItem() {
    localSelectedValue = SideBarItemColor.services;
    _mainPageWidget = pages[1];
    notifyListeners();
  }

  void setProfileMenuItem() {
    localSelectedValue = SideBarItemColor.profile;
    _mainPageWidget = pages[2];
    notifyListeners();
  }
}
