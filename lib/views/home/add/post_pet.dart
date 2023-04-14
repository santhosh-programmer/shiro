import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:shiro/main.dart';
import 'package:shiro/services/auth_services.dart';
import 'package:shiro/services/auth_services_impl.dart';
import 'package:shiro/views/menus.dart';

import '../../auth/login_page.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         AuthServices imp = new AuthServiceImpl();
        //         imp.signout();
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => const Login()),
        //         );
        //       },
        //       icon: Icon(Icons.logout))
        // ],
      ),
      drawer: const Menu(),
      body: SingleChildScrollView(
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
                fillColor: MaterialStateProperty.all<Color>(appColor),
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
                      items: ['Male', 'Female', 'Other'].map((gender) {
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
                        content: Text('Image,Video,Location Mandatory'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
