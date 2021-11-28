import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sidehustle/screen/auth/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff29487D),
      body: Column(
        children: [
          const SizedBox(height: 70),
          const Center(
            child: Text(
              'Register',
              style: TextStyle(fontSize: 40, color: Colors.white),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(height: 20),

          const CircleAvatar(
            radius: 55.0,
            backgroundImage: AssetImage('images/logo.jpg'),
          ),
          const SizedBox(height: 20),

          //email
          FractionallySizedBox(
            widthFactor: 0.9,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email Address',
                  hintStyle:
                      TextStyle(fontSize: 17, color: Colors.blue.shade100),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.white,
                  )),
              style: TextStyle(fontSize: 17, color: Colors.blue.shade200),
            ),
          ),

          //password
          const SizedBox(height: 20),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: TextField(
              controller: passController,
              decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle:
                      TextStyle(fontSize: 17, color: Colors.blue.shade100),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  )),
              obscureText: true,
              style: TextStyle(fontSize: 17, color: Colors.blue.shade200),
            ),
          ),
          //first name
          const SizedBox(height: 20),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                  hintText: 'First Name',
                  hintStyle:
                      TextStyle(fontSize: 17, color: Colors.blue.shade100),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  prefixIcon: const Icon(
                    Icons.face,
                    color: Colors.white,
                  )),
              style: TextStyle(fontSize: 17, color: Colors.blue.shade200),
            ),
          ),

          //last name
          const SizedBox(height: 20),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                  hintText: 'Last Name',
                  hintStyle:
                      TextStyle(fontSize: 17, color: Colors.blue.shade100),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  prefixIcon: const Icon(
                    Icons.face,
                    color: Colors.white,
                  )),
              style: TextStyle(fontSize: 17, color: Colors.blue.shade200),
            ),
          ),
          const SizedBox(height: 20),

          FractionallySizedBox(
            widthFactor: 0.8,
            child: Row(children: [
              const Text(
                'Already A Member? ',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  'SignIn',
                  style: TextStyle(color: Colors.blue.shade200, fontSize: 17),
                ),
              )
            ]),
          ),
          const SizedBox(height: 20),
          FractionallySizedBox(
            child: RaisedButton(
                onPressed: () {
                  signup(emailController.text, passController.text,
                      firstNameController.text, lastNameController.text);
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                color: Colors.blue.shade200,
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
          )
        ],
      ),
    );
  }

  Future<void> signup(String email, pass, firstname, lastname) async {
    Map data = {
      'email': email,
      'pass': pass,
      'first_name': firstname,
      'last_name': lastname
    };

    if (email.toString().isNotEmpty || pass.toString().isNotEmpty) {
      print(email);
    } else {
      print('not okay');
    }
  }
}
