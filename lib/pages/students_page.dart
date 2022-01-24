import 'package:basic_app/repesitory/Students.dart';
import 'package:flutter/material.dart';

class StudentsPage extends StatefulWidget {
  final StudentsRepestories studentsRepestories;

  const StudentsPage(this.studentsRepestories, {Key? key}) : super(key: key);

  @override
  StudentsPage_State createState() => StudentsPage_State();
}

class StudentsPage_State extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Öğrenciler'),
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
                      '${widget.studentsRepestories.students.length} Öğrenci '),
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => StudentsRow(
                    widget.studentsRepestories.students[index],
                    widget.studentsRepestories),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: widget.studentsRepestories.students.length))
      ]),
    );
  }
}

class StudentsRow extends StatefulWidget {
  final Students student;
  final StudentsRepestories studentsRepestories;

  StudentsRow(
    this.student,
    this.studentsRepestories, {
    Key? key,
  }) : super(key: key);

  @override
  State<StudentsRow> createState() => _StudentsRowState();
}

class _StudentsRowState extends State<StudentsRow> {
  @override
  Widget build(BuildContext context) {
    var isLove = widget.studentsRepestories.isLove(widget.student);
    return ListTile(
      title: Text(widget.student.name + ' ' + widget.student.surname),
      leading: widget.student.gender == 'kız' ? Text('👩') : Text('👨'),
      trailing: IconButton(
          onPressed: () {
            setState(() {
              widget.studentsRepestories.love(widget.student, !isLove);
            });
          },
          icon: Icon(isLove
              ? Icons.favorite
              : Icons.favorite_border_outlined)),
    );
  }
}
