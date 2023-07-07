import 'dart:ffi';

import 'package:contatos/main.dart';
import 'package:contatos/ui/contact_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void openContactRoute() {
    Navigator.pushNamed(context, ContactView.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contato"),
      ),
      body: ListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: openContactRoute,
        child: const Icon(Icons.add),
      ),
    );
  }
}