import 'package:errands/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:errands/screens/welcome_screen.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Menthor',
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            // initialRoute: '/',
            // routes: {
            //     '/': (ctx) => MyHomePage(),
            //     // MenthorPage.routeName: (ctx) => MenthorPage(),
            // },
            // onUnknownRoute: (settings) {
            //     return MaterialPageRoute(builder: (ctx) => MenthorsList());
            // },
        );
    }
}

class MyHomePage extends StatefulWidget {
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                elevation: 0.0,
                backgroundColor: primaryColPink,
                automaticallyImplyLeading: false,
            ),
            body: WelcomePage(),
        );
    }
}