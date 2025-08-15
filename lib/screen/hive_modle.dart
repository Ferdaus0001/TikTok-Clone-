import 'package:hive/hive.dart';

part 'hive_modle.g.dart'; // <-- অবশ্যই এই file name-এর সাথে মিলবে

@HiveType(typeId: 0)
class PDFPage extends HiveObject {
  @HiveField(0)
  String pageTitle;

  @HiveField(1)
  String pageContent;

  PDFPage({required this.pageTitle, required this.pageContent});
}
