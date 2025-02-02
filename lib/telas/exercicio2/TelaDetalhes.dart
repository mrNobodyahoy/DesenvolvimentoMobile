import 'package:flutter/material.dart';
import 'package:trabFinal/telas/exercicio2/TelaConfiguracoes.dart';



class telaDetalhes extends StatefulWidget {
  const telaDetalhes({super.key});

  @override
  State<telaDetalhes> createState() => _telaDetalhesState();
}

class _telaDetalhesState extends State<telaDetalhes>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
        centerTitle: true,
            backgroundColor: Color.fromRGBO(237, 167, 87, 0.878)
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Os jogos evoluíram drasticamente com o avanço da tecnologia. Nos anos 1970, os primeiros jogos digitais, como Pong e Space Invaders, marcaram o início de uma nova era. Desde então, a indústria cresceu exponencialmente, adotando gráficos realistas, jogabilidade complexa e histórias envolventes. Hoje, plataformas como PC, consoles e dispositivos móveis oferecem acesso a uma infinidade de experiências, que variam de jogos simples e casuais a RPGs massivos e realistas.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const telaConfiguracoes()));
                  });
                },
                child: const Text("avançar para tela Configurações"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
