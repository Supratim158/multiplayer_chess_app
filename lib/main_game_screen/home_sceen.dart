
import 'package:chess_app/main.dart';
import 'package:chess_app/main_game_screen/about_screen.dart';
import 'package:chess_app/main_game_screen/game_time_setup_screen.dart';
import 'package:chess_app/main_game_screen/settings_screen.dart';
import 'package:chess_app/proviers/game_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helper/helper_methods.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    final gameProvider = context.read<GameProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff79DBED),
        title: const Text("Dashboard"),
      ),

      body: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        children: [
          buildGameType(
              label: "Vs Computer",
              icon: Icons.computer_sharp,
              onTap: (){
                gameProvider.setVsComputer(value: true);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GameTimeSetupScreen()));
              }
          ),
          buildGameType(
              label: "Vs Friend",
              icon: Icons.group,
              onTap: (){
                gameProvider.setVsComputer(value: false);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GameTimeSetupScreen()));
              }
          ),
          buildGameType(
              label: "Settings",
              icon: Icons.settings,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
              }
          ),
          buildGameType(
              label: "Profile",
              icon: Icons.person,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              }
          ),
        ],

      ),
    );
  }
}


