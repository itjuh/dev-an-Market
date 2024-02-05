import 'package:app_00_board/main.dart';
import 'package:app_00_board/screens/meeting_cont_screen.dart';
import 'package:app_00_board/widgets/content.dart';
import 'package:flutter/material.dart';

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({super.key});

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      // appBar: _buildSubAppBar(context),
      // body: buildMeeting(),
      body: MeetingContentScreen(),
    );
  }
}

@override
AppBar _buildSubAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      '모임',
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    actions: [
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
        width: 14.0,
      ),
    ],
  );
}

Widget buildMeeting() {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 21.0,
      vertical: 14.0,
    ),
    child: ListView(
      children: [
        // 검색창
        meetingKeywordSearch(),
        SizedBox(
          height: 28,
        ),
        // 모임키워드
        _meetingKeywordList(),
        SizedBox(
          height: 41,
        ),
        // 모임 리스트
        for (int i = 0; i < 10; i++) _buildMeeting(),
      ],
    ),
  );
}

// 검색창
Widget meetingKeywordSearch() {
  return Row(
    children: [
      SizedBox(
        width: 12,
      ),
      Icon(
        Icons.search,
        color: Color(0xFF6D7582),
        size: 24.0,
      ),
      SizedBox(
        width: 8,
      ),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '키워드 입력',
            // contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12.0),
            hintStyle: TextStyle(
              color: Color(0xFF6D7582),
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    ],
  );
}

// 모임 키워드
Widget _meetingKeywordList() {
  List<String> keywordList = ['전체', '펫', '육아', '자취', '교육'];
  //List<String> keyword
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        for (int i = 0; i < keywordList.length; i++)
          _meetingKeywordUnit(keywordList[i]),
      ],
    ),
  );
}

// 모임 키워드 유닛
Widget _meetingKeywordUnit(String txt) {
  return Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF048AD4),
              width: 2,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
            child: Icon(
              Icons.camera_alt,
              color: Color(0xFF048AD4),
            ),
            // child: Image.asset(
            //   '/image.jpg',
            //   fit: BoxFit.fill,
            // ),
          ),
        ),
        SizedBox(
          height: 6,
        ),
        SizedBox(
          width: 56,
          child: Center(
              child: Text(
            txt,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: Color(0xFF048AD4),
            ),
          )),
        ),
      ],
    ),
  );
}

Widget _buildMeeting() {
  return Column(
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
                        '모임이름',
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
                  // keywordlist
                  meetingKeywordSetting(
                    ['도봉동', '반려견', '산책', '간식'], Color(0xFF606060),
                  ),
                  // padding
                  SizedBox(
                    height: 4,
                  ),
                  // time
                  Row(
                    children: [
                      Text(
                        '30분 전 대화',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color(0xFF606060),
                        ),
                      )
                    ],
                  ),
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
  );
}
