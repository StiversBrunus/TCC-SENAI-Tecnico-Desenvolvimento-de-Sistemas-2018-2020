import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/screens/phot_home/phot.home.dart';
import 'package:fypp/app/screens/signup/phot/phot.signup.dart';
import 'package:fypp/app/stores/login/phot.login.store.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

class PhotLogin extends StatefulWidget {
  PhotLogin({Key key}) : super(key: key);

  @override
  _PhotLoginState createState() => _PhotLoginState();
}

class _PhotLoginState extends State<PhotLogin> {
  PhotLoginStore loginStore = PhotLoginStore();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction((_) => loginStore.isLoggedIn, (loggedIn) {
      if (loggedIn) {
        Get.off(
          PhotHome(loggedPhot: loginStore.photLogged,),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  ),
                ],
              ),
            ),
            Positioned(
              top: height * 0.3,
              left: 0,
              right: 0,
              child: Wave(
                height: height * 0.17,
              ),
            ),
            Positioned(
              top: height * 0.26,
              left: 20,
              right: 20,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20)
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        Observer(
                          builder: (_) => TextField(
                            onChanged: loginStore.setEmail,
                            enabled: !loginStore.isLoading,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Observer(
                          builder: (_) => TextField(
                            onChanged: loginStore.setPassword,
                            enabled: !loginStore.isLoading,
                            obscureText: !loginStore.visibility,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  loginStore.visibility
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 24,
                                ),
                                onPressed: loginStore.togglePasswordVisibility,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Observer(
                    builder: (_) => Container(
                      height: 44,
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                        elevation: 0,
                        onPressed: loginStore.loginPressed,
                        child: loginStore.isLoading
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              )
                            : Text('Entrar'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('É novo por aqui? '),
                      GestureDetector(
                        onTap: () {
                          Get.to(PhotographerSignUp());
                        },
                        child: Text(
                          'Crie uma conta',
                          style: TextStyle(
                            color: Colors.deepPurple[800],
                            fontWeight: FontWeight.bold,
                          ),
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
