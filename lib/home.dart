import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
               onPressed: (){

               },
              icon: Icon(Icons.backspace),
            ),
          ],
        ),
        body: Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
