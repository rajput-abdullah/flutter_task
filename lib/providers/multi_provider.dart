

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_task/FirebaseAuthService/firebaseauthservice.dart';
import 'package:flutter_task/users_list/users_list_provider.dart';
import 'package:provider/provider.dart';

final multiProviders = [
  ChangeNotifierProvider<UsersListProvider>(
    create: (_) => UsersListProvider(),
    lazy: true,
  ),
  Provider<AuthenticationService> (create: (_)=>AuthenticationService(FirebaseAuth.instance),),
  StreamProvider(create: (context)=>context.read<AuthenticationService>().authStateChanges, initialData: null,)
];
