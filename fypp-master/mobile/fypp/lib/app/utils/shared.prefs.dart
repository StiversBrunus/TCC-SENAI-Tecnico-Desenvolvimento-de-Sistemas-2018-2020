import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  getAndSaveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('jwttoken', token);
  }

  Future<String> getAndReadToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString('jwttoken');
    if(token != null){
      return token;
    }
    return null;
  }

}