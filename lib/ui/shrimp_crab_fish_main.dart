import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SCFMain extends StatefulWidget {
  @override
  _SCFMainState createState() => _SCFMainState();
}

class _SCFMainState extends State<SCFMain> {
  double betButtonSize;
  double historyImageSize = 64;
  GlobalKey betBoardKey = GlobalKey();
  List<String> history = ["Shrimp", "Crab", "Fish"];

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

  @override
  Widget build(BuildContext context) {
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
    return Container(
      key: betBoardKey,
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
    final RenderBox containerRenderBox =
        betBoardKey.currentContext.findRenderObject();
    final Size betBoardSize = containerRenderBox.size;
    betButtonSize = betBoardSize.width / 3.5;
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
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 7.5),
                  alignment: Alignment.centerLeft,
                  child: Text('Last Round:'),
                ),
                Divider(
                  color: Colors.transparent,
                  height: 5.0,
                ),
                lastRound(),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: playButton(),
          )
        ],
      ),
    );
  }

  Widget lastRound() {
    return Container(
      color: Colors.blueGrey.withOpacity(0.5),
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
          size: 100.0,
        ),
        shape: CircleBorder(),
        elevation: 2.0,
        padding: const EdgeInsets.all(25.0),
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
      child: userButton('Huy Le'),
    );
  }

  double userButtonRadius = 20.0;
  double userButtonHeight = 30.0;
  Widget userButton(String name) {
    return ButtonTheme(
      height: userButtonHeight,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(userButtonRadius),
                topRight: Radius.circular(userButtonRadius))),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          setState(() {
            userButtonHeight = 30.0;

            double width = MediaQuery.of(context).size.width;
            double height = MediaQuery.of(context).size.height;
            print('width: $width');
            print('height: $height');
          });
        },
      ),
    );
  }
}
