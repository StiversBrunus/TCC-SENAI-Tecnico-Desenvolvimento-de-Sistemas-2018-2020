import 'package:flutter/material.dart';
import 'package:fypp/app/controllers/portfolio.controller.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/portfolioPhoto.dart';
import 'package:fypp/app/screens/profile/phot.profile.dart';
import 'package:fypp/app/screens/profile/photographer.details.dart';
import 'package:fypp/app/screens/profile/photographer.profile.dart';
import 'package:get/get.dart';

class HomeUserCard extends StatefulWidget {
  final Photographer phot;

  const HomeUserCard({Key key, this.phot}) : super(key: key);

  @override
  _HomeUserCardState createState() => _HomeUserCardState();
}

class _HomeUserCardState extends State<HomeUserCard> {
  PortfolioController portController = PortfolioController();
  bool isFavorite = false;
  List<PortfolioPhoto> photos = [];

  @override
  void initState() {
    super.initState();
    portController
        .getPhotosByPortfolio(widget.phot.portfolios[0].id)
        .then((value) {
      setState(() {
        photos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Get.to(PhotographerProfile(
          phot: widget.phot,
        ));
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        height: height * 0.34,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20,
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                    backgroundImage: widget.phot.profilePic != null
                        ? NetworkImage(widget.phot.profilePic)
                        : AssetImage('assets/images/blank-pic.png')),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.phot.name ?? 'Nome fotógrafo',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'São Paulo',
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 76,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: isFavorite
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.grey,
                              ),
                        onPressed: () {
                          isFavorite = !isFavorite;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: portController
                  .getPhotosByPortfolio(widget.phot.portfolios[0].id),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                snapshot.data[0].url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                width: 150,
                                height: 75,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    snapshot.data[1].url,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        snapshot.data[2].url,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: <Widget>[
                                  Container(
                                    width: 70,
                                    height: 70,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                snapshot.data[3].url),
                                            fit: BoxFit.cover,
                                            colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.5),
                                              BlendMode.darken,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          '+' +
                                              photos.length.toString() +
                                              '\n fotos',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
