import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget appBarComponents({String? userName,String? statusMessage,String? profileUrl}){
  return Container(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(userName!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17
            ),
            ),
            Text(statusMessage!,
            style: const TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 14
            ),
            )
          ],
        ),
        const CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.person_outline_sharp,
          color: Colors.white,
          ),)
      ],
    ),
  );
}