import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});
  final String profileImage = 'assets/profilepic.jpg'; // Use your local asset
  final String name = 'Thorn sreyneth';
  final String role = 'Backend Developer';
  final String bio =
      'I am a backend developer passionate about managing databases.';

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 239, 242),
        title: Row(
          children: [
            Image.asset('assets/profilepic.jpg', height: 30), // Add your logo here
            SizedBox(width: 10),
            Text(
              "AeroVision",
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {}, // Add menu action here
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(radius: 110, backgroundImage: AssetImage(profileImage)),
            SizedBox(height: 20),
            Text("Welcome to my Portfolio", 
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[600])),
            SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Hi I'm\n",
                    style: GoogleFonts.poppins(fontSize: 22, color: Colors.black),
                  ),
                  TextSpan(
                    text: "Thornsreyneth ",
                    style: GoogleFonts.poppins(
                        fontSize: 32, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 228, 160, 218)),
                  ),
                  TextSpan(
                    text: "Thorn\n",
                    style: GoogleFonts.poppins(
                        fontSize: 32, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 228, 160, 218)),
                  ),
                  TextSpan(
                    text: role,
                    style: GoogleFonts.poppins(
                        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              bio,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _launchURL('mailto:thornsreyneth1@gmail.com'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 215, 167, 216),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Hire Me!",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),
              ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => _launchURL('https://www.linkedin.com/in/sor-sonit-a30009312/?trk=opento_sprofile_details'),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side: BorderSide(color: Colors.blue),
              ),
              child: Text(
                "Download CV",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}