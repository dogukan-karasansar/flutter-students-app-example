import 'package:basic_app/pages/teachers_page.dart';
import 'package:basic_app/repesitory/Messages.dart';
import 'package:basic_app/repesitory/Students.dart';
import 'package:basic_app/repesitory/Teachers.dart';
import 'package:flutter/material.dart';

import 'package:basic_app/pages/messages_page.dart';
import 'package:basic_app/pages/students_page.dart';

void main() {
  runApp(const StudentsApp());
}

class StudentsApp extends StatefulWidget {
  const StudentsApp({Key? key}) : super(key: key);

  @override
  State<StudentsApp> createState() => _StudentsAppState();
}

class _StudentsAppState extends State<StudentsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Öğrenci Ana Sayfa'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  MessagesRepestories messagesRepestories = MessagesRepestories();

  StudentsRepestories studentsRepestories = StudentsRepestories();

  TeachersRepestories teachersRepestories = TeachersRepestories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(156, 15, 72, 1),
        title: Text(widget.title),
        leading: IconButton(
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            icon: const Icon(Icons.menu)),
      ),
      drawer: DrawMenu(
          messagesRepestories, studentsRepestories, teachersRepestories),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                MessageNavigator(context);
              },
              child: Text('${messagesRepestories.newMessagesCount} mesaj', style: const TextStyle(color: Color.fromRGBO(71, 13, 33, 1)),),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StudentsPage(studentsRepestories)));
              },
              child: Text('${studentsRepestories.students.length} öğrenci', style: const TextStyle(color: Color.fromRGBO(71, 13, 33, 1)),),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            TeachersPage(teachersRepestories)));
              },
              child: Text('${teachersRepestories.teachers.length} öğretmen', style: const TextStyle(color: Color.fromRGBO(71, 13, 33, 1)),),
            ),
          ],
        ),
      ),
    );
  }



  void MessageNavigator(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MessagesPage(messagesRepestories)));
    setState(() {});
  }
}

class DrawMenu extends StatelessWidget {
  TeachersRepestories teachersRepestories;
  StudentsRepestories studentsRepestories;
  MessagesRepestories messagesRepestories;

  DrawMenu(
    this.messagesRepestories,
    this.studentsRepestories,
    this.teachersRepestories, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(156, 15, 72, 1),
            ),
            child: Text(
              'Öğrenci Adı',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('Öğrenciler'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentsPage(studentsRepestories)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.accessibility_outlined),
            title: const Text('Öğretmenler'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeachersPage(teachersRepestories)));
            },
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Mesajlar'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MessagesPage(messagesRepestories)));
            },
          ),
        ],
      ),
    );
  }
}
