import 'package:flutter/material.dart';
import 'package:ggg/models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  //StudentAdd(List<Student> students){
  //this.students = students;
  //}
  //Dart dili için constructerda böyle yazılması yeterlidir.
  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  Student student = Student("", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Kayıt"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildGradeField(),
                  buildSubmitButton(),
                ],
              ),),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Ögrenci Adı", hintText: "Anıl"),
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Ögrenci Soyadı", hintText: "Yılmaz"),
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldıgı Not", hintText: "75"),
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
        child: Text("Kaydet"),
        onPressed: () {
          formKey.currentState.save();
          widget.students.add(student);
          Navigator.pop(context);
        });
  }
}
