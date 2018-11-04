import 'package:flutter/material.dart';
import '../Generic/History.dart';

List<Widget> x31fab221(List<xc6dd5964> lh) {
  List<Widget> widgetList = new List<Widget>();
  for (xc6dd5964 h in lh)
    widgetList.add(new xb9c6f8cc(h));
  return widgetList;
}

class x4badc55e extends StatefulWidget {
  @override
  _xac0c2dc5 createState() => _xac0c2dc5();
}

class _xac0c2dc5 extends State<x4badc55e> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Medical History"), centerTitle: true),
      body: new SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: x31fab221(testHist)
          ),
        ),
      ),
    );
  }
}

class xb9c6f8cc extends StatelessWidget {

  xc6dd5964 x530b3334;
  xb9c6f8cc(this.x530b3334);



  String xd0949da0(List<String> s) {
    String ret = "" ;
    for (int i=0;i<s.length;i++) {
      ret += (i==(s.length-1))?s[i]:(s[i] + ", ");
    }
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            new Text(x530b3334.xfab8ec42.x09272b73, style: new TextStyle(fontSize: 30.0)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Text("Diseases Treated: "),
                      new Text(xd0949da0(x530b3334.xfab8ec42.xb9eac2b3)),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      new Text("Medicines Prescribed: "),
                      new Text(xd0949da0(x530b3334.xfab8ec42.x5f5e7923)),
                    ],
                  )
                ],
              ),
            )

          ],
        ),
      )
    );
  }


}
