import 'package:attendence_app/FrontScreen/addClassForm.dart';
import 'package:attendence_app/FrontScreen/profile.dart';
import 'package:flutter/material.dart';
import './class.dart';
import 'dart:convert';
import 'package:attendence_app/model/classes.dart';
import 'package:http/http.dart'as http;

class Classroom extends StatefulWidget {
  const Classroom({Key? key}) : super(key: key);

  @override
  State<Classroom> createState() => _ClassroomState();
}

class _ClassroomState extends State<Classroom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jarret Fernandez"), //Name of Teacher
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.face),
            tooltip: "Profile",
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const Profile()
                  )
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ClassData()
                      )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 150.0,
                    child: Card (
                      color: Colors.amber,
                      shadowColor: Colors.white,
                      elevation: 25.0,
                      child: Column(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(top: 50.0),
                            child: Text (
                              "Android Programming",
                              style: TextStyle(
                                fontSize: 30.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                            child: Row(
                              children: const <Widget> [
                                Text (
                                  "CSC-105",
                                  style: TextStyle(fontSize: 20.0),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 105.0),
                                  child: Text (
                                    "09:30 - 13:30",
                                    style: TextStyle(fontSize: 20.0),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const addClassForm(),
                ));
            // display a form to take inputs of new class
          }
      ),
    );
  }



  getClasses() async {
    // fetch all classes taught by the logged in teacher
    List<Classes> classList = [];
    final response = await http.get(Uri.parse('https://script.google.com/macros/s/AKfycbyZCHxey_JUEsN8d1WKwSI4u4yP91DXrqfPqEozALNvSWXkwUQEKbmyrvTWQ20-TsDNJA/exec?action=getClasses'));
    print(response.statusCode);
    print(response.body);
    var notesJson = jsonDecode(response.body);
    print(notesJson);
    for(var u in notesJson){
      // Classes user =Classes(u["teacherEmail"],u["password"]);
      Classes classes = Classes(u["ClassID"], u["ClassName"], u["TeacherEmail"]);
      classList.add(classes);
    }
    print(classList.length);
    return classList;
  }
}