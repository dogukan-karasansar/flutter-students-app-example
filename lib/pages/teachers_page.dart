import 'package:basic_app/repesitory/Teachers.dart';
import 'package:flutter/material.dart';

class TeachersPage extends StatefulWidget {
  final TeachersRepestories teachersRepestories;

  const TeachersPage(this.teachersRepestories, {Key? key}) : super(key: key);

  @override
  _TeachersPageState createState() => _TeachersPageState();
}

class _TeachersPageState extends State<TeachersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğretmenler'),
        backgroundColor: const Color.fromRGBO(156, 15, 72, 1),
      ),
      body: Column(children: [
        PhysicalModel(
          color: const Color.fromRGBO(214, 125, 62, 1),
          elevation: 10,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Column(
                children: [
                  Text(
                      '${widget.teachersRepestories.teachers.length} Öğretmen '),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => TeachersRow(
                    widget.teachersRepestories.teachers[index],
                    widget.teachersRepestories),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: widget.teachersRepestories.teachers.length))
      ]),
    );
  }
}

class TeachersRow extends StatefulWidget {
  final Teachers teacher;
  final TeachersRepestories teachersRepestories;

  const TeachersRow(this.teacher, this.teachersRepestories, {Key? key})
      : super(key: key);

  @override
  _TeachersRowState createState() => _TeachersRowState();
}

class _TeachersRowState extends State<TeachersRow> {
  @override
  Widget build(BuildContext context) {
    var isLove = widget.teachersRepestories.isLove(widget.teacher);
    return ListTile(
      title: Text(widget.teacher.name + ' ' + widget.teacher.surname),
      leading: widget.teacher.gender == 'kız' ? Text('👩') : Text('👨'),
    );
  }
}
