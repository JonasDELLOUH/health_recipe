import 'package:flutter/material.dart';

Widget appTitle(BuildContext context){
  return
    RichText(
      text: const TextSpan(
        style: TextStyle(fontSize: 22, color: Colors.black87),
        children: <TextSpan>[
          TextSpan(text: 'ddgj', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
          TextSpan(text: 'Health', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
          TextSpan(text: 'Recipes', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue))
        ],
      ),
    );
}


Widget button(BuildContext context, String text) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10),
    width: MediaQuery.of(context).size.width,
    height: 40,
    decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(20))
    ),
    child: Center(child: Text(text,textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 20),)),
  );
}



