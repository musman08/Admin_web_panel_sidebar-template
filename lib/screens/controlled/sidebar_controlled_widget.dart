import 'package:flutter/material.dart';
import 'package:untitled/screens/controlled/panel_and_sidebar_controller.dart';
import 'package:untitled/screens/controlled/reusable.dart';
import 'package:untitled/widgets/sidebar.dart';

class SideBarMenuControlledWidget extends ControlledWidget<MyController> {
  const SideBarMenuControlledWidget({
    Key? key,
    required this.myController,
  }) : super(key: key, controller: myController);
  final MyController myController;

  @override
  State<SideBarMenuControlledWidget> createState() =>
      _SideBarMenuControlledWidgetState();
}

class _SideBarMenuControlledWidgetState
    extends State<SideBarMenuControlledWidget> with ControlledStateMixin {
  @override
  Widget build(BuildContext context) {
    return SideBar(
      selectedValue: widget.myController.localSelectedValue,
      myController: widget.myController,
    );
  }
}
