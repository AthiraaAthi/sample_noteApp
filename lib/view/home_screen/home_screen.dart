import 'package:flutter/material.dart';
import 'package:hive_adapterclass/model/notes_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box<NotesModel>("noteBox"); //defining it is notesmodel type
  List<Color> MyColorList = [
    Color.fromARGB(255, 113, 223, 243),
    Color.fromARGB(255, 237, 145, 139),
    Color.fromARGB(255, 202, 4, 236)
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  var keyList = [];

  @override
  void initState() {
    // TODO: implement initState
    keyList = box.keys.toList();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 170,
                  height: 40,
                  child: Center(
                    child: Text("Add Notes"
                        // box.get("data1")?.title ?? "",
                        ), ////"add notes"/////
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 154, 238, 160)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        box.get("data1")?.title ?? "",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        box.get("data1")?.description ?? "",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        box.get("data1")?.Category ?? "",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            box.get("data1")?.date ?? "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "title",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: desController,
                    decoration: InputDecoration(
                      hintText: "descrption",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: categoryController,
                    decoration: InputDecoration(
                      hintText: "Category",
                      suffixIcon: Icon(Icons.category),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: "date",
                      suffixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // box.add(
                      //   NotesModel(
                      //       title: titleController.text,
                      //       date: dateController.text,
                      //       description: desController.text,
                      //       Category: categoryController.text,
                      //       color: 2),
                      // );
                      // keyList = box.keys.toList();
                      // setState(() {});
                      box.put(
                        "data1",
                        NotesModel(
                          title: titleController.text, //"MyDay",
                          date: dateController.text,
                          description: desController.text,
                          Category: categoryController.text,
                          color: 2,
                        ),
                      );
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: Text("save"),
                  ),
                ],
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
