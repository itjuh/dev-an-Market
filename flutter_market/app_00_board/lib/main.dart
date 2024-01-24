import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BoardPage(),
    );
  }
}

class BoardPage extends StatelessWidget {
  const BoardPage({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildProfileAppBar(),
      
    );
  }
}

// 앱바생성 함수
AppBar _buildProfileAppBar() {
  return AppBar(
    backgroundColor: Colors.white10,
    
  );
}