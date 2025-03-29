import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userinfo/view%20model/user_view_model.dart';
import 'package:userinfo/view/home_screen.dart';



void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'User List App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
