import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/controllers/portfolio.controller.dart';
import 'package:fypp/app/controllers/signup_controller.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/portfolio.dart';
import 'package:fypp/app/model/portfolioPhoto.dart';
import 'package:fypp/app/screens/portfolio/portfolio.created.screen.dart';
import 'package:get/get.dart';

class AddPortfolioScreen extends StatefulWidget {
  final Photographer phot;
  AddPortfolioScreen({Key key, this.phot}) : super(key: key);

  @override
  _AddPortfolioScreenState createState() => _AddPortfolioScreenState();
}

class _AddPortfolioScreenState extends State<AddPortfolioScreen> {
  SignUpController controller = SignUpController();
  PortfolioController portController = PortfolioController();

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  List<File> images = List<File>();
  List<PortfolioPhoto> photos = [];
  String url = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void getImages() async {
    var files = await FilePicker.getMultiFile(type: FileType.image);
    setState(() {
      images = files;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            setState(() {
              isLoading = true;
            });
            photos.clear();
            for (File image in images) {
              url = await controller.sendProfilePic(image);
              PortfolioPhoto photo = PortfolioPhoto(
                name: DateTime.now().microsecondsSinceEpoch.toString() +
                    image.path.split('/').last,
                desc: 'teste',
                url: url,
              );
              photos.add(photo);
            }
            if (photos.length < 5) {
              Get.snackbar(
                  'Portfólio', 'O portfólio deve conter pelo menos 5 fotos');
              setState(() {
                isLoading = false;
              });
              return;
            }
            Portfolio port = Portfolio(
              name: nameController.text,
              desc: descController.text,
              photId: widget.phot.id,
              photos: photos,
            );
            Portfolio addedPort = await portController.newPortfolio(port);
            if (addedPort != null) {
              widget.phot.portfolios.add(port);
              Photographer photographer = Photographer(
                  id: widget.phot.id,
                  name: widget.phot.name,
                  birthDate: widget.phot.birthDate,
                  phone: widget.phot.phone,
                  cpf: widget.phot.cpf,
                  experience: widget.phot.experience,
                  cep: widget.phot.cep,
                  categories: widget.phot.categories,
                  email: widget.phot.email,
                  password: widget.phot.password,
                  profilePic: widget.phot.profilePic,
                  portfolios: widget.phot.portfolios,
                  token: widget.phot.token,
                  role: widget.phot.role);
              portController.updateWithPortfolio(photographer);
              // Get.to(PortfolioCreatedScreen(phot: photographer,));
              isLoading = false;
              setState(() {
                
              });
              Get.snackbar('Portfólio', 'Portfólio criado!');
            }
          },
          child: !isLoading
              ? Icon(
                  Icons.save,
                )
              : CircularProgressIndicator(backgroundColor: Colors.white)),
      appBar: AppBar(
        title: Text('Novo portfólio'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                height: 200,
                width: double.infinity,
                color: Colors.deepPurple,
                child: Column(
                  children: <Widget>[
                    TextField(
                      enabled: !isLoading,
                      controller: nameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                      ),
                    ),
                    TextField(
                      enabled: !isLoading,
                      controller: descController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Descrição',
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () {
                          getImages();
                        },
                        child: Text('Selecionar imagens'),
                      ),
                    ),
                  ],
                ),
              ),
              Wave(
                height: 60,
              ),
              Container(
                height: 400,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    if (images != null) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        height: 100,
                        width: 100,
                        child: Image.file(
                          images[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    } else {
                      return Center(
                        child: Text('Selecione as imagens'),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
