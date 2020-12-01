import 'package:flutter/material.dart';
import 'package:fypp/app/components/wave.dart';

class AddBundleScreen extends StatefulWidget {
  AddBundleScreen({Key key}) : super(key: key);

  @override
  _AddBundleScreenState createState() => _AddBundleScreenState();
}

class _AddBundleScreenState extends State<AddBundleScreen> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pacote'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              height: 180,
              color: Colors.deepPurple,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'O pacote deve conter uma breve descrição do que será oferecido por você',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'e é claro, quanto você cobra por esses serviços :)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
            Wave(
              height: 60,
            ),
            Container(
              height: 150,
              padding: EdgeInsets.all(8.0),
              child: PageView(
                controller: pageController,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('Dê um nome ao pacote'),
                      TextField(
                        decoration:
                            InputDecoration(labelText: 'Nome do pacote'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 44,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          elevation: 0,
                          onPressed: () {},
                          child: Text('Avançar'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Adicione uma descrição dos serviços'),
                      TextField(
                        decoration: InputDecoration(labelText: 'Descrição'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 44,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          elevation: 0,
                          onPressed: () {},
                          child: Text('Avançar'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text('Adicione o valor a ser cobrado'),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(labelText: 'Valor'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 44,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          elevation: 0,
                          onPressed: () {},
                          child: Text('Finalizar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
