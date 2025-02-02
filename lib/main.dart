
import 'package:flutter/material.dart';
import 'package:trabFinal/telas/TelaNavegacao.dart';
import 'telas/exercicio1/validacaoLogin.dart';
import 'telas/exercicio2/TelaInicial.dart';
import 'telas/exercicio3/sharedPreferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const TelaNavegacao(),
        '/exercicio1': (context) => const validacaoLogin(),
        '/exercicio2': (context) => const TelaInicial(),
        '/exercicio3': (context) => const SharedPreferencesScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
