import 'package:flutter/material.dart';
import 'package:fypp/app/components/wave.dart';

class PhotographerDetails extends StatelessWidget {
  const PhotographerDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text('Portfólio'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 16.0, top: 8.0),
                color: Colors.deepPurple,
                width: double.infinity,
                height: height * 0.24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Nome fotógrafo',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'São Paulo',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 6, 10, 0),
                      width: double.infinity,
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300].withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'Casamento',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.2215),
                child: Wave(
                  height: 80,
                ),
              ),
            ],
          ),
          Container(
            height: height * 0.44,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '  Álbuns',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        width: 180,
                        height: 100,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: BottomSheet(
        elevation: 0,
        enableDrag: false,
        onClosing: () {},
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(8.0),
            height: 54,
            width: double.infinity,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.deepPurple,
              child: Text(
                'Contratar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
