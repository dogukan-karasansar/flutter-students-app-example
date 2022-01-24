class StudentsRepestories {
  final List<Students> students = [
    Students('Mikail', 'Kocayamak', 19, 'kız'),
    Students('Doğukan', 'Karasansar', 19, 'erkek'),
  ];

  final Set<Students> loves = {};

  void love(Students student, isLove) {
    if(isLove){
      loves.add(student);
    } else {
      loves.remove(student);
    }

  }

  isLove(Students student) {
    return loves.contains(student);
  }
}

class Students {
  String name;
  String surname;
  int age;
  String gender;

  Students(this.name, this.surname, this.age, this.gender);
}
