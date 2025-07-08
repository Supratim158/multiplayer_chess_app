
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff79DBED),
        title: const Text("Dashboard"),
      ),

      body: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        children: [
          buildGameType(label: "Vs Computer",icon: Icons.computer_sharp, onTap: (){}),
          buildGameType(label: "Vs Friend",icon: Icons.group, onTap: (){}),
          buildGameType(label: "Settings",icon: Icons.settings, onTap: (){}),
          buildGameType(label: "Profile",icon: Icons.person, onTap: (){}),
        ],

      ),
    );
  }
}

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
