import 'package:flutter/cupertino.dart';
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
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // body: 
    );
  }
}

// 앱바생성 함수
AppBar _buildAppBar() {
  return AppBar(
    backgroundColor: Colors.grey.shade400,
    elevation: 1.0,
    actions: [
      Spacer(),
      IconButton(
        icon: Icon(
          CupertinoIcons.search,
          color: Colors.black87,
          size: 25.0,
          ),
        onPressed: (){
          debugPrint('search button is clicked');
        },
      ),
      SizedBox(
        width: 3.0,
      ),
      IconButton(
        icon: Icon(
          Icons.calendar_month_outlined,
          color: Colors.black87,
          size: 25.0,
          ),
        onPressed: (){
          debugPrint('calendar button is clicked');
        },
      ),
      SizedBox(
        width: 3.0,
      ),
      IconButton(
        icon: Icon(
          CupertinoIcons.bell,
          color: Colors.black87,
          size: 25.0,
          ),
        onPressed: (){
          debugPrint('bell button is clicked');
        },
      ),
      SizedBox(
        width: 3.0,
      ),
    ],
  );
}