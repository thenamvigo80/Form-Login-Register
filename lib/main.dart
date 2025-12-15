import 'package:flutter/material.dart';
import 'package:formdangnhap/formdangnhap.dart';
import 'package:formdangnhap/formdangky.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // 👇 CÁCH 3: DÙNG ROUTES
      initialRoute: '/login',
      routes: {
        '/login': (context) => const FormDangNhap(),
        '/register': (context) => const FormDangKy(),
      },
    );
  }
}
