import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  String displayName;
  String displayPhoto;
  String emailId;

  Future<FirebaseUser> _getUserData() async {
    user = await _auth.currentUser();
    return user;
  }

  void loadMedHistory() {
    Navigator.of(context).pushNamed('/3c45c9fb');
  }

  void _signOut() async {
    _auth.signOut().whenComplete(() {
      googleSignIn.signOut();
    });
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/0e6ee790', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    super.initState();
    _getUserData().then((user) {
      setState(() {
        displayName = user.displayName;
        displayPhoto = user.photoUrl;
        emailId = user.email;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double x8911c24d = MediaQuery.of(context).size.height;
    double x58be20cb = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Image(
          image: AssetImage(
            'assets/Room1.jpg',
          ),
          colorBlendMode: BlendMode.darken,
          color: Colors.black54,
        ),
        Padding(
          padding: EdgeInsets.only(top: x8911c24d / 5, left: x58be20cb / 12),
          child: Container(
            height: x8911c24d / 2.8,
            width: x58be20cb / 1.2,
            child: Card(
              elevation: 10.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: x8911c24d / 7, left: x58be20cb / 2.6),
          child: ClipOval(
            child: Container(
              height: x8911c24d / 6.9565,
              width: x58be20cb / 3.613,
              child: _loadImage(),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: x8911c24d / 3.2, left: x58be20cb / 3.5),
          child: Column(
            children: <Widget>[
              displayName == null
                  ? CircularProgressIndicator()
                  : Text(
                      displayName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
              Padding(padding: EdgeInsets.only(top: x8911c24d / 70)),
              emailId == null
                  ? CircularProgressIndicator()
                  : Text(
                      "Email: " + emailId,
                      style: TextStyle(fontSize: 14.0),
                    ),
              Padding(
                padding: EdgeInsets.only(top: x8911c24d / 125),
                child: Text(
                  'Aadhar: ' + '499118665246',
                  style: TextStyle(
                      fontSize: 14.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding:
          EdgeInsets.only(top: x8911c24d / 2.45, left: x58be20cb / 5.5),
          child: Row(
            children: <Widget>[
              ImageIcon(
                new AssetImage('assets/hospital.png'),
                size: (x8911c24d * x58be20cb) / 4000,
                color: Colors.black45,
              ),
              Padding(
                padding: EdgeInsets.only(left: x58be20cb / 20),
              ),
              Text(
                'MedRooms',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'Flamante',
                    color: Colors.black45),
              )
            ],
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: x8911c24d / 1.65, left: x58be20cb / 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: x8911c24d/15,
                    width: x58be20cb/2.5,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.green[400],
                      onPressed: () => loadMedHistory(),
                      child: Text(
                        'Medical History',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nexa',
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: x58be20cb/10),),
                  Container(
                    height: x8911c24d/15,
                    width: x58be20cb/2.5,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.green[400],
                      onPressed: () {
                        Navigator.of(context).pushNamed('/74ff5edc');
                      },
                      child: Text(
                        'Register Rooms',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nexa',
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: x8911c24d/25)),
              Row(
                children: <Widget>[
                  Container(
                    height: x8911c24d/15,
                    width: x58be20cb/2.5,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.green[400],
                      onPressed: () {
                        Navigator.of(context).pushNamed('/708e3168');
                      },
                      child: Text(
                        'Register Hospital',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nexa',
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: x58be20cb/10),),
                  Container(
                    height: x8911c24d/15,
                    width: x58be20cb/2.5,
                    child: RaisedButton(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.green[400],
                      onPressed: () {
                        _signOut();
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nexa',
                            fontSize: 14.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _loadImage() {
    Image image;
    try {
      image = Image.network(
        displayPhoto,
        fit: BoxFit.cover,
      );
      return image;
    } catch (e) {
      print(e);
    }
    return CircularProgressIndicator();
  }
}
