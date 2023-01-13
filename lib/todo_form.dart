import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasknumbtwo/model.dart';

class TodoForm extends StatefulWidget {

  final Function addTodo;
  final int listLength;

  const TodoForm({
    required this.addTodo,
    required this.listLength,
    Key? key}) : super(key: key);

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {

  TextEditingController titleController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  int randomID = Random().nextInt(9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: ListView(
        children: [
          Form(
            key: formKey,
              child: TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                    labelText: 'To Do',
                    contentPadding: const EdgeInsets.all(10),
                suffix: IconButton(
                    onPressed: (){

                      if(formKey.currentState!.validate()){

                        var newTask = Model(

                            id: widget.listLength + 1,
                            userid: randomID,
                            title: titleController.text,
                            completed: false

                        );

                        widget.addTodo(newTask);
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.check_circle))
            ),
            validator: (value){
              return value == null || value.isEmpty ?
              "Input your Task" : null;
            },
          )
          ),
        ],
      ),
    );
  }
}
