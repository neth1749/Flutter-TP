import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final String languageCode;
  final bool isDarkMode;
  final void Function(bool) onThemeChanged;
  final void Function(String) onLanguageChanged;

  const LoginScreen({
    super.key,
    required this.languageCode,
    required this.onThemeChanged,
    required this.onLanguageChanged,
    required this.isDarkMode,
  });

  static const Map<String, Map<String, String>> localizedStrings = {
    'en': {
      'title': 'Log in',
      'greeting': 'Hello!',
      'username': 'Username',
      'password': 'Password',
      'button': 'Log in',
      'darkMode': 'Dark Mode',
    },
    'fr': {
      'title': 'Connexion',
      'greeting': 'Salut!',
      'username': 'Nom d\'utilisateur',
      'password': 'Mot de passe',
      'button': 'Connexion',
      'darkMode': 'Mode sombre',
    },
    'kh': {
      'title': 'ចូល',
      'greeting': 'សួស្តី!',
      'username': 'ឈ្មោះអ្នកប្រើប្រាស់',
      'password': 'ពាក្យសម្ងាត់',
      'button': 'ចូល',
      'darkMode': 'របៀបងងឹត',
    },
  };

  @override
  Widget build(BuildContext context) {
    final strings = localizedStrings[languageCode]!;

    // Define colors based on dark mode
    final Color primaryColor = Colors.orange; // Worktency orange
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color hintColor = isDarkMode ? Colors.white70 : Colors.grey[600]!;
    final Color backgroundColor = isDarkMode ? const Color(0xFF121212) : Colors.white;
    final Color cardColor = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white;
    final Color borderColor = isDarkMode ? Colors.grey[700]! : Colors.grey[400]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0, // No shadow for the app bar
        title: Text(
          strings['title']!,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false, // Align title to the left
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: textColor), // Back arrow icon
            onPressed: () {
              // Handle back button press - consider Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 100), // Spacing from app bar
              // Worktency Logo Placeholder
              Center(
                child: Image.asset(
                  // Use the correct logo path as per your assets folder
                  'assets/images/worknet-logo-png_seeklogo-326005.png',
                  height: 120,width: 100,
                ),
              ),
              const SizedBox(height: 100),
              Text(
                strings['greeting']!,
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              TextField(
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  labelText: strings['username'],
                  labelStyle: TextStyle(color: hintColor),
                  hintStyle: TextStyle(color: hintColor),
                  filled: true,
                  fillColor: cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  prefixIcon: Icon(Icons.person, color: hintColor),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                style: TextStyle(color: textColor),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: strings['password'],
                  labelStyle: TextStyle(color: hintColor),
                  hintStyle: TextStyle(color: hintColor),
                  filled: true,
                  fillColor: cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor, width: 2),
                  ),
                  prefixIcon: Icon(Icons.lock, color: hintColor),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 54, // Taller button
                child: ElevatedButton(
                  onPressed: () {
                    // Handle login
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, // Orange color for the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                    elevation: 0, // No shadow for the button
                  ),
                  child: Text(
                    strings['button']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // --- FIX for RenderFlex overflow and correct flag paths ---
              SingleChildScrollView( // Make the row scrollable if items overflow
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Keeps items centered when there's space
                  children: [
                    // Ensure these paths match your actual filenames in assets/images/
                    _languageFlagButton('assets/images/Flag_of_England.png', 'en', context),
                    _languageFlagButton('assets/images/Flag_of_France.png', 'fr', context),
                    // Use the correct Khmer flag image path here
                    _languageFlagButton('assets/images/a9439ca543cf77093ab377af19c55bc8.jpg', 'kh', context), // <--- ASSUMING you added this file
                  ],
                ),
              ),
              // --- END FIX ---
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: borderColor),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SwitchListTile(
                  title: Text(
                    strings['darkMode']!,
                    style: TextStyle(color: textColor),
                  ),
                  value: isDarkMode,
                  onChanged: onThemeChanged,
                  activeColor: primaryColor, // Orange color for the active switch
                ),
              ),
              const SizedBox(height: 24), // Spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }

  Widget _languageFlagButton(String flagAsset, String code, BuildContext context) {
    final bool isSelected = languageCode == code;
    return GestureDetector(
      onTap: () => onLanguageChanged(code),
      child: Container(
        // Reduced horizontal margin to help with potential overflow, though SingleChildScrollView is the main fix
        margin: const EdgeInsets.symmetric(horizontal: 4), // Reduced from 8
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Image.asset(
          flagAsset,
          width: 32,
          height: 32,
        ),
      ),
    );
  }
}