import 'package:flutter_udemy_clone_project/Services/Authentication.dart';
import 'package:flutter/material.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("My List"),
        backgroundColor: Colors.black,
      ),
      body: Column(),
    );
  }
}
