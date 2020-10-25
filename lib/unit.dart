import 'package:meta/meta.dart';

class Unit {
  final String name;
  final String damage;

  const Unit({
    @required this.name,
    @required this.damage,
  })  : assert(name != null),
        assert(damage != null);

  Unit.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['damage'] != null),
        name = jsonMap['name'],
        damage = jsonMap['damage'].toDouble();
}
