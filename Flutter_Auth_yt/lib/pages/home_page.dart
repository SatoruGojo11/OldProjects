import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_yt/data/userdata.dart';
import 'package:flutter_auth_yt/pages/profile_page.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/database.dart';

class Homepage extends StatefulWidget {

  final Userdata? userdata;
  const Homepage({super.key, required this.userdata});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  // final user = FirebaseAuth.instance.currentUser;

  // Take reference of the hive box
  final mybox = Hive.box("taskBox");

  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    super.initState();

    // first time opening the app
    if (mybox.get('TODOLIST') == null) {
      db.createdataList();
    } else {
      db.loadData();
    }
  }

  //what's gonna happen when Check box Tapped
  void checkboxtap(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  // new task controller
  TextEditingController newtaskcontroller = TextEditingController();

  // create new task while clicking on Floating action button
  Future createnewtask() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.yellow[500],
        content: SizedBox(
          height: 150,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // for taking user input
              TextField(
                strutStyle: const StrutStyle(height: 1.3),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                controller: newtaskcontroller,
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 50,
                    ),
                  ),
                  hintText: "Add a new task",
                ),
              ),
              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (newtaskcontroller.text.isNotEmpty) {
                          db.todoList.add([newtaskcontroller.text, false]);
                          newtaskcontroller.clear();
                          Navigator.of(context).pop();
                        }
                      });
                      db.updateData();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // cancel button
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //delete func for deleting the task
  void deletefunc(int value) {
    setState(() {
      db.todoList.removeAt(value);
    });
    db.updateData();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "${db.todoList[value][0]} deleted!!",
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () =>
                // open Profile Page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                              userdata: widget.userdata,
                            ))),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: CircleAvatar(
                maxRadius: 25,
                backgroundImage: NetworkImage(
                  '${FirebaseAuth.instance.currentUser?.photoURL.toString()}',
                ),
                child: const Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 50,
                  semanticLabel: 'Profile',
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: const Text(
          'TO DO APP',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Colors.yellow[200],
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          onPressed: createnewtask,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          // text('Name :- ${widget.userdata.userName}'),
          Expanded(
            child: ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) => deletefunc(index),
                          icon: Icons.delete,
                          backgroundColor: Colors.red.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green[500],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          // Check Box
                          Checkbox(
                            value: db.todoList[index][1],
                            onChanged: (value) => checkboxtap(value, index),
                            activeColor: Colors.black87,
                          ),
                          // Task Name
                          Expanded(
                            child: Text(
                              db.todoList[index][0],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: db.todoList[index][1] == true
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
