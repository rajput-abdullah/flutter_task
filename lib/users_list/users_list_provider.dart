
import 'package:flutter/cupertino.dart';
import 'package:flutter_task/models/users_list_model.dart';
import 'package:flutter_task/network_manager/api_url.dart';
import 'package:flutter_task/network_manager/models.dart';
import 'package:flutter_task/network_manager/my_api.dart';

class UsersListProvider extends ChangeNotifier{
  late BuildContext context;
  UsersListModel usersListModel =UsersListModel();

  List<dynamic> productList = [];


  Future<void> init({required BuildContext context}) async {
    this.context = context;
    await usersListApi();
  }


  Future<bool> usersListApi() async {
    try {
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      usersListModel = await MyApi.callGetApi(
        url: usersListUrl,
        myHeaders: header,
        modelName: Models.usersListModel,
      );
      // if (usersListModel.code == 1) {
        debugPrint("usersListModel : ${usersListModel.body}");
        notifyListeners();
        return true;
      // } else {
      //   debugPrint("usersListModel: Something wrong");
      //   return false;
      // }
    } catch (e) {
      debugPrint("Catch-Error: ${e.toString()}");
      return false;
    }
  }

}