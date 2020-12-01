import 'package:flutter/material.dart';
import 'package:fypp/app/animations/fade.animation.dart';
import 'package:fypp/app/components/home_inkwell.dart';
import 'package:fypp/app/components/wave.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FadeAnimation(
              1,
              Container(
                height: 60,
                color: Colors.deepPurple,
              ),
            ),
            FadeAnimation(
              1,
              Wave(
                height: 70,
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                    1.2,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Bem vindo!',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text('Escolha como você deseja se autenticar')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.5,
                    HomeInkwell(
                      inkwellImage:
                          AssetImage('assets/images/inkwell-cliente.jpg'),
                      inkwellTitle: 'Quero um fotógrafo',
                    ),
                  ),
                  FadeAnimation(
                    1.7,
                    Row(
                      children: <Widget>[
                        Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('ou'),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                  ),
                  FadeAnimation(
                    2,
                    HomeInkwell(
                      inkwellImage: AssetImage('assets/images/1.jpg'),
                      inkwellTitle: 'Sou um fotógrafo',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
