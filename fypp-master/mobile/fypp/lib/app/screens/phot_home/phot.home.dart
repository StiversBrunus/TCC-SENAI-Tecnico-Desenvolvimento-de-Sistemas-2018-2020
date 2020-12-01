import 'package:flutter/material.dart';
import 'package:fypp/app/components/home.phot.drawer.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/screens/portfolio/addPortfolio.screen.dart';
import 'package:fypp/app/tabs/phot/phot.home.tab.dart';
import 'package:fypp/app/tabs/phot/phot.portfolios.dart';
import 'package:get/get.dart';

class PhotHome extends StatelessWidget {
  final Photographer loggedPhot;
  final pageController = PageController();

  PhotHome({Key key, this.loggedPhot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
            drawer: HomePhotDrawer(
              phot: loggedPhot,
              pageController: pageController,
            ),
            appBar: AppBar(
              title: Text('Fypp'),
              centerTitle: true,
              elevation: 0,
            ),
            body: PhotHomeTab(
              phot: loggedPhot,
            )),
        Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(AddPortfolioScreen(
                  phot: loggedPhot,
                ));
              },
              child: Icon(Icons.add_photo_alternate),
            ),
            drawer: HomePhotDrawer(
              phot: loggedPhot,
              pageController: pageController,
            ),
            appBar: AppBar(
              title: Text('Portfólios'),
              centerTitle: true,
              elevation: 0,
            ),
            body: PhotPortfolios(
              phot: loggedPhot,
            )),
        Scaffold(
          drawer: HomePhotDrawer(
            phot: loggedPhot,
            pageController: pageController,
          ),
          appBar: AppBar(
            title: Text('Avaliações'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Container(
            child: Center(
              child: Text('Você ainda não possui nenhuma avaliação'),
            ),
          ),
        ),
        Scaffold(
          drawer: HomePhotDrawer(
            phot: loggedPhot,
            pageController: pageController,
          ),
          appBar: AppBar(
            title: Text('Home fotógrafo'),
            centerTitle: true,
            elevation: 0,
          ),
          body: Container(
            child: Center(
              child: Text('Home do fotógrafo'),
            ),
          ),
        ),
      ],
    );
  }
}
