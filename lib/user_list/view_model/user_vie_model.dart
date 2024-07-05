import 'package:flutter/material.dart';
import 'package:practicing_on_mvvm/user_list/Models/user_error.dart';
import 'package:practicing_on_mvvm/user_list/Models/user_list_model.dart';
import 'package:practicing_on_mvvm/user_list/repos/api_status.dart';
import 'package:practicing_on_mvvm/user_list/repos/user_servcies.dart';
//! create User view Model Class Must extend ChangeNotifier
class UsersViewModel extends ChangeNotifier {
  //
  bool _loading = false;
  List<UserModel> _userListModel = [];
  //  UserError _userError;
  // UserModel _selectedUser;
  UserModel _addingUser = UserModel();

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  // UserError get userError => _userError;
  // UserModel get selectedUser => _selectedUser;
  UserModel get addingUser => _addingUser;

  UsersViewModel() {
    getUsers();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  // setUserError(UserError userError) {
  //   _userError = userError;
  // }

  // setSelectedUser(UserModel userModel) {
  //   _selectedUser = userModel;
  // }

  // addUser() async {
  //   if (!isValid()) {
  //     return;
  //   }
  //   _userListModel.add(addingUser);
  //   _addingUser = UserModel();
  //   notifyListeners();
  //   return true;
  // }

  // isValid() {
  //   if (addingUser.name == null || addingUser.name.isEmpty) {
  //     return false;
  //   }
  //   if (addingUser.email == null || addingUser.email.isEmpty) {
  //     return false;
  //   }
  //   return true;
  // }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );
     // setUserError(userError);
    }
    setLoading(false);
  }
}
