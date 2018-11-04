import 'package:flutter/material.dart';

class MedRoomForm extends StatefulWidget {
  @override
  _MedRoomFormState createState() => _MedRoomFormState();
}

class _MedRoomFormState extends State<MedRoomForm> {
  @override
  Widget build(BuildContext context) {
    double x8911c24d = MediaQuery.of(context).size.height;
    double x58be20cb = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Card(
              elevation: 20.0,
              child: new Column(
                children: <Widget>[
                  new AppBar(
                    backgroundColor: Colors.green[400],
                      title: new Text("MedRoom Registration Form"),
                      centerTitle: true),
                  Padding(padding: EdgeInsets.only(top: x8911c24d / 4)),
                  new ListTile(
                    leading: const Icon(Icons.my_location),
                    title: new TextField(
                      decoration: new InputDecoration(
                        hintText: "Neemrana",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.home),
                    title: new TextField(
                      decoration: new InputDecoration(
                        hintText: "Room Name/House Name",
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.person),
                    title: new TextField(
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        hintText: "Owner Aadhar Number",
                      ),
                    ),
                  ),
                  const Divider(
                    height: 1.0,
                  ),
                  new Padding(padding: EdgeInsets.only(top: x8911c24d / 25)),
                  Padding(
                    padding: EdgeInsets.only(left: x58be20cb / 13),
                    child: new Container(
                      height: x8911c24d / 15,
                      width: x58be20cb / 3,
                      child: RaisedButton(
                        color: Colors.green[400],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0)),
                          child: Text(
                            'Submit',
                            style: TextStyle(fontSize: 18.0, color: Colors.white, fontFamily: 'Nexa'),
                          ),
                          onPressed: () => Navigator.of(context)
                              .pushNamedAndRemoveUntil('/9e6d789a',
                                  (Route<dynamic> route) => false)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
