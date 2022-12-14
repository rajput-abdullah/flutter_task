import 'package:flutter/material.dart';

import 'package:flutter_task/Constants/constant_colors.dart';
import 'package:flutter_task/FirebaseAuthService/firebaseauthservice.dart';
import 'package:flutter_task/auth/login.dart';
import 'package:flutter_task/res/toasts.dart';
import 'package:provider/provider.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key ?key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController =  TextEditingController();
  final TextEditingController retypePassController =  TextEditingController();
  final TextEditingController firstNameController =  TextEditingController();
  final TextEditingController lastNameController =  TextEditingController();
  bool validate=false;



  @override
  Widget build(BuildContext context) {
    return
      // WillPopScope(
      // onWillPop: ()=> true,
      // child:
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Container(
            color: ConstantColor.WHITE,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "CREATE AN ACCOUNT",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children:  [
                        TextField(keyboardType: TextInputType.emailAddress,

                          controller: emailController,
                          style: const TextStyle(color: ConstantColor.WHITE, fontSize: 13),
                          decoration: InputDecoration(

                              contentPadding: const EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(40.0),
                              ),focusedBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(40.0),
                          ),
                              fillColor: ConstantColor.DARK_BLUE,
                              filled: true,
                              hintText: "EMAIL*",
                              hintStyle: const TextStyle(color: ConstantColor.WHITE,fontSize: 13)
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: passwordController,
                          obscureText: true,

                          style: const TextStyle(color: ConstantColor.WHITE, fontSize: 13),

                       decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(40.0),
                              ),focusedBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(40.0),
                          ),
                              fillColor: ConstantColor.DARK_BLUE,
                              filled: true,
                              hintText: "PASSWORD*",
                              hintStyle: const TextStyle(color: ConstantColor.WHITE, fontSize: 13)
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: retypePassController,
                          obscureText: true,

                          style: const TextStyle(color: ConstantColor.WHITE, fontSize: 13),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(40.0),
                              ),focusedBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(40.0),
                          ),
                              fillColor: ConstantColor.DARK_BLUE,
                              filled: true,
                              hintText: "RETYPE PASSWORD*",
                              hintStyle: const TextStyle(color: ConstantColor.WHITE,fontSize: 13)
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: firstNameController,

                          style: const TextStyle(color: ConstantColor.WHITE, fontSize: 13),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(40.0),
                              ),focusedBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(40.0),
                          ),
                              fillColor: ConstantColor.DARK_BLUE,
                              filled: true,
                              hintText: "FIRST NAME*",
                              hintStyle: const TextStyle(color: ConstantColor.WHITE,fontSize: 13)
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: lastNameController,

                          style: const TextStyle(color: ConstantColor.WHITE, fontSize: 13),
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:  BorderRadius.circular(40.0),
                              ),focusedBorder: OutlineInputBorder(
                            borderRadius:  BorderRadius.circular(40.0),
                          ),
                              fillColor: ConstantColor.DARK_BLUE,
                              filled: true,
                              hintText: "LAST NAME*",
                              hintStyle: const TextStyle(color: ConstantColor.WHITE,fontSize: 13)
                          ),
                        ),
                        const SizedBox(height: 10),
                        // TextField(
                        //   style: const TextStyle(color: ConstantColor.WHITE, fontSize: 13),
                        //
                        //   decoration: InputDecoration(
                        //       contentPadding: const EdgeInsets.only(left: 20),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(40.0),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius:  BorderRadius.circular(40.0),
                        //       ),focusedBorder: OutlineInputBorder(
                        //     borderRadius:  BorderRadius.circular(40.0),
                        //   ),
                        //       fillColor: ConstantColor.DARK_BLUE,
                        //       filled: true,
                        //       suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined, color: ConstantColor.WHITE, size: 30,),
                        //       hintText: "NSCC CAMPUS*",
                        //       hintStyle: const TextStyle(color: ConstantColor.WHITE,fontSize: 13)
                        //   ),
                        // ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: MaterialButton(
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            onPressed: (){
                              if(emailController.text.isEmpty)
                                {
                                  Toasts.getErrorToast(text: "Kindly enter email!");
                                  // Util.showSnack(context, "Kindly enter email!");
                                }
                              else if(passwordController.text.isEmpty)
                                {
                                  Toasts.getErrorToast(text: "Kindly enter password!");

                                  // Util.showSnack(context, "Kindly enter password!");
                                }
                              else if(retypePassController.text.isEmpty)
                                {
                                  Toasts.getErrorToast(text: "Kindly enter password!");

                                  // Util.showSnack(context, "Kindly retype password!");
                                }
                              else if(firstNameController.text.isEmpty)
                                {
                                  Toasts.getErrorToast(text: "Kindly enter First name!");

                                  // Util.showSnack(context, "Kindly enter First name!");
                                }
                              else if(lastNameController.text.isEmpty)
                                {
                                  Toasts.getErrorToast(text: "Kindly enter Last name!");

                                  // Util.showSnack(context, "Kindly enter Last name!");
                                }
                              else if(passwordController.text != retypePassController.text )
                                {
                                  Toasts.getErrorToast(text: "Passwords Do Not Match!!!");

                                  // Util.showSnack(context, "Passwords Do Not Match!!!");
                                }
                              else if(passwordController.text.length<8 )
                                {
                                  Toasts.getErrorToast(text: "Password must contain 8 character");

                                  // Util.showSnack(context, "Password must contain 8 character.");
                                }
                              else
                                {
                                  context.read<AuthenticationService>().signUp(email: emailController.text.trim(), password: passwordController.text.trim()).then((value) => {
                                    if(value=="weak-password")
                                      {
                                      Toasts.getErrorToast(text: "Weak Password!!")

                                  // Util.showSnack(context, "!\nPassword must contain at least one special character, lower & uppercase letter and numbers.")
                                      }
                                    else if( value=="email-already-in-use")
                                      {
                                      Toasts.getErrorToast(text: "The account already exists for that email")

                                      // Util.showSnack(context, "The account already exists for that email.")
                                      }
                                    else if(value=="something-went-wrong")
                                      {
                                      Toasts.getErrorToast(text: "Something Went Wrong!")


                                      // Util.showSnack(context, "Something Went Wrong!!");
                                      }else if(value=="signed-up")
                                      {
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login())),
                                        // Util.showSnack(context, "Successfully Signed Up!")
                                        Toasts.getErrorToast(text: "Successfully Signed Up!")

                                      }

                                    else
                                      {
                                        Toasts.getErrorToast(text: "Something Went Wrong")

                                        // Util.showSnack(context, "Something Went Wrong!!")

                                      }
                                  });

                                }


                            },
                            color: ConstantColor.YELLOW,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: const Text("SUBMIT"),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "Already have an account? Sign in", style: TextStyle(    decoration: TextDecoration.underline,
                                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                        Expanded(
                          child: TextButton(
                            onPressed: (){},
                            child: const Text("BY SUBMITTING THE FOLLOWING INFORMATION YOU AGREE TO THE TERMS AND CONDITIONS AND OUR PRIVACY POLICY.", style: TextStyle(    decoration: TextDecoration.underline,
                                color: Colors.black, fontSize: 11),),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
        ),
      );
    // );
  }


}
