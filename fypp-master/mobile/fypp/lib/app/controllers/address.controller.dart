import 'dart:convert';

import 'package:fypp/app/model/address.dart';

import 'package:fypp/app/utils/api.dart';
import 'package:http/http.dart';

class AddressController {
  Future<Address> addAddress(Address address) async {
    Response response = await post(
      Api.BASE_URL + 'endereco',
      headers: Api.BASE_HEADER,
      body: jsonEncode(address.toJson()),
    );

    if(response.statusCode == 201){
      return Address.fromJson(jsonDecode(response.body));
    }

    return null;

  }
}
