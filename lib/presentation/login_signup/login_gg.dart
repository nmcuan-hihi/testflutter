import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:testflutter/app/configs/route_name.dart';
import 'package:testflutter/app/resources/color_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testflutter/services/auth_service.dart';


class LoginGg extends StatefulWidget {
  const LoginGg({super.key});

  @override
  State<LoginGg> createState() => _LoginGgState();
}

class _LoginGgState extends State<LoginGg> with SingleTickerProviderStateMixin {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? loginError;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handleLogin(BuildContext context) async {
    emailController.text = emailController.text.trim();

    setState(() {
      loginError = null;
    });

    if (formKey.currentState?.validate() == true) {
      String email = emailController.text.trim();
      // Handle login logic
    }
  }

  Future<void> handleGoogleLogin() async {
    
    AuthService().signInWithGoogle();
    Navigator.pushNamed(context, RouteName.signUpScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              'start'.tr(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              'my_app'.tr(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.bgColor,
              ),
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'login_form_username'.tr(),
                prefixIcon: const Icon(Icons.mail, color: AppColors.bgColor),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.bgColor, width: 2.0),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.bgColor, width: 2.0),
                ),
                suffixIcon: emailController.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(
                          Icons.clear,
                          color: AppColors.bgColor,
                        ),
                        onPressed: () {
                          setState(() {
                            emailController.clear();
                          });
                        },
                      ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'email_required'.tr();
                }
                String emailPattern =
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$';
                RegExp regex = RegExp(emailPattern);
                if (!regex.hasMatch(value)) {
                  return 'email_invalid'.tr();
                }
                if (loginError != null) {
                  return loginError;
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => handleLogin(context),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width - 30, 50),
                backgroundColor: AppColors.bgColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                'login_button'.tr(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Expanded(
                  child: Divider(color: Colors.grey, thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'or'.tr(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.bgOrangeColor,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(color: Colors.grey, thickness: 1),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: handleGoogleLogin,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width - 30, 50),
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              icon: const Icon(
                Icons.g_mobiledata,
                color: Colors.black,
              ),
              label: const Text(
                'Login with Google',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Facebook login
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width - 30, 50),
                backgroundColor: Colors.white,
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              icon: const Icon(
                Icons.facebook,
                color: Colors.blue,
              ),
              label: const Text(
                'Login with Facebook',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
