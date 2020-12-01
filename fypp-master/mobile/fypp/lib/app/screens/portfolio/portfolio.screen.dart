import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fypp/app/controllers/portfolio.controller.dart';
import 'package:fypp/app/model/portfolio.dart';
import 'package:fypp/app/model/portfolioPhoto.dart';
import 'package:fypp/app/screens/portfolio/showImage.screen.dart';
import 'package:get/get.dart';

class PortfolioScreen extends StatefulWidget {
  final Portfolio snapshot;
  PortfolioScreen({Key key, this.snapshot}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  PortfolioController portController = PortfolioController();
  List<PortfolioPhoto> photos = [];

  Future<List<PortfolioPhoto>> getPhotos() async {
    return await portController.getPhotosByPortfolio(widget.snapshot.id);
  }

  @override
  void initState() {
    super.initState();
    getPhotos().then((value) {
      setState(() {
        photos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 270,
              color: Colors.deepPurple,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     colorFilter: ColorFilter.mode(
              //       Colors.black.withOpacity(0.2),
              //       BlendMode.darken,
              //     ),
              //     image: NetworkImage(photos[0].url),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.snapshot.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.snapshot.name ?? 'Descrição não informada',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(16.0),
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  height: 500,
                  child: FutureBuilder(
                    future: getPhotos(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          return GridView.builder(
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            padding: EdgeInsets.fromLTRB(12, 30, 12, 12),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(ShowImageScreen(url: snapshot.data[index].url,));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8.0),
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      image:
                                          NetworkImage(snapshot.data[index].url),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
