import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rondom_user/provider/user_provider.dart';
import 'package:rondom_user/screens/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rondom User',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => UserProvider(),
        child: const HomePage(),
      ),
    );
  }
}
