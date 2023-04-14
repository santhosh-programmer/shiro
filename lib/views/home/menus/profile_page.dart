import 'package:flutter/material.dart';
import 'package:shiro/main.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.account_circle,
                  size: 130,
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: appColor.withOpacity(0.1),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: [
                              Text(
                                'First Name : ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: appColor,
                                ),
                              ),
                              const Text(
                                'Tech',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: [
                              Text(
                                'Last Name : ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: appColor,
                                ),
                              ),
                              const Text(
                                'Pirates',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: [
                              Text(
                                'E-mail : ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: appColor,
                                ),
                              ),
                              const Text(
                                'techpirates@gmail.com',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: [
                              Text(
                                'Phone no : ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: appColor,
                                ),
                              ),
                              const Text(
                                '+911234567890',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: [
                              Text(
                                'Password : ',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: appColor,
                                ),
                              ),
                              const Text(
                                'TechPirates@123',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
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
                      'Edit details',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
