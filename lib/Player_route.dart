import 'package:flutter/material.dart';

import 'package:ajax/Player.dart';
import 'package:ajax/unit.dart';

class PlayerRoute extends StatelessWidget {
  const PlayerRoute();

  static const _playerNames = <String>[
    'Player1',
    'Player2',
    'Player3',
    'Player4',
    'Player5',
    'Player6',
    'Player7',
    'Player8',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pink,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.purple,
    Colors.red,
  ];

  Widget _buildPlayerWidgets(List<Widget> players) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => players[index],
      itemCount: players.length,
    );
  }

  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Game $i',
        damage: i.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final players = <Player>[];

    for (var i = 0; i < _playerNames.length; i++) {
      players.add(Player(
        name: _playerNames[i],
        color: _baseColors[i],
        icon: Icons.military_tech,
        units: _retrieveUnitList(_playerNames[i]),
      ));
    }

    final listView = Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: _buildPlayerWidgets(players),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://cdn.ccn.com/wp-content/uploads/2020/08/COD-Black-Ops-Cold-War.jpg"),
                fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.dstATop),)));

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'COD Players',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
