import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({Key? key,
    required this.title,
    required this.subTitle,
    required this.activeStatus
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String activeStatus;

  @override
  Widget build(BuildContext context) {
    Color iconColor = Colors.blue[600]!;

    return InkWell(
      onTap: (){
        context.pushNamed("ServicesDetailsPageScreen");
      },
      child: Container(
        width: 200,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.handshake, color: iconColor, size: 40,),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15,),
                  Row(children: [
                    Expanded(child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),
                    ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(activeStatus, style: TextStyle( fontSize: 9, fontStyle: FontStyle.italic  ,color: activeStatus!= "Active" ? Colors.red : Colors.green, ),),
                    )
                  ],),

                  Expanded(
                    child: Text(
                      subTitle,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}