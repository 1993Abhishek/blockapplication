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
        appBar: AppBar(backgroundColor: Colors.lightGreen,
          title: Center(
            child: Text(
              "Wanna Logged in",
                style: TextStyle(fontSize: 20,color: Colors.black54)
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey,
        body: LogInScreen(),
      ),
    );
  }
}
