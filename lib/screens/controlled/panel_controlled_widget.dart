import 'package:flutter/material.dart';
import 'package:untitled/screens/controlled/reusable.dart';

import 'panel_and_sidebar_controller.dart';

class PanelControlledWidget extends ControlledWidget<MyController> {
  const PanelControlledWidget({
    Key? key,
    required this.myController,
  }) : super(key: key, controller: myController);
  final MyController myController;

  @override
  State<PanelControlledWidget> createState() => _PanelControlledWidgetState();
}

class _PanelControlledWidgetState extends State<PanelControlledWidget>
    with ControlledStateMixin {
  @override
  Widget build(BuildContext context) {
    return widget.myController.mainPageWidget;
  }
}
