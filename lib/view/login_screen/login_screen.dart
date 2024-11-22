import 'package:flutter/material.dart';
import 'package:sample/view/home_screen/home_screen.dart';
import 'package:sample/view/registration_screen/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.arrow_back)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Text(
                'Sign in to Your account',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Your Email Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: "Your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(value: false, onChanged: (value) => true),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ));
                      },
                      child: Text("Forgot Password")),
                ],
              ),
              SizedBox(height: 10),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () async {
                  final SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  String? savedEmail = pref.getString('email');
                  String? savedPassword = pref.getString('password');
                  if (emailController.text == savedEmail &&
                      passwordController.text == savedPassword) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  }
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Do not have an account?'),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ));
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
