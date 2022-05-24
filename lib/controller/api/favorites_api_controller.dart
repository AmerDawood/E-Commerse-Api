

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:softagi_api/model/favorite_model.dart';
import 'package:softagi_api/utils/helpers.dart';

import '../../model/cart_model.dart';
import '../../model/product_model.dart';
import '../../prefs/user_pref_controller.dart';
import '../api_settings.dart';
import 'package:http/http.dart' as http;

class FavoritesApiController with Helpers {

  Future<bool> addFavorites({required BuildContext context,
    required String id,
  }) async {
    var url = Uri.parse(ApiSettings.Favorites);
    var response = await http.post(
        url,
        headers: {
          HttpHeaders.authorizationHeader: UserPreferenceController().token,
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: {
          'product_id': id,

        }
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == true) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
        );

        return true;
      } else if (jsonResponse['status'] == false) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
        );

        return false;
      }
    } else if (response.statusCode == 400) {
      //
    }

    return false;
  }

  Future<List<FavoriteModel>> getFavorite() async {
    var url = Uri.parse(ApiSettings.Favorites);

    var response = await http.get(url,
      headers: {
        HttpHeaders.authorizationHeader: UserPreferenceController().token,
        HttpHeaders.acceptHeader: 'application/json',
      },
    );


    var decoded = json.decode(response.body);
// print(decoded['data']['data']);

    if (response.statusCode == 200) {
      return (decoded['data']['data'] as List)
          .map((json) => FavoriteModel.fromJson(json))
          .toList();
    } else if (response.statusCode == 400) {
      throw HttpException(decoded['message']);
    } else {}
    return [];
  }

  Future<bool> deleteFavorite() async {
    var url = Uri.parse(ApiSettings.Favorites);

    var response = await http.delete(url,
      headers: {
        HttpHeaders.authorizationHeader: UserPreferenceController().token,
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    return true;
  }


  //====================================

  Future<bool> addToCarts({required BuildContext context,
    required String id,
  }) async {
    var url = Uri.parse(ApiSettings.CARTS);
    var response = await http.post(
        url,
        headers: {
          HttpHeaders.authorizationHeader: UserPreferenceController().token,
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: {
          'product_id': id,

        }
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse['status'] == true) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
        );

        return true;
      } else if (jsonResponse['status'] == false) {
        showSnackBar(
          context: context,
          message: jsonDecode(response.body)['message'],
        );

        return false;
      }
    } else if (response.statusCode == 400) {
      //
    }

    return false;
  }

  Future<List<CartModel>> getCarts() async {
    var url = Uri.parse(ApiSettings.CARTS);

    var response = await http.get(url,
      headers: {
        HttpHeaders.authorizationHeader: UserPreferenceController().token,
        HttpHeaders.acceptHeader: 'application/json',
      },
    );


    var decoded = json.decode(response.body);
print(decoded['data']['cart_items']);

    if (response.statusCode == 200) {
      return (decoded['data']['cart_items'] as List) 
          .map((json) => CartModel.fromJson(json))
          .toList();
    } else if (response.statusCode == 400) {
      throw HttpException(decoded['message']);
    } else {}
    return [];
  }

  Future<bool> deleteFCarts() async {
    var url = Uri.parse(ApiSettings.CARTS);

    var response = await http.delete(url,
      headers: {
        HttpHeaders.authorizationHeader: UserPreferenceController().token,
        HttpHeaders.acceptHeader: 'application/json',
      },
    );
    return true;
  }

}