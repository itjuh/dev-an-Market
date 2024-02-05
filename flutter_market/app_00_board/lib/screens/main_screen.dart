import 'package:app_00_board/config/palette.dart';
import 'package:app_00_board/widgets/banner.dart';
import 'package:app_00_board/widgets/content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int productSeq = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      // 앱바
      appBar: buildMainAppBar(context),
      // item widget
      body: _buildProductList(),
    );
  }
}

// 메인 앱바생성 함수
AppBar buildMainAppBar(BuildContext context) {
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

// 장소
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

Widget _buildProductList() {
  return ListView(
    children: [
      BannerBuild(),
      for (int i = 0; i < 10; i++) _buildProduct(),
    ],
  );
}

Widget _buildProduct() {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // gap
        SizedBox(
          height: 14.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // item Image
            itemImage(),
            // padding
            SizedBox(
              width: 12.0,
            ),
            // item info
            Flexible(
              // stretch box
              fit: FlexFit.tight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // itemName
                    Row(
                      children: [
                        Text(
                          '아이템 이름 길게 길게',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        // more icons
                        moreVertIcon(),
                      ],
                    ),
                    // padding
                    SizedBox(
                      height: 4,
                    ),
                    // location
                    Row(
                      children: [
                        Text(
                          '도봉구 도봉동',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '0km',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    // padding
                    SizedBox(
                      height: 4,
                    ),
                    // keyword
                    productKeywordSetting(
                        ['중고상품', '택배거래', '애견용품'], Color(0xFF606060)),
                    // padding
                    SizedBox(
                      height: 10,
                    ),
                    // icons
                    viewChatPickIcons([2, 5, 10])
                  ],
                ),
              ),
            ),
          ],
        ),
        // gap
        SizedBox(
          height: 14.0,
        ),
        // border
        Container(
          width: 317,
          height: 1,
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9),
          ),
        ),
      ],
    ),
  );
}
