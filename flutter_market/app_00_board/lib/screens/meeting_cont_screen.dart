import 'package:app_00_board/screens/meeting_screen.dart';
import 'package:app_00_board/widgets/content.dart';
import 'package:app_00_board/widgets/slider.dart';
import 'package:app_00_board/widgets/title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeetingContentScreen extends StatefulWidget {
  const MeetingContentScreen({super.key});

  @override
  State<MeetingContentScreen> createState() => _MeetingContentScreenState();
}

class _MeetingContentScreenState extends State<MeetingContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildContAppBar(),
      body: ListView(
        children: [
          // 상단 타이틀
          _buildMeetingTop(),
          // 상단 소개
          _buildMeetingInfo(),
          // 이미지
          BuildMeetingPhoto(),
          // 일정
          BuildSchedule(),
        ],
      ),
    );
  }
}

// 소개
Widget _buildMeetingInfo() {
  return Padding(
    padding: EdgeInsets.only(
      top: 20,
      bottom: 20,
      left: 21,
      right: 45,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 서브타이틀
        _textTitle('소개'),
        SizedBox(
          height: 7,
        ),
        Text(
          '우리 반려견도 혼자 산책하면 심심하니까 친구하나 만들어주면서 함께 산책해보는거 어떠세요?',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    ),
  );
}

// 일정
class BuildSchedule extends StatefulWidget {
  const BuildSchedule({super.key});

  @override
  State<BuildSchedule> createState() => _BuildScheduleState();
}

class _BuildScheduleState extends State<BuildSchedule> {
  int scheduleCount = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 서브타이틀
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 21,
            ),
            _textTitle('일정 $scheduleCount')
          ],
        ),

        Row(
          children: [
            CarouselWithIndicatorDemo(),
          ],
        )
      ],
    );
  }
}

Widget scheduleCont() {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '3일 5시에 같이 산책할 분 손!',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              // 일정
              Icon(
                Icons.calendar_today,
                size: 10.0,
              ),
              SizedBox(
                width: 7.5,
              ),
              Text('2월 3일'),
              SizedBox(
                width: 22,
              ),
              // 시간
              Icon(
                CupertinoIcons.clock,
                size: 10.0,
              ),
              SizedBox(
                width: 7.5,
              ),
              Text('오후 17:00'),
              SizedBox(
                width: 22,
              ),
              // 인원
              Icon(
                Icons.people_alt_outlined,
                size: 10.0,
              ),
              SizedBox(
                width: 7.5,
              ),
              Text('1/3명'),
              SizedBox(
                width: 22,
              ),
            ],
          )
        ],
      ),
      // 모집상태 버튼
      Container(
        width: 49,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Color(0xFFE5E5E5),
        ),
        alignment: Alignment.center,
        child: Text(
          '모집 중',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

// 이미지
class BuildMeetingPhoto extends StatefulWidget {
  const BuildMeetingPhoto({super.key});

  @override
  State<BuildMeetingPhoto> createState() => _BuildMeetingPhotoState();
}

class _BuildMeetingPhotoState extends State<BuildMeetingPhoto> {
  int viewCount = 9;
  int viewPullCount = 18;
  bool fullViewState = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 서브타이틀
        Padding(
          padding: EdgeInsets.all(21.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [_textTitle('우리모임의 추억 $viewPullCount')],
          ),
        ),
        // 그리드
        _buildGridView(viewCount, context),
        // 더보기
        if (!fullViewState)
          Padding(
            padding: EdgeInsets.all(21.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  viewCount = viewPullCount;
                  fullViewState = true;
                });
              },
              child: Container(
                width: 318,
                height: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Color(0xFFE5E5E5),
                ),
                child: Text(
                  '전체보기',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

Widget _buildGridView(int viewCount, BuildContext context) {
  return GridView.builder(
    // 그리드 축소(ListView 맞춰서)
    shrinkWrap: true,
    // 그리드 스크롤 금지
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
    ),
    itemCount: viewCount,
    itemBuilder: (context, index) {
      return Image.network(
        "https://picsum.photos/id/$index/200/200",
        errorBuilder: (context, error, stackTrace) {
          return Text('이미지 로드 실패');
        },
      );
    },
  );
}
// 글

// 가입하기

// 상단 타이틀
Widget _buildMeetingTop() {
  return Stack(
    children: [
      SizedBox(
        height: 261.0,
        width: double.maxFinite,
        child: Image.asset(
          '/cat_img.jpg',
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      Container(
        height: 261.0,
        width: double.infinity,
        color: Color.fromARGB(130, 0, 0, 0),
      ),
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 21.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // upload icon
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.file_upload_outlined,
                    color: Colors.white,
                    size: 1,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                // vert icon
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 80.0,
              left: 21,
              bottom: 25,
            ),
            // title
            child: _buildMeetingTitle(),
          ),
        ],
      ),
    ],
  );
}

// content title
Widget _buildMeetingTitle() {
  List<String> meetingInfo = ['멤버 12', '일정 3', '글 10'];
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
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // padding
                  SizedBox(
                    height: 12,
                  ),
                  // time
                  Row(
                    children: [
                      productKeywordSetting(meetingInfo, Color(0xFFADADAD)),
                    ],
                  ),
                  // padding
                  SizedBox(
                    height: 13,
                  ),
                  // keywordlist
                  meetingKeywordSetting(
                    ['도봉동', '반려견', '산책', '간식'],
                    Color(0xFFADADAD),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _textTitle(txt) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  );
}
