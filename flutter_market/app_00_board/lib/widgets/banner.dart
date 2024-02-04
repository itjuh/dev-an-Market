import 'package:app_00_board/widgets/title.dart';
import 'package:flutter/material.dart';

class BannerBuild extends StatelessWidget {
  const BannerBuild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 21,
          ),
          // 타이틀
          child: textTitle('회원님을 기다리는 모임'),
        ),
        // 컨텐츠
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for(int i = 0; i < 10; i++)
              smallImageBanner(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 21,
          ),
          // 타이틀
          child: textTitle('회원님을 기다리는 모임'),
        ),
        // 큰 이미지 배너
        bigImageBanner(),
      ],
    );
  }
}

Widget smallImageBanner() {
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Column(
      children: [
        Container(
          width: 90.0,
          height: 90.0,
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
        SizedBox(
          height: 7,
        ),
        SizedBox(
          width: 90.0,
          child: Text(
            '런닝 모임 모집합니다~',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget bigImageBanner() {
  return Padding(
    padding: EdgeInsets.all(20.0),
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          height: 92,
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
        Positioned(
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                    left: 22,
                    top: 16,
                    bottom: 16,
                  ),
                  child: SizedBox(
                    width: 186,
                    height: 60,
                    child: Text(
                      '빅배너 광고내용이 들어갑니다.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )),
              Spacer(),
              SizedBox(
                width: 58,
                height: 58,
                child: CircleAvatar(
                  backgroundColor: Colors.black38,
                ),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
