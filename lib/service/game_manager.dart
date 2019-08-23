import 'package:read_device_info/model/user.dart';

class GameManager {
  List<User> userList = new List<User>();
  User currentUser;
  BetRound betRound = new BetRound(null, null);
}

class BetRound {
  User user;
  List<Bet> betList;
  BetRound(this.user, this.betList);
}

class Bet {
  String gate;
  int money;

  Bet(this.gate, this.money);
}
