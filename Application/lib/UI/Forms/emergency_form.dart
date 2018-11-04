import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class EmergencyForm extends StatefulWidget {
  @override
  _EmergencyFormState createState() => _EmergencyFormState();
}

class _EmergencyFormState extends State<EmergencyForm> {


  var _currentLocation = <String, double>{};
  var _location = new Location();
  final TextEditingController _controllerLongitude = new TextEditingController();
  final TextEditingController _controllerLatitude = new TextEditingController();
  List<Address> results = [];

    @override
    Widget build(BuildContext context) {
      double x8911c24d = MediaQuery
          .of(context)
          .size
          .height;
      double x58be20cb = MediaQuery
          .of(context)
          .size
          .width;
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
                        title: new Text("Emergency Form"),
                        centerTitle: true,
                        backgroundColor: Colors.red),
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
                      leading: const Icon(Icons.person),
                      title: new TextField(
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          hintText: "Aadhar Number",
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
                        height: x8911c24d / 10,
                        width: x58be20cb / 3.5,
                        child: RaisedButton(
                            color: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0)),
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 18.0,
                                  color: Colors.white,
                                  fontFamily: 'Nexa'),
                            ),
                            onPressed: () =>
                                Navigator.of(context)
                                    .pushNamedAndRemoveUntil('/df206446',
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
