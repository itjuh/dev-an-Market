import 'package:app_00_board/config/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainItemScreen extends StatefulWidget {
  const MainItemScreen({Key? key}) : super(key: key);

  @override
  State<MainItemScreen> createState() => _MainItemScreenState();
}

class _MainItemScreenState extends State<MainItemScreen> {
  bool isSignupScreen = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      // item widget
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        margin: EdgeInsets.symmetric(
          vertical: 14.0,
        ),
        width: double.infinity,
        height: 104.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // item Image
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                    borderRadius: BorderRadius.all(
                      Radius.circular(14.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14.0),
                    ),
                    child: Image.asset(
                      '/image.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // padding
                SizedBox(
                  width: 12.0,
                ),
                // item info
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.0),
                  width: 225, // content 192
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
                          Icon(
                            Icons.more_vert,
                            size: 16.0,
                          ),
                        ],
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
                      // keyword
                      Row(
                        children: [
                          Text(
                            '중고상품',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            ' · ',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            '택배거래',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            ' · ',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            '애견용품',
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                      // padding
                      SizedBox(
                        height: 10,
                      ),
                      // icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // view icon
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: 12.0,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          // view count
                          Text(
                            '0',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          // comment icon
                          Icon(
                            CupertinoIcons.bubble_left_bubble_right,
                            size: 12.0,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          // comment count
                          Text(
                            '0',
                            style: TextStyle(fontSize: 12.0),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          // heart icon
                          Icon(
                            CupertinoIcons.heart,
                            size: 12.0,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          // heart count
                          Text(
                            '0',
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // border
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
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
