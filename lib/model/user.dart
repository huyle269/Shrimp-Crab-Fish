import 'package:read_device_info/model/bet.dart';

class User {
  final String name;
  int totalBet;
  final List<Bet> betList;
  User(this.name, this.totalBet, this.betList);
}
