import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Room/room.dart';

class x293a8a66 extends StatelessWidget {
  x2f0bb292 _x8ed7677a;

  x293a8a66(this._x8ed7677a);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new x4ba1bbe7(_x8ed7677a),
    );
  }
}

class x4ba1bbe7 extends StatefulWidget {
  x2f0bb292 _x8ed7677a;

  x4ba1bbe7(this._x8ed7677a);

  @override
  _x4ba1bbe7State createState() => _x4ba1bbe7State(_x8ed7677a);
}

enum x3aa321df { normal, pinned, floating, snapping }

class _x4ba1bbe7State extends State<x4ba1bbe7> {

  int count = 0;
  ScrollController _x5fa95a96;

  @override
  void initState() {
    super.initState();
    _x5fa95a96 = new ScrollController();
    _x5fa95a96.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _x5fa95a96.dispose();
    super.dispose();
  }

  x2f0bb292 _x8ed7677a;

  _x4ba1bbe7State(this._x8ed7677a);

  x3aa321df _xf7999a6d = x3aa321df.pinned;

  @override
  Widget build(BuildContext context) {
    double x58be20cb = MediaQuery.of(context).size.width;
    double x8911c24d = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        new CustomScrollView(
          controller: _x5fa95a96,
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: x8911c24d / 2.5,
              pinned: _xf7999a6d == x3aa321df.pinned,
              floating: _xf7999a6d == x3aa321df.floating ||
                  _xf7999a6d == x3aa321df.snapping,
              snap: _xf7999a6d == x3aa321df.snapping,
              flexibleSpace: new FlexibleSpaceBar(
                title: new Text(_x8ed7677a.roomName, style: TextStyle(fontSize: 14.0),),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    _x8ed7677a.roomImages != null
                        ? new Image.asset(
                            _x8ed7677a.roomImages[0],
                            fit: BoxFit.cover,
                            height: x8911c24d / 2.5,
                          )
                        : new Container(),


                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, -0.4),
                          colors: <Color>[Color(0x60000000), Color(0x00000000)],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new SliverList(
              delegate: new SliverChildListDelegate(<Widget>[
                new AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle.dark,
                    child: new Column(

                        children: <Widget>[
                          new DetailFlatButton(
                            icon: Icons.star,
                            content: _x8ed7677a.rating.toString(),
                            action: () {},
                          ),
                          xc8fca5b2(
                              _x8ed7677a.paymentModes, Icons.account_balance_wallet),
                          new DetailFlatButton(
                            icon: Icons.payment,
                            content: _x8ed7677a.xe18b00e0.toString() + "/- per day",
                            action: () {},
                          ),
                          xc8fca5b2(
                              _x8ed7677a.x1d7cfaf0, Icons.hotel),
                          new Divider(),
                          new DetailFlatButton(
                            icon: Icons.location_on,
                            content: _x8ed7677a.address,
                            action: () {},
                          ),
                          xc8fca5b2(
                              _x8ed7677a.xb3880136, Icons.local_hospital),
                          new Divider(),
                          new DetailFlatButton(
                            icon: Icons.person,
                            content: _x8ed7677a.x846b9b11,
                            action: () {},
                          ),
                          new DetailFlatButton(
                            icon: Icons.call,
                            content: _x8ed7677a.x9aa3078b,
                            action: () {},
                          ),
                          new DetailFlatButton(
                            icon: Icons.email,
                            content: _x8ed7677a.xf832f47b,
                            action: () {},
                          ),
                        ])),
              ]),
            ),
          ],
        ),
        _xa64bc48f(x8911c24d),
      ],
    );
  }

  Widget _xa64bc48f(double x8911c24d) {

    final double defaultTopMargin = x8911c24d / 2.5 - x8911c24d / 160;

    final double scaleStart = x8911c24d / 6.67;

    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_x5fa95a96.hasClients) {
      double offset = _x5fa95a96.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {

        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {

        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {

        scale = 0.0;
      }
    }

    return new Positioned(
      top: top,
      right: 16.0,
      child: new Transform(
        transform: new Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: new FloatingActionButton(
          onPressed: () {
                Navigator.of(context).pushNamed('/6a062cd4');
            },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget xc8fca5b2(List<String> _items, IconData icon) {
  List<Widget> ret = new List<Widget>();
  int x = 0;
  for (String str in _items) {
    ret.add(new DetailFlatButton(
        icon: (x == 0) ? icon : null, content: str, action: () {}));
    x++;
  }
  return new Column(
    children: ret,
  );
}

class DetailFlatButton extends StatelessWidget {
  String content;
  IconData icon;

  Function action;

  DetailFlatButton({this.icon, this.content, this.action});

  @override
  Widget build(BuildContext context) {
    double x58be20cb = MediaQuery.of(context).size.width;
    double x8911c24d = MediaQuery.of(context).size.height;

    return FlatButton(
      onPressed: action,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Row(
          children: <Widget>[
            (icon == null)
                ? new Padding(
                    padding: EdgeInsets.only(left: x58be20cb / 13.84),
                  )
                : new Icon(icon),
            Padding(
              padding: EdgeInsets.all(10.0),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(children: [new Text(content)]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
