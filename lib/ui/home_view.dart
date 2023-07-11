import 'dart:ffi';

import 'package:contatos/main.dart';
import 'package:contatos/ui/contact_view.dart';
import 'package:flutter/material.dart';

import '../data/contato_dao.dart';
import '../domain/contato.dart';

class HomeView extends StatefulWidget {
  final contatoDAO = ContatoDAO();

  HomeView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Contato> contatos = [];

  void atualizarContatos() {
    setState(() {
      contatos = widget.contatoDAO.buscarTodos();
    });
  }

  void openContactRoute() async {
    await Navigator.pushNamed(context, ContactView.route);
    atualizarContatos();
  }

  ListTile construirItemDaLista(BuildContext context, int i) {
    return ListTile(
      leading: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        height: 40,
        width: 40,
        child: Text(
          contatos[i].name[0],
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
      ),
      title: Text(
        contatos[i].name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    atualizarContatos();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contato"),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: construirItemDaLista,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openContactRoute,
        child: const Icon(Icons.add),
      ),
    );
  }
}
