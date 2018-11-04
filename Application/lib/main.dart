import 'package:flutter/material.dart';
import 'UI/Book/login.dart';
import 'UI/SplashScreen/splash_screen.dart';
import 'package:flutter/services.dart';
import 'UI/Forms/hospital_form.dart';
import 'UI/Forms/emergency_form.dart';
import 'UI/Forms/medroom_form.dart';
import 'UI/Home/HomePage.dart';
import 'UI/EvaluationPage/under_evaluation.dart';
import 'UI/EvaluationPage/Taxi Evaluation.dart';
import 'UI/EvaluationPage/RoomBookEvaluation.dart';
import 'UI/MedHistoryPage.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .whenComplete(() {
    runApp(new MyApp());
  });
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool userSignedIn = false;

  @override
  void initState() {
    super.initState();
    _auth.currentUser().then((user){
      if(user != null)
        userSignedIn = true;
      else
        userSignedIn = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MedRooms',
      theme: new ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.lightGreenAccent,
      ),
      routes: <String, WidgetBuilder>{
        '/0e6ee790': (BuildContext context) => new SignIn(
            action: (BuildContext _context) => Navigator.of(_context)
                .pushNamedAndRemoveUntil(
                '/df206446', (Route<dynamic> route) => false)),
        '/0cdf761b': (BuildContext context) => new SignIn(
            action: (BuildContext _context) => Navigator.of(_context)
                .pushNamedAndRemoveUntil(
                '/2c3feb02', (Route<dynamic> route) => false)),
        '/b013b5d8': (BuildContext context) => new SignIn(
            action: (BuildContext _context) => Navigator.of(_context)
                .pushNamedAndRemoveUntil(
                '/74ff5edc', (Route<dynamic> route) => false)),
        '/e74d74cb': (BuildContext context) => new SignIn(
            action: (BuildContext _context) => Navigator.of(_context)
                .pushNamedAndRemoveUntil(
                '/708e3168', (Route<dynamic> route) => false)),
        '/708e3168': (BuildContext context) => new HospitalForm(),
        '/74ff5edc': (BuildContext context) => new MedRoomForm(),
        '/2c3feb02': (BuildContext context) => new EmergencyForm(),
        '/df206446': (BuildContext context) => new HomePage(),
        '/9e6d789a': (BuildContext context) => new UnderEvalutaion(),
        '/6a062cd3': (BuildContext context) => new TaxiEvalutaion(),
        '/6a062cd4': (BuildContext context) => new RoomBookEvalutaion(),
        '/3c45c9fb': (BuildContext context) => new x4badc55e(),
      },
      home: new x690882f8(),
    );
  }


}
