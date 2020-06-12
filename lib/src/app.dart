import 'package:blockapplication/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Log me in",
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: LogInScreen(),
      ),
    );
  }
}
