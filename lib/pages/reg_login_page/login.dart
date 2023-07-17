// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillhunt/widgets/my_button.dart';
import 'package:skillhunt/widgets/google_btn.dart';
import 'package:skillhunt/pages/reg_login_page/regester.dart';
import 'package:skillhunt/widgets/my_textfield.dart';
import '../home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? username, pass;
  bool Showpassword = false;
  bool ShowConfirmpassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50),

                      //images
                      Icon(Icons.lock, size: 100),

                      SizedBox(height: 50),

                      //welcome
                      Text(
                        'Welcome back',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                      ),

                      SizedBox(height: 25),

                      //username field
                      CustomTextFormFeild(
                        onChanged: (value) {
                          username = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter Username";
                          }
                        },
                        hintText: "Username",
                        // labelText: "Username",
                        prefixIcon: Icon(Icons.person),
                      ),

                      SizedBox(height: 10),

                      //password field
                      CustomTextFormFeild(
                        onChanged: ((value) {
                          pass = value;
                        }),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "please enter password";
                          }
                        }),
                        hintText: "Enter your Password",
                        // labelText: "full password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: (() {
                              if (Showpassword == true) {
                                Showpassword = false;
                              } else {
                                Showpassword = true;
                              }
                              setState(() {
                                Showpassword;
                              });
                            }),
                            icon: Icon(Showpassword == true
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        obscureText: Showpassword == true ? false : true,
                      ),

                      SizedBox(height: 10),

                      //forget password
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forget Password?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 22, 22, 22),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 15),

                      //button for SignIn
                      Container(
                        height: 60,
                        width: 500,
                        child: MyBtn(
                          btnName: 'Login',
                          btnBgColor: Colors.black,
                          btnColor: Color.fromARGB(255, 241, 238, 238),
                          textStyle: TextStyle(fontSize: 18),
                          prefixIcon: Icon(Icons.lock),
                          onPressed: () {
                            Get.to(Home());
                          },
                        ),
                      ),

                      SizedBox(height: 50),

                      //continue with
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                          Text('Or Continue With'),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),

                      //google
                      GoogleBtn(imagePath: 'assects/images/google.png'),

                      SizedBox(height: 50),

                      //signup regestration

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Not a Member??',
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => RegisterPage(),
                              );
                            },
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
