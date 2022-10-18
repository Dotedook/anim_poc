import 'package:anim_poc/flutter_page.dart';
import 'package:anim_poc/refactored/refactored_page.dart';
import 'package:anim_poc/simple_page.dart';
import 'package:anim_poc/static_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App animado!",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 18,
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
            )),
      ),
      initialRoute: InitialPage.routeName,
      routes: {
        InitialPage.routeName: (context) => const InitialPage(),
        StaticAnimationPage.routeName: (context) => const StaticAnimationPage(),
        SimpleAnimationPage.routeName: (context) => const SimpleAnimationPage(),
        RefactoredAnimationPage.routeName: (context) =>
            const RefactoredAnimationPage(),
        FlutterAnimationPage.routeName: (context) =>
            const FlutterAnimationPage()
      },
    );
  }
}

class InitialPage extends StatelessWidget {
  static String routeName = '/';
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Super app de animação'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(StaticAnimationPage.routeName),
                  child: const Text('Animação Básica'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(SimpleAnimationPage.routeName),
                  child: const Text('Animação Simples'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(RefactoredAnimationPage.routeName),
                  child: const Text('Animação Refatorada'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(FlutterAnimationPage.routeName),
                  child: const Text('Animações Nativas'),
                )
              ]),
        ));
  }
}
