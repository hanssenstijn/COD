import 'package:flutter/material.dart';

// @required is defined in the meta.dart package
import 'package:meta/meta.dart';

import 'package:ajax/unit_route.dart';
import 'package:ajax/unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Player extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData icon;
  final List<Unit> units;

  const Player({
    Key key,
    @required this.name,
    @required this.color,
    @required this.icon,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(icon != null),
        assert(units != null),
        super(key: key);

  void _navigateToDamage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: UnitRoute(
            color: color,
            units: units,
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          // We can use either the () => function() or the () { function(); }
          // syntax.
          onTap: () => _navigateToDamage(context),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // There are two ways to denote a list: `[]` and `List()`.
              // Prefer to use the literal syntax, i.e. `[]`, instead of `List()`.
              // You can add the type argument if you'd like, i.e. <Widget>[].
              // See https://www.dartlang.org/guides/language/effective-dart/usage#do-use-collection-literals-when-possible
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    icon,
                    size: 60.0,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: Text(name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow( // bottomLeft
                                offset: Offset(-1.5, -1.5),
                                color: Colors.black
                            ),
                            Shadow( // bottomRight
                                offset: Offset(1.5, -1.5),
                                color: Colors.black
                            ),
                            Shadow( // topRight
                                offset: Offset(1.5, 1.5),
                                color: Colors.black
                            ),
                            Shadow( // topLeft
                                offset: Offset(-1.5, 1.5),
                                color: Colors.black
                            ),
                          ]
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
