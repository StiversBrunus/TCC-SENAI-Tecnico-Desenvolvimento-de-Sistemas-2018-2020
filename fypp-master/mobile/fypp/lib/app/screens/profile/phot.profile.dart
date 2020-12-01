import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/screens/book/bundle.screen.dart';
import 'package:fypp/app/screens/portfolio/portfolio.screen.dart';
import 'package:get/get.dart';

class PhotProfile extends StatelessWidget {
  final Photographer phot;
  PhotProfile({Key key, this.phot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      extendBodyBehindAppBar: true,
      bottomSheet: Container(
        margin: EdgeInsets.all(8.0),
        color: Colors.transparent,
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          onPressed: () {
            Get.to(BundleScreen());
          },
          color: Colors.deepPurple,
          child: Text(
            'Contratar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 310,
                color: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/1.jpg',
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(12.0),
                        margin: EdgeInsets.all(12.0),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage: phot.profilePic != null
                                      ? NetworkImage(phot.profilePic)
                                      : AssetImage(
                                          'assets/images/blank-pic.png',
                                        ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      phot.name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      'São Paulo',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text('68'),
                                    Text('fotos'),
                                  ],
                                ),
                                Container(
                                  width: 1,
                                  height: 40,
                                  color: Colors.grey,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('13'),
                                    Text('avaliações'),
                                  ],
                                ),
                                Container(
                                  width: 1,
                                  height: 40,
                                  color: Colors.grey,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('4'),
                                    Text('álbuns'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(12.0),
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Portfólios',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'ver tudo >',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          textColor: Colors.grey[400],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, builder) {
                        return InkWell(
                          onTap: () {
                            print(phot.id);
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => PortfolioScreen(
                                  
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            width: 180,
                            color: Colors.blue,
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.0),
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Álbuns',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(
                            'ver tudo >',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          textColor: Colors.grey[400],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, builder) {
                        return Container(
                          margin: EdgeInsets.all(8.0),
                          width: 180,
                          color: Colors.blue,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
