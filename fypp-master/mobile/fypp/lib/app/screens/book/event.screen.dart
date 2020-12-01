import 'dart:convert';

import 'package:cep_future/cep_future.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/controllers/category_controller.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:fypp/app/model/address.dart';
import 'package:fypp/app/model/category.dart';
import 'package:fypp/app/model/event.dart';
import 'package:fypp/app/screens/book/pickcategory.screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EventScreen extends StatefulWidget {
  final Category category;
  EventScreen({Key key, this.category}) : super(key: key);

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController neigh = TextEditingController();
  String numberHouse = '';
  String cep = '';

  CategoryController categoryController = CategoryController();
  DateTime actualDate = DateTime.now();
  DateTime selectedDate;

  TimeOfDay actualTime = TimeOfDay.now();
  TimeOfDay selectedInitialTime;

  TimeOfDay finalTime = TimeOfDay.now();
  TimeOfDay selectedFinalTime;

  DateFormat dateFormat = new DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
  }

  Future<DateTime> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      helpText: 'Data do evento',
      locale: Locale('pt', 'BR'),
      initialDate: actualDate,
      firstDate: actualDate,
      lastDate: DateTime(2023),
    );

    if (picked != null && picked != actualDate) {
      setState(() {
        actualDate = picked;
      });
      return actualDate;
    }

    return null;
  }

  Future<TimeOfDay> selectTime(BuildContext context, bool initial) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: actualTime,
    );

    if (picked != null && picked != actualTime && initial) {
      setState(() {
        actualTime = picked;
      });
      return actualTime;
    } else {
      setState(() {
        finalTime = picked;
      });
      return finalTime;
    }
  }

  Future<Map<String, dynamic>> getAddress(String cep) async {
    final result = await cepFuture(cep);
    return result.toJson();
  }

  Future<Event> createEvent() async {
    Event event = Event(
        id: null,
        date: dateFormat.format(actualDate),
        initialTime: selectedInitialTime.format(context),
        finalTime: selectedFinalTime.format(context),
        address: {
          'cep': cep,
          'id': null,
          'city': city.text,
          'country': 'br',
          'neigh': neigh.text,
          'number': numberHouse,
          'street': street.text,
          'state': state.text
        });
    return event;
    //print(event.toJson());
  }

  String selectedState = '';
  String selectedCity = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 12.0, top: 30.0),
                  width: double.infinity,
                  height: 130,
                  color: Colors.deepPurple,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Escolha abaixo',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        'a data, horário e local do evento ;)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Wave(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                      width: 110,
                      child: RaisedButton(
                        color: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                            Text(
                              selectedDate != null
                                  ? dateFormat.format(selectedDate)
                                  : 'Escolher data',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        onPressed: () async {
                          selectDate(context).then((value) {
                            setState(() {
                              selectedDate = value;
                              print(selectedDate);
                            });
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 80,
                      width: 110,
                      child: RaisedButton(
                        color: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                            Text(
                              selectedInitialTime != null
                                  ? selectedInitialTime.format(context)
                                  : 'Horário início',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        onPressed: () {
                          selectTime(context, true).then((value) {
                            setState(() {
                              selectedInitialTime = value;
                            });
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 80,
                      width: 110,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        color: Colors.deepPurple,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                            Text(
                              selectedFinalTime != null
                                  ? selectedFinalTime.format(context)
                                  : 'Horário fim',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {
                          selectTime(context, true).then((value) {
                            setState(() {
                              selectedFinalTime = value;
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          MaskTextInputFormatter(
                            mask: '#####-###',
                            filter: {
                              "#": RegExp(r'[0-9]'),
                            },
                          ),
                        ],
                        onChanged: (value) async {
                          if (value.length == 9) {
                            Map<String, dynamic> result =
                                await getAddress(value);
                            setState(() {
                              cep = value;
                              street.text = result['street'];
                              city.text = result['city'];
                              neigh.text = result['neighborhood'];
                              state.text = result['state'];
                            });
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Digite o CEP do local',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: street,
                              decoration: InputDecoration(
                                hintText: 'Rua',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                numberHouse = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Nº',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: neigh,
                        decoration: InputDecoration(
                          hintText: 'Bairro',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: city,
                              decoration: InputDecoration(
                                hintText: 'Cidade',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: state,
                              decoration: InputDecoration(
                                hintText: 'Estado',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 44,
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.deepPurple,
                          textColor: Colors.white,
                          elevation: 0,
                          onPressed: () async {
                            Event event = await createEvent();
                            Get.to(PickCategoryScreen(
                              event: event,
                            ));
                          },
                          child: Text('Avançar'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
