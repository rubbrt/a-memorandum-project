import 'package:flutter/material.dart';

class My_button extends StatelessWidget {
  late String text;
  VoidCallback onpressed;
  My_button({super.key, required this.text, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.yellow[400],
      onPressed: onpressed,
      child: Text(text),
    );
  }
}
