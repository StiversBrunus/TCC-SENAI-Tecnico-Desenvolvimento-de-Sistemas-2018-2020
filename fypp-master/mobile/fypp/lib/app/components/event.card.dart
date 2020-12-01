import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(),
                Text('Nome cliente'),
              ],
            ),
            Text('Casamento'),
            Text('28/11/2020 ás 18h'),
            Text('Osasco - SP'),
          ],
        ),
      ),
    );
  }
}
