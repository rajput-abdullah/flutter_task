import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/users_list/users_list_provider.dart';
import 'package:provider/provider.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {

   late UsersListProvider usersListProvider;



  @override
  void initState() {
    usersListProvider =
        Provider.of<UsersListProvider>(context, listen: false);
    usersListProvider.init(context: context);
    // usersListProvider.usersListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<UsersListProvider>(context, listen: true);

    return  Scaffold(
      appBar: AppBar(title:Text("Info",style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),),),
      body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.05,
              vertical: MediaQuery.of(context).size.width*0.05,
          ),
          // height: sizes!.heightRatio * 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Resource taken from: https://jsonplaceholder.typicode.com/posts/1",style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("User ID: ${usersListProvider.usersListModel.id}",style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("Title: ${usersListProvider.usersListModel.title}",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              SizedBox(height: 50,),
              Text("Body: ${usersListProvider.usersListModel.body}",style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),)
            ],
          )
      ),
    );
  }
}
