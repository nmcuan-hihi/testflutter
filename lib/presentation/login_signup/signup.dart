import 'package:flutter/material.dart';

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
                  color: Color.fromARGB(255, 5, 238, 13),
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
                prefixIcon: Icon(Icons.person, color: Color.fromARGB(255, 5, 238, 13),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 5, 238, 13), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 5, 238, 13), width: 1.0),
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
                prefixIcon: Icon(Icons.mail, color: Color.fromARGB(255, 5, 238, 13),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 5, 238, 13), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 5, 238, 13), width: 1.0),
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
                prefixIcon: Icon(Icons.phone, color: Color.fromARGB(255, 5, 238, 13),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 5, 238, 13), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 5, 238, 13), width: 1.0),
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
                prefixIcon: Icon(Icons.password, color: Color.fromARGB(255, 5, 238, 13),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 5, 238, 13), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 5, 238, 13), width: 1.0),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NextScreen()),
                  );
                },
                
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width-30, 50),
                  backgroundColor: Color.fromARGB(255, 5, 238, 13),
                  
               ),
                child: const Text('Sign Up', style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), 
                    fontSize: 20,
                ),),
              ),
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
