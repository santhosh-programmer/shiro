import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shiro/services/auth_services.dart';
import 'package:shiro/services/auth_services_impl.dart';
import 'package:shiro/views/auth/login_page.dart';

import '../../main.dart';

class MailOtp extends StatefulWidget {
  const MailOtp({Key? key}) : super(key: key);

  @override
  _MailOtpState createState() => _MailOtpState();
}

class _MailOtpState extends State<MailOtp> {
  AuthServices imp = new AuthServiceImpl();

  var enteredmail = '';
  var newtext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        backgroundColor: appColor,
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
              children: [
                SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  onChanged: (newtext2) {
                    enteredmail = newtext2;
                  },
                  style: styling,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your e-mail address',
                    hintStyle: styling,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: appColor ?? appColor), //<-- SEE HERE
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: appColor ?? appColor), //<-- SEE HERE
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 4, color: appColor ?? appColor), //<-- SEE HERE
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: appColor ?? appColor),
                    ),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: appColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    width: double.infinity,
                    height: 54.0,
                    child: !loading
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(appColor),
                                shape:
                                    MaterialStateProperty.all(StadiumBorder())),
                            onPressed: () async {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(enteredmail);

                              if (enteredmail == '') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Fill the field properly"),
                                  backgroundColor: appColor,
                                ));
                              } else {
                                if (emailValid == true) {
                                  try {
                                    setState(() {
                                      loading = true;
                                    });
                                    await imp.resetPass(email: enteredmail);
                                    setState(() {
                                      loading = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Reset link is sent to your mail"),
                                      backgroundColor: appColor,
                                    ));
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login()),
                                    );
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
                                    content: Text("Enter a valid Mail-Id"),
                                    backgroundColor: appColor,
                                  ));
                                }
                              }
                            },
                            child: Text(
                              'Reset Password',
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
      ),
    );
  }
}
