import 'package:fapplerv2/Authentication/Data/authenticationController.dart';
import 'package:fapplerv2/Authentication/Presentation/Screens/login.dart';
import 'package:fapplerv2/Shared/Widgets/LogoPosition.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  final controller = Get.put(SignUpController());

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
                    "Sign Up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Create an account to continue",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  SizedBox(height: 20),
                  buildTextField(
                    "Full Name",
                    "Enter your full name",
                    controller.fullName,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  buildTextField(
                    "Email",
                    "Enter your email",
                    controller.email,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || !GetUtils.isEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  buildTextField(
                    "Password",
                    "Enter your password",
                    controller.password,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  buildTextField(
                    "Age",
                    "Enter your age",
                    controller.age,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      if (int.tryParse(value) == null || int.parse(value) <= 0) {
                        return 'Please enter a valid age';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  buildDropdownField(
                    "Gender",
                    ["Male", "Female", "Other"],
                    controller.gender.value,
                        (value) => setState(() => controller.gender.value = value!),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your gender';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  buildTextField(
                    "Address",
                    "Enter your address",
                    controller.address,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  buildDropdownField(
                    "Relationship Type",
                    ["Family", "Friend", "Caregiver", "Other"],
                    controller.relationType.value,
                        (value) => setState(() => controller.relationType.value = value!),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your relationship type';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (formState.currentState!.validate()) {
                  // Handle sign-up logic here
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, String hint, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, bool obscureText = false, String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
              fontFamily: 'Roboto',
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.deepPurple,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
          ),
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
          validator: validator,
        ),
      ],
    );
  }

  Widget buildDropdownField(String label, List<String> items, String? selectedValue, Function(String?) onChanged, {String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        DropdownButtonFormField<String>(
          value: selectedValue,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.deepPurple,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
