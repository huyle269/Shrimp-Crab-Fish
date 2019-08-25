
import 'package:flutter/material.dart';

class SCFResult extends StatelessWidget {
  String result0;
  String result1;
  String result2;

  SCFResult(this.result0, this.result1, this.result2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Container(
        margin: const EdgeInsets.all(50.0),
        color: Colors.white.withOpacity(0.5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/scf/$result0.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/scf/$result1.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/scf/$result2.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
              ],
            ),            
          ],
        ),
      ),
    );
  }
}
