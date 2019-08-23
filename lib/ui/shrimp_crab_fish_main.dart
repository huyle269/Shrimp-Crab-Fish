import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:read_device_info/model/user.dart';
import 'package:read_device_info/service/game_manager.dart';

class SCFMain extends StatefulWidget {
  @override
  _SCFMainState createState() => _SCFMainState();
}

class _SCFMainState extends State<SCFMain> {
  double betButtonSize;
  double historyImageSize;
  double screenWidth;
  double screenHeight;
  List<String> history = ["Shrimp", "Crab", "Fish"];
  String currentUserString = '';
  String betAmountString = '';

  double userButtonRadius = 20.0;
  double userButtonHeight = 45.0;
  // List<User> userList = new List<User>();
  GameManager gameManager = new GameManager();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  getScreenSize() async {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  setCurrentUser(String user) {
    currentUserString = user;
  }

  setBetAmount(double money) {
    double amount = double.parse(betAmountString) + money;
    betAmountString = amount.toString();
  }

  @override
  Widget build(BuildContext context) {
    getScreenSize();
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: moneyBar(),
                ),
                Expanded(
                  flex: 5,
                  child: gameBoard(),
                ),
                Expanded(
                  flex: 1,
                  child: userbar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget moneyBar() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          moneyButton('1000'),
          moneyButton('2000'),
          moneyButton('5000'),
          moneyButton('10000'),
          moneyButton('20000'),
          moneyButton('50000'),
          moneyButton('100000'),
          moneyButton('200000'),
          moneyButton('500000'),
        ],
      ),
    );
  }

  Widget moneyButton(String value) {
    return Container(
      margin: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/scf/$value.jpg'), fit: BoxFit.contain),
      ),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width / 10,
        height: MediaQuery.of(context).size.height / 12,
        child: FlatButton(
          child: null,
          onPressed: () {
            print('Bid $value VND');
          },
        ),
      ),
    );
  }

  Widget gameBoard() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: betBoard(),
          ),
          Expanded(
            flex: 1,
            child: actionBoard(),
          ),
        ],
      ),
    );
  }

  Widget betBoard() {
    double betBoardWidth = screenWidth * 2 / 3;
    betButtonSize = betBoardWidth / 3.5;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              betButton('Deer'),
              betButton('Gourd'),
              betButton('Rooster'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              betButton('Fish'),
              betButton('Crab'),
              betButton('Shrimp'),
            ],
          ),
        ],
      ),
    );
  }

  Widget betButton(String button) {
    return Container(
      width: betButtonSize,
      height: betButtonSize,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/scf/$button.jpg'), fit: BoxFit.fill),
      ),
      child: FlatButton(
        child: null,
        onPressed: () {
          print('Clicked $button');
        },
      ),
    );
  }

  Widget actionBoard() {
    double actionBoardWidth = screenWidth / 3;
    historyImageSize = actionBoardWidth / 4;
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: lastRound(),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      currentUser(),
                      betAmount(),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: playButton(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget lastRound() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          historyImage(history[0]),
          historyImage(history[1]),
          historyImage(history[2]),
        ],
      ),
    );
  }

  Widget currentUser() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.account_circle),
          Text(
            ': $currentUserString',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }

  Widget betAmount() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.attach_money),
          Text(
            ': $betAmountString',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }

  Widget historyImage(String image) {
    return Container(
      // margin: const EdgeInsets.all(5.0),
      width: historyImageSize,
      height: historyImageSize,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/scf/$image.jpg'), fit: BoxFit.fill),
      ),
    );
  }

  Widget playButton() {
    return Container(
      child: RawMaterialButton(
        child: Icon(
          Icons.repeat,
          color: Colors.white,
          size: 75.0,
        ),
        shape: CircleBorder(),
        elevation: 2.0,
        padding: const EdgeInsets.all(20.0),
        fillColor: Colors.grey,
        onPressed: () {
          print('Spin');
        },
      ),
    );
  }

  Widget userbar() {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: gameManager.userList.length,
              itemBuilder: (context, index) {
                return Container(
                  width: screenWidth / 6,
                  child: Card(
                    color: gameManager.userList[index].name == currentUserString
                        ? Colors.white
                        : Colors.grey,
                    child: FlatButton(
                      child: Text(
                        '${gameManager.userList[index].name}',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        setState(() {
                          currentUserString = gameManager.userList[index].name;
                          gameManager.currentUser = gameManager.userList[index];
                          print(gameManager.currentUser.name);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
            child: RaisedButton(
              child: Icon(Icons.add),
              onPressed: () => addUserDialog(context),
            ),
          ),
        ],
      ),
    );
  }

  TextEditingController addUserTextFieldController = TextEditingController();
  addUserDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (contxt) {
        return AlertDialog(
          title: Text('Add New Player'),
          content: TextField(
            controller: addUserTextFieldController,
            decoration: InputDecoration(hintText: 'Enter name'),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  gameManager.userList
                      .add(User(addUserTextFieldController.text));
                });
                addUserTextFieldController.clear();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
