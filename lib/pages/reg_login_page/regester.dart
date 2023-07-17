// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skillhunt/widgets/google_btn.dart';
import 'package:skillhunt/pages/reg_login_page/login.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_textfield.dart';
import '../home.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? name, username, email, pass, conpass;
  bool Showpassword = false;
  bool ShowConfirmpassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),

                  //images
                  Icon(Icons.lock, size: 50),
                  SizedBox(height: 30),

                  //welcome
                  Text(
                    'Be a new Member!!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 15),

                  //Name field
                  CustomTextFormFeild(
                    onChanged: (value) {
                      name = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter name";
                      }
                    },
                    hintText: "Name",
                    // labelText: "Full Name",
                    prefixIcon: Icon(Icons.person),
                  ),

                  SizedBox(height: 10),

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

                  //Email field
                  CustomTextFormFeild(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Email";
                      }
                    },
                    hintText: "Username",
                    // labelText: "Email",
                    prefixIcon: Icon(Icons.email),
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
                      } else if (!RegExp(
                              "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@!%*?&])[A-Za-z\d@!%*?&]{8,10}")
                          .hasMatch(value)) {
                        return "Minimum eight and maximum 10 characters, \n at least one uppercase letter,\n one lowercase letter, one number and one special character ";
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

                  //Confirm password field
                  CustomTextFormFeild(
                    onChanged: ((value) {
                      conpass = value;
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
                  
                  SizedBox(height: 25),

                  //skip in button
                  Container(
                    height: 60,
                    width: 500,
                    child: MyBtn(
                      btnName: 'Register',
                      btnBgColor: Colors.black,
                      prefixIcon: Icon(Icons.lock_clock_rounded),
                      btnColor: Color.fromARGB(255, 242, 239, 239),
                      textStyle: TextStyle(fontSize: 18),
                      onPressed: () {
                        Get.to(Home());
                      },
                    ),
                  ),

                  SizedBox(height: 30),
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
                  SizedBox(height: 30),

                  //google
                  GoogleBtn(imagePath: 'assects/images/google.png'),

                  SizedBox(height: 50),

                  //signup registration

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a Member??',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Login Now',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
