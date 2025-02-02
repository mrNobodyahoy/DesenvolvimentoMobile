import 'package:flutter/material.dart';

import '../TelaNavegacao.dart';

class validacaoLogin extends StatefulWidget {
  const validacaoLogin({super.key});

  @override
  State<validacaoLogin> createState() => _validacaoLoginState();
}

class _validacaoLoginState extends State<validacaoLogin> {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Exercicio 1"),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(237, 167, 87, 0.878)),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TelaNavegacao()));
                },
                child: const Text('Voltar para a Tela de Navegação'),
              ),
              const SizedBox(
                height: 105,
              ),
              TextFormField(
                controller: controllerNome,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Digite seu nome',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Digite seu e-mail',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          String nome = controllerNome.text.trim();
                          String email = controllerEmail.text.trim();

                          bool nomeValido = nome.split(' ').length >= 2;
                          bool emailValido =
                              RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(email);

                          if (controllerNome.text.isEmpty ||
                              controllerEmail.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Por favor, preencha todos os campos.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else if (!nomeValido) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Por favor, preencha nome e sobrenome.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else if (!emailValido) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Por favor, preencha corretamente o email.'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Bem-vindo(a), $nome!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            print('Formulário enviado com sucesso!');
                            print('Nome: ${controllerNome.text}');
                            print('Email: ${controllerEmail.text}');
                          }
                        });

                        print("");
                      },
                      child: const Text('Enviar')))
            ])));
  }
}
