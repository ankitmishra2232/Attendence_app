import 'package:attendence_app/FrontScreen/profile.dart';
import 'package:flutter/material.dart';
import '../scan/scan.dart';
import './classroom.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendance"),
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0,),
              child: Container(
                color: Colors.red,
                child: const Center (
                    child: Padding (
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        "GOA UNIVERSITY",
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                      ),
                    )
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text("Department of Computer Science and Technology",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Image.asset('assets/images/unigoa.jpg'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const Classroom()
                    )
                );
              },
              child: const Text("CLASSROOM"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => scan(),
                    ));
              },
              child: const Text("Scan Bar Code"),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                color: Colors.red,
                child: Center (
                    child: Padding (
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Card(
                        color: Colors.red,
                        elevation: 10.0,
                        child: Column(
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 100.0, right: 100.0),
                              child: Text(
                                "Teacher Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0
                                ),
                              ),
                            ),
                            Text(
                              "Name: Jarret Fernandez",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Age: 35",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Address: Margao Goa",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}