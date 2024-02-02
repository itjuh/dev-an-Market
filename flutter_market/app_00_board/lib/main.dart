import 'package:app_00_board/screens/main_screen.dart';
import 'package:app_00_board/widgets/banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        routes: {
          '/': (context) => MainPage(),
          '/search': (context) => MainProductList(),
          '/alert': (context) => BannerBuild(),
        });
  }
}

// 메인 함수 stateful위셋 생성
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onIconTapped(int index){
    setState(() {
      _selectedIndex = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: MainProductList(),
      // 하단 앱바
      bottomNavigationBar: BottomNavigationBar(
        // 디자인 설정
        iconSize: 32,
        selectedFontSize: 12,
        selectedItemColor: Colors.black54,
        unselectedFontSize: 12,
        unselectedItemColor: Colors.black87,
        unselectedLabelStyle: TextStyle(
          color: Colors.black87,
          fontSize: 12,
        ),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onIconTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
            ),
            label: '모임',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.upload_file_outlined,
            ),
            label: '등록',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.forum,
            ),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}

// 앱바생성 함수
AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    actions: [
      Container(
        padding: EdgeInsets.only(
          top: 0,
          left: 14,
        ),
        // 메인 장소
        child: BuildMyLocation(),
      ),

      Spacer(),
      // 검색 아이콘
      IconButton(
        icon: Icon(
          Icons.search,
          color: Colors.black87,
          size: 24.0,
        ),
        onPressed: () {
          debugPrint('search button is clicked');
          Navigator.pushNamed(context, '/search');
        },
      ),
      SizedBox(
        width: 13.0,
      ),
      // 알람 아이콘
      IconButton(
        icon: Icon(
          Icons.notifications_none,
          color: Colors.black87,
          size: 24.0,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/alert');
        },
      ),
      SizedBox(
        width: 13.0,
      ),
    ],
  );
}

class BuildMyLocation extends StatefulWidget {
  const BuildMyLocation({super.key});

  @override
  State<BuildMyLocation> createState() => _BuildMyLocationState();
}

class _BuildMyLocationState extends State<BuildMyLocation> {
  final _locationList = ['강남구', '노원구'];
  String? _selectedLocation = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedLocation = _locationList[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String?>(
      icon: Icon(Icons.expand_more),
      items: _locationList.map((String loc) {
        return DropdownMenuItem<String>(
          value: loc,
          child: Text(loc),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          _selectedLocation = value;
        });
      },
      value: _selectedLocation,
    );
  }
}
