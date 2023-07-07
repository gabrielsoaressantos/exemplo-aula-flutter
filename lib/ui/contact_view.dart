import 'package:contatos/domain/contato.dart';
import 'package:flutter/material.dart';

class ContactView extends StatefulWidget {
  static const String route = "/contato";

  const ContactView({super.key});

  @override
  State<StatefulWidget> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final _nomeFieldController = TextEditingController();
  final _phoneFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void salvar() {
    if (!formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Se ligue!")));
      return;
    }

    var nome = _nomeFieldController.text;
    var telefone = _phoneFieldController.text;
    var email = _emailFieldController.text;

    try {
      var contato = Contato(
        name: nome,
        telefone: telefone == "" ? null : telefone,
        email: email == "" ? null : email,
      );
    } on FormatException catch (e) {
      buildMensagemDeErro(context) {
        return AlertDialog(
          title: const Text("Não é possível salvar"),
          content: Text(e.message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            )
          ],
        );
      }

      showDialog(context: context, builder: buildMensagemDeErro);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome"),
                  TextFormField(
                    validator: (value) {
                      if (value == "") {
                        return "Digite um nome válido";
                      }
                      return null;
                    },
                    controller: _nomeFieldController,
                  ),
                ],
              ),
            ),
            const Text("Telefone"),
            TextFormField(
              controller: _phoneFieldController,
            ),
            const Text("Email"),
            TextFormField(
              controller: _emailFieldController,
              validator: (value) {
                var regex = RegExp(r"[\w-\.]+@([\w-]+\.)+[\w-]{2,4}");
                if (!regex.hasMatch(value!)){
                  return "O formato correto de email é user@example.com";
                }
              },
            ),
            TextButton(
              child: const Text("Salvar"),
              onPressed: salvar,
            )
          ],
        ),
      ),
    );
  }
}
