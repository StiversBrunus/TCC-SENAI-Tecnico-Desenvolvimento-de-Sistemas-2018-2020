import 'package:flutter/material.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/screens/phot_home/phot.home.dart';
import 'package:fypp/app/screens/portfolio/portfolio.screen.dart';
import 'package:fypp/app/tabs/phot/phot.home.tab.dart';
import 'package:fypp/app/tabs/phot/phot.portfolios.dart';
import 'package:get/get.dart';

class PortfolioCreatedScreen extends StatelessWidget {
  final Photographer phot;
  const PortfolioCreatedScreen({Key key, this.phot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: height * 0.3,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Pronto!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  )
                ],
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Wave(
                height: 100,
              ),
            ),
            Positioned(
              top: 180,
              left: 20,
              right: 20,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20)
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.deepPurple,
                            size: 60,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Portfólio adicionado com sucesso')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 44,
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      elevation: 0,
                      onPressed: () {
                        Get.off(PhotHomeTab(phot: phot,));
                      },
                      child: Text('Continuar'),
                    ),
                  ),
                  SizedBox(
                    height: 120,
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
