import 'package:flutter/material.dart';
import 'package:job_app/screens/home/view/home_screen.dart';
import 'package:job_app/screens/job_details/view/job_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/jobDetailScreen': (context) => const JobDetailsScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //home: const HomeScreen(),
    );
  }
}
