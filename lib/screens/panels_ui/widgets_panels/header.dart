import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../widgets/mytextformfield_widget.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.row1, required this.row2}) : super(key: key);

  final Widget row1;
  final Widget row2;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints boxConstraints){
      if(boxConstraints.maxWidth > 600){
        return Row(
          children: [
            Expanded(
              ///Dashboard Logo and SearchField Row
              child: row1,
            ),
            const SizedBox(width: 10,),
            Expanded(
              /// Buttons Row
              child: row2,
            ),
          ],
        );
      }else{
        return Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: SizedBox(
                height: 80,
                child: Column(
                children: [
                Expanded(
                  ///First Row
                  child: row1,
                ),
                Expanded(
                  /// Second Row
                  child: row2,
                ),
            ],),
              ),)
          ],
        );
      }
    }
    );
  }

}
