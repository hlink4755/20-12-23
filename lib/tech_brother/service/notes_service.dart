import 'package:hive/hive.dart';

import '../app_db/notes_response_store.dart';

class NotesService {
  static Box<NotesResponseStore> getData() => Hive.box<NotesResponseStore>('notes');
}