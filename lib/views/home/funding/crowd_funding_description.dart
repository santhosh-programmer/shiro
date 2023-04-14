import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shiro/main.dart';
import 'crowd_constants.dart';

class CrowdFundingDescriptionPage extends StatefulWidget {
  const CrowdFundingDescriptionPage({super.key, required this.index});
  final int index;
  @override
  State<CrowdFundingDescriptionPage> createState() => _CrowdFundingDescriptionPageState();
}

class _CrowdFundingDescriptionPageState extends State<CrowdFundingDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: NetworkImage(dummyImgLink2),
              height: 230,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    issue[widget.index],
                    style: const TextStyle(
                      fontSize: 21.5,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          organization[widget.index],
                          style: TextStyle(
                            color: appColor,
                            fontSize: 17.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.verified,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          // color: const Color.fromRGBO(231, 231, 231, 1),
                          color: appColor.withOpacity(0.1)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          issueDescription,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Start Date: ',
                        style: TextStyle(
                          color: appColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        '01/01/2023',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'End Date: ',
                        style: TextStyle(
                          color: appColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const Text(
                        '20/01/2023',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: appColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: appColor,
                            offset: const Offset(
                              0,
                              0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow
                          const BoxShadow(
                            color: Colors.white,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Amount needed',
                            //   textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.currency_rupee,
                                color: appColor,
                                size: 30,
                              ),
                              Text(
                                Random().nextInt(100000).toString(),
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: appColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: appColor,
                                  offset: const Offset(
                                    0,
                                    0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                                const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Raised',
                                  //   textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Text(
                                  '${Random().nextInt(100)}%',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: appColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: appColor,
                                  offset: const Offset(
                                    0,
                                    0,
                                  ),
                                  blurRadius: 10.0,
                                  spreadRadius: 2.0,
                                ), //BoxShadow
                                const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ),
                              ],
                            ),
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Contributors',
                                  //   textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.group,
                                      color: appColor,
                                      size: 30,
                                    ),
                                    Text(
                                      Random().nextInt(100000).toString(),
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: appColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () => {},
                          icon: const Icon(Icons.bookmark_add),
                          iconSize: 40,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(appColor),
                          shape: MaterialStateProperty.all(
                            const StadiumBorder(),
                          ),
                        ),
                        onPressed: () => {},
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                          child: Text(
                            'Fund',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
