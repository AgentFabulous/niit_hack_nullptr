import 'package:flutter/material.dart';

final pages = [
  new PageViewModel(
      const Color(0xFFF44336),
      'assets/patient.png',
      'Patient?',
      'Tap on the "Emergency Book" button to book\n a MedRoom, if its urgent and we will take care!',
      'assets/person.png',
      'Emergency Book', (BuildContext context) {
    Navigator.of(context).pushNamed('/0cdf761b');
  }, false),
  new PageViewModel(
      const Color(0xFF03A9F4),
      'assets/home.png',
      'Rooms',
      'All rooms are sorted by hospitality \nrating',
      'assets/key.png',
      'Register Rooms', (BuildContext context) {
    Navigator.of(context).pushNamed('/b013b5d8');
  }, false),
  new PageViewModel(
      const Color(0xFF8BC34A),
      'assets/hospital.png',
      'Hospitals',
      'We carefully verify all hospitals before \nadding them into the app',
      'assets/wallet.png',
      'Register Hospital', (BuildContext context) {
    Navigator.of(context).pushNamed('/e74d74cb');
  }, true),
];

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentVisible;

  Page({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    double x8911c24d = MediaQuery.of(context).size.height;
    double x58be20cb = MediaQuery.of(context).size.width;

    return new Container(
        width: double.maxFinite,
        color: viewModel.color,
        child: new Opacity(
          opacity: percentVisible,
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 50.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(bottom: 25.0),
                    child: new ImageIcon(new AssetImage(viewModel.heroAssetPath), size: 175.0, color: Colors.white),


                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: new Text(
                      viewModel.title,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'FlamanteRoma',
                        fontSize: 34.0,
                      ),
                    ),
                  ),
                ),
                new Transform(
                  transform: new Matrix4.translationValues(
                      0.0, 30.0 * (1.0 - percentVisible), 0.0),
                  child: new Padding(
                    padding: new EdgeInsets.only(bottom: 75.0),
                    child: new Text(
                      viewModel.body,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(padding: EdgeInsets.only(left: x58be20cb / 25)),
                    Container(
                      height: 40.0,
                      width: 150.0,
                      child: new RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.white,
                        child: Text(
                          viewModel.buttonText,
                          style: TextStyle(
                            fontFamily: 'FlamanteRoma',
                            color: viewModel.color,
                          ),
                        ),
                        onPressed: () => viewModel.action(context),
                      ),
                    ),
                    viewModel.isNextNeeded
                        ? Padding(
                            padding: EdgeInsets.only(left: x58be20cb / 15))
                        : Container(),
                    viewModel.isNextNeeded
                        ? Container(
                            height: 40.0,
                            width: 150.0,
                            child: new RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                color: Colors.white,
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    fontFamily: 'FlamanteRoma',
                                    color: viewModel.color,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      '/0e6ee790');
                                }),
                          )
                        : Container(),
                  ],
                )
              ]),
        ));
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;
  final String buttonText;
  final Function action;
  final bool isNextNeeded;

  PageViewModel(this.color, this.heroAssetPath, this.title, this.body,
      this.iconAssetPath, this.buttonText, this.action, this.isNextNeeded);
}
