import 'package:flutter/material.dart';

import '../../menus.dart';

class TopPosts extends StatefulWidget {
  const TopPosts({Key? key}) : super(key: key);

  @override
  State<TopPosts> createState() => _TopPostsState();
}

class _TopPostsState extends State<TopPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shiro-Verified"),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         AuthServices imp = new AuthServiceImpl();
        //         imp.signout();
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => const Login()),
        //         );
        //       },
        //       icon: Icon(Icons.logout))
        // ],
      ),
      drawer: const Menu(),
      body: const Center(
        child: Text("Top posts"),
      ),
    );
  }
}
