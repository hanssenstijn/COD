import 'package:flutter/material.dart';

import 'package:ajax/Player_route.dart';

void main() {
  runApp(CodApp());
}

class CodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COD App',
      home: PlayerRoute(),
        );
  }
}