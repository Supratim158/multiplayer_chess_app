import 'package:flutter/material.dart';

Widget buildGameType({required String label, String? gameTime, IconData? icon, required Function() onTap}){
  return InkWell(
    onTap: onTap,
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null ? Icon(icon): Text(gameTime!),
          SizedBox(height: 10,),
          Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
        ],
      ),
    ),
  );
}


final List<String> gameTimes = [
  'Bullet 1+0',
  'Bullet 2+1',
  'Bullet 3+0',
  'Blitz 3+2',
  'Blitz 5+0',
  'Blitz 5+3',
  'Rapid 10+0',
  'Rapid 10+5',
  'Rapid 15+10',
  'Classical 30+0',
  'Classical 30+20',
  'Custom ',
];