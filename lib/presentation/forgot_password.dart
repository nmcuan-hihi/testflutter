import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:easy_localization/easy_localization.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? emailError;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void handleResetPassword(BuildContext context) async {
    String? email = emailController.text.trim();

    setState(() {
      emailError = null;
    });
    try {
    final methods =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    if (methods.isEmpty) {
      setState(() {
        emailError = 'email_not_found'.tr();
      });
      return;
    }

    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('reset_email_sent'.tr())),
    );
  } on FirebaseAuthException catch (e) {
    print(e.code);
    setState(() {
      emailError = e.message ?? 'error_occurred'.tr();
    });
  } catch (e) {
    print('Unexpected error: $e');
    setState(() {
      emailError = 'unexpected_error'.tr();
    });
  }
    formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('forgot_password_title'.tr()),
        titleTextStyle: TextStyle(
          color: Colors.green,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, left: 15, right: 15),
            child: Form(
              key: formKey,
                child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'input_forgot_email'.tr(),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.5,
                )),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.green,
                  width: 2.5,
                )),
                suffixIcon: emailController.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () => handleResetPassword(context),
                        icon: Icon(Icons.send, color: Colors.green),
                      ),
              ),
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
                if (emailError != null) {
                  return emailError;
                }
                return null;
              },
            )),
          ),
        ],
      ),
    );
  }
}
