import 'package:flutter/material.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/controllers/category_controller.dart';
import 'package:fypp/app/controllers/signup_controller.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/screens/signup/phot/phot.profilepic.dart';
import 'package:get/get.dart';

class PhotographerCategories extends StatefulWidget {
  final Photographer lastPhotographer;

  PhotographerCategories({Key key, this.lastPhotographer}) : super(key: key);

  @override
  _PhotographerCategoriesState createState() => _PhotographerCategoriesState();
}

class _PhotographerCategoriesState extends State<PhotographerCategories> {
  CategoryController categoryController = CategoryController();
  SignUpController signUpController = SignUpController();
  List selectedChecks = List();

  void _onCategorySelected(bool selected, int categoryId) {
    if (selected == true) {
      setState(() {
        selectedChecks.add(categoryId);
        print(selectedChecks.toString());
      });
    } else {
      setState(() {
        selectedChecks.remove(categoryId);
        print(selectedChecks.toString());
      });
    }
  }

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
                    'Categorias',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.16,
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
              top: height * 0.16,
              left: 20,
              right: 20,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: height * 0.54,
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
                        Expanded(child: categoryListBuilder()),
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
                      onPressed: () async {
                        if (selectedChecks.length < 1 ||selectedChecks.isEmpty) {
                          Get.snackbar('Opa...', 'Escolha pelo menos uma categoria');
                        } else {
                          List<Map<String, dynamic>> cat = [];
                          selectedChecks.forEach((c) {
                            Map<String, dynamic> category = {'id': c};
                            cat.add(category);
                          });
                          Photographer photographer = Photographer(
                            id: widget.lastPhotographer.id,
                            name: widget.lastPhotographer.name,
                            birthDate: widget.lastPhotographer.birthDate,
                            cpf: widget.lastPhotographer.cpf,
                            phone: widget.lastPhotographer.phone,
                            experience: widget.lastPhotographer.experience,
                            role: widget.lastPhotographer.role,
                            address: widget.lastPhotographer.address,
                            cep: widget.lastPhotographer.cep,
                            email: widget.lastPhotographer.email,
                            password: widget.lastPhotographer.password,
                            categories: cat,
                            token: widget.lastPhotographer.token,
                          );
                          Photographer phot = await signUpController
                              .updateWithCategories(photographer);
                          if (phot != null) {
                            Get.off(PhotographerProfilePic(
                              lastPhotographer: phot,
                            ));
                          }
                        }
                      },
                      child: Text('Continuar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryListBuilder() {
    return FutureBuilder(
      future: categoryController.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  selected: selectedChecks.contains(
                    snapshot.data[index].id,
                  ),
                  onChanged: (bool val) {
                    _onCategorySelected(
                      val,
                      snapshot.data[index].id,
                    );
                  },
                  title: !selectedChecks.contains(
                    snapshot.data[index].id,
                  )
                      ? Text(snapshot.data[index].name ?? 'Erro ao carregar')
                      : Text(
                          snapshot.data[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                  activeColor: Colors.deepPurple,
                  value: selectedChecks.contains(
                    snapshot.data[index].id,
                  ),
                );
              },
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
