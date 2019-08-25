import 'dart:math';

import 'package:read_device_info/model/bet.dart';
import 'package:read_device_info/model/user.dart';

class GameManager {
  List<User> userList = new List<User>();
  User currentUser;
  Gates currentGate = Gates.None;
  List<Gates> lastRound = new List<Gates>();

  void addUser(String name) {
    List<Bet> betList = new List<Bet>();
    betList.add(new Bet(Gates.Crab, 0));
    betList.add(new Bet(Gates.Deer, 0));
    betList.add(new Bet(Gates.Fish, 0));
    betList.add(new Bet(Gates.Gourd, 0));
    betList.add(new Bet(Gates.Rooster, 0));
    betList.add(new Bet(Gates.Shrimp, 0));
    User newUser = new User(name, 0, betList);
    userList.add(newUser);
  }

  void addBet(int money) {
    int totalBet = 0;
    for (var item in currentUser.betList) {
      if (item.gate == currentGate) {
        item.money += money;
      }
      totalBet += item.money;
    }
    currentUser.totalBet = totalBet;
  }

  void spin() {
    Random random = new Random();
    List<Gates> gates = Gates.values;
    lastRound.clear();
    for (int i = 0; i < 3; i++) {
      int dice = random.nextInt(gates.length - 1);
      lastRound.add(gates[dice]);
    }
    print('Result: ${lastRound[0]} - ${lastRound[1]} - ${lastRound[2]}');
  }
}

enum Gates { Crab, Deer, Fish, Gourd, Rooster, Shrimp, None }
