
import 'package:hive/hive.dart';
part 'notes_response_store.g.dart';
@HiveType(typeId: 0)
class NotesResponseStore {
  @HiveField(0)
  final String tile;
  @HiveField(1)
  final String desc;

  NotesResponseStore({required this.tile,required this.desc});
}