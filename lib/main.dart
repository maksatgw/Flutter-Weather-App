import 'package:flutter/material.dart';
import 'package:flutter_weather/screen/home/mainpage/view/main_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline5: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Color(0xffF02E65)),
          bodyText2: TextStyle(color: Color.fromARGB(255, 66, 125, 145)),
        ),
      ),
      home: const MainPageView(),
    );
  }
}
