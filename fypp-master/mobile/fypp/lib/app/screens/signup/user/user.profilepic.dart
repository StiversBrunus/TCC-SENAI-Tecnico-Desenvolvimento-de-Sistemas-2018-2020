import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/controllers/signup_controller.dart';
import 'package:fypp/app/model/user.dart';
import 'package:fypp/app/screens/signup/signup.complete.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePic extends StatefulWidget {
  final User lastUser;

  UserProfilePic({Key key, this.lastUser}) : super(key: key);

  @override
  _UserProfilePicState createState() => _UserProfilePicState();
}

class _UserProfilePicState extends State<UserProfilePic> {
  SignUpController _signUpController = SignUpController();

  File image;

  Future openCamera(BuildContext context) async {
    var pic = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      image = pic;
    });
    Navigator.pop(context);
  }

  Future openGallery(BuildContext context) async {
    var pic = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pic;
    });
    Navigator.pop(context);
  }

  addToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  void showChoiceDialog(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      openCamera(context);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.photo_camera,
                          color: Colors.deepPurple[800],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Tirar foto',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      openGallery(context);
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.photo_library,
                          color: Colors.deepPurple[800],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Escolher imagem da galeria',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
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
                    'Foto de perfil',
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
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20)
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showChoiceDialog(context);
                      },
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: SizedBox(
                            height: 180,
                            width: 180,
                            child: image != null
                                ? Image.file(
                                    image,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    'assets/images/blank-pic.png',
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  image != null
                      ? Container(
                          height: 44,
                          width: double.infinity,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.deepPurple,
                            textColor: Colors.white,
                            elevation: 0,
                            onPressed: () async {
                              String imageUrl =
                                  await _signUpController.sendProfilePic(image);
                              if (imageUrl != null) {
                                User user = User(
                                  id: widget.lastUser.id,
                                  name: widget.lastUser.name,
                                  phone: widget.lastUser.phone,
                                  cep: widget.lastUser.cep,
                                  email: widget.lastUser.email,
                                  password: widget.lastUser.password,
                                  profilePic: imageUrl,
                                  role: widget.lastUser.role,
                                  token: widget.lastUser.token,
                                );
                                User updatedUser = await _signUpController
                                    .updateUserProfilePic(
                                  user,
                                  imageUrl,
                                );

                                if (updatedUser != null) {
                                  Get.off(SignUpComplete(lastUser: updatedUser,));
                                }
                              }
                            },
                            child: Text('Continuar'),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: height * 0.16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Get.off(SignUpComplete());
                        },
                        child: Text(
                          'Adicionar foto mais tarde',
                          style: TextStyle(
                              color: Colors.deepPurple[800],
                              fontWeight: FontWeight.bold),
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
