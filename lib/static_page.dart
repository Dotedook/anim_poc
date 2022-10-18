import 'package:flutter/material.dart';

class StaticAnimationPage extends StatefulWidget {
  static String routeName = '/static';
  const StaticAnimationPage({super.key});

  @override
  State<StaticAnimationPage> createState() => _StaticAnimationPageState();
}

class _StaticAnimationPageState extends State<StaticAnimationPage> {
  double angle = 0;

  void _incrementAngle() {
    setState(() {
      angle += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animação Estática'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Quando clicado no botão de FloatButton é adicionado +1 no angulo atual do caminhãozinho',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Transform.rotate(
            angle: angle,
            child: Container(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.fire_truck,
                  color: Colors.pink,
                  size: 100,
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementAngle,
          child: const Icon(
            Icons.add,
          )),
    );
  }
}
