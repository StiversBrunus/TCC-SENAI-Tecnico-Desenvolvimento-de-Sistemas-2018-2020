import 'package:flutter/material.dart';
import 'package:fypp/app/controllers/portfolio.controller.dart';
import 'package:fypp/app/model/event.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/portfolio.dart';
import 'package:fypp/app/model/portfolioPhoto.dart';
import 'package:fypp/app/screens/book/bundle.screen.dart';
import 'package:fypp/app/screens/portfolio/portfolio.screen.dart';
import 'package:get/get.dart';

class PhotographerProfile extends StatefulWidget {
  final Event event;
  final Photographer phot;
  PhotographerProfile({Key key, this.phot, this.event}) : super(key: key);

  @override
  _PhotographerProfileState createState() => _PhotographerProfileState();
}

class _PhotographerProfileState extends State<PhotographerProfile> {
  PortfolioController portController = PortfolioController();

  bool isFav = false;
  List<Portfolio> portfolios = [];
  List<PortfolioPhoto> photos = [];
  List<dynamic> categories = [];
  Map<String, dynamic> photosMap = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      categories = widget.phot.categories;
    });
  }

  Future<Event> createEvent(int photId) async {
    Event event = Event(
      id: null,
      date: widget.event.date,
      initialTime: widget.event.initialTime,
      finalTime: widget.event.finalTime,
      address: widget.event.address,
      categoryId: widget.event.categoryId,
      photographerId: photId,
    );
    return event;
    //print(event.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Event event = await createEvent(widget.phot.id);
            Get.to(BundleScreen(
              event: event,
              phot: widget.phot,
            ));
          },
          icon: Icon(Icons.arrow_forward_ios),
          label: Text('Contratar'),
        ),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            IconButton(
              icon: isFav
                  ? Icon(Icons.favorite, color: Colors.redAccent)
                  : Icon(Icons.favorite),
              onPressed: () {
                setState(() {
                  isFav = !isFav;
                });
                // if(isFav){
                //   Get.snackbar('Favoritos', 'Fotógrafo adicionado aos favoritos');
                // }else{
                //   Get.snackbar('Favoritos', 'Fotógrafo removido dos favoritos');
                // }
              },
            ),
          ],
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.1),
                      BlendMode.darken,
                    ),
                    image: widget.phot.profilePic != null
                        ? NetworkImage(widget.phot.profilePic)
                        : AssetImage('assets/images/blank-pic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 90,
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
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.phot.name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'São Paulo',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star_half,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: TabBar(
                              indicatorColor: Colors.black,
                              isScrollable: false,
                              labelColor: Colors.black,
                              labelStyle: TextStyle(fontSize: 13),
                              unselectedLabelColor: Colors.grey[500],
                              tabs: [
                                Tab(
                                  text: 'Informações',
                                ),
                                Tab(
                                  text: 'Portfolio',
                                ),
                                Tab(
                                  text: 'Pacotes',
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            height: 380,
                            child: TabBarView(
                              physics: BouncingScrollPhysics(),
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Informações Pessoais:',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Email: ${widget.phot.email}'),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text('Celular: ${widget.phot.phone}'),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Experiência: ${widget.phot.experience}',
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 160,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Trabalha com:',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(
                                            height: 120,
                                            child: ListView(
                                              scrollDirection: Axis.horizontal,
                                              children: categories
                                                  .map(
                                                    (e) => Container(
                                                      height: 120,
                                                      width: 180,
                                                      margin:
                                                          EdgeInsets.all(8.0),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        image: DecorationImage(
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                            Colors.deepPurple
                                                                .withOpacity(
                                                                    0.4),
                                                            BlendMode.darken,
                                                          ),
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            e.image,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        margin:
                                                            EdgeInsets.fromLTRB(
                                                                15, 15, 0, 0),
                                                        child: Text(
                                                          e.name,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: FutureBuilder(
                                    future: portController
                                        .getPortfoliosByPhotographer(
                                            widget.phot.id),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data != null) {
                                          return ListView.builder(
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  Get.to(
                                                    PortfolioScreen(
                                                      snapshot:
                                                          snapshot.data[index],
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: 200,
                                                  height: 100,
                                                  child: Column(
                                                    children: <Widget>[
                                                      Text(
                                                        snapshot
                                                            .data[index].name,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          return Center(
                                            child: Text(
                                              'Esse fotógrafo não possui nenhum portfólio',
                                            ),
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
                                Icon(Icons.directions_bike),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Column(
//                                     children: portfolios.length >= 1
//                                         ? portfolios
//                                             .map(
//                                               (e) => Container(
//                                                 width: double.infinity,
//                                                 height: 120,
//                                                 color: Colors.red,
//                                                 child: Text(e.name),
//                                               ),
//                                             )
//                                             .toList()
//                                         : <Widget>[
//                                             Text('Nenhum portfólio'),
//                                           ],
//                                   ),
