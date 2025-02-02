import 'package:shared_preferences/shared_preferences.dart';

const nomeKey = "nomeKey";
const idadeKey = "idadeKey";

class LocalDate {
  static salvarString(String nome, String idade) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    print("--------------------------");
    print("Nome: $nome, Idade: $idade");  
    shared.setString(nomeKey, nome);
    shared.setString(idadeKey, idade);
  }

  static Future<String> retornaNome() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(nomeKey) ?? 'Vazio';
  }

  static Future<String> retornaIdade() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    return shared.getString(idadeKey) ?? 'Vazio';
  }
}
