import 'package:flutter/material.dart';

class TelaNavegacao extends StatefulWidget {
  const TelaNavegacao({super.key});

  @override
  State<TelaNavegacao> createState() => _TelaNavegacaoState();
}

class _TelaNavegacaoState extends State<TelaNavegacao>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegação'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 125, 55),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 229, 209), 
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  
                  Navigator.pushNamed(context, '/exercicio1');
                },
                child: const Text('Ir para Exercício 1'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exercicio2');
                },
                child: const Text('Ir para Exercício 2'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/exercicio3');
                },
                child: const Text('Ir para Exercício 3'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
