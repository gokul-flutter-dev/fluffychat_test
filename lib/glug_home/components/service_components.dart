import 'package:flutter/cupertino.dart';

Widget serviceComponents({IconData? iconData,String? name}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 1,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Icon(iconData,size: 23,),
      ),
      Text(name!,
      style: const TextStyle(
        fontSize: 12
      ),
      )
      ]
  );
}