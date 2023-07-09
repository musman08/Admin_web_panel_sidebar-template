import 'package:flutter/material.dart';
import 'package:untitled/screens/controlled/panel_and_sidebar_controller.dart';
import 'package:untitled/utils/enums/enum_sidebar.dart';
import 'package:untitled/widgets/sidebar_menu_item.dart';

class SideBar extends StatelessWidget {
  const SideBar(
      {Key? key,
        required this.selectedValue,
      required this.myController})
      : super(key: key);

  final SideBarItemColor selectedValue;
  final MyController myController;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 180,
        minWidth: 180,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SideBarMenuItem(
              icon: Icons.dashboard,
              menuItemName: "Jobs",
              onTap: () {
                myController.setDashboardMenuItem();
              },
              itemColor: selectedValue == SideBarItemColor.dashboard ? true : false ,
            ),
            SideBarMenuItem(
              icon: Icons.miscellaneous_services,
              menuItemName: "Service Management",
              onTap: () {
                myController.setServicesMenuItem();
              },
              itemColor: selectedValue == SideBarItemColor.services ? true : false ,
            ),
            SideBarMenuItem(
              icon: Icons.bar_chart,
              menuItemName: "Finance",
              onTap: () {
                myController.setProfileMenuItem();
              },
              itemColor: selectedValue == SideBarItemColor.profile ? true : false ,
            )
          ],
        ),
      ),
    );
  }
}


