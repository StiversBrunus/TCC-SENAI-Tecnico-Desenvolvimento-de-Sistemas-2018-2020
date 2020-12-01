import 'dart:convert';
import 'dart:io';

import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/user.dart';
import 'package:fypp/app/utils/api.dart';
import 'package:http/http.dart';
import 'package:mime/mime.dart';

class SignUpController {
  Future<User> userSignUp(User user) async {
    Response response = await post(
      Api.BASE_URL + 'cliente',
      headers: Api.BASE_HEADER,
      body: jsonEncode(
        user.toJson(),
      ),
    );

    if (response.statusCode == 201) {
      return User.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  Future<Photographer> photographerSignUp(Photographer photographer) async {
    Response response = await post(
      Api.BASE_URL + 'fotografo',
      headers: Api.BASE_HEADER,
      body: jsonEncode(
        photographer.toJson(),
      ),
    );

    if (response.statusCode == 201) {
      return Photographer.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  Future<Photographer> updateWithCategories(Photographer photographer) async {
    Response response = await put(
      Api.BASE_URL + 'fotografo/${photographer.id}',
      headers: Api.BASE_HEADER,
      body: jsonEncode(
        photographer.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      return Photographer.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  Future<User> updateUserProfilePic(User user, String urlImage) async {
    Response response = await put(
      Api.BASE_URL + 'cliente/${user.id}',
      headers: Api.BASE_HEADER,
      body: jsonEncode(
        user.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  Future<Photographer> updatePhotographerProfilePic(
      Photographer photographer, String urlImage) async {
    Response response = await put(
      Api.BASE_URL + 'fotografo/${photographer.id}',
      headers: Api.BASE_HEADER,
      body: jsonEncode(
        photographer.toJson(),
      ),
    );

    if (response.statusCode == 200) {
      return Photographer.fromJson(jsonDecode(response.body));
    }

    return null;
  }

  Future<String> sendProfilePic(File image) async {
    var mime = lookupMimeType(image.path, headerBytes: [0xFF, 0xD8]).split('/');
    String base64 = base64Encode(image.readAsBytesSync());
    String filename = DateTime.now().microsecondsSinceEpoch.toString() +
        image.path.split('/').last;
    String mimeType = mime[0] + '/' + mime[1];

    Response response = await post(
      Api.BASE_URL + 'upload/imagem',
      headers: Api.IMAGE_BASE_HEADER,
      body: jsonEncode(
        {
          'filename': filename,
          'mimetype': mimeType,
          'base64': base64,
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }
}
