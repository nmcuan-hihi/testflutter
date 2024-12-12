import 'package:flutter/material.dart';
import 'package:testflutter/app/configs/route_name.dart';
import 'package:testflutter/app/resources/color_manager.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign - Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.bgColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  labelText: "User Name",
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.bgColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.bgColor, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.bgColor, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.mail, color: AppColors.bgColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.bgColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.bgColor, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppColors.bgColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.bgColor, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.bgColor, width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.password,
                    color: AppColors.bgColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.bgColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.bgColor),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NextScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width - 30, 50),
                  backgroundColor: AppColors.bgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
                child: Text(
                  'sign_up'.tr(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'have_acc'.tr(),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.loginScreen);
                    },
                    child: Text(
                      'login_button'.tr(),
                      style: const TextStyle(
                        color: AppColors.bgColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Screen'),
      ),
      body: const Center(
        child: Text(
          'This is the next screen!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
