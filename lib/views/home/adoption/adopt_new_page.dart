import 'package:flutter/material.dart';

import '../../../services/auth_services.dart';
import '../../../services/auth_services_impl.dart';
import '../../auth/login_page.dart';

class AdoptNew extends StatefulWidget {
  const AdoptNew({Key? key}) : super(key: key);

  @override
  State<AdoptNew> createState() => _AdoptNewState();
}

class _AdoptNewState extends State<AdoptNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adopt New"),
        actions: [
          IconButton(
              onPressed: () {
                AuthServices imp = AuthServiceImpl();
                imp.signout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text("Adopt New"),
      ),
    );
  }
}
