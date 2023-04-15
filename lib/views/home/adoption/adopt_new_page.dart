import 'package:flutter/material.dart';
import 'package:shiro/main.dart';

import '../../../services/auth_services.dart';
import '../../../services/auth_services_impl.dart';
import '../../auth/login_page.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'adopt_details.dart';

class Animal {
  String animalImage;
  String animalLocation;
  String animalSex;
  Animal(
      {required this.animalImage,
      required this.animalLocation,
      required this.animalSex});
}

class AdoptNew extends StatefulWidget {
  const AdoptNew({Key? key}) : super(key: key);

  @override
  State<AdoptNew> createState() => _AdoptNewState();
}

class _AdoptNewState extends State<AdoptNew> {
  int current = 0;
  List<String> items = ["Adopt", "Give Away"];

  final _formKey = GlobalKey<FormState>();
  bool _isMyPet = false;
  String? _breed;
  String? _age;
  String? _gender;
  File? _image;
  File? _video;
  String? _description;
  LocationData? _locationData;
  final ImagePicker _picker = ImagePicker();
  final Location _location = Location();

  Future<void> _takePicture() async {
    final pickedFile = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _takeVideo() async {
    final pickedFile = await _picker.getVideo(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _video = File(pickedFile.path);
      } else {
        print('No video selected.');
      }
    });
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _locationData = await _location.getLocation();
    setState(() {});
  }

  List<Animal> animals = [
    Animal(
        animalImage:
            "https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        animalLocation: 'Chennai',
        animalSex: 'Male'),
    Animal(
        animalImage:
            "https://images.unsplash.com/photo-1541364983171-a8ba01e95cfc?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        animalLocation: "Kanchipuram",
        animalSex: 'Female'),
    Animal(
        animalImage:
            "https://images.unsplash.com/photo-1556227702-d1e4e7b5c232?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        animalLocation: "Tirunelveli",
        animalSex: "Male"),
    Animal(
        animalImage:
            "https://images.unsplash.com/photo-1587764379873-97837921fd44?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        animalLocation: "Tirunelveli",
        animalSex: "Male"),
    Animal(
        animalImage:
            "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
        animalLocation: "Tirunelveli",
        animalSex: "Male"),
  ];

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
      body: Container(
        margin: const EdgeInsets.only(top: 15),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  height: 42,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                margin: index == 0
                                    ? const EdgeInsets.only(left: 75)
                                    : const EdgeInsets.only(left: 20),
                                width: 120,
                                height: 42,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: current != index
                                          ? Colors.black
                                          : appColor,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                    color: current != index
                                        ? Colors.white
                                        : appColor),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: TextStyle(
                                        color: current != index
                                            ? Colors.black
                                            : Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
              current == 1
                  ? SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: _takePicture,
                              child: const Text('Take Picture'),
                            ),
                            if (_image != null) Image.file(_image!),
                            ElevatedButton(
                              onPressed: _takeVideo,
                              child: const Text('Take Video'),
                            ),
                            if (_video != null) const Text("Video Added"),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Enter description',
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _description = value;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              onPressed: _getCurrentLocation,
                              child: const Text('Get Current Location'),
                            ),
                            if (_locationData != null)
                              Text(
                                'Latitude: ${_locationData!.latitude}, Longitude: ${_locationData!.longitude}',
                              ),
                            const SizedBox(height: 20.0),
                            const Text('Is it your own pet?'),
                            Checkbox(
                              fillColor:
                                  MaterialStateProperty.all<Color>(appColor),
                              value: _isMyPet,
                              onChanged: (value) {
                                setState(() {
                                  _isMyPet = value!;
                                });
                              },
                            ),
                            const SizedBox(height: 20.0),
                            if (_isMyPet)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Name',
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Breed',
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _breed = value;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 20.0),
                                  DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Age',
                                    ),
                                    value: _age,
                                    onChanged: (value) {
                                      setState(() {
                                        _age = value;
                                      });
                                    },
                                    items: ['1', '2', '3', '4', '5'].map((age) {
                                      return DropdownMenuItem(
                                        value: age,
                                        child: Text(age),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(height: 20.0),
                                  DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Gender',
                                    ),
                                    value: _gender,
                                    onChanged: (value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    },
                                    items: ['Male', 'Female', 'Other']
                                        .map((gender) {
                                      return DropdownMenuItem(
                                        value: gender,
                                        child: Text(gender),
                                      );
                                    }).toList(),
                                  ),
                                  const SizedBox(height: 20.0),
                                ],
                              ),
                            ElevatedButton(
                              onPressed: () {
                                if (_image != null && _video != null) {
                                  _breed = null;
                                  _age = null;
                                  _gender = null;
                                  _image = null;
                                  _video = null;
                                  _isMyPet = false;
                                  _description = null;

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Form submitted'),
                                    ),
                                  );
                                  setState(() {});
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Image,Video,Location Mandatory'),
                                    ),
                                  );
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: double.maxFinite,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: animals.length,
                                  itemBuilder: (ctx, index) {
                                    final animal = animals[index];
                                    return Column(
                                      children: [
                                        Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              color: appColor.withOpacity(0.05),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Row(
                                            children: [
                                              Image(
                                                  width: 180,
                                                  height: 170,
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      animal.animalImage)),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const FaIcon(
                                                        FontAwesomeIcons
                                                            .locationPin,
                                                      ),
                                                      const SizedBox(width: 5),
                                                      Text(
                                                        animal.animalLocation,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 8.0,
                                                    ),
                                                    child: Text(
                                                      animal.animalSex,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.grey),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 40),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                Adopt_Details(
                                                                    animal:
                                                                        animal),
                                                          ));
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            foregroundColor:
                                                                appColor),
                                                    child: const Text(
                                                      'View Details',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20)
                                      ],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
