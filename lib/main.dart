
import 'package:chess_app/proviers/game_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_game_screen/home_sceen.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => GameProvider()),],
          child: const MyApp()
      ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chess',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
