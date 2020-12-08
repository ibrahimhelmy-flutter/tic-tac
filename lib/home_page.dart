import 'package:flutter/material.dart';
import 'package:tic_tac_toe_game/game_button.dart';

import 'custom_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GameButton> mylist;
  var player1;
  var player2;
  var activeplayer;

  @override
  void initState() {
    super.initState();
    mylist = getAllList();
  }

  List<GameButton> getAllList() {
    player1 = List();
    player2 = List();
    activeplayer = 1;
    return <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
  }

  void playGame(GameButton button) {
    setState(() {
      if (activeplayer == 1) {
        button.text = "x";
        button.bg = Colors.red;
        activeplayer = 2;
        player1.add(button.id);
        print(button.id);
      } else {
        button.text = "o";
        button.bg = Colors.black;
        activeplayer = 1;
        player2.add(button.id);
      }
      button.enable = false;
      checkWinner();
    });
  }

  void checkWinner() {
    print("kkkkk");
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
      print("row 1");
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                "Player 1 Won", "press Rest button to restart", restGame));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                "Player 2 Won", "press Rest button to restart", restGame));
      }
    }
  }

  void restGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      mylist = getAllList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("tic tac toe")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(
            flex: 10,
            child: GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 9.0,
                  mainAxisSpacing: 9.0),
              itemCount: mylist.length,
              itemBuilder: (context, i) => new SizedBox(
                width: 100,
                height: 100,
                child: RaisedButton(
                  padding: EdgeInsets.all(8.0),
                  onPressed:
                      mylist[i].enable ? () => playGame(mylist[i]) : null,
                  child: Text(
                    mylist[i].text,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: mylist[i].bg,
                  disabledColor: mylist[i].bg,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
              child: RaisedButton(
            onPressed: () => restGame(),
            color: Colors.red,
            child: Text("Reset"),
          ))
        ],
      ),
    );
  }
}
