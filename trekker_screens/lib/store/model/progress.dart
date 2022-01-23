class Progress {
  int levelId;
  String level;
  String image;
  int maxPoints;
  int xp;
  List<Course> prerequisit;
  List<Course> prerequisitDone;

  Progress(
      {this.levelId,
      this.level,
      this.image,
      this.maxPoints,
      this.xp,
      this.prerequisit,
      this.prerequisitDone});

  Progress.fromJson(Map<String, dynamic> json) {
    levelId = json['level_id'];
    level = json['level'];
    image = json['image'];
    maxPoints = json['max_points'];
    xp = json['xp'];
    if (json['prerequisit_all'] != null) {
      prerequisit = new List<Course>();
      json['prerequisit_all'].forEach((v) {
        prerequisit.add(new Course.fromJson(v));
      });
    }
    if (json['prerequisit_done'] != null) {
      prerequisitDone = new List<Course>();
      json['prerequisit_done'].forEach((v) {
        prerequisit.add(new Course.fromJson(v)..completed = true);
      });
    }
  }
}

class Course {
  int id;
  String name;
  bool completed = false;

  Course({this.id, this.name});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
