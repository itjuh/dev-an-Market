
import 'package:flutter/material.dart';

class Board extends StatelessWidget {
  const Board({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            child: Text('다시돌아가기'),
          ),
                ],
              ),
        ));
  }
}
