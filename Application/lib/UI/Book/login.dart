import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';


class SignIn extends StatefulWidget {
  Function action;

  SignIn({@required this.action});

  @override
  _SignInState createState() => _SignInState(action: action);
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  Function action;

  _SignInState({@required this.action});

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future _signIn() async {
    GoogleSignInAccount gSI = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await gSI.authentication;

    _auth.signInWithGoogle(idToken: gSA.idToken, accessToken: gSA.accessToken).then((user){

    action(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    double x8911c24d = MediaQuery.of(context).size.height;
    double x58be20cb = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          color: Color(0xFF4CAF50),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: x8911c24d / 2 - x8911c24d / 3.2),
            ),
            Container(
                height: (animation.value * 120),
                width: (animation.value * 120),
                child: Image(image: AssetImage('assets/logo.png'), fit: BoxFit.cover,)),
            Padding(padding: EdgeInsets.only(top: x8911c24d / 16)),
            Text(
              "MedRooms",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nexa',
                  fontSize: 50.0,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: x8911c24d / 3),
          child: Center(
            child: Container(
              width: x58be20cb / 1.09,
              height: x8911c24d / 12.8,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 30.0,

                onPressed: () => _signIn().catchError((e) => print(e)),
                color: Color(0xFFFF000F),
                child: Row(
                  children: <Widget>[
                    Image(
                        image: AssetImage('assets/whitegooglelogo.png'),
                        height: x8911c24d / 32,
                        width: x58be20cb / 18),
                    Padding(padding: EdgeInsets.all(x58be20cb / 14.4)),
                    Text(
                      'Sign In with Google',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: x58be20cb / 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
