// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DisplayingTodoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DisplayingTodoPage(),
      );
    },
    HiveExampleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HiveExamplePage(),
      );
    },
    HiveTodoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HiveTodoPage(),
      );
    },
    NotesHiveRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotesHivePage(),
      );
    },
  };
}

/// generated route for
/// [DisplayingTodoPage]
class DisplayingTodoRoute extends PageRouteInfo<void> {
  const DisplayingTodoRoute({List<PageRouteInfo>? children})
      : super(
          DisplayingTodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'DisplayingTodoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HiveExamplePage]
class HiveExampleRoute extends PageRouteInfo<void> {
  const HiveExampleRoute({List<PageRouteInfo>? children})
      : super(
          HiveExampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'HiveExampleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HiveTodoPage]
class HiveTodoRoute extends PageRouteInfo<void> {
  const HiveTodoRoute({List<PageRouteInfo>? children})
      : super(
          HiveTodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'HiveTodoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotesHivePage]
class NotesHiveRoute extends PageRouteInfo<void> {
  const NotesHiveRoute({List<PageRouteInfo>? children})
      : super(
          NotesHiveRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotesHiveRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
