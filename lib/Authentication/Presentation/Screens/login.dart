import 'package:fapplerv2/Shared/Widgets/LogoPosition.dart';
import 'package:flutter/material.dart';

import 'TypesOfAccounts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  logo(),
                  SizedBox(height: 20),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Login To Continue Using The App",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade600, // Hint text color
                        fontSize: 16,
                        fontFamily: 'Roboto', // Change font family if available
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200, // Background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), // Rounded corners
                        borderSide: BorderSide.none, // Removes the default border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.deepPurple, // Border color when focused
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300, // Border color when enabled
                          width: 1,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto', // Change font family if needed
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade600, // Hint text color
                        fontSize: 16,
                        fontFamily: 'Roboto', // Change font family if available
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200, // Background color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12), // Rounded corners
                        borderSide: BorderSide.none, // Removes the default border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.deepPurple, // Border color when focused
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300, // Border color when enabled
                          width: 1,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto', // Change font family if needed
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Button color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Optional padding
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20), // Optional font size
              ),
            ),
            SizedBox(height: 20),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => IdentificationScreen()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have an Account?",
                    style: TextStyle(fontSize: 15),
                  ),
                  Container(
                    width: 5,
                  ),
                  Text(
                    "Register",
                    style: TextStyle(fontSize: 18, color: Colors.red, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }


}
