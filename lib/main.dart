import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';
import 'history.dart';
import 'layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

final router = GoRouter(routes: [
  GoRoute(path: '/', builder: (_, __) => const Layout(), routes: [
    GoRoute(path: 'home', builder: (_, __) => const Home()),
    GoRoute(path: 'histories', builder: (_, __) => const History())
  ])
]);
