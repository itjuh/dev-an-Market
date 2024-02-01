import 'package:app_00_board/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/board_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 첫페이지 home 또는 initialRoute로 등록
      // home: MainPage(),
      initialRoute: '/',
      routes:{
        '/': (context) => MainPage(),
        '/board' : (context) => Board(),
        '/main' : (context) => MainItemScreen(),
      }
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: MainItemScreen(),
    );
  }
}

// 앱바생성 함수
AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    actions: [
      Spacer(),
      IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.black87,
          size: 25.0,
        ),
        onPressed: () {
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
        onPressed: () {
          debugPrint('calendar button is clicked');
        },
      ),
      SizedBox(
        width: 3.0,
      ),
      IconButton(
        icon: Icon(
          Icons.notifications_none,
          color: Colors.black87,
          size: 25.0,
        ),
        onPressed: () {
          Navigator.pushNamed( context ,'/login');
        },
      ),
      SizedBox(
        width: 3.0,
      ),
    ],
  );
}

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('login'),
              duration: Duration(seconds: 2),
              action: SnackBarAction(
                label: 'Go to the board page.',
                onPressed: () {
                  Navigator.pushNamed(context, '/board');
                  // 바로 push하기
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     // 필요없는 parameter값 보낼거면 _로 보내기
                  //     builder: (_) => SecondPage()
                  //   ),
                  // );
                },
              ),
            ),
          );
        },
        child: Text('click me'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('secondPage'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('here'),
        ),
      ),
    );
  }
}
