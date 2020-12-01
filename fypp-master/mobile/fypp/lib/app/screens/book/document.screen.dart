import 'package:flutter/material.dart';
import 'package:fypp/app/components/wave.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DocumentScreen extends StatefulWidget {
  DocumentScreen({Key key}) : super(key: key);

  @override
  _DocumentScreenState createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            height: 140,
            width: double.infinity,
            color: Colors.deepPurple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Legal! Para finalizarmos',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'a solicitação do fotógrafo,',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'só precisamos do seu CPF',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )
              ],
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
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    MaskTextInputFormatter(mask: "###.###.###-##")
                  ],
                  decoration: InputDecoration(hintText: 'Digite seu CPF'),
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
                    onPressed: () {},
                    child: Text('Finalizar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
