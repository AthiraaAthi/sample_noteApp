import 'package:hive/hive.dart';
part 'notes_model.g.dart'; //runner dev_dependencies il vnm with2 spaces
//error vnn so letting know the hive its type,we use build_runner

@HiveType(typeId: 1) //adapters aan,so FOA(1st of all) we have to declare the id
class NotesModel {
  @HiveField(1)
  String title;
  @HiveField(2)
  String date;
  @HiveField(3)
  String description;
  @HiveField(4)
  String Category;
  @HiveField(5)
  int color;
  NotesModel(
      {required this.title,
      required this.date,
      required this.description,
      required this.Category,
      required this.color});
}
