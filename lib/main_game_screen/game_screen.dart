import 'dart:math';
import 'package:bishop/bishop.dart' as bishop;
import 'package:flutter/material.dart';
import 'package:square_bishop/square_bishop.dart';
import 'package:squares/squares.dart';
import '../services/assets_manager.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late bishop.Game game;
  late SquaresState state;
  int player = Squares.white;
  bool aiThinking = false;
  bool flipBoard = false;

  @override
  void initState() {
    super.initState();
    game = bishop.Game(variant: bishop.Variant.standard());
    state = game.squaresState(player);
  }

  void _resetGame([bool ss = true]) {
    game = bishop.Game(variant: bishop.Variant.standard());
    state = game.squaresState(player);
    if (ss) setState(() {});
  }

  void _flipBoard() => setState(() => flipBoard = !flipBoard);

  void _onMove(Move move) async {
    bool result = game.makeSquaresMove(move);
    if (result) {
      setState(() => state = game.squaresState(player));
    }

    if (state.state == PlayState.theirTurn && !aiThinking) {
      setState(() => aiThinking = true);
      await Future.delayed(
        Duration(milliseconds: Random().nextInt(4750) + 250),
      );
      game.makeRandomMove();
      setState(() {
        aiThinking = false;
        state = game.squaresState(player);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff79DBED),
        title: const Text("Chess"),
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black,)),

        actions: [
          IconButton(
            onPressed: _resetGame,
            icon: Icon(Icons.start, color: Colors.black,),
          ),
          IconButton(
            onPressed: _flipBoard,
            icon: const Icon(Icons.rotate_left),
          ),
        ],
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AssetsManager.stockfishIcon),
              ),
              title: Text("Magnus"),
              subtitle: Text("Rating: 1500"),
              trailing: Text("05:00"),
            ),
            const SizedBox(height: 7,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BoardController(
                state: flipBoard ? state.board.flipped() : state.board,
                playState: state.state,
                pieceSet: PieceSet.merida(),
                theme: BoardTheme.brown,
                moves: state.moves,
                onMove: _onMove,
                onPremove: _onMove,
                markerTheme: MarkerTheme(
                  empty: MarkerTheme.dot,
                  piece: MarkerTheme.corners(),
                ),
                promotionBehaviour: PromotionBehaviour.autoPremove,
              ),
            ),
            const SizedBox(height: 7,),
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(AssetsManager.userIcon),
              ),
              title: Text("Me"),
              subtitle: Text("Rating: 1500"),
              trailing: Text("05:00"),
            ),

          ],
        ),
      ),
    );
  }
}
