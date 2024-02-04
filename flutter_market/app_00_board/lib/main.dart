import 'package:app_00_board/screens/main_screen.dart';
import 'package:app_00_board/screens/meeting_screen.dart';
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
        initialRoute: '/meeting',
        routes: {
          '/': (context) => MainPage(),
          // '/search': (context) => MainScreen(),
          // '/alert': (context) => BannerBuild(),
          '/meeting': (context) => MeetingScreen(),
        });
  }
}

// 메인 함수 stateful위셋 생성
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  // 탭컨트롤러 추가
  TabController? controller;

  void _onIconTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // mount
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  // unmount
  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  Widget commonBottomAppBar(context) {
    return BottomNavigationBar(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 상단 앱바
      appBar: _buildAppBar(context),
      body: [
        // mainPage
        TabBarView(
          controller: controller,
          children: [
            MainScreen(),
            MeetingScreen(),
            MeetingScreen(),
            MeetingScreen(),
            MeetingScreen(),
          ],
        ),
        // meetingPage
        MeetingScreen(),
        // uploadProductPage
        MeetingScreen(),
        // chattingPage
        MeetingScreen(),
        // myProfilePage
        MeetingScreen(),
      ][_selectedIndex],
      // 하단 앱바
      bottomNavigationBar: commonBottomAppBar(context),
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
  final locationList = ['도봉구', '노원구'];
  String? selectedLocation = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedLocation = locationList[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String?>(
      icon: Icon(Icons.expand_more),
      items: locationList.map((String loc) {
        return DropdownMenuItem<String>(
          value: loc,
          child: Text(loc),
        );
      }).toList(),
      onChanged: (String? value) {
        setState(() {
          selectedLocation = value;
        });
      },
      value: selectedLocation,
    );
  }
}
