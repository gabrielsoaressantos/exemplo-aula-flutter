import 'package:contatos/ui/contact_view.dart';
import 'package:contatos/ui/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => HomeView(),
        ContactView.route : (context) => ContactView()
      },
      initialRoute: "/",
    );
  }

}