import 'package:flutter/material.dart';

void main() {
  runApp(const ManyPinsApp());
}

class ManyPinsApp extends StatelessWidget {
  const ManyPinsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Many Pins',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,
      ),
      home: const Home(),
    );
  }
}

/// The Model Widget defines external parameters.
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeController createState() => HomeController();
}

/// The Controller handles the staHomeControllers logic.
class HomeController extends State<Home> {
  @override
  Widget build(BuildContext context) => HomeView(this);
}

/// The View is purely declarative.
class HomeView extends StatelessWidget {
  final HomeController state;
  const HomeView(this.state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
