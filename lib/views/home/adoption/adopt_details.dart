import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shiro/main.dart';
import 'package:shiro/views/home/adoption/adopt_new_page.dart';

class Adopt_Details extends StatefulWidget {
  const Adopt_Details({super.key, required this.animal});
  final Animal animal;

  @override
  State<Adopt_Details> createState() => _Adopt_DetailsState();
}

class _Adopt_DetailsState extends State<Adopt_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image(
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.animal.animalImage)),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.locationPin,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.animal.animalLocation,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text(
                widget.animal.animalSex,
                style: TextStyle(
                    color: appColor, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Animals are placed up for adoption for numerous reasons like being abandoned, lost, or rehomed from their current family. The need for rehoming sometimes results from allergies, death of a pet-owner, divorce, the birth of a baby, or relocation.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(foregroundColor: appColor),
                child: const Text(
                  'Adopt Now',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
