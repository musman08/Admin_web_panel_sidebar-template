import 'package:flutter/material.dart';

class SideBarMenuItem extends StatelessWidget {
  const SideBarMenuItem(
      {Key? key,
      required this.icon,
      required this.menuItemName,
      required this.onTap,
      required this.itemColor})
      : super(key: key);

  final IconData icon;
  final String menuItemName;
  final void Function() onTap;
  final bool itemColor;

  @override
  Widget build(BuildContext context) {
    Color iconColor, containerColor;
    if(itemColor == false){
      iconColor = Colors.grey[600]!;
      containerColor = Colors.transparent;
    }else{
      iconColor = Colors.blue[600]!;
      containerColor = Colors.blue[100]!;
    }
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 10),
                child: Icon(icon, color: iconColor, size: 20,),
              ),
               Expanded(child: Text(menuItemName, style: const TextStyle(fontSize: 14),),)
            ],
          ),
        ),
        // ListTile(
        //   leading: ,
        //   title:
        //   onTap: onTap,
        // ),
      ),
    );
  }
}
