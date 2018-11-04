import 'package:flutter/material.dart';
import '../../Room/room.dart';
import '../RoomView.dart';



class Page0 extends StatefulWidget {
  @override
  _Page0State createState() => _Page0State();
}

class _Page0State extends State<Page0> {
  @override
  Widget build(BuildContext context) {
    double x8911c24d = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return CardItemWidget(testRoom[index]);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: (x8911c24d / 42.666)),
          )
        ],
      ),
    );
  }
}

class CardItemWidget extends StatelessWidget {
  x2f0bb292 _x8ed7677a;

  CardItemWidget(this._x8ed7677a);

  @override
  Widget build(BuildContext context) {
    double x58be20cb = MediaQuery.of(context).size.width;
    double x8911c24d = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(
          top: x8911c24d / 42.666,
          left: x58be20cb / 24,
          right: x58be20cb / 24
      ),
      child: new Card(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _x8ed7677a.roomImages != null
                ? new Image.asset(
                    _x8ed7677a.roomImages[0],
                    fit: BoxFit.cover,
                  )
                : new Container(),
            Padding(
              padding: EdgeInsets.only(
                  top: x8911c24d / 40,
                  left: x58be20cb / 22.5,
                  bottom: x8911c24d / 80,
                  right: x58be20cb / 22.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Flexible(
                    child: new Text(
                      _x8ed7677a.roomName,
                      style: new TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: x58be20cb / 45),
                        child: new Icon(Icons.star),
                      ),
                      new Text(_x8ed7677a.rating.toString()),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: x58be20cb / 22.5),
              child: new Text(
                "Distance: 2.0 kms",
                style: new TextStyle(fontSize: 18.0),
              ),
            ),
            new ButtonBar(
              children: <Widget>[
                new FlatButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new x293a8a66(_x8ed7677a))),
                  child: new Text("View details",
                      style: new TextStyle(color: Colors.green)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
