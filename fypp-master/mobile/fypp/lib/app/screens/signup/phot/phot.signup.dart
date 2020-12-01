import 'package:date_field/date_field.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:fypp/app/screens/signup/phot/phot.categories.dart';
import 'package:fypp/app/stores/signup/phot.signup.store.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

class PhotographerSignUp extends StatefulWidget {
  PhotographerSignUp({Key key}) : super(key: key);

  @override
  _PhotographerSignUpState createState() => _PhotographerSignUpState();
}

class _PhotographerSignUpState extends State<PhotographerSignUp> {
  PhotSignUpStore signUpStore = PhotSignUpStore();
  PageController pageController = PageController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reaction((_) => signUpStore.isLoggedIn, (loggedIn) {
      if (loggedIn) {
        Get.to(
          PhotographerCategories(
            lastPhotographer: signUpStore.loggedPhot,
          ),
        );
      } else {
        print('erro');
      }
    });
  }

  DateTime _dateTime;
  int currentPage = 0;

  bool isLoading = false;
  bool loadingButton = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: height * 0.3,
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
                  Text(
                    'Crie sua conta',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.1,
                  )
                ],
              ),
            ),
            Positioned(
              top: height * 0.3,
              left: 0,
              right: 0,
              child: Wave(
                height: height * 0.17,
              ),
            ),
            Positioned(
              top: height * 0.22,
              left: 20,
              right: 20,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    height: height * 0.42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20)
                      ],
                    ),
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      children: <Widget>[
                        firstForm(),
                        secondForm(),
                        thirdForm(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  currentPage < 2
                      ? Observer(
                          builder: (_) => Container(
                            height: 44,
                            width: double.infinity,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                color: Colors.deepPurple,
                                textColor: Colors.white,
                                elevation: 0,
                                onPressed: () {
                                  pageController.nextPage(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.bounceIn,
                                  );
                                },
                                child: Text('Avançar')),
                          ),
                        )
                      : Observer(
                          builder: (_) => Container(
                            height: 44,
                            width: double.infinity,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                color: Colors.deepPurple,
                                textColor: Colors.white,
                                elevation: 0,
                                onPressed: signUpStore.firstFormPressed,
                                child: Text('Finalizar')),
                          ),
                        ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Já possui uma conta? '),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'Clique aqui',
                          style: TextStyle(
                            color: Colors.deepPurple[800],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstForm() {
    return ListView(
      children: <Widget>[
        Observer(
          builder: (_) => TextField(
            onChanged: signUpStore.setName,
            decoration: InputDecoration(
              labelText: 'Nome',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Observer(
          builder: (_) => TextField(
            onChanged: signUpStore.setCpf,
            keyboardType: TextInputType.number,
            inputFormatters: [
              MaskTextInputFormatter(
                mask: '###.###.###-##',
                filter: {
                  "#": RegExp(r'[0-9]'),
                },
              ),
            ],
            decoration: InputDecoration(
              labelText: 'CPF',
              prefixIcon: Icon(Icons.featured_play_list),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Observer(
          builder: (_) => DateField(
            initialDatePickerMode: DatePickerMode.day,
            // selectedDate: _dateTime,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.date_range),
            ),
            dateFormat: DateFormat('dd/MM/yyyy'),
            lastDate: DateTime(2020),
            onDateSelected: signUpStore.setBirthDate,
            selectedDate: signUpStore.birthDate,
            label: signUpStore.birthDate != null
                ? signUpStore.birthDate.toString()
                : 'Data de nascimento',
          ),
        ),
      ],
    );
  }

  Widget secondForm() {
    return ListView(
      children: <Widget>[
        // Observer(
        //   builder: (_) => DropDownFormField(
        //     titleText: 'Experiência',
        //     hintText: 'Escolha uma',
        //     textField: 'display',
        //     valueField: 'value',
        //     value: signUpStore.experience,
        //     onChanged: signUpStore.setExperience,
        //     dataSource: [
        //       {'display': 'Profissional', 'value': 'profissional'},
        //       {'display': 'Amador', 'value': 'amador'}
        //     ],
        //   ),
        // ),
        SizedBox(
          height: 10,
        ),
        Observer(
          builder: (_) => TextField(
            onChanged: signUpStore.setCep,
            keyboardType: TextInputType.number,
            inputFormatters: [
              MaskTextInputFormatter(
                mask: '#####-###',
                filter: {
                  "#": RegExp(r'[0-9]'),
                },
              ),
            ],
            decoration: InputDecoration(
              labelText: 'CEP',
              prefixIcon: Icon(Icons.location_on),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Observer(
                builder: (_) => TextField(
                  controller: signUpStore.street,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: 'Rua',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Observer(
                builder: (_) => TextField(
                  onChanged: signUpStore.setNumber,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: 'Nº',
                  ),
                ),
              ),
            ),
          ],
        ),
        TextField(
          controller: signUpStore.city,
          enabled: false,
          decoration: InputDecoration(
            labelText: 'Cidade',
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: TextField(
                enabled: false,
                controller: signUpStore.neigh,
                decoration: InputDecoration(
                  labelText: 'Bairro',
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextField(
                enabled: false,
                controller: signUpStore.state,
                decoration: InputDecoration(
                  labelText: 'Estado',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget thirdForm() {
    return ListView(
      children: <Widget>[
        Observer(
          builder: (_) => TextField(
            onChanged: signUpStore.setPhone,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              MaskTextInputFormatter(
                mask: '(##) #####-####',
                filter: {
                  "#": RegExp(r'[0-9]'),
                },
              ),
            ],
            decoration: InputDecoration(
              labelText: 'Celular',
              prefixIcon: Icon(Icons.phone_android),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Observer(
          builder: (_) => TextField(
            onChanged: signUpStore.setEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Observer(
          builder: (_) => TextField(
            onChanged: signUpStore.setPassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        ),
      ],
    );
  }
}
