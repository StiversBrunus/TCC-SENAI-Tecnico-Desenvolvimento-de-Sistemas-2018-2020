import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/controllers/category_controller.dart';

class UserBookTab extends StatefulWidget {
  const UserBookTab({Key key}) : super(key: key);

  @override
  _UserBookTabState createState() => _UserBookTabState();
}

class _UserBookTabState extends State<UserBookTab> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 12.0, top: 30.0),
              color: Colors.deepPurple,
              height: 130,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Encontre um fotógrafo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'em poucos minutos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            Wave(
              height: 60,
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 350,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: pageController,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Escolha a data, horário e local do seu evento',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Image.asset('assets/images/book2.png'),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Selecione o tipo de fotografia que deseja',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Image.asset('assets/images/book5.png'),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Com base no que nos passou, vamos filtrar os fotógrafos disponíveis',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Image.asset('assets/images/book6.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            DotsIndicator(
              dotsCount: 3,
              decorator: DotsDecorator(
                activeColor: Colors.deepPurple,
              ),
              position: currentIndex.toDouble(),
            ),
          ],
        ),
      ),
    );
  }
}
