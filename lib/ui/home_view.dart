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
  List<Contato> itensSelecionados = [];

  void atualizarContatos() {
    setState(() {
      contatos = widget.contatoDAO.buscarTodos();
    });
  }

  void openContactRoute() async {
    await Navigator.pushNamed(context, ContactView.route);
    atualizarContatos();
  }

  void selecionarItem(Contato contato) {
    setState(() {
      if (itensSelecionados.contains(contato)) {
        itensSelecionados.remove(contato);
      } else {
        itensSelecionados.add(contato);
      }
    });
  }

  ListTile construirItemDaLista(BuildContext context, int i) {
    return ListTile(
      onLongPress: () {
        selecionarItem(contatos[i]);
      },
      leading: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          height: 40,
          width: 40,
          child: buildRoundContainerChild(contatos[i])),
      title: Text(
        contatos[i].name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      selected: itensSelecionados.contains(contatos[i]),
      selectedColor: Colors.black,
    );
  }

  Widget buildRoundContainerChild(Contato contato) {
    var letra = Text(
      contato.name[0].toUpperCase(),
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
    );

    const checkBox = Icon(Icons.check);
    return itensSelecionados.contains(contato) ? checkBox : letra;
  }

  void deletarItensSelecionados() {
    for (var contato in itensSelecionados) {
      widget.contatoDAO.deletar(contato);
      // Assumo que deu tudo certo. nào façam isso em casa
      contatos.remove(contato);
    }

    setState(() {
      itensSelecionados.clear();
    });
  }

  AppBar buildAppBar(BuildContext context) {
    return itensSelecionados.isEmpty
        ? AppBar(
            title: const Text("Contatos"),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          )
        : AppBar(
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                setState(() {
                  itensSelecionados.clear();
                });
              },
            ),
            actions: [
              IconButton(
                  onPressed: deletarItensSelecionados,
                  icon: const Icon(Icons.delete))
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    atualizarContatos();
    return Scaffold(
      appBar: buildAppBar(context),
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
