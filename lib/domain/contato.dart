
import '../utils/validation.dart';

class Contato {
  String _name = "";
  String? _telefone;
  String? _email;

  Contato({
    required String name,
    String? telefone,
    String? email}) {
    if (telefone != null){
      this.telefone = telefone;
    }

    if (email != null) {
      this.email = email;
    }

    this.name = name;
  }

  bool _isNameValid(String name) {
    return name.isNotEmpty;
  }

  String get email => _email ?? "";

  set email(String value) {
    if (!isEmailValid(value)) {
      throw const FormatException("O email é inválido");
    }
    _email = value;
  }

  String get telefone => _telefone ?? "";

  set telefone(String value) {
    if (!isTelefoneValid(telefone)) {
      throw const FormatException("O telefone não é válido");
    }
    _telefone = value;
  }

  String get name => _name;

  set name(String value) {
    if (!_isNameValid(value)) {
      throw const FormatException("O nome não é válido");
    }
    _name = value;
  }
}