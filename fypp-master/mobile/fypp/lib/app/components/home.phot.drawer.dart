import 'package:flutter/material.dart';
import 'package:fypp/app/components/drawer.tile.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/model/photographer.dart';

class HomePhotDrawer extends StatelessWidget {
  final Photographer phot;
  final PageController pageController;
  HomePhotDrawer({Key key, this.pageController, this.phot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            height: 200,
            color: Colors.deepPurple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: phot.profilePic != null ? Image.network(phot.profilePic)
                        : Image.asset("assets/images/blank-pic.png")
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          phot.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          phot.email,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'ver perfil >',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Wave(
            height: 60,
          ),
          DrawerTile(
            controller: pageController,
            icon: Icons.home,
            text: 'Home',
            page: 0,
          ),
          DrawerTile(
            controller: pageController,
            icon: Icons.book,
            text: 'Meus portfólios',
            page: 1,
          ),
          DrawerTile(
            controller: pageController,
            icon: Icons.favorite,
            text: 'Minhas avaliações',
            page: 2,
          ),
          DrawerTile(
            controller: pageController,
            icon: Icons.settings,
            text: 'Configurações',
            page: 3,
          ),
          DrawerTile(
            controller: pageController,
            icon: Icons.exit_to_app,
            text: 'Sair',
            page: 4,
          ),
        ],
      ),
    );
  }
}
