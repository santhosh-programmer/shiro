import 'package:flutter/material.dart';
import 'package:shiro/views/home_page.dart';

Color appColor = Color(0xFF800000);
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF800000),
        ),
        primaryColor: Colors.white,
        buttonColor: appColor,
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFE5E5E5),
        dividerColor: appColor,
        accentColor: appColor),
    home: Shiro(),
  ));
}

class Shiro extends StatefulWidget {
  const Shiro({Key? key}) : super(key: key);

  @override
  State<Shiro> createState() => _ShiroState();
}

class _ShiroState extends State<Shiro> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
