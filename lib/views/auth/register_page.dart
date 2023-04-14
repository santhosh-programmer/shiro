import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shiro/services/auth_services.dart';
import 'package:shiro/services/auth_services_impl.dart';
import 'package:shiro/views/home_page.dart';

import '../../main.dart';

class RegisterNow extends StatefulWidget {
  const RegisterNow({Key? key}) : super(key: key);

  @override
  _RegisterNowState createState() => _RegisterNowState();
}

class _RegisterNowState extends State<RegisterNow> {
  AuthServices imp = new AuthServiceImpl();
  bool p = true;
  bool p1 = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  var using1 = Icons.remove_red_eye;

  var enteredmail1 = '';
  var name = '';
  var enteredpass1 = '';
  var newtext1;
  var newpass1;
  var enteredpass2 = '';
  var newpass2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appColor,
          title: Text("New Registration"),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    onChanged: (newtext1) {
                      name = newtext1;
                    },
                    style: styling,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintStyle: styling,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: appColor ?? appColor),
                      ),
                      hintText: 'Enter your name',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (newtext1) {
                      enteredmail1 = newtext1;
                    },
                    style: styling,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintStyle: styling,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: appColor ?? appColor),
                      ),
                      hintText: 'Enter your e-mail address',
                      prefixIcon: Icon(
                        Icons.mail,
                        color: appColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (newpass1) {
                      enteredpass1 = newpass1;
                    },
                    style: styling,
                    obscureText: p,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintStyle: styling,
                      hintText: 'Enter your Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: appColor ?? appColor),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: appColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (using == openeye) {
                              using = closeeye;
                            } else {
                              using = openeye;
                            }
                            setState(() {
                              if (p == false) {
                                p = true;
                              } else {
                                p = false;
                              }
                            });
                          },
                          icon: Icon(
                            using,
                            color: appColor,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (newpass2) {
                      enteredpass2 = newpass2;
                    },
                    style: styling,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: p1,
                    decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      hintStyle: styling,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 4,
                            color: appColor ?? appColor), //<-- SEE HERE
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: appColor ?? appColor),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        color: appColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (using1 == openeye) {
                              using1 = closeeye;
                            } else {
                              using1 = openeye;
                            }
                            setState(() {
                              if (p1 == false) {
                                p1 = true;
                              } else {
                                p1 = false;
                              }
                            });
                          },
                          icon: Icon(
                            using1,
                            color: appColor,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Container(
                      width: double.infinity,
                      height: 54.0,
                      child: !loading
                          ? ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(appColor),
                                  shape: MaterialStateProperty.all(
                                      StadiumBorder())),
                              onPressed: () async {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(enteredmail1);
                                if (enteredmail1 == '' ||
                                    enteredpass1 == '' ||
                                    enteredpass2 == '') {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text("Fill all the fields properly"),
                                    backgroundColor: appColor,
                                  ));
                                } else {
                                  if (emailValid == true) {
                                    if (enteredpass1.length >= 6) {
                                      if (enteredpass2 == enteredpass1) {
                                        try {
                                          setState(() {
                                            loading = true;
                                          });
                                          await imp.signup(
                                              mail: enteredmail1,
                                              pass: enteredpass1,
                                              name: name);
                                          setState(() {
                                            loading = false;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text("Registered Successfully"),
                                            backgroundColor: appColor,
                                          ));
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage()),
                                              (Route<dynamic> route) => false);
                                        } on FirebaseException catch (e) {
                                          print(e);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(e.toString()),
                                            backgroundColor: appColor,
                                          ));
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text("Passwords do not match"),
                                          backgroundColor: appColor,
                                        ));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "Passwords must be atleast 6 characters"),
                                        backgroundColor: appColor,
                                      ));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text("Enter a valid Mail-Id"),
                                      backgroundColor: appColor,
                                    ));
                                  }
                                }
                              },
                              child: Text(
                                'Register',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25.0),
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                                color: appColor,
                              ),
                            )),
                ],
              ),
            ),
          ),
        ));
  }
}
