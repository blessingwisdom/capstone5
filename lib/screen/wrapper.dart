import 'package:flutter/material.dart';
import 'package:sidehustle/screen/auth/register.dart';
import 'auth/login.dart';
class Wrapper extends StatefulWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return Register();
  }
}