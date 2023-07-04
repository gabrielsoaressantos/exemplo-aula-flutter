
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

  static bool _isEmailValid(String email) {
    var emailRegex = RegExp("^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$");
    return emailRegex.hasMatch(email);
  }

  static bool _isTelefoneValid(String telefone) {
    var telefoneRegex = RegExp("^\([1-9]{2}\) (?:[2-8]|9[1-9])[0-9]{3}\-[0-9]{4}\$");
    return telefoneRegex.hasMatch(telefone);
  }

  String get email => _email ?? "";

  set email(String value) {
    if (!_isEmailValid(value)) {
      throw const FormatException("O email é inválido");
    }
    _email = value;
  }

  String get telefone => _telefone ?? "";

  set telefone(String value) {
    if (!_isTelefoneValid(telefone)) {
      throw const FormatException("O telefone não é válido");
    }
    _telefone = value;
  }

  String get name => _name;

  set name(String value) {
    if (!_isNameValid(name)) {
      throw const FormatException("O nome não é válido");
    }
    _name = value;
  }
}