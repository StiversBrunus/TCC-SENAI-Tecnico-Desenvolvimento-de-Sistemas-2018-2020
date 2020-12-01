import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/model/event.dart';
import 'package:fypp/app/screens/book/document.screen.dart';
import 'package:get/get.dart';
import 'package:mask_shifter/mask_shifter.dart';

class CreditCardPayment extends StatefulWidget {
  final Event event;
  CreditCardPayment({Key key, this.event}) : super(key: key);

  @override
  _CreditCardPaymentState createState() => _CreditCardPaymentState();
}

class _CreditCardPaymentState extends State<CreditCardPayment> {
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  PageController pageController = PageController();

  String cardNumber = 'XXXX XXXX XXXX XXXX';
  String cardName = 'Seu nome';
  String cardDate = '06/20';
  String cardCvv = 'XXX';
  bool flip = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagamento - Cartão'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                color: Colors.deepPurple,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      flip = !flip;
                    });
                  },
                  child: CreditCard(
                    cardNumber: cardNumber,
                    cardExpiry: cardDate,
                    cardHolderName: cardName,
                    cvv: cardCvv,
                    bankName: "Fypp",
                    cardType: CardType.other,
                    showBackSide: flip,
                    frontTextColor: Colors.black,
                    backTextColor: Colors.black,
                    frontBackground: CardBackgrounds.white,
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                  ),
                ),
              ),
              Wave(
                height: 70,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                height: 160,
                width: double.infinity,
                child: PageView(
                  controller: pageController,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            inputFormatters: [
                              MaskedTextInputFormatterShifter(
                                maskONE: 'XXXX XXXX XXXX XXXX',
                                maskTWO: 'XXXX XXXX XXXX XXXX',
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                cardNumber = value;
                              });
                            },
                            keyboardType: TextInputType.number,
                            controller: numberController,
                            decoration: InputDecoration(
                              labelText: 'Número do cartão',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 44,
                            width: double.infinity,
                            child: RaisedButton(
                              color: Colors.deepPurple,
                              textColor: Colors.white,
                              elevation: 0,
                              onPressed: () {
                                if (numberController.text.length > 11) {
                                  pageController.animateToPage(
                                    1,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.bounceIn,
                                  );
                                }
                              },
                              child: Text('Avançar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                cardName = value;
                              });
                            },
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'Nome (Igual o cartão)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 44,
                            width: double.infinity,
                            child: RaisedButton(
                              color: Colors.deepPurple,
                              textColor: Colors.white,
                              elevation: 0,
                              onPressed: () {
                                if (nameController.text.length > 5) {
                                  pageController.animateToPage(
                                    2,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.bounceIn,
                                  );
                                }
                              },
                              child: Text('Avançar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            inputFormatters: [
                              MaskedTextInputFormatterShifter(
                                maskONE: 'XX/XX',
                                maskTWO: 'XX/XX',
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                cardDate = value;
                              });
                            },
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: dateController,
                            decoration: InputDecoration(
                              labelText: 'Data de expiração',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 44,
                            width: double.infinity,
                            child: RaisedButton(
                              color: Colors.deepPurple,
                              textColor: Colors.white,
                              elevation: 0,
                              onPressed: () {
                                if (dateController.text.length == 5) {
                                  pageController.animateToPage(
                                    3,
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.bounceIn,
                                  );
                                  setState(() {
                                    flip = true;
                                  });
                                }
                              },
                              child: Text('Avançar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            inputFormatters: [
                              MaskedTextInputFormatterShifter(
                                maskONE: 'XXX',
                                maskTWO: 'XXX',
                              )
                            ],
                            onChanged: (value) {
                              setState(() {
                                cardCvv = value;
                              });
                            },
                            keyboardType: TextInputType.numberWithOptions(),
                            controller: cvvController,
                            decoration: InputDecoration(
                              labelText: 'CVV',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 44,
                            width: double.infinity,
                            child: RaisedButton(
                              color: Colors.deepPurple,
                              textColor: Colors.white,
                              elevation: 0,
                              onPressed: () {
                                if (cvvController.text.length == 3) {
                                  print(numberController.text);
                                  print(nameController.text);
                                  print(dateController.text);
                                  print(cvvController.text);
                                  print(widget.event.toJson());
                                  // Get.to(DocumentScreen());
                                }
                              },
                              child: Text('Finalizar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
