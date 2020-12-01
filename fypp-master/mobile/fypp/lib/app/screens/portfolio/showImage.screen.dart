import 'package:flutter/material.dart';

class ShowImageScreen extends StatelessWidget {
  final String url;
  ShowImageScreen({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      appBar: AppBar(
        title: Text('Foto'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Image.network(url),
      ),
    );
  }
}
