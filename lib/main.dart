import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shiro/views/auth/login_page.dart';

Color appColor = Color(0xFF800000);
bool loading = false;
final styling = TextStyle(color: appColor);

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
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
    return Login();
  }
}
