import 'package:flutter/material.dart';
import 'package:fypp/app/screens/login/phot.login.dart';
import 'package:fypp/app/screens/login/user.login.dart';
import 'package:fypp/app/screens/signup/phot/phot.signup.dart';
import 'package:get/get.dart';

class HomeInkwell extends StatelessWidget {
  final ImageProvider inkwellImage;
  final String inkwellTitle;

  HomeInkwell({Key key, this.inkwellImage, this.inkwellTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        inkwellTitle == 'Sou um fotógrafo'
            ? Get.to(PhotLogin())
            : Get.to(UserLogin());
      },
      child: Container(
        height: 200,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.deepPurple.withOpacity(0.4),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
            image: inkwellImage,
          ),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Text(
            inkwellTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
