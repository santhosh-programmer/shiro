import 'package:flutter/material.dart';

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
        title: Text("Shiro-Verified"),
      ),
      body: Center(
        child: Text("Top posts"),
      ),
    );
  }
}
