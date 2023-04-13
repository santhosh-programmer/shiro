import 'package:flutter/material.dart';

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
        title: Text("Adopt New"),
      ),
      body: Center(
        child: Text("Adopt New"),
      ),
    );
  }
}
