import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tasknumbtwo/model.dart';
import 'dart:convert' as convert;

import 'package:tasknumbtwo/todo_details.dart';
import 'package:tasknumbtwo/todo_form.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List todos = <dynamic>[];

  @override
  void initState(){
    super.initState();
    getTodo();
  }

  // 1. Home Page (List of Todos) - Get
  getTodo() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var response = await http.get(Uri.parse(url));

    setState(() {
      todos = convert.jsonDecode(response.body) as List<dynamic>;
    });
  }

  // 2. Add Todo Page (Form) - Post
  void addTodo(var newTask) async {

    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?userId='
            '${newTask.userID}&id=${newTask.id}&title=${newTask.title}&completed='
            '${newTask.completed}');

    var response = await http.post(url);

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(newTask.title);
      setState(() {
        todos.add(newTask);
      });
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to add.');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDos"),
        leading: const Icon(Icons.library_books_outlined),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index]['title']),
            onTap: (){
              Navigator.push(context, 
                  MaterialPageRoute(builder:(context) => TodoDetails(todo: todos[index]),));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => TodoForm(
                addTodo : addTodo,
                listLength: todos.length,
              ),
            ));
          },
          child: const Icon(Icons.add_task_outlined),
      ),

            );

  }
}
