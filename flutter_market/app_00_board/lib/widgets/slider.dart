import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

final List<Map> scheduleList = [
  {
    'title': '3일 5시에 같이 산책할 분 손!',
    'month': '3',
    'date': '2',
    'time': '17',
    'member': '3',
    'currentMember': '1',
    'state': true,
  },
  {
    'title': '3일 7시에 같이 !',
    'month': '3',
    'date': '2',
    'time': '19',
    'member': '3',
    'currentMember': '2',
    'state': false,
  },
];

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  // 개별 모임 상태
  final List<Widget> sliders = scheduleList
      .map(
        (item) => Stack(children: [
          Padding(
            padding: EdgeInsets.only(top: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 21,
                ),
                Text(
                  '${item["title"]}',
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
                    Text('${item["month"]}월 ${item["date"]}일'),
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
                    Text('${item["time"]}'),
                    Text(':00'),
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
                    Text('${item["currentMember"]}'),
                    Text('/'),
                    Text('${item["member"]}'),
                    Text('명'),
                    SizedBox(
                      width: 22,
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // 모집상태
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
                  SizedBox(
                    width: 14,
                  ),
                ],
              ),
            ),
          ),
        ]),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              items: sliders,
              carouselController: _controller,
              options: CarouselOptions(
                enlargeFactor: 1,
                padEnds: false,
                enlargeCenterPage: false,
                viewportFraction: 1,
                aspectRatio: MediaQuery.of(context).size.width / 170,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _current = index;
                    },
                  );
                },
              ),
            ),
          ),
          Row(
            // indic
            mainAxisAlignment: MainAxisAlignment.center,
            children: scheduleList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => {
                  _controller.animateToPage(entry.key),
                  debugPrint(entry.key.toString()),
                },
                child: Container(
                  width: 6.0,
                  height: 6.0,
                  margin: EdgeInsets.symmetric(vertical: 21.0, horizontal: 6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                  color: Colors.amber,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// Widget scheduleCont() {
//   return Row(
//     children: [
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '3일 5시에 같이 산책할 분 손!',
//             style: TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               // 일정
//               Icon(
//                 Icons.calendar_today,
//                 size: 10.0,
//               ),
//               SizedBox(
//                 width: 7.5,
//               ),
//               Text('2월 3일'),
//               SizedBox(
//                 width: 22,
//               ),
//               // 시간
//               Icon(
//                 CupertinoIcons.clock,
//                 size: 10.0,
//               ),
//               SizedBox(
//                 width: 7.5,
//               ),
//               Text('오후 17:00'),
//               SizedBox(
//                 width: 22,
//               ),
//               // 인원
//               Icon(
//                 Icons.people_alt_outlined,
//                 size: 10.0,
//               ),
//               SizedBox(
//                 width: 7.5,
//               ),
//               Text('1/3명'),
//               SizedBox(
//                 width: 22,
//               ),
//             ],
//           )
//         ],
//       ),
//       // 모집상태 버튼
//       Container(
//         width: 49,
//         height: 40,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(4.0),
//           color: Color(0xFFE5E5E5),
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           '모집 중',
//           style: TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     ],
//   );
// }
