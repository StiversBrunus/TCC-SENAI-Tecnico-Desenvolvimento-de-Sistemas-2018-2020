import 'package:flutter/material.dart';
import 'package:fypp/app/screens/home/home.screen.dart';
import 'package:fypp/app/screens/user_home/user.home.dart';
import 'package:fypp/app/utils/shared.prefs.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPrefs prefs = SharedPrefs();
  String token = '';

  @override
  void initState() { 
    super.initState();
    // prefs.getAndReadToken().then((value) => token = value);
    // if(token == ''){
    //   Get.to(UserHome());
    // }else{
    //   Get.to(HomeScreen());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurpleAccent,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}