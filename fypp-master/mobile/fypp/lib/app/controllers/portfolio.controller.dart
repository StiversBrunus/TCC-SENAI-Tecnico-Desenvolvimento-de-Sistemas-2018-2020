import 'dart:convert';

import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/portfolio.dart';
import 'package:fypp/app/model/portfolioPhoto.dart';
import 'package:fypp/app/utils/api.dart';
import 'package:http/http.dart';

class PortfolioController {
  Future<Portfolio> newPortfolio(Portfolio port) async {
    Response response = await post(
      Api.BASE_URL + 'portfolio',
      headers: Api.BASE_HEADER,
      body: jsonEncode(
        port.toJson(),
      ),
    );

    if (response.statusCode == 201) {
      return Portfolio.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  Future<List<Portfolio>> getPortfoliosByPhotographer(int id) async {
    Response response = await get(
      Api.BASE_URL + 'portfolios/$id',
      headers: Api.BASE_HEADER,
    );

    if (response.statusCode == 200) {
      List<Portfolio> portfolios = [];
      for (var port in jsonDecode(response.body)) {
        portfolios.add(Portfolio.fromJson(port));
      }
      return portfolios;
    }

    return null;
  }

  Future<List<PortfolioPhoto>> getPhotosByPortfolio(int id) async {
    Response response = await get(
      Api.BASE_URL + 'portfolios/fotos/$id',
      headers: Api.BASE_HEADER,
    );

    if (response.statusCode == 200) {
      List<PortfolioPhoto> photos = [];
      for (var photo in jsonDecode(response.body)) {
        photos.add(PortfolioPhoto.fromJson(photo));
      }
      return photos;
    }

    return null;
  }

  Future<Photographer> updateWithPortfolio(Photographer photographer) async {
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
}
