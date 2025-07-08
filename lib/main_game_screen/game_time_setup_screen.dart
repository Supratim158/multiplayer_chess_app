import 'package:chess_app/helper/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../proviers/game_providers.dart';

class GameTimeSetupScreen extends StatefulWidget {
  const GameTimeSetupScreen({super.key});

  @override
  State<GameTimeSetupScreen> createState() => _GameTimeSetupScreenState();
}

class _GameTimeSetupScreenState extends State<GameTimeSetupScreen> {
  @override
  Widget build(BuildContext context) {
    final gameProvider = context.read<GameProvider>();
    print("${gameProvider.vsComputer}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff79DBED),
        title: const Text("Setup Game Time "),
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              childAspectRatio: 1.5,
            ),
            itemCount: gameTimes.length,
            itemBuilder: (context, index){
              final String lable = gameTimes[index].split(' ')[0];
              final String time = gameTimes[index].split(' ')[1];

              return buildGameType(
                  label: lable,
                  gameTime: time,
                  onTap: (){
                    print('${gameTimes[index]}');
                  });
            }
        ),
      ),
    );
  }
}
