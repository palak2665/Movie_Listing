import 'package:flutter/material.dart';
import 'package:movie_listing/view/home_page.dart';
import 'package:movie_listing/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      home: const HomePage(),
    );
  }
}
