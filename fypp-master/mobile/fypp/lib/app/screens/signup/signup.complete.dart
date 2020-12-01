import 'package:flutter/material.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/user.dart';
import 'package:fypp/app/screens/phot_home/phot.home.dart';
import 'package:fypp/app/screens/user_home/user.home.dart';
import 'package:get/get.dart';

class SignUpComplete extends StatelessWidget {
  final User lastUser;
  final Photographer lastPhotographer;
  SignUpComplete({Key key, this.lastUser, this.lastPhotographer})
      : super(key: key);

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
                    'Obrigado!',
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
                        Text('Conta criada com sucesso')
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
                        if(lastPhotographer != null){
                          Get.off(PhotHome(loggedPhot: lastPhotographer,));
                        }else{
                          Get.off(UserHome(loggedUser: lastUser,));
                        }
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
