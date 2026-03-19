import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lira_bar/mainmenu/mainmenu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lira bar',
      home: const mainmenu(),
    );
  }
}


