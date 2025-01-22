import 'package:flutter/material.dart';
import 'package:the_fragrance_diary/pages/home.dart';
import 'package:http/http.dart';
import 'dart:convert';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map data = {};

  @override
  void initState() {
    super.initState();
    _navigateToHome();
    getData();
  }

  _navigateToHome() async {
    String delayedData = await Future.delayed(Duration(seconds: 2), () {
      return "Some data";
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePageWidget()),
    );
    Navigator.pushNamed(context, '/home');
    print("Got data $delayedData");
  }

  getData() async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    data = jsonDecode(response.body);
    print("Response: ${response.body}");
    print("Response Type: ${response.body.runtimeType}");
    print("Data Type: ${data.runtimeType}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.local_florist,
              size: 100.0,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'The Fragrance Diary',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
