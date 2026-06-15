import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PantryMate());
}

class PantryMate extends StatelessWidget {
  const PantryMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pantry Mate',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.dark(
          primary: Colors.tealAccent,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
