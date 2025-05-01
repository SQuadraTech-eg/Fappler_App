import 'package:fapplerv2/Authentication/Presentation/Screens/signUpFamilyMember.dart';
import 'package:flutter/material.dart';

class IdentificationScreen extends StatefulWidget {
  const IdentificationScreen({Key? key}) : super(key: key);

  @override
  _IdentificationScreenState createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align to top
          children: [
            const SizedBox(height: 40), // Adjust the top padding

            // Fappler Logo
            Column(
              children: [
                // Placeholder for your logo
                Image.asset(
                  'assets/images/fappler.png',
                  height: 130,
                ),
                const SizedBox(height: 20), // Reduce the space after the logo
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  // The whole box is pressable
                  child: _buildBox(
                    context,
                    imageAsset: 'assets/images/patient.png',
                    label: 'Patient',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  // The whole box is pressable
                  child: _buildBox(
                    context,
                    imageAsset: 'assets/images/familyMember.png',
                    label: 'Family member',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Signup()),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildBox(
                    context,
                    imageAsset: 'assets/images/DR.png',
                    label: 'Doctor',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  // The whole box is pressable
                  child: _buildBox(
                    context,
                    imageAsset: 'assets/images/nurse.png',
                    label: 'Nurse',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to build each box with an image and a button
  Widget _buildBox(BuildContext context, {required String imageAsset, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap, // Make the whole box tappable
      child: Column(
        children: [
          // Image placeholder (replace with your actual image asset)
          Image.asset(
            imageAsset,
            height: 200,
          ),
          const SizedBox(height: 10),
          // Button-like container under the image
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
