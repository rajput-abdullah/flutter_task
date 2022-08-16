
import 'package:flutter_task/models/users_list_model.dart';

class Models {
  static const String usersListModel = "UsersListModel";

  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case usersListModel:
        return UsersListModel.fromJson(json);


    }
  }
}
