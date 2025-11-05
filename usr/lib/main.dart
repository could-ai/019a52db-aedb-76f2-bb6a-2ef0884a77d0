import "package:flutter/material.dart";
import "package:couldai_user_app/screens/home_screen.dart";
import "package:supabase_flutter/supabase_flutter.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace with your Supabase project URL
    url: "YOUR_SUPABASE_URL",
    // TODO: Replace with your Supabase anon key
    anonKey: "YOUR_SUPABASE_ANON_KEY",
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "H.L.-Eduroom",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00796B), // Teal
          primary: const Color(0xFF00796B), // Teal
          secondary: const Color(0xFF4DB6AC), // Light Teal
          background: const Color(0xFFE0F2F1), // Very Light Teal
          surface: Colors.white,
          error: const Color(0xFFD32F2F), // Red
        ),
        fontFamily: "Roboto",
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
