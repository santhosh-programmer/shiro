import 'package:flutter/material.dart';

import '../../../services/auth_services.dart';
import '../../../services/auth_services_impl.dart';
import '../../auth/login_page.dart';

class CrowdFunding extends StatefulWidget {
  const CrowdFunding({Key? key}) : super(key: key);

  @override
  State<CrowdFunding> createState() => _CrowdFundingState();
}

class _CrowdFundingState extends State<CrowdFunding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crowd Funding"),
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
        child: Text("Crowd Funding"),
      ),
    );
  }
}
