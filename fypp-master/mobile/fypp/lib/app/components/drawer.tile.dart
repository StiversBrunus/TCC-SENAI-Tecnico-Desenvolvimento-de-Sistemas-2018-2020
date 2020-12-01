import 'package:flutter/material.dart';
import 'package:fypp/app/screens/home/home.screen.dart';
import 'package:get/get.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  const DrawerTile({Key key, this.icon, this.text, this.controller, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (text == 'Sair') {
            Get.off(HomeScreen());
          } else {
            Navigator.of(context).pop();
            controller.animateToPage(
              page,
              duration: Duration(milliseconds: 200),
              curve: Curves.bounceInOut,
            );
          }
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icon(
              //   icon,
              //   size: 24,
              //   color: controller.page.round() == page
              //       ? Colors.deepPurple
              //       : Colors.grey[700],
              // ),
              // SizedBox(
              //   width: 32,
              // ),
              Text(
                text,
                style: text == 'Sair'
                    ? TextStyle(
                        fontSize: 16.0,
                        color: controller.page.round() == page
                            ? Colors.redAccent
                            : Colors.redAccent,
                      )
                    : TextStyle(
                        fontSize: 16.0,
                        color: controller.page.round() == page
                            ? Colors.deepPurple
                            : Colors.grey[700],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
