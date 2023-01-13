import 'package:flutter/material.dart';

class TodoUpdate extends StatefulWidget {

  const TodoUpdate({
    Key? key}) : super(key: key);

  @override
  State<TodoUpdate> createState() => _TodoUpdateState();
}

class _TodoUpdateState extends State<TodoUpdate> { Widget rowItem(String title, dynamic value){
  return Row(
    children: [
      Expanded(
          flex: 3,
          child: Text(title)
      ),
      const SizedBox(
        width: 5,
      ),
      Text(value.toString())
    ],
  );

}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Update ToDo'),
    ),
    body: ListView(
    ),
  );
}
}
