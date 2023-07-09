import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
        content: const SizedBox(
          height: 50,
          width: 100,
          child: Center(child: CircularProgressIndicator()),
        )

    );
  }

  void show(BuildContext context) {
    showDialog(context: context, builder: (_) => this);
  }
}

// void showLoadingDialog(BuildContext context, String title) {
//   showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//             title: Text(
//               title,
//             ),
//             content: const SizedBox(
//               height: 80,
//               width: 250,
//               child: Center(child: CircularProgressIndicator()),
//             ));
//       });
// }

void errorDialog(BuildContext context, String error) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Error!!!",
            style: TextStyle(color: Colors.red),
          ),
          content: SizedBox(
            height: 100,
            width: 250,
            child: Text(error),
          ),
          actions: [
            TextButton(
              child: const Text(
                'Okay!!!',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
