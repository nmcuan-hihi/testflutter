import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:testflutter/app/configs/route_name.dart';
import 'homePage.dart';
import 'forgot_password.dart';

// Future<User?> loginWithEmailAndPassword(String email, String password) async {
//   try {
//     UserCredential userCredential = await FirebaseAuth.instance
//         .signInWithEmailAndPassword(email: email, password: password);

//     return userCredential.user;
//   } on FirebaseAuthException catch (e) {
//     print(e.code);
//   } catch (e) {
//     print('Đã xảy ra lỗi: $e');
//   }
//   return null;
// }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? loginlError;
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      loginlError = null;
    });

    if (formKey.currentState?.validate() == true) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (userCredential != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          loginlError = 'login_error'.tr();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 250, bottom: 100),
            child: Text(
              'login_screen_logo'.tr(),
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                 Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'login_form_username'.tr(),
                        //hintText: 'Username',
                        prefixIcon: const Icon(Icons.person, color: Colors.green),
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 2.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 2.0),
                        ),
                        suffixIcon: emailController.text.isEmpty
                            ? null
                            : IconButton(
                                 icon: Icon(
                                  Icons.clear,
                                  color: Colors.green,
                                ),
                                onPressed: () {
                                  setState(() {
                                    emailController.clear();
                                  });
                                },
                              )),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'email_required'.tr();
                      }
                      String emailPattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      RegExp regex = RegExp(emailPattern);
                      if (!regex.hasMatch(value)) {
                        return 'email_invalid'.tr();
                      }
                      if (loginlError != null) {
                        return loginlError;
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _obscurePassword,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      labelText: 'login_form_password'.tr(),
                      prefixIcon: const Icon(Icons.key, color: Colors.green),
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2.5),
                      ),
                      suffixIcon: passwordController.text.isEmpty? null:
                      IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'password_required'.tr();
                      }
                      if (value.length < 6) {
                        return 'password_min_length'.tr();
                      }
                      if (loginlError != null) {
                        return loginlError;
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 18, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen()));
                  },
                  child: Text(
                    'forgot_password'.tr(),
                    style: const TextStyle(
                      color: Colors.green,
                      //fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () => handleLogin(context),
              child: Text(
                'login_button'.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 30, 50),
                  backgroundColor: const Color.fromARGB(255, 116, 215, 119),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "didn't_have_account".tr(),
                  style:const TextStyle(
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.signUpScreen);
                  },
                  child: Text(
                     'sign_up'.tr(),
                  
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.green,
                  ),
                  ),
                ),
                 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
