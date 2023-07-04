import 'package:contatos/domain/contato.dart';

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