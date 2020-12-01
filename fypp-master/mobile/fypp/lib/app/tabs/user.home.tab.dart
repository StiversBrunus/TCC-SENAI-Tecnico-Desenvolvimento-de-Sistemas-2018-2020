import 'package:flutter/material.dart';
import 'package:fypp/app/components/home.user.card.dart';
import 'package:fypp/app/components/phot.card.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/controllers/category_controller.dart';
import 'package:fypp/app/controllers/photographer_controller.dart';
import 'package:fypp/app/controllers/portfolio.controller.dart';
import 'package:fypp/app/model/category.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/portfolioPhoto.dart';
import 'package:fypp/app/model/user.dart';
import 'package:fypp/app/screens/book/pickphot.screen.dart';
import 'package:fypp/app/screens/profile/photographer.profile.dart';
import 'package:fypp/app/stores/category/category.store.dart';
import 'package:fypp/app/stores/phot/phot.store.dart';
import 'package:get/get.dart';

class UserHomeTab extends StatefulWidget {
  final User user;
  const UserHomeTab({Key key, this.user}) : super(key: key);

  @override
  _UserHomeTabState createState() => _UserHomeTabState();
}

class _UserHomeTabState extends State<UserHomeTab> {
  PhotographerController photController = PhotographerController();
  CategoryController categoryController = CategoryController();
  PortfolioController portController = PortfolioController();
  PhotStore photStore = PhotStore();
  CategoryStore catStore = CategoryStore();

  bool isFavorite = false;

  List<Photographer> phots = [];
  List<PortfolioPhoto> photos = [];
  List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 12.0, top: 30.0),
              height: 130,
              width: double.infinity,
              color: Colors.deepPurple,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Descubra os',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'melhores fotógrafos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            Wave(height: 70),
            Container(
              height: 190,
              padding: EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: categoryController.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ' Categorias',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 140,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: snapshot.data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () async {
                                    List<Photographer> phots =
                                        await categoryController
                                            .getPhotographersByCategory(
                                                snapshot.data[index].id);
                                    Get.to(PickPhotScreen(
                                      photographers: phots,
                                    ));
                                  },
                                  child: Container(
                                    height: 120,
                                    width: 210,
                                    margin: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                          Colors.deepPurple.withOpacity(0.4),
                                          BlendMode.darken,
                                        ),
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          snapshot.data[index].image,
                                        ),
                                      ),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                                      child: Text(
                                        snapshot.data[index].name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
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
            Divider(),
            Container(
              padding: EdgeInsets.all(8.0),
              child: FutureBuilder<List<Photographer>>(
                future: photController.getPhotographers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ' Fotógrafos em alta',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            height: 500,
                            child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(PhotographerProfile(
                                      phot: snapshot.data[index],
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            CircleAvatar(
                                                backgroundImage: snapshot
                                                            .data[index]
                                                            .profilePic !=
                                                        null
                                                    ? NetworkImage(snapshot
                                                        .data[index].profilePic)
                                                    : AssetImage(
                                                        'assets/images/blank-pic.png')),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data[index].name ??
                                                      'Nome fotógrafo',
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
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
                                        // FutureBuilder(
                                        //   future: portController
                                        //       .getPhotosByPortfolio(snapshot
                                        //           .data[index]
                                        //           .portfolios[0]
                                        //           .id).then((value) => photos = value),
                                        //   builder: (context, snapshot) {
                                        //     if (!snapshot.hasData) {
                                        //       return Center(
                                        //         child:
                                        //             CircularProgressIndicator(),
                                        //       );
                                        //     } else {
                                        //       return Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment
                                        //                 .spaceEvenly,
                                        //         children: <Widget>[
                                        //           Column(
                                        //             children: <Widget>[
                                        //               Container(
                                        //                 height: 150,
                                        //                 width: 150,
                                        //                 decoration:
                                        //                     BoxDecoration(
                                        //                   borderRadius:
                                        //                       BorderRadius
                                        //                           .circular(10),
                                        //                 ),
                                        //                 child: ClipRRect(
                                        //                   borderRadius:
                                        //                       BorderRadius
                                        //                           .circular(10),
                                        //                   child: Image.network(
                                        //                     snapshot
                                        //                         .data[0].url,
                                        //                     fit: BoxFit.cover,
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //           Column(
                                        //             children: <Widget>[
                                        //               Row(
                                        //                 children: <Widget>[
                                        //                   Container(
                                        //                     width: 150,
                                        //                     height: 75,
                                        //                     child: ClipRRect(
                                        //                       borderRadius:
                                        //                           BorderRadius
                                        //                               .circular(
                                        //                                   10),
                                        //                       child:
                                        //                           Image.network(
                                        //                         snapshot.data[1]
                                        //                             .url,
                                        //                         fit: BoxFit
                                        //                             .cover,
                                        //                       ),
                                        //                     ),
                                        //                   ),
                                        //                 ],
                                        //               ),
                                        //               SizedBox(
                                        //                 height: 5,
                                        //               ),
                                        //               Row(
                                        //                 children: <Widget>[
                                        //                   Column(
                                        //                     children: <Widget>[
                                        //                       Container(
                                        //                         width: 70,
                                        //                         height: 70,
                                        //                         child:
                                        //                             ClipRRect(
                                        //                           borderRadius:
                                        //                               BorderRadius
                                        //                                   .circular(
                                        //                                       10),
                                        //                           child: Image
                                        //                               .network(
                                        //                             snapshot
                                        //                                 .data[2]
                                        //                                 .url,
                                        //                             fit: BoxFit
                                        //                                 .cover,
                                        //                           ),
                                        //                         ),
                                        //                       ),
                                        //                     ],
                                        //                   ),
                                        //                   SizedBox(
                                        //                     width: 10,
                                        //                   ),
                                        //                   Column(
                                        //                     children: <Widget>[
                                        //                       Container(
                                        //                         width: 70,
                                        //                         height: 70,
                                        //                         child:
                                        //                             ClipRRect(
                                        //                           borderRadius:
                                        //                               BorderRadius
                                        //                                   .circular(
                                        //                                       10),
                                        //                           child:
                                        //                               Container(
                                        //                             alignment:
                                        //                                 Alignment
                                        //                                     .center,
                                        //                             decoration:
                                        //                                 BoxDecoration(
                                        //                               image:
                                        //                                   DecorationImage(
                                        //                                 image: NetworkImage(snapshot
                                        //                                     .data[3]
                                        //                                     .url),
                                        //                                 fit: BoxFit
                                        //                                     .cover,
                                        //                                 colorFilter:
                                        //                                     ColorFilter.mode(
                                        //                                   Colors
                                        //                                       .black
                                        //                                       .withOpacity(0.5),
                                        //                                   BlendMode
                                        //                                       .darken,
                                        //                                 ),
                                        //                               ),
                                        //                             ),
                                        //                             child: Text(
                                        //                               '+' +
                                        //                                   photos.length
                                        //                                       .toString() +
                                        //                                   '\n fotos',
                                        //                               style:
                                        //                                   TextStyle(
                                        //                                 color: Colors
                                        //                                     .white,
                                        //                                 fontSize:
                                        //                                     16,
                                        //                               ),
                                        //                             ),
                                        //                           ),
                                        //                         ),
                                        //                       ),
                                        //                     ],
                                        //                   )
                                        //                 ],
                                        //               ),
                                        //             ],
                                        //           ),
                                        //         ],
                                        //       );
                                        //     }
                                        //   },
                                        // )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
