import 'package:flutter/material.dart';

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
      ),
      body: Center(
        child: Text("Crowd Funding"),
      ),
    );
  }
}
