import 'package:flutter/material.dart';

class EditUserProfile extends StatefulWidget {
  EditUserProfile({Key key}) : super(key: key);

  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('editar perfil'),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.save,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(14)),
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 60,
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  labelText: 'Nome',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.location_city,
                  ),
                  labelText: 'CEP',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone_android,
                  ),
                  labelText: 'Celular',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                  labelText: 'Senha',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
