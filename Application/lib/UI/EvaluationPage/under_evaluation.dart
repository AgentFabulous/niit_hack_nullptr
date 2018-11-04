import 'package:flutter/material.dart';

class UnderEvalutaion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double x58be20cb = MediaQuery.of(context).size.width;
    double x8911c24d = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              height: x8911c24d / 6.4,
              width: x58be20cb / 3.6,
              child: Image(
                image: AssetImage('assets/tick.png'),
                fit: BoxFit.cover,
              )),
          Padding(padding: EdgeInsets.only(top: x8911c24d/20)),
          Padding(
            padding: EdgeInsets.only(left: x58be20cb/20),
            child: Text(
              'Your Application is Under Evaluation.',
              style: TextStyle(color: Colors.green, fontFamily: 'Flamante', fontSize: 18.0),
            ),
          )
        ],
      ),
    );
  }
}
