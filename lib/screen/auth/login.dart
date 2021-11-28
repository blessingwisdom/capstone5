import 'package:flutter/material.dart';
import 'package:sidehustle/screen/auth/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff29487D),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 28.0,
                ),
                const CircleAvatar(
                  radius: 55.0,
                  backgroundImage: AssetImage('images/logo.jpg'),
                ),
                const SizedBox(
                  height: 70.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        bottom: 0.0,
                        top: 0.0,
                      ),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                                fontSize: 17, color: Colors.blue.shade100),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.white,
                            )),
                        style: TextStyle(
                            fontSize: 17, color: Colors.blue.shade200),
                      ),
                    ),
                    const SizedBox(
                      height: 28.0,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        bottom: 0.0,
                        top: 0.0,
                      ),
                      child: TextFormField(
                        controller: passController,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontSize: 17, color: Colors.blue.shade100),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          prefixIcon:
                              const Icon(Icons.lock, color: Colors.white),
                        ),
                        style: TextStyle(
                            fontSize: 17, color: Colors.blue.shade200),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Row(
                        children: [
                          const Text(
                            'Not Yet A Member? ',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register()));
                              },
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                    color: Colors.blue.shade200, fontSize: 17),
                              ))
                        ],
                      ),
                    )

                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Text(
                    //     'Sign Up?',
                    //     style: TextStyle(
                    //       fontSize: 15.0,
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.normal,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 29.0,
                ),
                FractionallySizedBox(
                  widthFactor: 0.8,
                  child: RaisedButton(
                    onPressed: () {
                      login(emailController.text, passController.text);
                    },
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    color: Colors.blue.shade200,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(String email, pass) async {
    Map data = {'email': email, 'pass': pass};

    var response = await http.post(
        Uri.parse('https://madgroup13.herokuapp.com/api/auth/userlogin'),
        body: data);

    if (response.statusCode == 200) {
      print(email);
      print(response.body);
    } else {
      print(email);
      print(response.body);
    }
  }
}
