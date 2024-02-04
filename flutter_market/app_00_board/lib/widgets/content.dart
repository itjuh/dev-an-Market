import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemImage() {
  return Container(
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
  );
}

Widget productKeywordSetting(List<String> key) {
  return Row(
    children: [
      Text(
        key[0],
        style: TextStyle(
          fontSize: 10.0,
          color: Color(0xFF606060),
        ),
      ),
      Text(
        ' · ',
        style: TextStyle(
          fontSize: 10.0,
          color: Color(0xFF606060),
        ),
      ),
      Text(
        key[1],
        style: TextStyle(
          fontSize: 10.0,
          color: Color(0xFF606060),
        ),
      ),
      Text(
        ' · ',
        style: TextStyle(
          fontSize: 10.0,
          color: Color(0xFF606060),
        ),
      ),
      Text(
        key[2],
        style: TextStyle(
          fontSize: 10.0,
          color: Color(0xFF606060),
        ),
      ),
    ],
  );
}

Widget meetingKeywordSetting(List<String> key) {
  return Row(
    children: [
      Text(
        '#${key[0]}',
        style: TextStyle(
          fontSize: 10.0,
          color: Color(0xFF606060),
        ),
      ),
      SizedBox(
        width: 4.0,
      ),
      Text(
        '#${key[1]}',
        style: TextStyle(
          fontSize: 10.0,
          color: Color(0xFF606060),
        ),
      ),
      SizedBox(
        width: 4.0,
      ),
      Text(
        '#${key[2]}',
        style: TextStyle(
          fontSize: 10.0,
          color: Color(0xFF606060),
        ),
      ),
      SizedBox(
        width: 4.0,
      ),
      Text(
        '#${key[3]}',
        style: TextStyle(
          fontSize: 10.0,
          color: Color(0xFF606060),
        ),
      ),
    ],
  );
}

Widget viewChatPickIcons(List<int> key) {
  return Row(
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
        key[0].toString(),
        style: TextStyle(fontSize: 12.0),
      ),
      SizedBox(
        width: 12,
      ),
      // comment icon
      Icon(
        CupertinoIcons.bubble_left_bubble_right,
        size: 12.0,
      ),
      SizedBox(
        width: 4,
      ),
      // comment count
      Text(
        key[1].toString(),
        style: TextStyle(fontSize: 12.0),
      ),
      SizedBox(
        width: 12,
      ),
      // heart icon
      Icon(
        CupertinoIcons.heart,
        size: 12.0,
      ),
      SizedBox(
        width: 4,
      ),
      // heart count
      Text(
        key[2].toString(),
        style: TextStyle(fontSize: 12.0),
      ),
    ],
  );
}

Widget moreVertIcon() {
  return Icon(
    Icons.more_vert,
    size: 16.0,
  );
}
