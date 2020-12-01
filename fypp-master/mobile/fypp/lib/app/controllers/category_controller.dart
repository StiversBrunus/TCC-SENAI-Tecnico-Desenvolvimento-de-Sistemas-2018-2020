import 'dart:convert';

import 'package:fypp/app/model/category.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/utils/api.dart';
import 'package:http/http.dart';

class CategoryController {
  Future<List<Category>> getCategories() async {
    Response response = await get(Api.BASE_URL + 'especialidades');
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var content = body['content'];
      List<Category> categories = [];
      for (var c in content) {
        Category category = Category(
          id: c['id'],
          name: c['nome'],
          image: c['imagem'],
        );
        categories.add(category);
      }
      return categories;
    }

    return null;
  }

  Future<List<Photographer>> getPhotographersByCategory(int id) async {
    Response response = await get(Api.BASE_URL + 'fotografos/categoria/$id');
    if (response.statusCode == 200) {
      List<Photographer> photographers = [];
      for (var p in jsonDecode(response.body)) {
        Photographer photographer = Photographer.fromJson(p);
        photographers.add(photographer);
      }
      return photographers;
    }
  }
}
