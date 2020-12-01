import 'package:flutter/material.dart';
import 'package:fypp/app/controllers/portfolio.controller.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/screens/profile/phot.profile.dart';
import 'package:fypp/app/screens/profile/photographer.profile.dart';
import 'package:get/get.dart';

class PhotCard extends StatefulWidget {
  final Photographer phot;
  PhotCard({Key key, this.phot}) : super(key: key);

  @override
  _PhotCardState createState() => _PhotCardState();
}

class _PhotCardState extends State<PhotCard> {
  PortfolioController portController = PortfolioController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.phot.id);
        Get.to(PhotographerProfile(
          phot: widget.phot,
        ));
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        height: 240,
        color: Colors.transparent,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.phot.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'São Paulo',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            FutureBuilder(
                              future: portController.getPhotosByPortfolio(
                                  widget.phot.portfolios[0].id),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    height: 50,
                                    child: ListView.builder(
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.circular(8),
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            child: Image.network(
                                              snapshot.data[index].url,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   height: 30,
                            //   width: 30,
                            //   decoration: BoxDecoration(
                            //     border: Border.all(
                            //         width: 1, color: Colors.grey[500]),
                            //     borderRadius: BorderRadius.circular(8),
                            //   ),
                            //   child: Text(
                            //     ,
                            //     style: TextStyle(color: Colors.grey[500]),
                            //     textAlign: TextAlign.center,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Classificação',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.favorite, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                height: 120,
                width: 260,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/1.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
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
