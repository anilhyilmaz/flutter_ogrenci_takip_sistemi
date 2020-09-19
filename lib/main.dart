import 'package:flutter/material.dart';
import 'package:ggg/models/student.dart';
import 'StudentAdd.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1, "anil", "bb", 95),
    Student.withId(2, "haydar", "dd", 45),
    Student.withId(3, "yılmaz", "ff", 25),
  ];
  Student selectedStudent = Student.withId(0, "Hiç Kimse", "", 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Ögrenci Takip Sistemi"),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  subtitle: Text("Sınavdan aldıgı not:" +
                      students[index].grade.toString() +
                      "[" +
                      students[index].getStatus +
                      "]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://ae01.alicdn.com/kf/H0796eedf43804726819970bb8de51be5Q/4-adet-grup-Pokemon-Pikachu-klasik-oyuncaklar-Sticker-moda-ki-ilik-karikat-r-diz-st-bilgisayar.jpg_q50.jpg"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      this.selectedStudent = students[index];
                    });
                    print(selectedStudent.firstName);
                  },
                  onLongPress: () {
                    print("Uzun basıldı!");
                  },
                );
              }),
        ),
        Text("Seçili ögrenci  " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                    color: Colors.green,
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 10.0),
                        Text("Yeni Ögrenci")
                      ],
                    ),
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students))))),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                    color: Colors.blue,
                    child: Row(
                      children: [
                        Icon(Icons.cake),
                        SizedBox(width: 25.0),
                        Text("Güncelle")
                      ],
                    ),
                    onPressed: () => print("Güncelle"))),
            Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: RaisedButton(
                    color: Colors.yellow,
                    child: Row(
                      children: [
                        Icon(Icons.clear),
                        SizedBox(width: 10.0),
                        Text("Sil")
                      ],
                    ),
                    onPressed: () => print("Sil"))),
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
