import 'package:flutter/material.dart';
import 'package:untitled/screens/controlled/panel_and_sidebar_controller.dart';
import 'controlled/panel_controlled_widget.dart';
import 'controlled/sidebar_controlled_widget.dart';

class MainPanelScreen extends StatefulWidget {
  const MainPanelScreen({Key? key}) : super(key: key);

  @override
  State<MainPanelScreen> createState() => _MainPanelScreenState();
}

class _MainPanelScreenState extends State<MainPanelScreen> {
  MyController myController = MyController();

  @override
  Widget build(BuildContext context) {
    final sideBar = SideBarMenuControlledWidget(myController: myController);
    final centerWidget = PanelControlledWidget(myController: myController);
    return LayoutBuilder(builder: (_, boxConstraints) {
      final isMobile = boxConstraints.maxWidth < 700;
      return Scaffold(
        appBar: isMobile
            ? AppBar(
                title: const Text("Admin Panel"),
              )
            : null,
        drawer: isMobile
            ? Drawer(
          width: 200,
                backgroundColor: Colors.blue[50],
                child: sideBar,
              )
            : null,
        body: Row(
          children: [
            isMobile? const SizedBox() : Container(
              color: Colors.blue[50],
              child: sideBar,
            ),
            Expanded(
              child: centerWidget,
            ),
          ],
        ),
      );
    });
  }
}
