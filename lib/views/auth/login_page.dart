import 'package:flutter/material.dart';
import 'package:shiro/services/auth_services.dart';
import 'package:shiro/services/auth_services_impl.dart';
import 'package:shiro/views/auth/register_page.dart';
import 'package:shiro/views/auth/reset_password.dart';
import 'package:shiro/views/home_page.dart';

import '../../main.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthServices imp = AuthServiceImpl();
  bool p = true;
  var openeye = Icons.remove_red_eye;
  var closeeye = Icons.visibility_off;
  var using = Icons.remove_red_eye;
  var enteredmail = '';
  var enteredpass = '';
  var newtext;
  var newpass;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SizedBox(
          height: double.maxFinite,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage("assets/bgimage.jpeg"),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        'Finding Shiro',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: appColor,
                          fontSize: 50.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 36.0,
                    ),
                    TextFormField(
                      onChanged: (newtext) {
                        enteredmail = newtext;
                      },
                      style: TextStyle(color: appColor),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Enter your e-mail address',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: appColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: appColor), //<-- SEE HERE
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2, color: appColor), //<-- SEE HERE
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 4, color: appColor), //<-- SEE HERE
                          ),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: appColor,
                          ),
                          hintStyle: TextStyle(color: appColor)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      onChanged: (newpass) {
                        enteredpass = newpass;
                      },
                      style: TextStyle(color: appColor),
                      obscureText: p,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: appColor), //<-- SEE HERE
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: appColor), //<-- SEE HERE
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 4, color: appColor), //<-- SEE HERE
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 2, color: appColor),
                        ),
                        hintText: 'Enter your Password',
                        hintStyle: TextStyle(color: appColor),
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: appColor,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (p == false) {
                                  p = true;
                                } else {
                                  p = false;
                                }
                                if (using == openeye) {
                                  using = closeeye;
                                } else {
                                  using = openeye;
                                }
                              });
                            },
                            icon: Icon(
                              using,
                              color: appColor,
                            )),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MailOtp()));
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w900,
                            color: appColor,
                          ),
                        )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                        width: double.infinity,
                        height: 54.0,
                        child: !loading
                            ? ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(appColor), shape: MaterialStateProperty.all(const StadiumBorder())),
                                onPressed: () async {
                                  bool emailValid =
                                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(enteredmail);
                                  if (enteredmail == '' || enteredpass == '') {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                        "Fill all the fields properly",
                                        style: TextStyle(color: appColor),
                                      ),
                                      backgroundColor: appColor,
                                    ));
                                  } else {
                                    if (emailValid == true) {
                                      try {
                                        setState(() {
                                          loading = true;
                                        });
                                        await imp.signin(mail: enteredmail, pass: enteredpass);
                                        setState(() {
                                          loading = false;
                                        });
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text(
                                            "Logged in Successfully",
                                            style: TextStyle(color: appColor),
                                          ),
                                          backgroundColor: appColor,
                                        ));
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (context) => const HomePage()),
                                          (Route<dynamic> route) => false,
                                        );
                                      } on Exception catch (e) {
                                        print(e);
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                          content: Text(
                                            e.toString(),
                                            style: TextStyle(color: appColor),
                                          ),
                                          backgroundColor: appColor,
                                        ));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                          "Enter a valid Mail-Id",
                                          style: TextStyle(color: appColor),
                                        ),
                                        backgroundColor: appColor,
                                      ));
                                    }
                                  }
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white, fontSize: 25.0),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                  color: appColor,
                                ),
                              )),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Divider(
                      color: appColor,
                      thickness: 1.5,
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: appColor,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterNow()));
                              },
                              child: Text(
                                'Register now',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: appColor,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
