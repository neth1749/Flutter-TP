import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  String _languageCode = 'en';

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _themeMode = (prefs.getBool('darkMode') ?? false)
          ? ThemeMode.dark
          : ThemeMode.light;
      _languageCode = prefs.getString('language') ?? 'en';
    });
  }

  Future<void> _updateTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', isDark);
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  Future<void> _updateLanguage(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', code);
    setState(() {
      _languageCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Assignment',
      themeMode: _themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: LoginScreen(
        languageCode: _languageCode,
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _updateTheme,
        onLanguageChanged: _updateLanguage,
      ),
    );
  }
}
