class Validator {
  Validator._();
  // r"\b[a-zA-Z]{3,}\b( \b[a-zA-Z]{3,}\b)+$"


  static String? validateName(String? value) {
    final condition = RegExp(r"\b[A-ZÀ-ÿ]{3,}\b( \b[A-ZÀ-ÿ]{3,}\b)+$");
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }
    if (value != null && !condition.hasMatch(value)){
      return "Nome inválido!";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(r"^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,6}$");
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }
    if (value != null && !condition.hasMatch(value)){
      return "Email inválido!";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    if (value != null && value.isEmpty) {
      return "Esse campo não pode ser vazio!";
    }
    if (value != null && !condition.hasMatch(value)){
      return "Garanta que sua senha tenha pelo menos:\n\n● 8 caracteres;\n● Uma letra maiúscula e uma minúscula;\n● Um número;\n● Um caracter especial.";
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? compareTo) {
    if(value != compareTo){
      return "Ambas as senhas devem que ser iguais!";
    } 
    return null;
  }
}