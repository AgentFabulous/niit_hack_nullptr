import 'package:flutter/material.dart';

class RoomBookEvalutaion extends StatelessWidget {

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
              'Your MedRoom has Successfully been booked.',
              style: TextStyle(color: Colors.green, fontFamily: 'Flamante', fontSize: 14.0),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: x8911c24d/10),),
          Padding(padding: EdgeInsets.only(left: x58be20cb/20),
            child: Container(
              height: x8911c24d/13,
              width: x58be20cb/2.5,
              child: RaisedButton(
                color: Colors.lightGreenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0)
                  ),
                  child: Text('Book a Cab'),
                  onPressed: (){
                    Navigator.of(context).pushNamedAndRemoveUntil('/6a062cd3', ModalRoute.withName('/df206446'));
                  }),
            ),
          )
        ],
      ),
    );
  }
}
