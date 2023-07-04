import 'package:flutter/material.dart';

class ContactView extends StatefulWidget {
  static const String route = "/contato";

  @override
  State<StatefulWidget> createState() => ContactViewState();
}

class ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Nome"),
          TextField(

          ),

        ],
      ),
    );
  }
}
