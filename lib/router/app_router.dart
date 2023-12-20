import 'package:auto_route/auto_route.dart';

import '../dbestech/ui/hive_todo/hive_todo_page.dart';
import '../flutter_guys/ui/displaying_todo/diplaying_todo_page.dart';
import '../mitch_koko/ui/hive_example/hive_example_page.dart';
import '../tech_brother/ui/notes/notes_hive_page.dart';

part 'app_router.gr.dart';
@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: DisplayingTodoRoute.page),
    AutoRoute(page: HiveExampleRoute.page),
    AutoRoute(page: HiveTodoRoute.page,),
    AutoRoute(page: NotesHiveRoute.page,initial: true),
  ];
}