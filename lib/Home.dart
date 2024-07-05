import 'package:flutter/material.dart';
import 'package:practicing_on_mvvm/user_list/Models/user_list_model.dart';
import 'package:practicing_on_mvvm/user_list/components/app_loading.dart';
import 'package:practicing_on_mvvm/user_list/view_model/user_vie_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UsersViewModel userViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: _ui(userViewModel),
    );
  }

  Widget _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return  AppLoading();
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        UserModel userModel = usersViewModel.userListModel[index];
        return ListTile(
          title: Text(userModel.name!),
          subtitle: Text(userModel.email!),
        );
      },
      separatorBuilder: (context, index) => Divider(),
      itemCount: usersViewModel.userListModel.length,
    );
  }
}
