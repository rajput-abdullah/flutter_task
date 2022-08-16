import 'package:flutter/material.dart';
import 'package:flutter_task/Constants/constant_colors.dart';
import 'package:flutter_task/FirebaseAuthService/firebaseauthservice.dart';
import 'package:flutter_task/auth/sign_up_screen.dart';
import 'package:flutter_task/res/toasts.dart';
import 'package:flutter_task/users_list/users_list_screen.dart';
import 'package:provider/provider.dart';


class Login extends StatefulWidget {
  const Login({Key ?key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      // WillPopScope(
      //     onWillPop: () => SystemNavigator.pop(),
      //
      //     child:
          Container(
            color: ConstantColor.WHITE,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "LOGIN SCREEN",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("SIGN IN")),
                        const SizedBox(height: 10),
                        TextField(
                          style: const TextStyle(
                              color: ConstantColor.WHITE, fontSize: 13),
                          controller: emailController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              fillColor: ConstantColor.DARK_BLUE,
                              filled: true,
                              hintText: "EMAIL*",
                              hintStyle: const TextStyle(
                                  color: ConstantColor.WHITE, fontSize: 13)),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          style: const TextStyle(
                              color: ConstantColor.WHITE, fontSize: 13),
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              fillColor: ConstantColor.DARK_BLUE,
                              filled: true,
                              hintText: "PASSWORD*",
                              hintStyle: const TextStyle(
                                  color: ConstantColor.WHITE, fontSize: 13)),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 13),
                            onPressed: () {
                              if (emailController.text.isEmpty) {
                                // Util.showSnack(context, "Kindly enter email!");
                                Toasts.getErrorToast(text: "Kindly enter email!");

                              } else if (passwordController.text.isEmpty) {
                                // Util.showSnack(context, "Kindly enter password!");
                                Toasts.getErrorToast(text: "Kindly enter password!");

                              } else {
                                context
                                    .read<AuthenticationService>()
                                    .signIn(
                                        email: emailController.text.trim(),
                                        password: passwordController.text.trim())
                                    .then((value) {
                                      if(value=="user-not-found")
                                        {
                                          // Util.showSnack(context, ("No user found for that email."));
                                          Toasts.getErrorToast(text: "No user found for that email.");

                                        }
                                      else if(value=="wrong-password")
                                        {
                                          // Util.showSnack(context, ("Wrong password provided for that user."));
                                          Toasts.getErrorToast(text: "Wrong password provided for that user.");

                                        }

                                      else if(value=="signed-in")
                                        {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                   UsersListScreen()));
                                          // Util.showSnack(context, "Successfully signed in!!");
                                          Toasts.getErrorToast(text: "Successfully signed in!!");

                                        }
                                      else
                                        {
                                          // Util.showSnack(context, "Something Went Wrong!!");
                                          Toasts.getErrorToast(text: "Something Went Wrong!!");

                                        }
                                });
                              }

                              /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );*/
                            },
                            color: ConstantColor.YELLOW,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: const Text("LOGIN"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  SignUp()));
                            },
                            child: const Text(
                              "CREATE AN ACCOUNT",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 11),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ))
      // ),
    );
  }
}
