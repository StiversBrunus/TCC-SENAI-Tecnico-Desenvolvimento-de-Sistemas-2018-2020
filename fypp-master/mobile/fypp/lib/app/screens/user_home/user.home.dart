import 'package:flutter/material.dart';
import 'package:fypp/app/components/home.user.drawer.dart';
import 'package:fypp/app/model/user.dart';
import 'package:fypp/app/screens/book/event.screen.dart';
import 'package:fypp/app/screens/book/pickcategory.screen.dart';
import 'package:fypp/app/tabs/user.book.tab.dart';
import 'package:fypp/app/tabs/user.favorites.tab.dart';
import 'package:fypp/app/tabs/user.home.tab.dart';
import 'package:fypp/app/tabs/user.settings.tab.dart';
import 'package:get/get.dart';

class UserHome extends StatelessWidget {
  final User loggedUser;
  final pageController = PageController();

  UserHome({Key key, this.loggedUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: HomeUserDrawer(
            user: loggedUser,
            pageController: pageController,
          ),
          appBar: AppBar(
            title: Text('Fypp'),
            centerTitle: true,
            elevation: 0,
          ),
          body: UserHomeTab(),
        ),
        Scaffold(
          bottomSheet: Container(
            margin: EdgeInsets.all(8.0),
            color: Colors.transparent,
            width: double.infinity,
            height: 50,
            child: RaisedButton(
              onPressed: () {
                Get.to(EventScreen());
              },
              color: Colors.deepPurple,
              child: Text(
                'Começar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          drawer: HomeUserDrawer(
            user: loggedUser,
            pageController: pageController,
          ),
          appBar: AppBar(
            title: Text('Fypp'),
            elevation: 0,
            centerTitle: true,
          ),
          body: UserBookTab(),
        ),
        Scaffold(
          drawer: HomeUserDrawer(
            user: loggedUser,
            pageController: pageController,
          ),
          appBar: AppBar(
            title: Text('Fypp'),
            centerTitle: true,
          ),
          body: UserFavoritesTab(),
        ),
        Scaffold(
          drawer: HomeUserDrawer(
            user: loggedUser,
            pageController: pageController,
          ),
          appBar: AppBar(
            title: Text('Fypp'),
            centerTitle: true,
          ),
          body: UserSettingsTab(),
        ),
      ],
    );
  }
}
