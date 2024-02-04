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
      // item widget
      body: _buildProductList(),
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
                    productKeywordSetting(['중고상품', '택배거래', '애견용품']),
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

