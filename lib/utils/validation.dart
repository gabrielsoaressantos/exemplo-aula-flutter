bool isEmailValid (String email) {
  var emailRegex = RegExp(r"[\w-\.]+@([\w-]+\.)+[\w-]{2,4}");
  return emailRegex.hasMatch(email);
}

bool isTelefoneValid(String telefone) {
  var telefoneRegex = RegExp(r"([1-9]{2}) (?:[2-8]|9[1-9])[0-9]{3}-[0-9]{4}");
  return telefoneRegex.hasMatch(telefone);
}
