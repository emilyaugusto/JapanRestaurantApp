import 'package:flutter/material.dart';
import 'package:flutter_sushi_app/models/shop.dart';
import 'package:flutter_sushi_app/pages/cart_pages.dart';
import 'package:flutter_sushi_app/pages/intro_page.dart';
import 'package:flutter_sushi_app/pages/menu_page.dart';
import 'package:flutter_sushi_app/pages/splash.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sushi_app/pages/profile.dart';
import 'package:flutter_sushi_app/pages/historico.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sushi App',
      debugShowCheckedModeBanner: false,
      home: const MenuPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/historico': (context) => const HistoricoPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
