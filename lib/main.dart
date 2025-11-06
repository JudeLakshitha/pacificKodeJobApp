import 'package:flutter/material.dart';
import 'package:job_app/screens/favourites/view/favourite_screen.dart';
import 'package:job_app/screens/home/view/home_screen.dart';
import 'package:job_app/screens/job_details/view/job_details_screen.dart';
import 'package:job_app/utils/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  ThemeMode themeMode = ThemeMode.system;

  void toggleThemeType(ThemeMode mode) {
    setState(() {
      themeMode = mode;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => updateTheme());
  }

  @override
  void didChangePlatformBrightness() {
    WidgetsBinding.instance.addPostFrameCallback((_) => updateTheme());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/jobDetailScreen': (context) => const JobDetailsScreen(),
        '/favoriteScreen': (context) => const FavouriteScreen(),
      },
      themeMode: themeMode,
      //home: const HomeScreen(),
    );
  }

  void updateTheme() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.updateTheme(brightness);
  }
}
