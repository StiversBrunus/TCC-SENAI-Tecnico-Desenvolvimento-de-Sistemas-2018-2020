import 'dart:convert';

import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/portfolio.dart';
import 'package:fypp/app/utils/api.dart';
import 'package:http/http.dart';

class PhotographerController {
  Future<List<Photographer>> getPhotographers() async {
    Response response = await get(Api.BASE_URL + 'fotografos');
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var content = body['content'];
      List<Photographer> photographers = [];
      List<Portfolio> portfolios = [];
      for (var p in content) {
        Photographer photographer = Photographer.fromJson(p);
        photographers.add(photographer);
      }
      return photographers;
    }

    return null;
  }
}
