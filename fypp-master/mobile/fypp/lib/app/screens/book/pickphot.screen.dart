import 'package:flutter/material.dart';
import 'package:fypp/app/components/home.user.card.dart';
import 'package:fypp/app/model/event.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/screens/profile/photographer.profile.dart';
import 'package:get/get.dart';

class PickPhotScreen extends StatefulWidget {
  final Event event;
  final List<Photographer> photographers;
  PickPhotScreen({Key key, this.photographers, this.event}) : super(key: key);

  @override
  _PickPhotScreenState createState() => _PickPhotScreenState();
}

class _PickPhotScreenState extends State<PickPhotScreen> {
  List<Photographer> phots = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      phots = widget.photographers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: phots
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        Get.to(
                          PhotographerProfile(
                            phot: e,
                            event: widget.event,
                          ),
                        );
                      },
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
