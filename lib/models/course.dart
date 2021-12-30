import 'package:flutter/cupertino.dart';

class Course {
  String? courseId;
  String? courseName;
  String? coursevalue;

  Course(this.courseId, this.courseName, this.coursevalue);

  get courseValue => null;

  static List<Course> getCourse() {
    return[
      Course('01', 'วิทยาการคอมพิวเตอร์','cs'),
      Course('02', 'เทคโนโลยีสารสนเทศ','it'),
    ];
  }
}