import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'my_button.dart';

class My_dialog extends StatelessWidget {
  final controler;
  VoidCallback onsave;
  VoidCallback cancel;
  My_dialog(
      {super.key,
      required this.controler,
      required this.onsave,
      required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      elevation: 0,
      content: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(color: Colors.yellow[300]),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "add a new task"),
              controller: controler,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                My_button(text: 'add', onpressed: onsave),
                My_button(text: 'cancel', onpressed: cancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
