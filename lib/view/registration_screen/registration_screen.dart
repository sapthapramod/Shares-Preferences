import 'package:flutter/material.dart';
import 'package:sample/view/home_screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmParrwordcontroller = TextEditingController();
  String? savedEmail;
  String? savedPassword;
  String? confirmParrword;
  String? passwordError;

  Future<void> saveCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedEmail = emailController.text;
    final savedPassword = passwordController.text;
    final confirmPassword = confirmParrwordcontroller.text;

    if (savedPassword != confirmPassword) {
      setState(() {});
      passwordError = 'Password missmatch';
      return;
    }

    if (savedEmail.isNotEmpty && savedPassword.isNotEmpty) {
      await prefs.setString('email', savedEmail);
      await prefs.setString('password', savedPassword);
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
  }

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
                'Sign Up for Free',
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
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Your Password",
                    suffix: Icon(Icons.toggle_off, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: confirmParrwordcontroller,
                decoration: InputDecoration(
                    labelText: "Confirm Your Password",
                    suffix: Icon(Icons.toggle_off, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: saveCredentials,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationScreen(),
                            ));
                      },
                      child: Text(
                        'Login in',
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
