import 'package:flutter/widgets.dart';

Widget dashBoardComponents({IconData? iconData,String? text,String? count}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(iconData,
      size: 25,
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text("$text $count",
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),
        ),
      ),
    ],
  );
}