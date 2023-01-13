import 'package:flutter/material.dart';

class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {

  TextEditingController nameCtrler = TextEditingController();
  TextEditingController mailCtrler = TextEditingController();

  var userSltSection = '';
  var formKey = GlobalKey<FormState>();





  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
