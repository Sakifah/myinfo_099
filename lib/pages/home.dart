import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myinfo099/models/animes.dart';
import 'package:myinfo099/models/course.dart';
import 'package:myinfo099/models/year.dart';



class MyHomePage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const MyHomePage({ Key? key, required this.Title }) : super(key: key);

    // ignore: non_constant_identifier_names
    final String Title ;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   final _formKey = GlobalKey<FormState>();

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _studentidcontroller = TextEditingController();

  String? yearValue;
  String? courseValue;



  late List<Year> years;
  late List<Course> courses;
  late List<Anime> animes;

  List selectedAnime = [];

  List<Faculty> dropdownItems = Faculty.getFaculty();
  late List<DropdownMenuItem<Faculty>> dropdownMenuItems;
  late Faculty _selectedFaculty;


@override
  void initState() {
    super.initState();
    years = Year.getYear();
    courses = Course.getCourse();
    animes = Anime.getAnime();
    dropdownMenuItems = createDropdownMenu(dropdownItems);
     _selectedFaculty = dropdownMenuItems[0].value!;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.Title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
              children: [
                name(),
              const SizedBox(height: 14),
                studentid(),
              const SizedBox(height: 14),
              const Text('ชั้นปีที่กำลังศึกษา'),
              Column(
                children: createYearRadio(),
              ),
              Text('Item Selected $yearValue'),
              const SizedBox(height: 14),
              const Text('หลักสูตรที่ศึกษา'),
              Column(
                children: createCourseRadio(),
              ),
              Text('Item Selected $courseValue'),
              const SizedBox(height: 14),
              const Text('คณะที่ศึกษา'),
              DropdownButton(
                value: _selectedFaculty,
                items: dropdownMenuItems, 
                onChanged: (value) {
                  setState(() {
                    _selectedFaculty = value! as Faculty;
                  });
                }
                ),
              const SizedBox(height: 14),
              const Text('สิ่งที่ชอบ'),
              Column(
                children: createAnimeCheckbox(),
              ),
              const SizedBox(height: 14),
                button()
                ],
                )
              ),
            )
        ],
      ),
    );
  }

  TextFormField name() {
    return TextFormField(
                controller: _namecontroller,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Enter name Please';
                  }
                  return null;
                } ,
                decoration: const InputDecoration(
                  labelText: 'name',
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 2.0,
                    )
                  )
                ),
              );
  }

  TextFormField studentid() {
    return TextFormField(
                controller:_studentidcontroller,
                validator: (value) {
                  if(value!.isEmpty) {
                    return 'Enter studentID Please';
                  }
                  return null;
                } ,
                decoration: const InputDecoration(
                  labelText: 'studentid',
                  prefixIcon: Icon(Icons.person),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 2.0,
                    )
                  )
                ),
              );
  }

  ElevatedButton button() {
    return ElevatedButton(
                onPressed: () {
                
                if(_formKey.currentState!.validate()){
                }
                },
                child: Text('Submid'),
                 );
  }

  List<Widget> createYearRadio() {
    List<Widget> listRadioYear = [];

    for (var year in years){
      listRadioYear.add(
        RadioListTile<dynamic>(
          title: Text(year.yearId!),
          subtitle: Text(year.yearName!),
          value: year.yearvalue,
          groupValue: yearValue,
          onChanged: (value) {
            setState(() {
              yearValue = value.toString();
                  });
                },
              ),
      );
    }

    return listRadioYear;
  }

  List<Widget> createCourseRadio() {
        List<Widget> listRadioCourse = [];

    for (var course in courses){
      listRadioCourse.add(
        RadioListTile<dynamic>(
          title: Text(course.courseId!),
          subtitle: Text(course.courseName!),
          value: course.coursevalue ,
          groupValue: courseValue,
          onChanged: (value) {
            setState(() {
              courseValue = value.toString();
                  });
                },
              ),
      );
    }

    return listRadioCourse;
  }

  List<DropdownMenuItem<Faculty>> createDropdownMenu(List<Faculty> dropdownItems) {
    List<DropdownMenuItem<Faculty>> faculty = [];

    for (var item in dropdownItems){
      faculty.add(DropdownMenuItem(
        child: Text(item.name!),
        value : item,

      ));
    }

    return faculty;
  }

  createAnimeCheckbox() {
    List<Widget> listCheckboxAnime = [];

    for (var anime in animes){
      listCheckboxAnime.add(
        CheckboxListTile(
          title: Text(anime.animeName!),
          subtitle: Text('animeTName: ${anime.animeTName}'),
          value: anime.checked,
          onChanged: (value) {
            setState(() {
              anime.checked = value!;
                  });
                //ให้เขียนดพิ่ม เอาไอเทมออกจาก ลิสต์
                if(value!){
                  selectedAnime.add(anime.animeName!);
                } else {
                  selectedAnime.remove(anime.animeName!);
                }
                const Text('selectedAnime');
                },
              ),
      );
  }
return listCheckboxAnime;
}
}
class Faculty {
  int? value;
  String? name;
  
  Faculty(this.value, this.name);

  static List<Faculty> getFaculty() {
    return[
      Faculty(1, 'คณะวิทยาศาสตร์'),
      Faculty(2, 'คณะวิทยาการสุขภาพและการกีฬา'),
      Faculty(3, 'คณะเทคโนโลยีและการพัฒนาชุมชน'),
      Faculty(4, 'คณะวิศวกรรมศาสตร์'),
      Faculty(5, 'คณะพยาบาลศาสตร์'),
      Faculty(6, 'คณะนิติศาสตร์'),
      Faculty(7, 'คณะอุตสาหกรรมเกษตรและชีวภาพ'),
    ];

  }

}