import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SCFMain extends StatefulWidget {
  @override
  _SCFMainState createState() => _SCFMainState();
}

class _SCFMainState extends State<SCFMain> {
  double bidButtonWidth = 118;
  double historyImageWidth = 64;
  // Stirng[] history = String[3]{};
  List<String> history = ["Shrimp", "Crab", "Fish"];

  @override
  void initState() {
    super.initState();
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
                  child: Container(
                    color: Colors.green,
                    child: Text('userBar'),
                  ),
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
        crossAxisAlignment: CrossAxisAlignment.end,
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
    print('Log: ${MediaQuery.of(context).size.width / 10}');
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/scf/$value.jpg'), fit: BoxFit.fitWidth),
      ),
      child: ButtonTheme(
        minWidth: MediaQuery.of(context).size.width / 10,
        child: FlatButton(
          // child: Text(value),
          // child: Image.asset(
          //   'assets/scf/$value.jpg',
          //   width: 40.0,
          //   // height: 32.0,
          // ),
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
            child: bidBoard(),
          ),
          Expanded(
            flex: 1,
            child: actionBoard(),
          ),
        ],
      ),
    );
  }

  Widget bidBoard() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              bidButton('Deer'),
              bidButton('Gourd'),
              bidButton('Rooster'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              bidButton('Fish'),
              bidButton('Crab'),
              bidButton('Shrimp'),
            ],
          ),
        ],
      ),
    );
  }

  Widget bidButton(String button) {
    return FlatButton(
      child: Image.asset(
        'assets/scf/$button.jpg',
        width: bidButtonWidth,
        fit: BoxFit.fitWidth,
      ),
      onPressed: () {
        print('Clicked $button');
      },
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
                  alignment: Alignment.centerLeft,
                  child: Text('Last Round:'),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            'assets/scf/${history[0]}.jpg',
            width: historyImageWidth,
            fit: BoxFit.fitWidth,
          ),
          Image.asset(
            'assets/scf/${history[1]}.jpg',
            width: historyImageWidth,
            fit: BoxFit.fitWidth,
          ),
          Image.asset(
            'assets/scf/${history[2]}.jpg',
            width: historyImageWidth,
            fit: BoxFit.fitWidth,
          ),
        ],
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
        padding: const EdgeInsets.all(15.0),
        fillColor: Colors.grey,
        onPressed: () {
          print('Spin');
        },
      ),
    );
  }

  Widget userbar() {}
}
