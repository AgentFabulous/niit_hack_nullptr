import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {



  @override
  Widget build(BuildContext context) {

    double x8911c24d = MediaQuery.of(context).size.height;
    return Container(

      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index){
            return NotificationItem();
          }),
    );
  }
}

class NotificationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double x58be20cb = MediaQuery.of(context).size.width;
    double x8911c24d = MediaQuery.of(context).size.height;
    return Container(
        height: 100.0,
      child: Card(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: (){},
              color: Colors.green,
            ),
            Padding(padding: EdgeInsets.only(left: x58be20cb/20)),
            Text('Your MedRoom has Successfully\n been Booked!',
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'Nexa',
              ),),
          ],
        ),
      ),
    );
  }
}

