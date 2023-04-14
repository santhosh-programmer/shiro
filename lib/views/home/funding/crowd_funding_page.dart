import 'package:flutter/material.dart';
import 'package:shiro/main.dart';
import 'package:shiro/views/home/funding/crowd_funding_description.dart';
import 'dart:math';
import 'crowd_constants.dart';

class CrowdFunding extends StatefulWidget {
  const CrowdFunding({Key? key}) : super(key: key);

  @override
  State<CrowdFunding> createState() => _CrowdFundingState();
}

class _CrowdFundingState extends State<CrowdFunding> {
  @override
  Widget build(BuildContext context) {
    List<Widget> createFundingData() {
      List<Widget> fundingData = [];

      fundingData.add(Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          alignment: Alignment.topLeft,
          child: const Text(
            "They need your help...",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ));

      for (int i = 0; i < 10; i++) {
        fundingData.add(Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 130,
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.,
                    image: DecorationImage(
                      image: NetworkImage(dummyImgLink),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    issue[i],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          organization[i],
                          style: TextStyle(
                            color: appColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(Icons.currency_rupee),
                              ),
                              Column(
                                children: [
                                  Text(
                                    Random().nextInt(100000).toString(),
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Amount',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                '${Random().nextInt(100)}%',
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Raised',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(Icons.person),
                              ),
                              Column(
                                children: [
                                  Text(
                                    Random().nextInt(1000).toString(),
                                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'Funded',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CrowdFundingDescriptionPage(index: i),
                        ))
                  },
                  child: Container(
                    color: appColor,
                    width: double.infinity,
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'View Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
      }
      return fundingData;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: createFundingData(),
          ),
        ),
      ),
    );
  }
}
