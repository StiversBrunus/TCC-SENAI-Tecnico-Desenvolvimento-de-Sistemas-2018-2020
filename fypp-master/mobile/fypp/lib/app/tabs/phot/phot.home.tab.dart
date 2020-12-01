import 'package:flutter/material.dart';
import 'package:fypp/app/components/event.card.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/model/photographer.dart';

class PhotHomeTab extends StatelessWidget {
  final Photographer phot;
  const PhotHomeTab({Key key, this.phot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return ListView(
      children: <Widget>[
        Container(
          height: 280,
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                height: height * 0.20,
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
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '  Bem vindo,',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '  ${phot.name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: height * 0.20,
                left: 0,
                right: 0,
                child: Wave(
                  height: height * 0.13,
                ),
              ),
              Positioned(
                top: height * 0.20,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(4.0),
                      height: height * 0.18,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 20)
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: phot.profilePic != null
                            ? Image.network(
                                phot.profilePic,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "assets/images/blank-pic.png",
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 600,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                ' Minha agenda',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 140,
                child: ListView.builder(
                  itemCount: 5,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return EventCard();
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                ' Últimos eventos',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 140,
                child: ListView.builder(
                  itemCount: 5,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return EventCard();
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
