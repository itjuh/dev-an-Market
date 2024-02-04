import 'package:flutter/cupertino.dart';

Widget textTitle(String txt) {
  return Row(
    children: [
      Text(
        txt,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ],
  );
}
