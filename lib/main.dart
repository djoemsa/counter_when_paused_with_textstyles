import 'package:flutter/material.dart';
import 'package:sprint_2_01/screens/home_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  // FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
