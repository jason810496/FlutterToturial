import 'package:flutter/material.dart';
// import 'package:test_app/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: const Text('123'),
    );
  }
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.black38,
      onGenerateRoute: Route(settings: ),
      home: const MyWidget(),
    );
  }
}
