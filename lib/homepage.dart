import 'package:flutter/material.dart';
import 'todolist.dart';
import 'unit/dialog.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final controler = TextEditingController();

  List todolist = [
    ['finish the project', true],
    ['strengthen body', false],
  ];

  void Checkboxchange(bool? value, int index) {
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void create_new_todolist() {
    setState(() {
      todolist.add([controler.text, false]);
    });
  }

  void createnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return My_dialog(
              controler: controler,
              onsave: create_new_todolist,
              cancel: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              });
        });
  }

  void deletetask(index) {
    setState(() {
      todolist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          leading: Icon(
            Icons.drafts,
            color: Colors.black,
          ),
          title: const Text(
            "TO DO",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
        ),
//------------------------------------------------------------------dialog
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow[500],
          onPressed: createnewtask,
          child: Icon(
            Icons.add,
            //color: Colors.yellow[500],
          ),
        ),

//------------------------------------------------------------------floating button
//实例化 todolist
        body: ListView.builder(
          itemCount: todolist.length,
          itemBuilder: (context, index) {
            return Todolist(
              taskname: todolist[index][0],
              isChecked: todolist[index][1],
              onchanged: (value) => Checkboxchange(value, index),
              deletetask: () => deletetask(index),
            );
          }, //这里的value表面上没有用到，实际上通过checkbox实现了二者之间的关联
        ));
  }
}
