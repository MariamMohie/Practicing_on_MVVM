import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:practicing_on_mvvm/user_list/Models/user_list_model.dart';
import 'package:practicing_on_mvvm/user_list/Utils/constants.dart';
import 'package:practicing_on_mvvm/user_list/repos/api_status.dart';
//! We will use http package in Api

//? creating class for UserServices

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var response = await http.get(Uri.parse(USERS_LIST));
      if (SUCCESS == response.statusCode) {
        return Success(response: usersListModelFromJson(response.body));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}