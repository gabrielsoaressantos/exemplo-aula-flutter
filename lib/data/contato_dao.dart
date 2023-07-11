import 'package:contatos/domain/contato.dart';


// TODO: Add real comunication with database
List<Contato> _contatos = [];

class ContatoDAO {
  void criar(Contato contato) {
    _contatos.add(contato);
  }

  List<Contato> buscarTodos() {
    return _contatos;
  }

  void deletar(Contato contato) {
    _contatos.remove(contato);
  }
}