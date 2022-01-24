class TeachersRepestories {
  final List<Teachers> teachers = [
    Teachers('Faruk', 'Kocayamak', 19, 'erkek'),
    Teachers('Dominik Torrent', 'Karasansar', 19, 'erkek'),
  ];

  final Set<Teachers> loves = {};

  void love(Teachers teacher, isLove) {
    if(isLove){
      loves.add(teacher);
    } else {
      loves.remove(teacher);
    }

  }

  isLove(Teachers teacher) {
    return loves.contains(teacher);
  }

}

class Teachers {
  String name;
  String surname;
  int age;
  String gender;

  Teachers(this.name, this.surname, this.age, this.gender);
}
