import 'package:flutter/material.dart';

import '../../../services/auth_services.dart';
import '../../../services/auth_services_impl.dart';
import '../../auth/login_page.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shiro"),
        actions: [
          IconButton(
              onPressed: () {
                AuthServices imp = new AuthServiceImpl();
                imp.signout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text("Posts"),
      ),
    );
  }
}
