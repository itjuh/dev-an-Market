import 'package:app_00_board/config/palette.dart';
import 'package:app_00_board/widgets/banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainProductList extends StatefulWidget {
  const MainProductList({Key? key}) : super(key: key);

  @override
  State<MainProductList> createState() => _MainProductListState();
}

class _MainProductListState extends State<MainProductList> {
  int productSeq = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      // item widget
      body: _buildProduct(),
    );
  }
}

Widget _buildProduct() {
  return ListView(
    children: [
      BannerBuild(),
      _buildProductList(),
      _buildProductList(),
      _buildProductList(),
      _buildProductList(),
      _buildProductList(),
      _buildProductList(),
    ],
  );
}

Widget _buildProductList() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // gap
      SizedBox(
        height: 14.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
              child: Icon(Icons.camera_alt),
              // child: Image.asset(
              //   '/image.jpg',
              //   fit: BoxFit.fill,
              // ),
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
  );
  // );
}
