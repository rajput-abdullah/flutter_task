import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/users_list/users_list_provider.dart';
import 'package:provider/provider.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {

   UsersListProvider usersListProvider;



  @override
  void initState() {
    usersListProvider =
        Provider.of<UsersListProvider>(context, listen: false);
    usersListProvider.init(context: context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<UsersListProvider>(context, listen: true);

    return  Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.05,
              vertical: MediaQuery.of(context).size.width*0.05,
          ),
          // height: sizes!.heightRatio * 50,
          child: Column(
            children: [
              Text("${usersListProvider.usersListModel.id}"),
              Text("${usersListProvider.usersListModel.title}"),
              Text("${usersListProvider.usersListModel.body}")
            ],
          )
      ),
    );
  }
}
