import 'package:flutter/material.dart';
import 'package:trabFinal/telas/exercicio3/localStorage.dart';

import '../TelaNavegacao.dart';

class SharedPreferencesScreen extends StatefulWidget {
  const SharedPreferencesScreen({super.key});

  @override
  State<SharedPreferencesScreen> createState() =>
      _SharedPreferencesScreenState();
}

class _SharedPreferencesScreenState extends State<SharedPreferencesScreen> {
  String nomeAtual = "";
  String idadeAtual = "";
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerIdade = TextEditingController();

  @override
  void initState() {
    super.initState();
    atualizarValor();
  }

  void atualizarValor() async {
    nomeAtual = await LocalDate.retornaNome();
    idadeAtual = await LocalDate.retornaIdade();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Digite os valores"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(200, 131, 96, 0.965),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TelaNavegacao())); 
              },
              child: const Text('Voltar para a Tela de Navegação'),
            ),
            const SizedBox(
                height: 20), // Espaço entre o botão e o campo de texto
            TextFormField(
              controller: controllerNome,
              onChanged: (valor) => nomeAtual = valor,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Digite seu nome',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 20), // Espaço entre os campos de texto
            TextFormField(
              controller: controllerIdade,
              onChanged: (valor) => idadeAtual = valor,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Idade',
                hintText: 'Digite sua idade',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(
                height: 20), // Espaço entre os campos de texto e o botão
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  LocalDate.salvarString(
                      controllerNome.text, controllerIdade.text);
                  setState(() {
                    nomeAtual = controllerNome.text;
                    idadeAtual = controllerIdade.text;
                  });
                },
                child: const Text('Salvar e Enviar'),
              ),
            ),
            const SizedBox(height: 20), // Espaço entre o botão e o texto
            Text(
              'O nome é: $nomeAtual e a idade é: $idadeAtual',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
