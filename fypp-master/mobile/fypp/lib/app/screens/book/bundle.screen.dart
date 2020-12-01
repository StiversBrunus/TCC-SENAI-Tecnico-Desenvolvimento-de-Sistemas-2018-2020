import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fypp/app/model/bundle.dart';
import 'package:fypp/app/model/event.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/screens/payment/creditcard.payment.dart';
import 'package:get/get.dart';

class BundleScreen extends StatefulWidget {
  final Photographer phot;
  final Event event;
  const BundleScreen({Key key, this.event, this.phot}) : super(key: key);

  @override
  _BundleScreenState createState() => _BundleScreenState();
}

class _BundleScreenState extends State<BundleScreen> {
  List selectedChecks = List();
  Event event = Event();

  void _onCategorySelected(bool selected, int categoryId) {
    if (selected == true) {
      setState(() {
        selectedChecks.add(categoryId);
        print(selectedChecks.toString());
      });
    } else {
      setState(() {
        selectedChecks.remove(categoryId);
        print(selectedChecks.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Bundle> bundles = [
      Bundle(
        id: 1,
        name: 'Casamento - básico',
        desc: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        price: 700.00,
      ),
      Bundle(
        id: 2,
        name: 'Casamento - intermediário',
        desc: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        price: 1000.00,
      ),
      Bundle(
        id: 3,
        name: 'Casamento - avançado',
        desc: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        price: 1800.00,
      ),
    ];

    Future<Event> createEvent(int bundleId) async {
      Event event = Event(
        id: null,
        date: widget.event.date,
        initialTime: widget.event.initialTime,
        finalTime: widget.event.finalTime,
        address: widget.event.address,
        categoryId: widget.event.categoryId,
        photographerId: widget.event.photographerId,
        bundleId: bundleId
      );
      return event;
      //print(event.toJson());
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (context) => CreditCardPayment(event: event,),
            ),
          );
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
      appBar: AppBar(
        title: Text('Escolha do pacote'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: bundles
              .map(
                (e) => InkWell(
                  onTap: () async {
                    Get.snackbar('Pacote', 'Pacote adicionado: ${e.name}');
                    Event ev = await createEvent(e.id);
                    setState(() {
                      event = ev;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    height: 120,
                    width: 220,
                    color: Colors.green,
                    child: Column(
                      children: <Widget>[
                        Text(e.name),
                        Text(e.desc),
                        Text(e.price.toString()),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
